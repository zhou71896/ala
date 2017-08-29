# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.19)
# Database: springboot
# Generation Time: 2017-08-29 13:24:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_operation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_operation`;

CREATE TABLE `auth_operation` (
  `opid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `opcode` varchar(20) NOT NULL COMMENT '权限值',
  `opname` varchar(50) NOT NULL COMMENT '权限名称',
  `ophref` varchar(200) DEFAULT NULL COMMENT '权限操作链接',
  `opseq` int(11) NOT NULL DEFAULT '1' COMMENT '显示顺序',
  PRIMARY KEY (`opid`),
  KEY `op_code_index` (`opcode`) USING BTREE,
  KEY `op_name_index` (`opname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限信息表';

LOCK TABLES `auth_operation` WRITE;
/*!40000 ALTER TABLE `auth_operation` DISABLE KEYS */;

INSERT INTO `auth_operation` (`opid`, `opcode`, `opname`, `ophref`, `opseq`)
VALUES
	(87,'01','????','/admin/auth',1),
	(88,'02','????','/admin/tech',1),
	(89,'03','????','/admin/log',1),
	(90,'0101','??????','/admin/user/queryPage',1),
	(91,'010102','??????','/admin/user/updatePage/{id}',1),
	(92,'010206','???????','/admin/role/hasOpers/{roleid}',1),
	(93,'010102','????','/admin/user/update',1),
	(94,'0103','??????','/admin/oper/queryPage',1),
	(96,'010104','????','/admin/user/deleteByID/{id}',1),
	(97,'0101','??????','/admin/user/mainPage',1),
	(98,'010205','????????','/admin/role/bindOperPage/{roleid}',1),
	(99,'0201','??????','/admin/tech/queryFilePage',1),
	(100,'020203','????','/admin/tech/delArticle/{id}',1),
	(101,'010101','????','/admin/user/add',1),
	(102,'010104','??????','/admin/user/updatePasswd',1),
	(103,'020101','????','/admin/tech/addFile',1),
	(105,'0103','??????','/admin/oper/mainPage',1),
	(106,'010201','??????','/admin/role/addPage',1),
	(107,'0102','??????','/admin/role/mainPage',1),
	(108,'010204','??????','/admin/role/bindUser',1),
	(109,'010103','????????','/admin/user/updatePwdPage',1),
	(110,'010203','????','/admin/role/deleteByID/{id}',1),
	(111,'010205','??????','/admin/role/bindOpers',1),
	(112,'0202','??????','/admin/tech/articlePage',1),
	(113,'010202','??????','/admin/role/updatePage/{id}',1),
	(114,'010101','??????','/admin/user/addPage',1),
	(115,'020101','??????','/admin/tech/addFilePage',1),
	(116,'0201','??????','/admin/tech/filePage',1),
	(117,'020201','????','/admin/tech/addArticle',1),
	(118,'010202','????','/admin/role/update',1),
	(119,'010201','????','/admin/role/add',1),
	(120,'010206','??????','/admin/role/unbindOpers',1),
	(122,'010206','???????','/admin/role/noOpers/{roleid}',1),
	(123,'0001','?????','/admin/main',1),
	(124,'020201','??????','/admin/tech/addArticlePage',1),
	(125,'0202','??????','/admin/tech/queryArticlePage',1),
	(126,'010104','????????','/admin/user/updatePasswdPage',1),
	(127,'0102','??????','/admin/role/queryPage',1),
	(128,'010103','??????','/admin/user/updatePwd',1),
	(129,'010204','????????','/admin/role/bindUserPage/{roleid}',1),
	(131,'020102','??????','/admin/tech/updateFilePage/{id}',1),
	(132,'020202','??????','/admin/tech/updateArticlePage/{id}',1),
	(133,'020202','????','/admin/tech/updateArticle',1),
	(134,'0301','??????','/admin/log/mainPage',1),
	(135,'0301','??????','/admin/log/queryPage',1),
	(136,'0203','????','/admin/tech/testPage',1),
	(137,'020103','????','/admin/tech/delFile/{id}',1),
	(138,'020102','????','/admin/tech/updateFile',1);

/*!40000 ALTER TABLE `auth_operation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_role`;

CREATE TABLE `auth_role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rolename` varchar(20) NOT NULL COMMENT '角色名称',
  `cname` varchar(50) NOT NULL COMMENT '中文名',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息表';

LOCK TABLES `auth_role` WRITE;
/*!40000 ALTER TABLE `auth_role` DISABLE KEYS */;

INSERT INTO `auth_role` (`roleid`, `rolename`, `cname`)
VALUES
	(5,'admin1','测试管理员'),
	(23,'admin','超级管理员'),
	(25,'anonymous','匿名用户组');

/*!40000 ALTER TABLE `auth_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_role_operation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_role_operation`;

CREATE TABLE `auth_role_operation` (
  `roleid` int(11) NOT NULL COMMENT '角色ID',
  `opid` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`roleid`,`opid`),
  KEY `fk_opid` (`opid`),
  CONSTRAINT `fk_opid` FOREIGN KEY (`opid`) REFERENCES `auth_operation` (`opid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_roleid` FOREIGN KEY (`roleid`) REFERENCES `auth_role` (`roleid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关系表';

LOCK TABLES `auth_role_operation` WRITE;
/*!40000 ALTER TABLE `auth_role_operation` DISABLE KEYS */;

INSERT INTO `auth_role_operation` (`roleid`, `opid`)
VALUES
	(5,87),
	(23,87),
	(5,88),
	(23,88),
	(5,89),
	(23,89),
	(5,90),
	(23,90),
	(5,91),
	(23,91),
	(5,92),
	(23,92),
	(5,93),
	(23,93),
	(5,94),
	(23,94),
	(5,96),
	(23,96),
	(5,97),
	(23,97),
	(5,98),
	(23,98),
	(5,99),
	(23,99),
	(5,100),
	(23,100),
	(5,101),
	(23,101),
	(5,102),
	(23,102),
	(5,103),
	(23,103),
	(5,105),
	(23,105),
	(5,106),
	(23,106),
	(5,107),
	(23,107),
	(5,108),
	(23,108),
	(5,109),
	(23,109),
	(5,110),
	(23,110),
	(5,111),
	(23,111),
	(5,112),
	(23,112),
	(5,113),
	(23,113),
	(5,114),
	(23,114),
	(5,115),
	(23,115),
	(5,116),
	(23,116),
	(5,117),
	(23,117),
	(5,118),
	(23,118),
	(5,119),
	(23,119),
	(5,120),
	(23,120),
	(5,122),
	(23,122),
	(5,123),
	(23,123),
	(5,124),
	(23,124),
	(5,125),
	(23,125),
	(5,126),
	(23,126),
	(5,127),
	(23,127),
	(5,128),
	(23,128),
	(5,129),
	(23,129),
	(5,131),
	(23,131),
	(5,132),
	(23,132),
	(5,133),
	(23,133),
	(5,134),
	(23,134),
	(5,135),
	(23,135),
	(23,136),
	(23,137),
	(23,138);

/*!40000 ALTER TABLE `auth_role_operation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `useable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可用(0禁用,1可用)',
  `roleid` int(11) NOT NULL COMMENT '所属角色',
  `addtime` datetime NOT NULL COMMENT '创建时间',
  `logintime` datetime DEFAULT NULL COMMENT '登陆时间',
  `loginip` varchar(15) DEFAULT NULL COMMENT '登陆IP',
  PRIMARY KEY (`id`),
  KEY `username` (`username`) USING BTREE,
  KEY `fk_user_role` (`roleid`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`roleid`) REFERENCES `auth_role` (`roleid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `username`, `password`, `email`, `useable`, `roleid`, `addtime`, `logintime`, `loginip`)
VALUES
	(15,'ok77','e2137fae6eb8c807519b2645e433900d','meinv777@qq.com',1,25,'2016-07-02 21:53:59','2017-01-03 08:10:47','162.247.96.40'),
	(16,'caizehua','e10adc3949ba59abbe56e057f20f883e',NULL,1,5,'2016-09-29 17:21:05','2017-04-25 19:11:40','192.168.0.200'),
	(17,'ok666','2cd31ce854ce6a763f801d761bee549d','',1,25,'2017-01-04 11:38:20','2017-01-13 20:00:13','113.87.160.102'),
	(18,'admin','21232f297a57a5a743894a0e4a801fc3',NULL,1,23,'2017-04-21 14:45:05','2017-08-29 20:52:38','192.168.1.101'),
	(19,'test','96e79218965eb72c92a549dd5a330112','',1,5,'2017-05-04 11:14:31',NULL,NULL),
	(20,'userJ4o51','123456','J4o51@test.com',1,5,'2017-05-04 15:22:46',NULL,NULL),
	(21,'user3vSi8','123456','3vSi8@test.com',1,5,'2017-05-04 15:23:34',NULL,NULL),
	(22,'user9wJjI','123456','9wJjI@test.com',1,5,'2017-05-04 15:33:19',NULL,NULL),
	(23,'user2NLJB','123456','2NLJB@test.com',1,5,'2017-05-04 17:00:12',NULL,NULL),
	(24,'userjy208','123456','jy208@test.com',1,5,'2017-05-04 17:12:41',NULL,NULL),
	(25,'userfKEIy','123456','fKEIy@test.com',1,5,'2017-05-04 17:36:30',NULL,NULL),
	(26,'user59u9o','123456','59u9o@test.com',1,5,'2017-05-04 17:42:22',NULL,NULL),
	(27,'userB0VQP','123456','B0VQP@test.com',1,5,'2017-05-04 17:46:23',NULL,NULL),
	(28,'usertP745','123456','tP745@test.com',1,5,'2017-05-04 17:56:57',NULL,NULL),
	(29,'userNO3Dz','123456','NO3Dz@test.com',1,5,'2017-05-04 18:01:24',NULL,NULL),
	(30,'userebT60','123456','ebT60@test.com',1,5,'2017-05-05 10:28:41',NULL,NULL),
	(31,'userufXrw','123456','ufXrw@test.com',1,5,'2017-05-05 11:40:43',NULL,NULL),
	(32,'usernK2R8','123456','nK2R8@test.com',1,5,'2017-05-05 14:12:59',NULL,NULL),
	(33,'userb035J','123456','b035J@test.com',1,5,'2017-05-05 14:44:07',NULL,NULL);

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(11) DEFAULT NULL,
  `city_name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;

INSERT INTO `city` (`id`, `province_id`, `city_name`, `description`)
VALUES
	(1,11,'chengdu','good place'),
	(2,22,'chongqing','so so');

/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `type` tinyint(4) NOT NULL COMMENT '公司类型',
  `address` varchar(255) DEFAULT NULL COMMENT '地区',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `introduce` text COMMENT '简单介绍',
  `product_id` bigint(11) NOT NULL COMMENT '产品id',
  `description` varchar(255) DEFAULT NULL COMMENT '公司描述',
  `good_at` text COMMENT '详情',
  `score` float DEFAULT NULL COMMENT '评分',
  `oper_date` datetime NOT NULL COMMENT '操作日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';



# Dump of table i_article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `i_article`;

CREATE TABLE `i_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '发帖id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `color` varchar(20) NOT NULL COMMENT '标题颜色',
  `cover` varchar(255) NOT NULL COMMENT '封面',
  `content` text NOT NULL COMMENT '内容',
  `posttime` datetime NOT NULL COMMENT '发表时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章信息表';

LOCK TABLES `i_article` WRITE;
/*!40000 ALTER TABLE `i_article` DISABLE KEYS */;

INSERT INTO `i_article` (`id`, `uid`, `title`, `color`, `cover`, `content`, `posttime`)
VALUES
	(1,18,'测试','#2b2b32','/upload/20170502/7ff39476-f154-4511-abd1-4248c6a546d7.jpg','<p>测试测试</p><p><img src=\"/upload/20170502/c7821f6d-9164-4dfd-88ff-cee1299144f6.jpg\"/></p><p><img src=\"/upload/20170502/f1a4efb2-b1ba-4ecf-a9df-9450952d36ab.jpg\"/></p><p><br/></p>','2017-05-02 14:07:28'),
	(2,18,'测试','#2b2b32','/upload/20170502/15a2e757-0c6e-430e-8b8b-c949238ed17b.jpg','<pre>岗位职责：\r\n1．负责公司整体ios产品的整体架构设计，完成IOS平台手机软件的需求、设计、编码和自测工作；\r\n2．根据软件设计规范，开发基于iphone/ipad平台的应用程序；\r\n3．协同后台开发人员实现产品界面和功能与后台的交互；\r\n4．配合产品经理、UI设计师，研究并改善用户体验；\r\n\r\n任职要求：\r\n1、熟悉Object-C中MVC，封装，多态，委托代理，单例，Block，观察者等设计模式；\r\n2、熟悉iOS的内存管理机制和多线程开发，熟练运用GCD、NSOperation、NSThread等；\r\n3、具有良好的代码编程管理习惯，有独立分析问题和解决问题的能力；\r\n4、精通iOS下的并行开发、网络、内存管理、GUI开发等技术；\r\n5、精通iOS的消息传递机制，delegate，block，通知，推送等等；\r\n6、掌握iOS网络通信机制；熟悉http、tcp、socket等网络编程；\r\n7、了解iOS开发环境，对iOS与第三方平台开发接口的配合，有广泛深入的了解；\r\n8、具备良好的项目进度把控能力，能够独立承担项目任务，分析解决问题；\r\n9、对移动产品的用户体验有一定经验者优先。</pre><p><img src=\"/upload/20170502/631e6117-e726-4f33-8056-d54b792615ee.jpg\" title=\"\" alt=\"\"/></p>','2017-05-02 15:10:59');

/*!40000 ALTER TABLE `i_article` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table i_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `i_file`;

CREATE TABLE `i_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL COMMENT '文件原名',
  `nowname` varchar(255) NOT NULL COMMENT '文件名称',
  `savepath` varchar(255) NOT NULL COMMENT '存放位置',
  `url` varchar(255) NOT NULL COMMENT '访问地址',
  `filetype` varchar(255) NOT NULL COMMENT '文件类型',
  `filesize` bigint(20) NOT NULL COMMENT '文件大小(字节)',
  `addtime` datetime NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传的文件信息';

LOCK TABLES `i_file` WRITE;
/*!40000 ALTER TABLE `i_file` DISABLE KEYS */;

INSERT INTO `i_file` (`id`, `filename`, `nowname`, `savepath`, `url`, `filetype`, `filesize`, `addtime`)
VALUES
	(1,'产品经理招聘.docx','a5c395ed-523c-4a52-b40d-af9a53ad6307.docx','/service/upload/20170502/a5c395ed-523c-4a52-b40d-af9a53ad6307.docx','/upload/20170502/a5c395ed-523c-4a52-b40d-af9a53ad6307.docx','.docx',12379,'2017-04-28 16:17:39'),
	(2,'IOS开发工程师.txt','d67819fa-e062-421b-b4de-4878338c4c60.txt','/service/upload/20170428/d67819fa-e062-421b-b4de-4878338c4c60.txt','/upload/20170428/d67819fa-e062-421b-b4de-4878338c4c60.txt','.txt',855,'2017-04-28 16:41:53'),
	(4,'Java网络爬虫开发工程师.txt','c2dafcca-8bd3-4f48-bd20-143e53ecd83f.txt','/service/upload/20170428/c2dafcca-8bd3-4f48-bd20-143e53ecd83f.txt','/upload/20170428/c2dafcca-8bd3-4f48-bd20-143e53ecd83f.txt','.txt',1194,'2017-04-28 17:14:58'),
	(5,'《M6》会员系统功能需求文档.docx','d48ffbd5-0394-40ae-b5e4-f8ab3a23c20f.docx','/service/upload/20170502/d48ffbd5-0394-40ae-b5e4-f8ab3a23c20f.docx','/upload/20170502/d48ffbd5-0394-40ae-b5e4-f8ab3a23c20f.docx','.docx',6015953,'2017-05-02 11:01:48'),
	(6,'Java招聘.txt','dfdc9423-7abd-4bf0-9a26-a606b94b8eb5.txt','/service/upload/20170502/dfdc9423-7abd-4bf0-9a26-a606b94b8eb5.txt','/upload/20170502/dfdc9423-7abd-4bf0-9a26-a606b94b8eb5.txt','.txt',1248,'2017-05-02 11:04:50'),
	(7,'M6计算.txt','7dd95ba4-4b64-401f-b9bf-d46ebd538538.txt','/service/upload/20170502/7dd95ba4-4b64-401f-b9bf-d46ebd538538.txt','/upload/20170502/7dd95ba4-4b64-401f-b9bf-d46ebd538538.txt','.txt',179,'2017-05-02 11:05:13'),
	(8,'IOS开发工程师.txt','6929d03c-fdae-42b1-9997-3210b33a44f8.txt','/service/upload/20170502/6929d03c-fdae-42b1-9997-3210b33a44f8.txt','/upload/20170502/6929d03c-fdae-42b1-9997-3210b33a44f8.txt','.txt',855,'2017-05-02 11:20:10');

/*!40000 ALTER TABLE `i_file` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table i_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `i_log`;

CREATE TABLE `i_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '操作用户',
  `type` tinyint(4) NOT NULL COMMENT '操作类型(0操作日志;1异常日志)',
  `url` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `method` varchar(255) NOT NULL COMMENT '执行方法',
  `params` text COMMENT '请求参数',
  `requestip` varchar(255) NOT NULL COMMENT '请求IP',
  `description` varchar(255) DEFAULT NULL COMMENT '操作描述',
  `detail` text COMMENT '异常详情',
  `oper_date` datetime NOT NULL COMMENT '操作日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';

LOCK TABLES `i_log` WRITE;
/*!40000 ALTER TABLE `i_log` DISABLE KEYS */;

INSERT INTO `i_log` (`id`, `username`, `type`, `url`, `method`, `params`, `requestip`, `description`, `detail`, `oper_date`)
VALUES
	(1,'匿名操作',0,'/boot/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-02 17:15:34'),
	(2,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-02 17:16:12'),
	(3,'admin',0,'/boot/admin/main','com.xe.demo.controller.LoginController.main()','{loginIp=192.168.0.200}','192.168.0.200','进入主界面',NULL,'2017-05-02 17:16:12'),
	(2531,'匿名操作',0,'/boot/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-02 17:17:21'),
	(2532,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-02 17:17:55'),
	(2533,'admin',0,'/boot/admin/main','com.xe.demo.controller.LoginController.main()','{loginIp=192.168.0.200}','192.168.0.200','进入主界面',NULL,'2017-05-02 17:17:57'),
	(2534,'匿名操作',0,'/boot/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-02 17:18:08'),
	(2535,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-02 17:32:12'),
	(2536,'admin',0,'/boot/admin/main','com.xe.demo.controller.LoginController.main()','{loginIp=192.168.0.200}','192.168.0.200','进入主界面',NULL,'2017-05-02 17:32:17'),
	(2537,'匿名操作',0,'/boot/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-02 17:32:43'),
	(2538,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-02 17:37:27'),
	(2539,'admin',0,'/boot/admin/main','com.xe.demo.controller.LoginController.main()','{loginIp=192.168.0.200}','192.168.0.200','进入主界面',NULL,'2017-05-02 17:37:27'),
	(2540,'匿名操作',0,'/boot/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-02 17:37:33'),
	(2541,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-02 17:38:56'),
	(2542,'admin',0,'/boot/admin/main','com.xe.demo.controller.LoginController.main()','{loginIp=192.168.0.200}','192.168.0.200','进入主界面',NULL,'2017-05-02 17:38:56'),
	(2543,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-02 18:19:39'),
	(2544,'admin',0,'/boot/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-02 18:19:42'),
	(2545,'admin',0,'/boot/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询角色列表',NULL,'2017-05-02 18:19:43'),
	(2546,'admin',0,'/boot/admin/oper/queryPage','com.xe.demo.controller.OperationController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询权限列表',NULL,'2017-05-02 18:19:44'),
	(2547,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文件列表',NULL,'2017-05-02 18:19:46'),
	(2548,'admin',0,'/boot/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-02 18:19:47'),
	(2549,'admin',0,'/boot/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询角色列表',NULL,'2017-05-02 18:20:59'),
	(2550,'admin',0,'/boot/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询角色列表',NULL,'2017-05-02 18:21:17'),
	(2551,'admin',1,'/boot/admin/role/queryPage','com.xe.demo.service.RoleService.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','分页查询','/ by zero','2017-05-02 18:21:17'),
	(2552,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-02 18:33:29'),
	(2553,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:34:20'),
	(2554,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=2, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:34:24'),
	(2555,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=3, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:34:27'),
	(2556,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=100}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:34:32'),
	(2557,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:41:38'),
	(2558,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:42:02'),
	(2559,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:42:20'),
	(2560,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{useable=0, sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:44:00'),
	(2561,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{useable=0, sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:45:25'),
	(2562,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{useable=0, sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:45:37'),
	(2563,'admin',0,'/boot/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-02 18:46:00'),
	(2564,'admin',0,'/boot/admin/oper/queryPage','com.xe.demo.controller.OperationController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询权限列表',NULL,'2017-05-02 18:46:02'),
	(2565,'admin',0,'/boot/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询角色列表',NULL,'2017-05-02 18:46:04'),
	(2566,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{useable=0, sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:46:05'),
	(2567,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{useable=0, sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:46:56'),
	(2568,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:51:19'),
	(2569,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:51:47'),
	(2570,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:51:53'),
	(2571,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{pageNo=1, loginIp=192.168.0.200, pageSize=10, type=0}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:51:56'),
	(2572,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{pageNo=1, loginIp=192.168.0.200, pageSize=10, type=1}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:51:58'),
	(2573,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{pageNo=1, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:51:59'),
	(2574,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{pageNo=1, loginIp=192.168.0.200, pageSize=10, username=匿}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:52:10'),
	(2575,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{pageNo=1, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:52:23'),
	(2576,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{pageNo=1, loginIp=192.168.0.200, pageSize=10, username=admin}','192.168.0.200','查询日志列表',NULL,'2017-05-02 18:52:26'),
	(2577,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-02 20:38:41'),
	(2578,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-02 20:38:44'),
	(2579,'admin',0,'/boot/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-02 20:38:48'),
	(2580,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-02 20:45:19'),
	(2581,'admin',0,'/boot/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-02 20:45:23'),
	(2582,'admin',0,'/boot/admin/tech/updateArticle','com.xe.demo.controller.TechController.updateArticle()','{cover=/upload/20170502/8ff6b7e9-39fb-46ba-9ad5-aaa7d7888fee.jpg, uid=0, color=#2b2b32, loginIp=192.168.0.200, title=测试, content=<p>测试测试<br/></p>}','192.168.0.200','修改文章',NULL,'2017-05-02 20:45:52'),
	(2583,'admin',0,'/boot/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-02 20:47:19'),
	(2584,'admin',0,'/boot/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-02 20:47:25'),
	(2585,'admin',0,'/boot/admin/tech/updateArticle','com.xe.demo.controller.TechController.updateArticle()','{cover=/upload/20170502/15a2e757-0c6e-430e-8b8b-c949238ed17b.jpg, uid=18, color=#2b2b32, loginIp=192.168.0.200, id=2, title=测试, content=<pre>岗位职责：\r\n1．负责公司整体ios产品的整体架构设计，完成IOS平台手机软件的需求、设计、编码和自测工作；\r\n2．根据软件设计规范，开发基于iphone/ipad平台的应用程序；\r\n3．协同后台开发人员实现产品界面和功能与后台的交互；\r\n4．配合产品经理、UI设计师，研究并改善用户体验；\r\n\r\n任职要求：\r\n1、熟悉Object-C中MVC，封装，多态，委托代理，单例，Block，观察者等设计模式；\r\n2、熟悉iOS的内存管理机制和多线程开发，熟练运用GCD、NSOperation、NSThread等；\r\n3、具有良好的代码编程管理习惯，有独立分析问题和解决问题的能力；\r\n4、精通iOS下的并行开发、网络、内存管理、GUI开发等技术；\r\n5、精通iOS的消息传递机制，delegate，block，通知，推送等等；\r\n6、掌握iOS网络通信机制；熟悉http、tcp、socket等网络编程；\r\n7、了解iOS开发环境，对iOS与第三方平台开发接口的配合，有广泛深入的了解；\r\n8、具备良好的项目进度把控能力，能够独立承担项目任务，分析解决问题；\r\n9、对移动产品的用户体验有一定经验者优先。</pre><p><br/></p>}','192.168.0.200','修改文章',NULL,'2017-05-02 20:50:10'),
	(2586,'admin',0,'/boot/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-02 20:50:10'),
	(2587,'admin',0,'/boot/admin/tech/updateArticle','com.xe.demo.controller.TechController.updateArticle()','{cover=/upload/20170502/15a2e757-0c6e-430e-8b8b-c949238ed17b.jpg, uid=18, color=#2b2b32, loginIp=192.168.0.200, id=2, title=测试, content=<pre>岗位职责：\r\n1．负责公司整体ios产品的整体架构设计，完成IOS平台手机软件的需求、设计、编码和自测工作；\r\n2．根据软件设计规范，开发基于iphone/ipad平台的应用程序；\r\n3．协同后台开发人员实现产品界面和功能与后台的交互；\r\n4．配合产品经理、UI设计师，研究并改善用户体验；\r\n\r\n任职要求：\r\n1、熟悉Object-C中MVC，封装，多态，委托代理，单例，Block，观察者等设计模式；\r\n2、熟悉iOS的内存管理机制和多线程开发，熟练运用GCD、NSOperation、NSThread等；\r\n3、具有良好的代码编程管理习惯，有独立分析问题和解决问题的能力；\r\n4、精通iOS下的并行开发、网络、内存管理、GUI开发等技术；\r\n5、精通iOS的消息传递机制，delegate，block，通知，推送等等；\r\n6、掌握iOS网络通信机制；熟悉http、tcp、socket等网络编程；\r\n7、了解iOS开发环境，对iOS与第三方平台开发接口的配合，有广泛深入的了解；\r\n8、具备良好的项目进度把控能力，能够独立承担项目任务，分析解决问题；\r\n9、对移动产品的用户体验有一定经验者优先。</pre><p><img src=\"/upload/20170502/631e6117-e726-4f33-8056-d54b792615ee.jpg\" title=\"\" alt=\"\"/></p>}','192.168.0.200','修改文章',NULL,'2017-05-02 20:50:39'),
	(2588,'admin',0,'/boot/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-02 20:50:39'),
	(2589,'admin',0,'/boot/admin/tech/updateArticle','com.xe.demo.controller.TechController.updateArticle()','{cover=/upload/20170502/7ff39476-f154-4511-abd1-4248c6a546d7.jpg, uid=18, color=#2b2b32, loginIp=192.168.0.200, id=1, title=测试, content=<p>测试测试</p><p><img src=\"/upload/20170502/c7821f6d-9164-4dfd-88ff-cee1299144f6.jpg\"/></p><p><img src=\"/upload/20170502/f1a4efb2-b1ba-4ecf-a9df-9450952d36ab.jpg\"/></p><p><br/></p>}','192.168.0.200','修改文章',NULL,'2017-05-02 20:51:19'),
	(2590,'admin',0,'/boot/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-02 20:51:19'),
	(2591,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-03 09:43:25'),
	(2592,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-03 09:43:31'),
	(2593,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-03 09:43:37'),
	(2594,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-03 09:43:39'),
	(2595,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{pageNo=1, loginIp=192.168.0.200, pageSize=10, type=1}','192.168.0.200','查询日志列表',NULL,'2017-05-03 09:43:47'),
	(2596,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 09:47:46'),
	(2597,'admin',0,'/boot/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询用户列表',NULL,'2017-05-03 09:47:51'),
	(2598,'admin',0,'/boot/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文章列表',NULL,'2017-05-03 09:48:24'),
	(2599,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 09:48:26'),
	(2600,'admin',0,'/boot/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文章列表',NULL,'2017-05-03 09:48:31'),
	(2601,'admin',0,'/boot/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询用户列表',NULL,'2017-05-03 10:19:26'),
	(2602,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 10:19:28'),
	(2603,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 10:26:45'),
	(2604,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 10:26:49'),
	(2605,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 10:28:32'),
	(2606,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 10:30:41'),
	(2607,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 10:30:45'),
	(2608,'admin',0,'/boot/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文章列表',NULL,'2017-05-03 10:33:51'),
	(2609,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 10:34:29'),
	(2610,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询日志列表',NULL,'2017-05-03 10:34:35'),
	(2611,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=2, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询日志列表',NULL,'2017-05-03 10:34:44'),
	(2612,'admin',0,'/boot/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询日志列表',NULL,'2017-05-03 10:34:45'),
	(2613,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 10:41:29'),
	(2614,'admin',0,'/boot/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询用户列表',NULL,'2017-05-03 10:42:16'),
	(2615,'匿名操作',0,'/boot/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=127.0.0.1}','127.0.0.1','退出',NULL,'2017-05-03 10:42:22'),
	(2616,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 11:25:39'),
	(2617,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 11:28:15'),
	(2618,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 13:45:06'),
	(2619,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 13:45:15'),
	(2620,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:17'),
	(2621,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:19'),
	(2622,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:19'),
	(2623,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:19'),
	(2624,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:19'),
	(2625,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:19'),
	(2626,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:20'),
	(2627,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:20'),
	(2628,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:20'),
	(2629,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:20'),
	(2630,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:20'),
	(2631,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:21'),
	(2632,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:21'),
	(2633,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:21'),
	(2634,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:21'),
	(2635,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:21'),
	(2636,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:22'),
	(2637,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:22'),
	(2638,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:22'),
	(2639,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:22'),
	(2640,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:22'),
	(2641,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:23'),
	(2642,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:23'),
	(2643,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:23'),
	(2644,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:23'),
	(2645,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:23'),
	(2646,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:23'),
	(2647,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:24'),
	(2648,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:24'),
	(2649,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:24'),
	(2650,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:24'),
	(2651,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:24'),
	(2652,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:24'),
	(2653,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:24'),
	(2654,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:25'),
	(2655,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:25'),
	(2656,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:45:25'),
	(2657,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 13:54:21'),
	(2658,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:54:25'),
	(2659,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:54:25'),
	(2660,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:54:25'),
	(2661,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:54:25'),
	(2662,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:54:26'),
	(2663,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:54:26'),
	(2664,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:54:26'),
	(2665,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:54:26'),
	(2666,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:54:26'),
	(2667,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:54:27'),
	(2668,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:54:27'),
	(2669,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=20}','127.0.0.1','查询文件列表',NULL,'2017-05-03 13:54:50'),
	(2670,'admin',0,'/boot/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文章列表',NULL,'2017-05-03 13:54:52'),
	(2671,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 14:06:36'),
	(2672,'admin',0,'/boot/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询用户列表',NULL,'2017-05-03 14:07:25'),
	(2673,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 14:09:18'),
	(2674,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 14:11:38'),
	(2675,'匿名操作',0,'/boot/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=127.0.0.1}','127.0.0.1','退出',NULL,'2017-05-03 14:11:55'),
	(2676,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 14:12:16'),
	(2677,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 14:12:51'),
	(2678,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 14:19:54'),
	(2679,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 14:20:03'),
	(2680,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 14:30:35'),
	(2681,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 14:39:45'),
	(2682,'admin',0,'/boot/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询用户列表',NULL,'2017-05-03 14:42:05'),
	(2683,'匿名操作',0,'/boot/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=127.0.0.1}','127.0.0.1','退出',NULL,'2017-05-03 14:42:09'),
	(2684,'admin>',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin>}','127.0.0.1','登录',NULL,'2017-05-03 14:42:14'),
	(2685,'admin>',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin>}','127.0.0.1','登录',NULL,'2017-05-03 14:42:25'),
	(2686,'admin>',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin>}','127.0.0.1','登录',NULL,'2017-05-03 14:42:59'),
	(2687,'admin>',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin>}','127.0.0.1','登录',NULL,'2017-05-03 14:43:32'),
	(2688,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 15:06:47'),
	(2689,'admin',0,'/boot/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询用户列表',NULL,'2017-05-03 15:06:50'),
	(2690,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 15:08:40'),
	(2691,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 15:09:17'),
	(2692,'admin',0,'/boot/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询文件列表',NULL,'2017-05-03 15:10:31'),
	(2693,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=127.0.0.1, username=admin}','127.0.0.1','登录',NULL,'2017-05-03 15:18:09'),
	(2694,'admin',0,'/boot/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询用户列表',NULL,'2017-05-03 15:20:15'),
	(2695,'admin',0,'/boot/admin/oper/queryPage','com.xe.demo.controller.OperationController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=127.0.0.1, pageSize=10}','127.0.0.1','查询权限列表',NULL,'2017-05-03 15:27:52'),
	(2696,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-04 11:10:46'),
	(2697,'admin',0,'/boot/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-04 11:11:10'),
	(2698,'admin',0,'/boot/admin/user/add','com.xe.demo.controller.UserController.add()','{useable=1, password=96e79218965eb72c92a549dd5a330112, roleid=5, loginIp=192.168.0.200, email=, username=test}','192.168.0.200','添加用户',NULL,'2017-05-04 11:13:27'),
	(2699,'admin',1,'/boot/admin/user/add','com.xe.demo.service.UserService.saveUser()','{useable=1, password=96e79218965eb72c92a549dd5a330112, roleid=5, loginIp=192.168.0.200, email=, username=test}','192.168.0.200','添加用户','\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'addtime\' cannot be null\r\n### The error may involve com.xe.demo.mapper.AuthUserMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO auth_user  ( id,username,password,email,useable,roleid,addtime,logintime,loginip ) VALUES( ?,?,?,?,?,?,?,?,? )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'addtime\' cannot be null\n; SQL []; Column \'addtime\' cannot be null; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'addtime\' cannot be null','2017-05-04 11:13:45'),
	(2700,'admin',0,'/boot/admin/user/add','com.xe.demo.controller.UserController.add()','{useable=1, password=96e79218965eb72c92a549dd5a330112, roleid=5, loginIp=192.168.0.200, email=, username=test}','192.168.0.200','添加用户',NULL,'2017-05-04 11:14:31'),
	(2701,'admin',0,'/boot/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-04 11:14:31'),
	(2702,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 14:37:30'),
	(2703,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-08 14:37:35'),
	(2704,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-08 14:37:38'),
	(2705,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-08 14:53:46'),
	(2706,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 15:09:37'),
	(2707,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-08 15:09:40'),
	(2708,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{pageNo=1, loginIp=192.168.0.200, pageSize=10, type=0}','192.168.0.200','查询日志列表',NULL,'2017-05-08 15:09:44'),
	(2709,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{pageNo=1, loginIp=192.168.0.200, pageSize=10, type=1}','192.168.0.200','查询日志列表',NULL,'2017-05-08 15:09:45'),
	(2710,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-08 15:09:53'),
	(2711,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 15:18:46'),
	(2712,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 15:29:56'),
	(2713,'匿名操作',0,'/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-08 15:30:01'),
	(2714,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 15:30:13'),
	(2715,'admin',0,'/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文件列表',NULL,'2017-05-08 15:30:16'),
	(2716,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-08 15:30:18'),
	(2717,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=2, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-08 15:30:23'),
	(2718,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:22:32'),
	(2719,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','Cannot serialize; nested exception is org.springframework.core.serializer.support.SerializationFailedException: Failed to serialize object using DefaultSerializer; nested exception is java.lang.IllegalArgumentException: DefaultSerializer requires a Serializable payload but received an object of type [com.xe.demo.common.pojo.Identity]','2017-05-08 17:22:37'),
	(2720,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:23:47'),
	(2721,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','Cannot serialize; nested exception is org.springframework.core.serializer.support.SerializationFailedException: Failed to serialize object using DefaultSerializer; nested exception is java.lang.IllegalArgumentException: DefaultSerializer requires a Serializable payload but received an object of type [com.xe.demo.common.pojo.Identity]','2017-05-08 17:24:00'),
	(2722,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:28:48'),
	(2723,'admin',0,'/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文件列表',NULL,'2017-05-08 17:29:18'),
	(2724,'匿名操作',0,'/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-08 17:30:35'),
	(2725,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:30:49'),
	(2726,'admin',0,'/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文件列表',NULL,'2017-05-08 17:31:15'),
	(2727,'匿名操作',0,'/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-08 17:31:36'),
	(2728,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:34:14'),
	(2729,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','Cannot serialize; nested exception is org.springframework.core.serializer.support.SerializationFailedException: Failed to serialize object using DefaultSerializer; nested exception is java.lang.IllegalArgumentException: DefaultSerializer requires a Serializable payload but received an object of type [com.xe.demo.common.pojo.Identity]','2017-05-08 17:34:17'),
	(2730,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:35:41'),
	(2731,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','Cannot serialize; nested exception is org.springframework.core.serializer.support.SerializationFailedException: Failed to serialize object using DefaultSerializer; nested exception is java.lang.IllegalArgumentException: DefaultSerializer requires a Serializable payload but received an object of type [com.xe.demo.common.pojo.Identity]','2017-05-08 17:35:42'),
	(2732,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:36:46'),
	(2733,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','Cannot serialize; nested exception is org.springframework.core.serializer.support.SerializationFailedException: Failed to serialize object using DefaultSerializer; nested exception is java.lang.IllegalArgumentException: DefaultSerializer requires a Serializable payload but received an object of type [com.xe.demo.common.pojo.Identity]','2017-05-08 17:36:46'),
	(2734,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:37:47'),
	(2735,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:38:40'),
	(2736,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','Cannot serialize; nested exception is org.springframework.core.serializer.support.SerializationFailedException: Failed to serialize object using DefaultSerializer; nested exception is java.lang.IllegalArgumentException: DefaultSerializer requires a Serializable payload but received an object of type [com.xe.demo.common.pojo.Identity]','2017-05-08 17:38:40'),
	(2737,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:40:32'),
	(2738,'匿名操作',0,'/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-08 17:40:37'),
	(2739,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:41:41'),
	(2740,'匿名操作',0,'/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-08 17:42:11'),
	(2741,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:45:02'),
	(2742,'匿名操作',0,'/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-08 17:45:11'),
	(2743,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:45:57'),
	(2744,'匿名操作',0,'/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-08 17:46:06'),
	(2745,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:48:16'),
	(2746,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:48:44'),
	(2747,'匿名操作',0,'/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-08 17:48:47'),
	(2748,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:49:35'),
	(2749,'匿名操作',0,'/boot/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-08 17:49:39'),
	(2750,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:50:12'),
	(2751,'匿名操作',0,'/boot/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-08 17:50:16'),
	(2752,'admin',0,'/boot/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:50:23'),
	(2753,'匿名操作',0,'/boot/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-08 17:50:26'),
	(2754,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 17:50:55'),
	(2755,'匿名操作',0,'/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-08 17:50:58'),
	(2756,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 18:35:30'),
	(2757,'匿名操作',0,'/admin/logout','com.xe.demo.controller.LoginController.logout()','{loginIp=192.168.0.200}','192.168.0.200','退出',NULL,'2017-05-08 18:35:53'),
	(2758,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 18:36:12'),
	(2759,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-08 18:43:43'),
	(2760,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','Unknown redis exception; nested exception is java.lang.NullPointerException','2017-05-08 18:43:43'),
	(2761,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 09:15:27'),
	(2762,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','Unknown redis exception; nested exception is java.lang.NullPointerException','2017-05-09 09:15:28'),
	(2763,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 09:36:19'),
	(2764,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','Unknown redis exception; nested exception is java.lang.NullPointerException','2017-05-09 09:36:19'),
	(2765,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 09:36:50'),
	(2766,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','Unknown redis exception; nested exception is java.lang.NullPointerException','2017-05-09 09:37:20'),
	(2767,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 09:38:08'),
	(2768,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','Unknown redis exception; nested exception is java.lang.NullPointerException','2017-05-09 09:38:20'),
	(2769,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 09:39:43'),
	(2770,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','Unknown redis exception; nested exception is java.lang.NullPointerException','2017-05-09 09:39:43'),
	(2771,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 10:14:27'),
	(2772,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','Unknown redis exception; nested exception is java.lang.NullPointerException','2017-05-09 10:14:27'),
	(2773,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 10:15:38'),
	(2774,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 10:23:44'),
	(2775,'admin',0,'/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文件列表',NULL,'2017-05-09 10:24:03'),
	(2776,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-09 10:24:04'),
	(2777,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-09 10:24:05'),
	(2778,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询角色列表',NULL,'2017-05-09 10:24:06'),
	(2779,'admin',0,'/admin/oper/queryPage','com.xe.demo.controller.OperationController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询权限列表',NULL,'2017-05-09 10:24:06'),
	(2780,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 10:31:16'),
	(2781,'admin',0,'/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文件列表',NULL,'2017-05-09 10:31:19'),
	(2782,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-09 10:31:47'),
	(2783,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 10:42:19'),
	(2784,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-09 10:42:25'),
	(2785,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询角色列表',NULL,'2017-05-09 10:42:27'),
	(2786,'admin',0,'/admin/oper/queryPage','com.xe.demo.controller.OperationController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询权限列表',NULL,'2017-05-09 10:42:27'),
	(2787,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-09 10:42:29'),
	(2788,'admin',0,'/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文件列表',NULL,'2017-05-09 10:42:30'),
	(2789,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 11:28:31'),
	(2790,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 11:31:08'),
	(2791,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 11:36:47'),
	(2792,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 11:41:48'),
	(2793,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-09 11:41:51'),
	(2794,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询角色列表',NULL,'2017-05-09 13:53:29'),
	(2795,'admin',0,'/admin/oper/queryPage','com.xe.demo.controller.OperationController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询权限列表',NULL,'2017-05-09 13:53:31'),
	(2796,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-09 13:53:36'),
	(2797,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询角色列表',NULL,'2017-05-09 13:53:55'),
	(2798,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-09 13:55:35'),
	(2799,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 14:06:07'),
	(2800,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 14:07:58'),
	(2801,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 14:17:06'),
	(2802,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 14:17:51'),
	(2803,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 14:22:19'),
	(2804,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 14:24:37'),
	(2805,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 14:28:52'),
	(2806,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 14:31:25'),
	(2807,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 14:32:14'),
	(2808,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','[B cannot be cast to com.xe.demo.model.AuthUser','2017-05-09 14:32:14'),
	(2809,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 14:33:24'),
	(2810,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 14:34:10'),
	(2811,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','[B cannot be cast to com.xe.demo.model.AuthUser','2017-05-09 14:34:10'),
	(2812,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 14:55:17'),
	(2813,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录','[B cannot be cast to com.xe.demo.model.AuthUser','2017-05-09 14:55:17'),
	(2814,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 15:01:48'),
	(2815,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 15:22:54'),
	(2816,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 15:25:09'),
	(2817,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 15:26:23'),
	(2818,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 15:53:01'),
	(2819,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 15:53:01'),
	(2820,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 15:53:37'),
	(2821,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 15:53:48'),
	(2822,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 15:54:05'),
	(2823,'admin',1,'/admin/login','com.xe.demo.service.LoginService.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 15:54:20'),
	(2824,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-09 15:54:29'),
	(2825,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-10 10:01:54'),
	(2826,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-10 10:02:23'),
	(2827,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询角色列表',NULL,'2017-05-10 10:02:24'),
	(2828,'admin',0,'/admin/oper/queryPage','com.xe.demo.controller.OperationController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询权限列表',NULL,'2017-05-10 10:02:24'),
	(2829,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-10 10:07:07'),
	(2830,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-10 10:08:21'),
	(2831,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-10 10:09:53'),
	(2832,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-15 10:03:23'),
	(2833,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-15 10:03:29'),
	(2834,'admin',0,'/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文件列表',NULL,'2017-05-15 10:03:38'),
	(2835,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-15 10:03:49'),
	(2836,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.0.200, username=admin}','192.168.0.200','登录',NULL,'2017-05-19 15:15:20'),
	(2837,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询用户列表',NULL,'2017-05-19 15:15:23'),
	(2838,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文章列表',NULL,'2017-05-19 15:15:26'),
	(2839,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询日志列表',NULL,'2017-05-19 15:15:28'),
	(2840,'admin',0,'/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.0.200, pageSize=10}','192.168.0.200','查询文件列表',NULL,'2017-05-19 15:15:30'),
	(2841,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=e10adc3949ba59abbe56e057f20f883e, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-28 20:43:17'),
	(2842,'userJ4o51',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=e10adc3949ba59abbe56e057f20f883e, loginIp=192.168.1.101, username=userJ4o51}','192.168.1.101','??',NULL,'2017-08-28 20:43:34'),
	(2843,'userJ4o51',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=e10adc3949ba59abbe56e057f20f883e, loginIp=192.168.1.101, username=userJ4o51}','192.168.1.101','??',NULL,'2017-08-28 20:43:36'),
	(2844,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-28 20:44:07'),
	(2845,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:18'),
	(2846,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:19'),
	(2847,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:20'),
	(2848,'admin',0,'/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:21'),
	(2849,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:22'),
	(2850,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:23'),
	(2851,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:25'),
	(2852,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{pageNo=1, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:28'),
	(2853,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{pageNo=2, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:32'),
	(2854,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{pageNo=3, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:33'),
	(2855,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{pageNo=2, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:34'),
	(2856,'admin',0,'/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:37'),
	(2857,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:38'),
	(2858,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:39'),
	(2859,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:40'),
	(2860,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:44:41'),
	(2861,'admin',0,'/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:46:18'),
	(2862,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:46:25'),
	(2863,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:46:28'),
	(2864,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:46:28'),
	(2865,'admin',0,'/admin/oper/queryPage','com.xe.demo.controller.OperationController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:46:30'),
	(2866,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-28 20:56:16'),
	(2867,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:57:23'),
	(2868,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:57:35'),
	(2869,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=35, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:57:43'),
	(2870,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=34, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:57:44'),
	(2871,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:57:54'),
	(2872,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:58:12'),
	(2873,'admin',0,'/admin/oper/queryPage','com.xe.demo.controller.OperationController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:58:18'),
	(2874,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:58:19'),
	(2875,'admin',0,'/admin/role/unbindOpers','com.xe.demo.controller.RoleController.unbindOpers()','{roleid=5, loginIp=192.168.1.101}','192.168.1.101','??????',NULL,'2017-08-28 20:58:43'),
	(2876,'admin',1,'/admin/role/unbindOpers','com.xe.demo.service.RoleService.unbindOpers()','{roleid=5, loginIp=192.168.1.101}','192.168.1.101','??????',NULL,'2017-08-28 20:58:43'),
	(2877,'admin',0,'/admin/role/unbindOpers','com.xe.demo.controller.RoleController.unbindOpers()','{roleid=5, loginIp=192.168.1.101}','192.168.1.101','??????',NULL,'2017-08-28 20:58:44'),
	(2878,'admin',1,'/admin/role/unbindOpers','com.xe.demo.service.RoleService.unbindOpers()','{roleid=5, loginIp=192.168.1.101}','192.168.1.101','??????',NULL,'2017-08-28 20:58:44'),
	(2879,'admin',0,'/admin/role/unbindOpers','com.xe.demo.controller.RoleController.unbindOpers()','{roleid=5, loginIp=192.168.1.101}','192.168.1.101','??????',NULL,'2017-08-28 20:58:46'),
	(2880,'admin',1,'/admin/role/unbindOpers','com.xe.demo.service.RoleService.unbindOpers()','{roleid=5, loginIp=192.168.1.101}','192.168.1.101','??????',NULL,'2017-08-28 20:58:46'),
	(2881,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-28 20:59:02'),
	(2882,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-29 19:45:17'),
	(2883,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 19:45:25'),
	(2884,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 19:45:28'),
	(2885,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 19:45:28'),
	(2886,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 19:45:32'),
	(2887,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-29 19:51:45'),
	(2888,'admin',0,'/admin/oper/queryPage','com.xe.demo.controller.OperationController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 19:51:50'),
	(2889,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 19:51:51'),
	(2890,'admin',0,'/admin/user/queryPage','com.xe.demo.controller.UserController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 19:51:51'),
	(2891,'admin',0,'/admin/role/queryPage','com.xe.demo.controller.RoleController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 19:51:52'),
	(2892,'admin',0,'/admin/oper/queryPage','com.xe.demo.controller.OperationController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 19:51:52'),
	(2893,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 19:52:24'),
	(2894,'admin',0,'/admin/tech/queryArticlePage','com.xe.demo.controller.TechController.queryArticlePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 19:52:30'),
	(2895,'admin',0,'/admin/tech/queryFilePage','com.xe.demo.controller.TechController.queryFilePage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 19:52:30'),
	(2896,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-29 20:30:55'),
	(2897,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-29 20:31:38'),
	(2898,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-29 20:33:56'),
	(2899,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 20:34:17'),
	(2900,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-29 20:42:20'),
	(2901,'admin',0,'/admin/log/queryPage','com.xe.demo.controller.LogController.queryPage()','{sortName=id, pageNo=1, sortOrder=desc, loginIp=192.168.1.101, pageSize=10}','192.168.1.101','??????',NULL,'2017-08-29 20:44:03'),
	(2902,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-29 20:46:38'),
	(2903,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-29 20:48:51'),
	(2904,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-29 20:50:32'),
	(2905,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-29 20:51:12'),
	(2906,'admin',0,'/admin/login','com.xe.demo.controller.LoginController.login()','{password=21232f297a57a5a743894a0e4a801fc3, loginIp=192.168.1.101, username=admin}','192.168.1.101','??',NULL,'2017-08-29 20:52:38');

/*!40000 ALTER TABLE `i_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '????',
  `type` tinyint(4) NOT NULL COMMENT '????',
  `address` varchar(255) DEFAULT NULL COMMENT '??',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '??',
  `introduce` text COMMENT '????',
  `product_id` bigint(11) NOT NULL COMMENT '??id',
  `description` varchar(255) DEFAULT NULL COMMENT '????',
  `good_at` text COMMENT '?????',
  `??` float DEFAULT NULL COMMENT '??',
  `oper_date` datetime NOT NULL COMMENT '????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='?????';



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(50) DEFAULT NULL,
  `nickName` varchar(60) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `mobile` varchar(60) DEFAULT NULL,
  `email` varchar(765) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `active_degree` bigint(20) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `signature` text,
  `registe_time` datetime DEFAULT NULL,
  `province` varchar(150) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `head_img_url` varchar(765) DEFAULT NULL,
  `fk_resource_id` varchar(765) DEFAULT NULL,
  `introduction` text,
  `status` int(10) DEFAULT NULL,
  `type` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




--
-- Dumping routines (PROCEDURE) for database 'springboot'
--
DELIMITER ;;

# Dump of PROCEDURE addOrUpdateOper
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `addOrUpdateOper` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `addOrUpdateOper`(IN `opcode` varchar(20),IN `ophref` varchar(50),IN `opname` varchar(50),IN `opseq` int)
BEGIN
	declare opid int default 0;
	select op.opid intoopid from auth_operation AS op where op.opcode = opcode and op.ophref = ophref;
	if opid > 0 then
		update auth_operation set opname = opname, opseq = opseq 
		where opcode = opcode and ophref = ophref;
		delete from auth_operation where opid = opid;
	else
		insert into auth_operation(opcode, opname, ophref, opseq) 
		values(opcode, opname, ophref, opseq);
	end if;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE bind_opers
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `bind_opers` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `bind_opers`(IN `roleid` integer)
BEGIN
	/*??????????*/
	declare done int default 0;
	declare opid int;
	declare count int default 0;
	/*????*/
	declare c_opid cursor for select op.opid from auth_operation op;
	/*?? ????????done????? ???*/
	declare continue handler for not FOUND set done = 1;
	/*????*/
	open c_opid;
		repeat
			fetch c_opid into opid;
			if not done then 
				select count(op.opid) into count from auth_role_operation op where op.roleid = roleid and op.opid = opid;

				if count <= 0 then
					insert into auth_role_operation(roleid, opid) values(roleid, opid);
				end if;
			end if;
		until done end repeat;
	close c_opid;  /*????*/
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
