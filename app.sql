SET NAMES UTF8;
DROP DATABASE IF EXISTS app_fly;
CREATE DATABASE app_fly CHARSET=UTF8;
USE app_fly;
#创建轮播图 数据
CREATE TABLE app_carousel(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255)
);
INSERT INTO app_carousel VALUES(null,"http://127.0.0.1:3000/img/zg0f13000000tt0k777E3.png");
INSERT INTO app_carousel VALUES(null,"http://127.0.0.1:3000/img/zg0j12000000t4dcvE57C.png");
INSERT INTO app_carousel VALUES(null,"http://127.0.0.1:3000/img/zg0213000000tldj853F5.png");
INSERT INTO app_carousel VALUES(null,"http://127.0.0.1:3000/img/zg0613000000u1ezjFFA3.png");



#旅游攻略信息
CREATE TABLE app_strategy(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  sell VARCHAR(255),
  img  VARCHAR(255),
  sm  VARCHAR(255),
  weather VARCHAR(100),
  strategy VARCHAR(255)
);
INSERT INTO app_strategy VALUES(null,"上海","Shanghai","http://127.0.0.1:3000/img/100e0h0000008rp39A12F_C_750_375.jpg","http://127.0.0.1:3000/img/01.png","阴 15-19℃","上海，被称为“东方的巴黎”，东西方文化在此融汇交织，造就了洋气的海派风情。它是曾经的“十里洋场”老上海，也是如今日新月异的繁华“魔都”。");
INSERT INTO app_strategy VALUES(null,"兰州","Lanzhou","http://127.0.0.1:3000/img/CggYG1YCak2AVyQgABZu9YJ3Xq8462_C_750_375.jpg","http://127.0.0.1:3000/img/01.png","阴 6-19℃","黄河水奔腾不息，牛肉面日夜飘香。 昔日的“金城”，如今的甘肃省会——兰州。来到了兰州城，意味着你的双脚，已经踏进了苍凉广博的大西北。 你可能在这座城市不会呆很久，那就去吃一碗牛肉面，在黄河河滩上走一遭，然后，开始你的西北之行。");
INSERT INTO app_strategy VALUES(null,"北京","Beijing","http://127.0.0.1:3000/img/100j0y000000m0bhg78DC_C_750_375.jpg","http://127.0.0.1:3000/img/00.png","晴 10-27℃","悠久的历史文化，传奇的政治魅力，丰富的人文内涵，熙熙攘攘的商业繁华，令人向往的文化艺术活动。这，就是我们的首都北京，俯首皆是千年古都的记忆，到处充满令人惊喜的魅力。");
INSERT INTO app_strategy VALUES(null,"郑州","Zhengzhou","http://127.0.0.1:3000/img/100o0f0000007ez2yA4F6_C_750_375.jpg","http://127.0.0.1:3000/img/00.png","晴 11-25℃","郑州，地处中华腹地，九州之中，素有“中国铁路心脏”和“中国交通十字路口”之誉，又被称为“火车拉来的城市”，铁路在郑州的发展上有着及其重要的意义。 郑州北临黄河，西依中岳嵩山，山水相连，历史源远流长。现在的郑州已成为中原城市群的核心，郑东新区、航空港区等新区蓬勃发展，尤其是郑东新区CBD景色优美，汇集了郑州顶尖的公司和机构。。");

#城市信息
CREATE TABLE citys(
  id  INT PRIMARY KEY AUTO_INCREMENT,
  c_id VARCHAR(255),
  city VARCHAR(100)
);
INSERT INTO citys VALUES(null,1,"上海");
INSERT INTO citys VALUES(null,2,"兰州");
INSERT INTO citys VALUES(null,3,"北京");
INSERT INTO citys VALUES(null,4,"郑州");


