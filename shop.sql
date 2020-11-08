/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.18 : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `shop`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `aId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `aContent` varchar(255) NOT NULL,
  PRIMARY KEY (`aId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`aId`,`userId`,`aContent`) values (7,7,'江苏省连云港市海州区苍梧路59号江苏海洋大学'),(8,21,'江苏省连云港市海州区苍梧路59号江苏海洋大学'),(9,26,'江苏海洋大学'),(10,28,'1111');

/*Table structure for table `cartitem` */

DROP TABLE IF EXISTS `cartitem`;

CREATE TABLE `cartitem` (
  `cartItemId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerId` int(11) NOT NULL,
  `userId` int(11) NOT NULL COMMENT '�����ĸ��û�',
  `gName` varchar(255) NOT NULL,
  `gPic` varchar(255) NOT NULL,
  `gPrice` double(10,2) NOT NULL,
  `buyNum` int(11) NOT NULL COMMENT '���������',
  `totalPrice` double(10,2) NOT NULL COMMENT 'һ����Ʒ����ܼ۸�',
  `gId` int(11) NOT NULL,
  PRIMARY KEY (`cartItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `cartitem` */

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `cId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `cContent` varchar(255) NOT NULL,
  `cTime` datetime NOT NULL,
  `cState` tinyint(1) NOT NULL DEFAULT '0',
  `cResult` varchar(255) DEFAULT NULL,
  `gid` int(11) NOT NULL,
  PRIMARY KEY (`cId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `complaints` */

insert  into `complaints`(`cId`,`userId`,`cContent`,`cTime`,`cState`,`cResult`,`gid`) values (8,21,'不符合描述','2020-07-05 19:49:41',1,NULL,104);

/*Table structure for table `evaluation` */

DROP TABLE IF EXISTS `evaluation`;

CREATE TABLE `evaluation` (
  `eId` int(11) NOT NULL AUTO_INCREMENT,
  `gId` int(11) NOT NULL,
  `eContent` varchar(255) NOT NULL,
  `eTime` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`eId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `evaluation` */

insert  into `evaluation`(`eId`,`gId`,`eContent`,`eTime`,`userId`) values (11,125,'与描述不符','2020-07-05 19:40:46',21),(12,180,'送货很快，好评','2020-07-08 09:58:38',21);

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `gId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `gName` varchar(255) NOT NULL,
  `gDes` varchar(255) NOT NULL,
  `gPic` varchar(255) NOT NULL,
  `gAmount` int(11) NOT NULL,
  `gChar` double(10,2) NOT NULL DEFAULT '0.00',
  `gCheck` tinyint(1) NOT NULL DEFAULT '0',
  `gKind` varchar(255) NOT NULL,
  `gPrice` double(10,2) NOT NULL,
  PRIMARY KEY (`gId`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`gId`,`userId`,`gName`,`gDes`,`gPic`,`gAmount`,`gChar`,`gCheck`,`gKind`,`gPrice`) values (104,5,'Aape','upLoadPic/AapeXQ.jpg','upLoadPic/AapeFM.jpg',98,0.00,1,'yifu',118.00),(105,5,'EVISU 19SS 男士佛头印花海鸥刺绣短袖T恤 1ESHTM9TS522XX','upLoadPic/EVISUXQ.jpg','upLoadPic/EVISUFM.jpg',100,0.00,1,'yifu',699.00),(106,5,'芝麻街 X kaws限定联名短袖T恤2019年新款夏季半袖正品男女情侣装','upLoadPic/XkawsXQ.jpg','upLoadPic/XkawsFM.jpg',100,0.00,1,'yifu',79.00),(107,5,'美版Thrasher火焰字母LOGO圆领情侣装短袖T恤爆款TEE','upLoadPic/trasherXQ.jpg','upLoadPic/ThrasherFM.jpg',100,0.00,1,'yifu',215.00),(108,5,'Converse匡威1970S黄色三星标高帮休闲男女帆布鞋162054C 姜黄色高帮 162054C','upLoadPic/ConverseXQ.jpg','upLoadPic/ConverseFM.jpg',100,0.00,1,'yifu',559.00),(109,5,'High OGGSaj1体育画报 天生巨星绿格钩','upLoadPic/HighOGGSajXQ.jpg','upLoadPic/HighOGGSajFM.jpg',100,0.00,1,'yifu',589.00),(112,5,'BoyLondon宽松老鹰烫金印花情侣款t恤男女B195NCT07202','upLoadPic/B195NCT07202XQ.jpg','upLoadPic/B195NCT07202FM.jpg',100,0.00,1,'yifu',499.00),(113,5,'H＆M男装男士裤子夏季薄款宽松休闲短裤卫裤男潮运动裤','upLoadPic/HM0687635XQ.jpg','upLoadPic/HM0687635FM.jpg',100,0.00,1,'yifu',79.00),(114,5,'gxgjeans男装2019夏新款t恤男 时尚涂鸦ins风休闲圆领短袖T恤潮 白色','upLoadPic/gxgjeansXQ.jpg','upLoadPic/gxgjeansFM.jpg',100,0.00,1,'yifu',199.00),(115,5,'GENANX闪电潮牌太空棉夏季T恤男2019夏季情侣装新品宽松字母印花动漫五分袖潮流短袖 白色 L','upLoadPic/GENANXXQ.jpg','upLoadPic/GENANXFM.jpg',100,0.00,1,'yifu',238.00),(116,5,'三彩2019夏季新款 亮丝雪纺裙蛋糕裙V领七分袖黑白波点连衣裙女黑白15580AS','upLoadPic/15580ASXQ.jpg','upLoadPic/15580ASFM.jpg',100,0.00,1,'yifu',328.00),(117,5,'三彩2019秋季新款 垂感铜氨丝直筒裤九分裤遮肉松紧腰休闲裤女 黑色 160 68A M','upLoadPic/JH16068AMXQ.jpg','upLoadPic/JH16068AMFM.jpg',100,0.00,1,'yifu',198.00),(118,5,'颜域女装新款气质白色印花蕾丝裙子女夏2019流行长款过膝高腰碎花无袖连衣裙女 绿花 L 40','upLoadPic/JHasdasdL40XQ.jpg','upLoadPic/JHasdasdL40FM.jpg',100,0.00,1,'yifu',389.00),(119,5,'颜域女装气质背心裙子夏2019新款修身显瘦中长款无袖碎花连衣裙女 绿色 L40','upLoadPic/eruiewL40XQ.jpg','upLoadPic/eruiewL40FM.jpg',100,0.00,1,'yifu',389.00),(120,5,'Levi\'s李维斯酷爽系列男士512修身锥型牛仔裤28833-0303Levis 牛仔色3132','upLoadPic/asd0303LevisXQ.jpg','upLoadPic/asd0303LevisFM.jpg',100,0.00,1,'yifu',659.00),(121,5,'Levi\'s李维斯2019新品男士撞色迷彩印花短袖T恤56803-0004Levis 迷彩色 M','upLoadPic/kcl004LevisMXQ.jpg','upLoadPic/kcl004LevisMFM.jpg',100,0.00,1,'yifu',199.00),(122,5,'回力休闲帆布鞋男女韩版低帮透气系带春夏季板鞋潮鞋男鞋2019学生情侣款女鞋 白色HL709T 42','upLoadPic/HL709T42XQ.jpg','upLoadPic/HL709T42FM.jpg',100,0.00,1,'yifu',79.00),(123,5,'足力健老人鞋新品夏季透气网鞋慢跑运动鞋爸爸老年鞋男 蓝色（男款）','upLoadPic/zljlrxasdeXQ.jpg','upLoadPic/zljlrxasdeFM.jpg',100,0.00,1,'yifu',279.00),(124,5,'卡帝乐鳄鱼 CARTELO 低帮系带百搭英伦潮流户外透气防滑驾车运动休闲男鞋 KDL819 黑色 42','upLoadPic/CARTELOXQ.jpg','upLoadPic/CARTELOFM.jpg',100,0.00,1,'yifu',138.00),(125,5,'我是刘慈欣（刘慈欣《三体》之外的重要作品 京东专享风琴折页版）','upLoadPic/wslcrashdjkXQ.jpg','upLoadPic/wslcrashdjkFM.jpg',100,0.00,1,'book',35.80),(126,5,'-她的骑士男孩狂售20余国版权，电影版权已售华纳兄弟影业；《剪刀手爱德华》《蝙蝠侠归来》制片人丹尼斯.蒂诺威领衔制作！','upLoadPic/tdqs131XQ.jpg','upLoadPic/tdqs131FM.jpg',100,0.00,1,'book',15.90),(127,5,'成功学：鬼谷子+墨菲定律+方与圆+人性的弱点+九型人格+心理学与读心方法 等（套装共10册）','upLoadPic/cgx2131XQ.jpg','upLoadPic/cgx2131FM.jpg',100,0.00,1,'book',102.90),(128,5,'PPT之光：三个维度打造完美PPT','upLoadPic/pptzg1231XQ.jpg','upLoadPic/pptzg1231FM.jpg',100,0.00,1,'book',57.80),(129,5,'一生所寻不过爱与自由李银河2019年新版随笔集，写给所有勇敢的年轻人。华景时代','upLoadPic/yssxXQ.jpg','upLoadPic/yssxFM.jpg',100,0.00,1,'book',43.60),(130,5,'冀连梅全新力作，随书附赠课程卡，扫码听冀连梅亲录音频，讲解家长关心10个儿童用药疑问，扫码看视频，冀连梅新书解读','upLoadPic/jlmqx1231XQ.jpg','upLoadPic/jlmqx1231FM.jpg',100,0.00,1,'book',56.70),(131,5,'T.S.艾略特传：不完美的一生（林德尔·戈登文集）蒋方舟推荐！传记写作典范1948年诺贝尔文学奖得主，他的缺陷与怀疑能让一切过着不完美人生的我们找到共鸣','upLoadPic/ts123123XQ.jpg','upLoadPic/ts123123FM.jpg',100,0.00,1,'book',36.90),(132,5,'君王论','upLoadPic/jwl12XQ.jpg','upLoadPic/jwl12FM.jpg',100,0.00,1,'book',200.00),(133,5,'5分钟商学院刘润为你书写《5分钟商学院》从0到1诞生记。人人都是自己的CEO投资自己，是这个世界上稳赚不赔的生意。得到两季23万+用户订阅，雷军、吴晓波、罗振宇击掌力荐','upLoadPic/sxylr123XQ.jpg','upLoadPic/sxylr123FM.jpg',100,0.00,1,'book',132.00),(134,5,'64G下单选送无线充 iPhonexr中移动Apple苹果 iPhone XR全网通手机苹果x正品国行苹果xr','upLoadPic/xr123XQ.jpg','upLoadPic/xr123FM.jpg',97,0.00,1,'shuma',5059.00),(135,5,'【8+64G】Huawei华为 P30全面屏超感光徕卡三摄变焦双景录像980芯片智能手机p30','upLoadPic/Huawekhhi776XQ.jpg','upLoadPic/Huawekhhi776FM.jpg',99,0.00,1,'shuma',3988.00),(136,5,'华为 HUAWEI P30 Pro 超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+512GB珠光贝母全网通版双4G手机','upLoadPic/p30proda1XQ.jpg','upLoadPic/p30proda1FM.jpg',100,0.00,1,'shuma',6788.00),(137,5,'华为 HUAWEI Mate 20 Pro (UD)屏内指纹版麒麟980芯片全面屏超大广角徕卡三摄8GB+128GB亮黑色全网通双4G手机','upLoadPic/mate20qweqXQ.jpg','upLoadPic/mate20qweqFM.jpg',100,0.00,1,'shuma',5499.00),(138,5,'华为(HUAWEI)MateBook 13 全面屏轻薄性能笔记本 八代酷睿(i5-8265U 8G 512G MX250 office 2K 一碰传)银','upLoadPic/HUAWEIMateBXQ.jpg','upLoadPic/HUAWEIMateBFM.jpg',100,0.00,1,'shuma',5699.00),(139,5,'Apple iPad Pro 11英寸平板电脑 2018款(64G WLAN版全面屏A12X-Face ID MTXN2CH-A) 深空灰色','upLoadPic/AppleiPadProhakjsdXQ.jpg','upLoadPic/AppleiPadProhakjsdFM.jpg',100,0.00,1,'shuma',6331.00),(140,5,'Apple MacBook Air 13.3 2018款Retina屏幕 Core i5 8G 256G SSD 金色 苹果笔记本电脑 轻薄本MREF2CHA','upLoadPic/MacBookAirMEF2CHAXQ.jpg','upLoadPic/MacBookAirMEF2CHAFM.jpg',100,0.00,1,'shuma',9699.00),(141,5,'美的(Midea)258升三门冰箱变频风冷无霜一级能效节能静音36分贝 宽幅变温智能电冰箱 睿智金 BCD-258WTPZM','upLoadPic/MideaBCD258WTPZMXQ.png','upLoadPic/MideaBCD258WTPZMFM.jpg',100,0.00,1,'shuma',2599.00),(142,5,'美的（Midea）滚筒洗衣机全自动 10公斤 巴氏除菌洗 BLDC静音变频 智能时间可调 MG100V331DS5','upLoadPic/MG100V331DS5XQ.png','upLoadPic/MG100V331DS5FM.jpg',100,0.00,1,'shuma',1999.00),(143,5,'创维（SKYWORTH）55H6 55英寸4K超高清HDR 超薄全面屏 2+32G 人工智能语音 智能物联 液晶电视机 家电','upLoadPic/SKYWORTH55H6asXQ.png','upLoadPic/SKYWORTH55H6asFM.jpg',100,0.00,1,'shuma',3099.00),(144,5,'全新Kindle paperwhite 电子书阅读器 电纸书 墨水屏 经典版 第四代 8G 6英寸 wifi 黑色','upLoadPic/Kindlepaperwhite67XQ.png','upLoadPic/Kindlepaperwhite67FM.jpg',100,0.00,1,'shuma',998.00),(145,5,'科大讯飞机器人 阿尔法蛋超能蛋智能机器人儿童学习早教玩具国学教育智能对话陪伴机器人 白色','upLoadPic/kdxfjqr1231XQ.png','upLoadPic/kdxfjqr1231FM.jpg',100,0.00,1,'shuma',849.00),(146,5,'索尼（SONY）ILCE-7RM2 全画幅微单数码相机 单机身（约4240万有效像素 4K视频 5轴防抖','upLoadPic/SONYILCE7RM2A7RM2XQ.png','upLoadPic/SONYILCE7RM2A7RM2FM.jpg',99,0.00,1,'shuma',9899.00),(147,5,'爱奇艺 奇遇2S 4k VR一体机 VR眼镜 体感游戏机 智能3D头盔','upLoadPic/aqyasllz7823XQ.png','upLoadPic/aqyasllz7823FM.jpg',100,0.00,1,'shuma',2299.00),(148,5,'大疆 无人机 御Mavic Air 便携可折叠 4K超清航拍 旅行无人机 （雪域白）','upLoadPic/DJIMavi2313cAirXQ.jpg','upLoadPic/DJIMavi2313cAirFM.jpg',100,0.00,1,'shuma',4599.00),(149,5,'华为平板 M5 青春版 10.1英寸智能语音平板电脑4GB+128GB WiFi版 香槟金','upLoadPic/BAH123asda2W09XQ.jpg','upLoadPic/BAH123asda2W09FM.jpg',100,0.00,1,'shuma',2166.00),(150,5,'荣耀移动电源 10000mAh 标准版AP08L 充电宝 Micro USB单输入（白色）','upLoadPic/10000mAhAP08LMicroUSBXQ.png','upLoadPic/10000mAhAP08LMicroUSBFM.jpg',100,0.00,1,'shuma',129.00),(151,5,'【NBA联名款】Beats Studio3 Wireless 录音师无线3代 头戴式 蓝牙无线降噪游戏耳机 - 哈登代言款 -火箭红','upLoadPic/NBBeatsStudio3Wirel123essXQ.jpg','upLoadPic/NBBeatsStudio3Wirel123essFM.jpg',100,0.00,1,'shuma',2688.00),(152,5,'华硕（ASUS）RT-AC5300 5300M三频全千兆低辐射 无线电竞路由器 MU-MIMO高速路由','upLoadPic/AC53005300MMUMIMOAiMeshXQ.jpg','upLoadPic/AC53005300MMUMIMOAiMeshFM.jpg',100,0.00,1,'shuma',1488.00),(153,5,'南孚(NANFU)7号碱性电池30粒 聚能环2代 适用于儿童玩具-血糖仪-挂钟-鼠标键盘-遥控器等','upLoadPic/NANF123ULR03AAAXQ.jpg','upLoadPic/NANF123ULR03AAAFM.jpg',100,0.00,1,'shuma',100.00),(154,5,'荣耀20 4800万超广角AI四摄 3200W美颜自拍 麒麟Kirin980全网通版8GB+128GB 幻影蓝 移动联通电信4G全面屏','upLoadPic/4800AI3200WKirin9808GXQ.png','upLoadPic/4800AI3200WKirin9808GFM.jpg',100,0.00,1,'shuma',2999.00),(155,5,'OPPO Reno 10倍变焦版 高通骁龙855 4800万超清三摄 6GB+128GB 雾海绿 全网通 全面屏拍照游戏智能手机','upLoadPic/OPPOReno1048006GB128GBXQ.jpg','upLoadPic/OPPOReno1048006GB128GBFM.jpg',100,0.00,1,'shuma',3999.00),(156,5,'小米9 4800万超广角三摄 8GB+128GB全息幻彩蓝 骁龙855 全网通4G 双卡双待 水滴全面屏拍照游戏智能手机','upLoadPic/xiaomi9ajsdhk231XQ.png','upLoadPic/xiaomi9ajsdhk231FM.jpg',100,0.00,1,'shuma',3299.00),(157,5,'一加 OnePlus 7 Pro 2K+90Hz 流体屏 骁龙855旗舰 4800万超广角三摄 8GB+256GB 星雾蓝 全面屏拍照游戏手机','upLoadPic/OnePlusPro85548008GB6GBXQ.jpg','upLoadPic/OnePlusPro85548008GB6GBFM.jpg',100,0.00,1,'shuma',4499.00),(158,5,'Apple 苹果 iPhone Xs Max 手机 金色 全网通 256GB','upLoadPic/Ap123pleiPhoneXsMaxXQ.jpg','upLoadPic/Ap123pleiPhoneXsMaxFM.jpg',100,0.00,1,'shuma',8758.00),(159,5,'日本进口AKAW保温杯 女学生水杯文艺刻字不锈钢杯子茶杯便携清新','upLoadPic/pppds6786767FMpppds6786767XQ.jpg','upLoadPic/pppds6786767FM.jpg',99,0.00,1,'baihuo',102.00),(160,5,'德国微力达平板拖把拖地神器家用一拖净懒人拖把免手洗拖帕尘推头','upLoadPic/sahdkasj546XQ.jpg','upLoadPic/sahdkasj546FM.jpg',56,0.00,1,'baihuo',89.00),(161,5,'洁自动收口垃圾袋加厚 手提式家用厨房提绳中小号环保塑料袋10卷','upLoadPic/sjdh85677XQ.jpg','upLoadPic/sjdh85677FM.jpg',89,0.00,1,'baihuo',32.80),(162,5,'欧式穿衣镜首饰收纳柜壁挂镜家用试衣镜宿舍落地镜子衣帽间全身镜','upLoadPic/hsjadh864XQ.jpg','upLoadPic/hsjadh864FM.jpg',125,0.00,1,'baihuo',420.00),(163,5,'卡贝森沙发实木沙发布艺沙发北欧新中式客厅整装家具 升级版颜色备注 单人位','upLoadPic/kb4s1s5jaasd237XQ.png','upLoadPic/kb4s1s5jaasd237FM.jpg',100,0.00,1,'house',1715.00),(164,5,'全友 布艺沙发组合现代简约客厅布艺沙发客厅可拆洗布沙发 全友家居小户型沙发客厅整装套装102137 布艺沙发','upLoadPic/q1y2b3y4s5f6z7hXQ.png','upLoadPic/q1y2b3y4s5f6z7hFM.jpg',100,0.00,1,'house',4499.00),(165,5,'厨房无盖垃圾桶创意家用萌猫压圈纸篓北欧风卫生间加厚塑料垃圾筒','upLoadPic/ASDK65646XQ.jpg','upLoadPic/ASDK65646FM.jpg',564,0.00,1,'baihuo',13.00),(166,5,'风之意 餐桌 北欧实木餐桌日式可折叠餐桌椅组合现代简约多功能家用饭桌FR-102','upLoadPic/fzy5c4z1b1a23sid23XQ.png','upLoadPic/fzy5c4z1b1a23sid23FM.jpg',100,0.00,1,'house',1199.00),(167,5,'儿童浴室拖鞋女洗澡夏家用防滑防臭速干卫生间漏水镂空塑料凉拖男','upLoadPic/SDAAGJH65468XQ.jpg','upLoadPic/SDAAGJH65468FM.jpg',16,0.00,1,'baihuo',19.50),(168,5,'梵爱餐桌 新中式实木餐桌椅组合现代简约家用小户型餐台长方形可变圆桌餐厅饭桌','upLoadPic/f1a1c1z1x1z1s1s1m1cz1yXQ.png','upLoadPic/f1a1c1z1x1z1s1s1m1cz1yFM.jpg',100,0.00,1,'house',1280.00),(169,5,'碗碟套装家用4人简约北欧骨瓷餐具6人创意日式陶瓷盘碗筷碗具组合','upLoadPic/SADHG6546XQ.jpg','upLoadPic/SADHG6546FM.jpg',46,0.00,1,'baihuo',218.00),(170,5,'卡奈登电脑椅家用学生写字网椅宿舍职员座椅弓形简约办公会议椅子','upLoadPic/Xxaski923Y1621XQ.jpg','upLoadPic/Xxaski923Y1621FM.jpg',100,0.00,1,'house',299.00),(171,9,'全自动口袋遮阳伞晴雨伞两用女防晒防紫外线便携小巧折叠太阳伞','upLoadPic/ASD64899XQ.jpg','upLoadPic/ASD64899FM.jpg',46,0.00,1,'baihuo',48.00),(172,5,'夏季牛仔布料薄款围裙理发店美发师定制logo花艺咖啡馆工作服围腰','upLoadPic/ASDAS648997XQ.jpg','upLoadPic/ASDAS648997FM.jpg',19,0.00,1,'baihuo',78.00),(173,5,'家乐铭品 书柜书架 带门储物柜自由组合简易柜子省空间落地文件柜现代简约客厅置物柜收纳柜子','upLoadPic/jl1m1p1s1adqweQWEAXQ.jpg','upLoadPic/jl1m1p1s1adqweQWEAFM.jpg',100,0.00,1,'house',359.00),(174,5,'孚日洁玉纯棉毛巾 经典素色柔软强吸水洗脸巾4条装 爱丁堡畅想毛巾 33x70cm','upLoadPic/OIOP88XQ.jpg','upLoadPic/OIOP88FM.jpg',12,0.00,1,'baihuo',39.90),(175,5,'中派 床卧室双人真皮床 1.82.0标准床+床垫+床头柜1个','upLoadPic/2350ASDAXZ231asdXQ.jpg','upLoadPic/2350ASDAXZ231asdFM.jpg',100,0.00,1,'house',2350.00),(176,5,'名创优品（MINISO）面包粒子枕U型枕 办公室午睡枕 出差旅行多功能护颈 蓝灰','upLoadPic/HFG4664XQ.jpg','upLoadPic/HFG4664FM.jpg',45,0.00,1,'baihuo',29.90),(177,5,'雅高长柄搓澡神器洗澡刷搓澡巾洗澡神器沐浴刷搓背神器','upLoadPic/NNG568XQ.jpg','upLoadPic/NNG568FM.jpg',48,0.00,1,'baihuo',19.90),(178,5,'访客（FK）衣架干湿两用防滑衣架 晾衣挂 晾衣架 衣服架 晒衣架子 衣撑 新款无痕宽肩混色10支（颜色随机）','upLoadPic/CBCX44125XQ.jpg','upLoadPic/CBCX44125FM.jpg',56,0.00,1,'baihuo',14.90),(179,5,'5','upLoadPic/646DSA5XQ.jpg','upLoadPic/646DSA5FM.jpg',54,0.00,1,'baihuo',94.00),(180,5,'帝王蟹特大7斤只进口野生鲜活速冻生鲜长脚皇帝蟹海鲜礼盒','upLoadPic/8564hxjXQ.jpg','upLoadPic/8564hxjFM.jpg',15,0.00,1,'数码家电',745.00),(181,5,'百草味零食大礼包组合小吃一整箱超大好吃的休闲食品送女友女生成人款散装混合装吃货网红礼盒 41款零食组合','upLoadPic/ls1d2l3b4L5S6DLBXQ.jpg','upLoadPic/ls1d2l3b4L5S6DLBFM.jpg',100,0.00,1,'jiushui',128.00),(182,5,'原膳南海大虾1.8kg净虾重(50-60只每kg) 冷冻生鲜冻虾海鲜海虾鲜虾','upLoadPic/454DS5XQ.jpg','upLoadPic/454DS5FM.jpg',15,0.00,1,'数码家电',316.00),(183,5,'三只松鼠营养早餐口袋手撕面包网红零食饼干蛋糕乳酸菌小伴侣面包520g整箱装','upLoadPic/s1z2234s3sS5Z6SSXQ.jpg','upLoadPic/s1z2234s3sS5Z6SSFM.jpg',100,0.00,1,'jiushui',25.00),(184,5,'西域日记 新疆法式羊排2斤鲜羊肉12肋小羊排羊扒新鲜新疆羊肉生鲜','upLoadPic/546866SD4FQ.jpg','upLoadPic/568SD6ZX4FM.jpg',45,0.00,1,'shuiguo',159.00),(185,5,'南方黑芝麻酥伊喜留心酥330g每盒6枚装雪媚娘休闲食品零食早餐点心','upLoadPic/nqw12341fhzmhNFHZMHXQ.jpg','upLoadPic/nqw12341fhzmhNFHZMHFM.jpg',100,0.00,1,'jiushui',39.90),(186,5,'中粮凌鲜南美青虾仁 （45-55只每500g）1kg 袋装 冷冻虾仁','upLoadPic/ASSD6548XQ.jpg','upLoadPic/ASSD6548FM.jpg',16,0.00,1,'shuiguo',109.00),(187,5,'新鲜羊杂整套6斤 羊杂汤羊杂碎心肝肺肠肚靖远羊羔肉羊肉生鲜冷冻','upLoadPic/158SD9X86XQ.jpg','upLoadPic/158SD9X86FM.jpg',16,0.00,1,'shuiguo',156.00),(188,5,'卫龙 辣条 休闲零食组合礼包 麻辣 儿时网红小吃 办公室零食大面筋112g 5包','upLoadPic/wll213123tW43376LLTXQ.jpg','upLoadPic/wll213123tW43376LLTFM.jpg',100,0.00,1,'jiushui',19.50),(189,5,'伊利 安慕希希腊风味常温酸奶原味205g 16盒','upLoadPic/YLylas123dhk23205g16XQ.jpg','upLoadPic/YLylas123dhk23205g16FM.jpg',100,0.00,1,'jiushui',59.90),(190,5,'舒喜山散养老母鸡','upLoadPic/568DSSFFOO5XQ.jpg','upLoadPic/568DSSFFOO5FM.jpg',15,0.00,1,'shuiguo',35.00),(191,5,'蒙牛 特仑苏 纯牛奶 250ml 16盒 礼盒装','upLoadPic/mn123123aaASDtlsMNTLSXQ.jpg','upLoadPic/mn123123aaASDtlsMNTLSFM.jpg',100,0.00,1,'jiushui',68.90),(192,5,'现摘现发广西小米蕉 香蕉新鲜当季水果整箱10斤banana芭蕉皇帝蕉','upLoadPic/8896643ffXQ.jpg','upLoadPic/8896643ffFM.jpg',52,0.00,1,'shuiguo',23.00),(193,5,'伊利 纯牛奶250ml24盒','upLoadPic/YLC2314N51NylcnnXQ.jpg','upLoadPic/YLC2314N51NylcnnFM.jpg',100,0.00,1,'jiushui',56.80),(194,5,'轩农谷正宗仙居杨梅新鲜当季水果 特级东魁大杨梅5A级6斤高山现摘','upLoadPic/SD656G4DXQ.jpg','upLoadPic/SD656G4DFM.jpg',65,0.00,1,'shuiguo',258.00),(195,5,'益达木糖醇无糖口香糖大瓶装混合味70粒98g单瓶装（新旧包装随机发）零食糖果休闲食品','upLoadPic/ydmqw41e123tcYDMTCXQ.jpg','upLoadPic/ydmqw41e123tcYDMTCFM.jpg',100,0.00,1,'jiushui',13.50),(196,5,'新疆哈密瓜新鲜水果脆甜吐鲁番网纹瓜西州蜜一箱（7-8）包邮','upLoadPic/SDH65648S5XQ.jpg','upLoadPic/SDH65648S5FM.jpg',46,0.00,1,'shuiguo',29.90),(197,5,'来伊份 肉枣小香肠碳烤迷你肠125g肉质Q弹','upLoadPic/lyfLYCNRASD1231asdopXQ.jpg','upLoadPic/lyfLYCNRASD1231asdopFM.jpg',100,0.00,1,'jiushui',37.90),(198,5,'大号60-70只毛重2kg（净重约1.5kg）渔公码头 厄瓜多尔南美白虾 冷冻大虾海虾 烧烤','upLoadPic/TKB56824G6XQ.jpg','upLoadPic/TKB56824G6FM.jpg',46,0.00,1,'shuiguo',89.00),(199,5,'盐津铺子 蜜饯果干 果脯 办公室零食 话梅杨梅干蜜汁杨梅100g 零食小吃','upLoadPic/yjpzgpASQbasdYJPZGPXQ.jpg','upLoadPic/yjpzgpASQbasdYJPZGPFM.jpg',100,0.00,1,'jiushui',10.90),(200,5,'高湖 高邮咸鸭蛋熟鸭蛋流油麻鸭咸鸭蛋 55g 20枚简装','upLoadPic/DUIF56845XQ.jpg','upLoadPic/DUIF56845FM.jpg',45,0.00,1,'shuiguo',36.80),(201,5,'巴厘岛原装进口 整箱装百事可乐(Pepsi) blue 蓝色可乐网红可乐汽水饮料 450ml 12瓶','upLoadPic/1231AAAPepsiblueXQ.jpg','upLoadPic/1231AAAPepsiblueFM.jpg',100,0.00,1,'jiushui',65.90),(202,5,'九牛一卤原切牛排套餐10片 广西寿乡牛肉西冷菲力眼肉儿童牛排 生鲜','upLoadPic/JHNFF145XQ.jpg','upLoadPic/JHNFF145FM.jpg',64,0.00,1,'shuiguo',148.00),(203,5,'正宗无锡阳山水蜜桃 新鲜水果 非黄桃雪桃油桃毛桃 新鲜水果桃子 京东生鲜 单果4两-5两 八个装精品果','upLoadPic/777665DMLXQ.jpg','upLoadPic/777665DMLFM.jpg',46,0.00,1,'shuiguo',129.00),(204,5,'伊利 畅意100%乳酸菌饮品原味100ml 30盒','upLoadPic/YLCY100YLC2112YGMXQ.jpg','upLoadPic/YLCY100YLC2112YGMFM.jpg',100,0.00,1,'jiushui',56.00),(206,5,'脉动（Mizone）青柠口味 邓伦同款低糖维生素运动功能饮料600ml  15瓶 整箱装','upLoadPic/MDongmaidong12MizoneXQ.jpg','upLoadPic/MDongmaidong12MizoneFM.jpg',100,0.00,1,'jiushui',50.90),(207,5,'康师傅 矿泉水饮用水550ml 24瓶每箱 夏季生活用水 上海地区三箱包邮','upLoadPic/CAA61278ASDasdjXQ.jpg','upLoadPic/CAA61278ASDasdjFM.jpg',100,0.00,1,'jiushui',22.90),(208,5,'燕京啤酒 11度 蓝听啤酒330ml 24听整箱装 特制精品啤酒','upLoadPic/yjpjiuYJPjiu123991XQ.jpg','upLoadPic/yjpjiuYJPjiu123991FM.jpg',100,0.00,1,'jiushui',39.90),(217,5,'可达鸭','upLoadPic/9fe7b2b6be6ae0c8a65c68250d6e1ffe9656bf84.jpg','upLoadPic/9fe7b2b6be6ae0c8a65c68250d6e1ffe9656bf84.jpg',1,0.00,1,'shuiguo',756.00);

/*Table structure for table `indexs` */

DROP TABLE IF EXISTS `indexs`;

CREATE TABLE `indexs` (
  `iId` int(11) NOT NULL AUTO_INCREMENT,
  `iName` varchar(255) NOT NULL,
  `iSName` varchar(255) DEFAULT NULL,
  `iPIc` varchar(255) NOT NULL,
  `iUrl` varchar(255) NOT NULL,
  `iKind` varchar(255) NOT NULL,
  PRIMARY KEY (`iId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `indexs` */

insert  into `indexs`(`iId`,`iName`,`iSName`,`iPIc`,`iUrl`,`iKind`) values (14,'暑期大促','暑期大促','upLoadPic/lbt1.jpg','123','轮播图'),(16,'枣阳黄桃','枣阳黄桃','upLoadPic/lbt3.jpg','123','轮播图'),(17,'家具小物','家具小物','upLoadPic/lbt4.png','123','轮播图'),(18,'家具会场','家居会场','upLoadPic/lbt5.png','123','轮播图'),(20,'菲安妮','菲安妮','upLoadPic/lbt2.jpg','123','轮播图'),(21,'Aape','118','upLoadPic/AapeFM.jpg','123','热门商品'),(22,'EVISU 19SS 男士佛头印花海鸥刺绣短袖T恤 1ESHTM9TS522XX','699','upLoadPic/EVISUFM.jpg','123','热门商品'),(23,'芝麻街 X kaws限定联名短袖T恤2019年新款夏季半袖正品男女情侣装','79','upLoadPic/XkawsFM.jpg','123','热门商品'),(24,'君王论','200','upLoadPic/jwl12FM.jpg','123','热门商品'),(25,'华为 HUAWEI P30 Pro 超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+512GB珠光贝母全网通版双4G手机','6788','upLoadPic/p30proda1FM.jpg','123','热门商品'),(26,'日本进口AKAW保温杯 女学生水杯文艺刻字不锈钢杯子茶杯便携清新','102','upLoadPic/pppds6786767FM.jpg','123','热门商品'),(27,'卡贝森沙发实木沙发布艺沙发北欧新中式客厅整装家具 升级版颜色备注 单人位','1715','upLoadPic/kb4s1s5jaasd237FM.jpg','123','热门商品'),(28,'风之意 餐桌 北欧实木餐桌日式可折叠餐桌椅组合现代简约多功能家用饭桌FR-102','1199','upLoadPic/fzy5c4z1b1a23sid23FM.jpg','123','热门商品'),(29,'孚日洁玉纯棉毛巾 经典素色柔软强吸水洗脸巾4条装 爱丁堡畅想毛巾 33x70cm','39.9','upLoadPic/OIOP88FM.jpg','123','热门商品'),(30,'名创优品（MINISO）面包粒子枕U型枕 办公室午睡枕 出差旅行多功能护颈 蓝灰','29.9','upLoadPic/HFG4664FM.jpg','123','最新商品'),(31,'雅高长柄搓澡神器洗澡刷搓澡巾洗澡神器沐浴刷搓背神器','19.9','upLoadPic/NNG568FM.jpg','123','最新商品'),(32,'访客（FK）衣架干湿两用防滑衣架 晾衣挂 晾衣架 衣服架 晒衣架子 衣撑 新款无痕宽肩混色10支（颜色随机）','14.9','upLoadPic/CBCX44125FM.jpg','123','最新商品'),(33,'百草味零食大礼包组合小吃一整箱超大好吃的休闲食品送女友女生成人款散装混合装吃货网红礼盒 41款零食组合','128','upLoadPic/ls1d2l3b4L5S6DLBFM.jpg','123','最新商品'),(34,'原膳南海大虾1.8kg净虾重(50-60只每kg) 冷冻生鲜冻虾海鲜海虾鲜虾','316','upLoadPic/454DS5FM.jpg','123','最新商品'),(35,'新鲜羊杂整套6斤 羊杂汤羊杂碎心肝肺肠肚靖远羊羔肉羊肉生鲜冷冻','156','upLoadPic/158SD9X86FM.jpg','123','最新商品'),(36,'舒喜山散养老母鸡','35','upLoadPic/568DSSFFOO5FM.jpg','123','最新商品'),(37,'脉动（Mizone）青柠口味 邓伦同款低糖维生素运动功能饮料600ml  15瓶 整箱装','50.9','upLoadPic/MDongmaidong12MizoneFM.jpg','123','最新商品'),(38,'H＆M男装男士裤子夏季薄款宽松休闲短裤卫裤男潮运动裤','79','upLoadPic/HM0687635FM.jpg','123','最新商品');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oId` int(11) NOT NULL AUTO_INCREMENT,
  `gId` int(11) NOT NULL,
  `oNum` int(11) NOT NULL,
  `oPrice` double NOT NULL,
  `oState` varchar(255) NOT NULL,
  `oTip` varchar(255) DEFAULT NULL,
  `oTime` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `userAddress` varchar(255) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`oId`,`gId`,`oNum`,`oPrice`,`oState`,`oTip`,`oTime`,`userId`,`userAddress`) values (7,159,1,102,'待发货',NULL,'2020-07-08 09:57:30',21,'江苏省连云港市海州区苍梧路59号江苏海洋大学'),(9,134,1,5059,'待发货',NULL,'2020-07-09 10:10:03',28,'1111');

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `sId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `gId` int(11) NOT NULL,
  PRIMARY KEY (`sId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `store` */

insert  into `store`(`sId`,`userId`,`gId`) values (11,7,136),(12,7,188),(13,7,128),(15,26,216),(16,28,134);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `userPwd` varchar(16) NOT NULL,
  `headPic` varchar(255) NOT NULL,
  `nickName` varchar(10) NOT NULL,
  `userType` tinyint(1) NOT NULL DEFAULT '0',
  `IDNum` char(18) NOT NULL,
  `phone` char(11) NOT NULL,
  `charity` double NOT NULL DEFAULT '0',
  `honest` int(11) NOT NULL DEFAULT '100',
  `uCheck` tinyint(1) NOT NULL DEFAULT '0',
  `kuserType` tinyint(1) NOT NULL DEFAULT '0',
  `kCheck` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`userName`,`userPwd`,`headPic`,`nickName`,`userType`,`IDNum`,`phone`,`charity`,`honest`,`uCheck`,`kuserType`,`kCheck`) values (1,'2017123243','123','upLoadPic/morentouxiang.png','xcw',0,'320923199999999999','12345678941',0,100,0,0,0),(5,'liutong','123456','upLoadPic/morentouxiang.png','liutong',1,'320923199990904123','13458795654',0,100,0,0,0),(7,'qwer','123456','upLoadPic/morentouxiang.png','qwer',0,'333333333333333333','11111111111',0,100,0,0,0),(21,'2017123242','wqlnb666','upLoadPic/morentouxiang.png','zuiguguda',0,'320923200008065410','18361489681',7,100,0,1,0),(25,'88888888','123456','upLoadPic/morentouxiang.png','111111',0,'320923200008065411','18361489681',0,100,0,0,0),(28,'2017123238','666666','upLoadPic/morentouxiang.png','一路顺利',0,'320321199905061637','15062018251',0,100,0,1,0),(29,'2017123238','666666','upLoadPic/morentouxiang.png','一路顺利',0,'320321199905061637','15062018251',0,100,0,0,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
