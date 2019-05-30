const express=require("express");
const mysql=require("mysql");
const session=require("express-session");
const cors=require("cors");
var bodyParser = require('body-parser');
//上传图片/文件
const fs = require("fs");
const multer = require("multer");

var pool=mysql.createPool({
	host     : process.env.MYSQL_HOST,
    port     : process.env.MYSQL_PORT,
    user     : process.env.ACCESSKEY,
    password : process.env.SECRETKEY,
    database : 'app_' + process.env.APPNAME
})

var serve=express();
serve.listen(5050);
serve.use(bodyParser.urlencoded({
    extended:true
}));
serve.use(cors({
	origin:["http://127.0.0.1:8080","http://localhost:8080"],
	credentials:true//提高安全级别 每次访问都要验证
}))

var upload = multer({dest:"upload/"});
serve.use(session({
    secret:"128位字符串", //配置钥匙
    resave:false,           //每次请求是否更新数据
    saveUninitialized:true  //保存初始化数据
}))
//请求静态资源必须挂载
serve.use(express.static("public"));
serve.use(express.static("upload"));
// 上传头像
serve.post("/Shang",(req,res)=>{
	console.log(req.body.name)
})

serve.post("/Social",upload.single("mypic"),(req,res)=>{
	var contents = req.body.name;
	var src = req.file.originalname;
	console.log(src)
	//获取原文件
	var id = 1
	if(req.file.originalname.length == 0){
		var sql = "insert into social set content=?,uid=?";
		pool.query(sql,[imgs,contents,id],(err,result)=>{
		if(err) throw err;
		console.log(result)
		if(result.affectedRows>0){
			res.send({code:1})
		};
		return;
	})
	}else{
		var src = req.file.originalname;
		//创建新文件名字
		//var des = 事件戳 + 随机数 +jpg 
		var ft = new Date().getTime();
		var th = Math.floor(Math.random()*9999);
		var i3 = src.lastIndexOf(".");//查找后缀.下标
		var suff = src.substring(i3);//i3位置截取
		var  des = __dirname+"/upload/"+ft+th+suff;
		console.log(des);
		var img = des.lastIndexOf("/");
		var imgs = des.substring(img)
		console.log(imgs)
		//将临时文件移动到 upload目录下
		fs.renameSync(req.file.path,des);
		var sql = "insert into social set img=?,content=?,uid=?";
		pool.query(sql,[imgs,contents,id],(err,result)=>{
			if(err) throw err;
			if(result.affectedRows>0){
				res.send({code:1});
			}
		})
	}	
})
// 搜索
	serve.get("/Serch",(req,res)=>{
		var count = req.query.count;
		var sql = "select img,id,content from social where content like concat('%',?,'%')";
		pool.query(sql,[count],(err,result)=>{
			if(err) throw err;
			console.log(result)
			res.send({code:1,data:result})
		})	
	})
//删除动态
	serve.get("/delete",(req,res)=>{
		var id = req.query.id;
		var sql = "delete  from social where id=?";
		pool.query(sql,[id],(err,result)=>{
			if(err) throw err;
			console.log(result)
			res.send({code:1,msg:"删除成功"})
		})
	})
// 请求朋友圈
serve.get("/content",(req,res)=>{
	var sql = "select img,content,id from social where uid=1";
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		console.log(result)
		res.send({code:1,data:result})
	})
})

serve.get("/imglist",(req,res)=>{
	
	var sql="SELECT img_url FROM app_carousel ";
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send({code:1,data:result})
		}
	})
})
// 请求 攻略
serve.get("/strategy",(req,res)=>{
	 var id=req.query.id;
	var sql="select * from app_strategy where id=?";
	pool.query(sql,[id],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send({code:1,data:result});
		}else{
			res.send({code:-1,msg:"请求失败"})
		}
	})
})
//查询
serve.get("/Sserch",(req,res)=>{
	var name=req.query.name;
	var sql="select c_id,city from citys where city like concat('%',?,'%')";
	pool.query(sql,[name],(err,result)=>{
		if(err) throw err;
		if(result==""){
			res.send({code:-1});
			return;
		}
		res.send({code:1,data:result})
	})
})
//查询 a title
serve.get("/serch2",(req,res)=>{
	var t_id=req.query.t_id;
	var sql="select t_id,title from app_title where t_id=?";
	pool.query(sql,[t_id],(err,result)=>{
		if(err) throw err;
		res.send({code:1,data:result})
	})
})
// 查询 热门景点
serve.get("/scenic",(req,res)=>{
	var s_id=req.query.t_id;
	console.log(s_id)
	var sql="select s_id,img,score,name from scenic where s_id=?";
	pool.query(sql,[s_id],(err,result)=>{
		if(err) throw err;
		res.send({code:1,data:result});
		console.log(result)
	})
})

// 预约时间
serve.get("/Order",(req,res)=>{
	var title = req.query.title;
	if(!title){
		res.send({code:-1,msg:"吃饭哪能没有时间"});
		return
	}
	var td = 1
	var sql = "insert into  orders set title=?,Td=?";
	pool.query(sql,[title,td],(err,result)=>{
		if(err) throw err;
		res.send({code:1,msg:"预约成功"})

	})
})

// 查询预约
serve.get("/Sorder",(req,res)=>{
	var sql = "select title from orders where Td=1";
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send({code:1,msg:result})
	})
})

// 查询美食
serve.get("/food",(req,res)=>{
	var name = req.query.name;
	 if(!name){
		 res.send({code:-1,msg:"你就不能打个字吗"});
		 return
	 }
	 var sql ="select * from Foot where name like concat('%',?,'%')";
	 pool.query(sql,[name],(err,result)=>{
		 if(err) throw err;
		 res.send({code:1,data:result})
	 })
})