#旅游小情况
CREATE TABLE app_title(
  id INT PRIMARY KEY AUTO_INCREMENT,
  t_id VARCHAR(100),
  title VARCHAR(10)
);
INSERT INTO app_title VALUES(null,1,"第一次来上海");
INSERT INTO app_title VALUES(null,1,"上海迪士尼");
INSERT INTO app_title VALUES(null,1,"新年嗨起来");
INSERT INTO app_title VALUES(null,1,"星巴克烘培坊");
INSERT INTO app_title VALUES(null,1,"第一次来上海");
INSERT INTO app_title VALUES(null,1,"第一次来上海");
INSERT INTO app_title VALUES(null,1,"第一次来上海");
INSERT INTO app_title VALUES(null,1,"第一次来上海");
INSERT INTO app_title VALUES(null,1,"第一次来上海");
INSERT INTO app_title VALUES(null,2,"1分钟速读");
INSERT INTO app_title VALUES(null,2,"兰州玩什么");
INSERT INTO app_title VALUES(null,2,"畅游河西走廊");
INSERT INTO app_title VALUES(null,2,"从兰州出发");
INSERT INTO app_title VALUES(null,2,"金城特色美食");
INSERT INTO app_title VALUES(null,2,"去甘南藏区");
INSERT INTO app_title VALUES(null,3,"第一次来北京");
INSERT INTO app_title VALUES(null,3,"逛逛老胡同");
INSERT INTO app_title VALUES(null,3,"烤鸭大盘点");
INSERT INTO app_title VALUES(null,3,"在北京滑雪");
INSERT INTO app_title VALUES(null,3,"当季热点动态");
INSERT INTO app_title VALUES(null,3,"古故宫过春节");
INSERT INTO app_title VALUES(null,3,"故宫扩大开放");
INSERT INTO app_title VALUES(null,3,"北京玩什么");
INSERT INTO app_title VALUES(null,3,"北京城的美食");
INSERT INTO app_title VALUES(null,3,"京城文艺范儿");
INSERT INTO app_title VALUES(null,4,"郑州速揽");
INSERT INTO app_title VALUES(null,4,"市内交通");
INSERT INTO app_title VALUES(null,4,"嵩山少林");
INSERT INTO app_title VALUES(null,4,"冬季滑雪");
INSERT INTO app_title VALUES(null,4,"当地特色");
INSERT INTO app_title VALUES(null,4,"住宿推荐");

# 当地热门 景区
 CREATE TABLE scenic(
  id INT PRIMARY KEY AUTO_INCREMENT,
  s_id VARCHAR(100),
  img VARCHAR(255),
  score VARCHAR(100),
  name VARCHAR(100)
);
INSERT INTO scenic VALUES(null,1,"100p0z000000nan397523_C_220_150.jpg","4.6","上海迪士尼度假区");
INSERT INTO scenic VALUES(null,1,"100b0x000000lgi7jFD89_C_220_150.jpg","4.8","外滩");
INSERT INTO scenic VALUES(null,1,"100c0u000000jjsgj9399_C_220_150.jpg","5.0","东方明珠");
INSERT INTO scenic VALUES(null,1,"100q11000000qsj8y3D34_C_220_150.jpg","4.2","南京路步行街");
INSERT INTO scenic VALUES(null,1,"100i11000000qqc9qCB34_C_220_150.jpg","4.5","城隍庙旅游区");

INSERT INTO scenic VALUES(null,2,"100s0m000000dvi408C46_C_220_150.jpg","4.6","上海迪士尼度假区");
INSERT INTO scenic VALUES(null,2,"CghzflW4kYSAI5sEAC9msLjmmgw691_D_220_150.jpg","4.8","外滩");
INSERT INTO scenic VALUES(null,2,"CggYslcQmKOARtqJAAf977f0DD0121_C_220_150.jpg","5.0","东方明珠");
INSERT INTO scenic VALUES(null,2,"CggYHlYCabiACMbJAAvGZ65kWXo119_C_220_150.jpg","4.2","南京路步行街");
INSERT INTO scenic VALUES(null,2,"100i11000000qqc9qCB34_C_220_150.jpg","4.5","城隍庙旅游区");



# 旅游朋友圈分享
CREATE TABLE social(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid VARCHAR(255),
  img VARCHAR(255),
  content VARCHAR(255)
);

# 用户头像
CREATE TABLE personage(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid  VARCHAR(255),
  img VARCHAR(255)
);

# 预约时间
CREATE TABLE orders(
  id  INT PRIMARY KEY AUTO_INCREMENT,
  Td VARCHAR(255),
  title VARCHAR(255)
);

# 美食
CREATE table Foot(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(255),
  name VARCHAR(255),
  bp VARCHAR(10),
  score VARCHAR(10)
);

INSERT INTO Foot VALUES(null,"http://127.0.0.1:3000/img/10030u000000ji6qiEB8B_D_265_265_Q90.jpg","成隆行蟹王府（南京东路店)","美食林一星",4.6);
INSERT INTO Foot VALUES(null,"http://127.0.0.1:3000/img/10070q000000h3nzk0D75_D_265_265_Q90.jpg","上海老饭店","美食林臻选",4.8);
INSERT INTO Foot VALUES(null,"http://127.0.0.1:3000/img/100i0f0000007ggjh19BC_D_265_265_Q90.jpg"," 甬府","美食林三星",4.6);
INSERT INTO Foot VALUES(null,"http://127.0.0.1:3000/img/100c080000003j6qa0143_D_265_265_Q90.jpg","东泰祥生煎馆（重庆北路店） ","美食林风味",4.9);
INSERT INTO Foot VALUES(null,"http://127.0.0.1:3000/img/10090q000000gc0wv77D7_D_265_265_Q90.jpg"," 兰心餐厅 ","美食林风味",4.9);