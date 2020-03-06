/*
SQLyog Ultimate v8.32 
MySQL - 5.5.36 : Database - bookstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bookstore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bookstore`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `price` double(11,2) unsigned NOT NULL,
  `sales` int(11) unsigned NOT NULL,
  `stock` int(11) unsigned NOT NULL,
  `img_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`id`,`name`,`author`,`price`,`sales`,`stock`,`img_path`) values (42,'cocos2d-x游戏编程入门','国哥',47.00,62,52,'static/img/default.jpg'),(44,'Lua语言程序设计','雷丰阳',49.50,51,79,'static/img/default.jpg'),(46,'水浒传','华仔',31.05,23,87,'static/img/default.jpg'),(47,'操作系统原理','刘优',131.05,124,186,'static/img/default.jpg'),(48,'数据结构 java版','封大神',171.15,22,80,'static/img/default.jpg'),(50,'javaScript高级编程','国哥',67.15,211,809,'static/img/default.jpg'),(52,'人月神话','刚哥',86.15,20,80,'static/img/default.jpg'),(55,'怎样拐跑别人的媳妇','龙伍',66.00,99999,52,'static/img/default.jpg'),(56,'木虚肉盖饭','小胖',14.00,1000,50,'static/img/default.jpg'),(57,'C++编程思想','刚哥',43.50,14,95,'static/img/default.jpg'),(58,'蛋炒饭','周星星',7.90,12,53,'static/img/default.jpg'),(59,'赌神','龙伍',64.50,125,535,'static/img/default.jpg'),(60,'Java编程思想','阳哥',97.50,47,36,'static/img/default.jpg'),(61,'JavaScript从入门到精通','婷姐',7.90,85,95,'static/img/default.jpg'),(62,'cocos2d-x游戏编程入门','国哥',47.00,52,62,'static/img/default.jpg'),(63,'C语言程序设计','谭浩强',26.00,52,74,'static/img/default.jpg'),(64,'Lua语言程序设计','雷丰阳',49.50,48,82,'static/img/default.jpg'),(65,'西游记','罗贯中',10.00,19,9999,'static/img/default.jpg'),(66,'水浒传','华仔',31.05,22,88,'static/img/default.jpg'),(69,'UNIX高级环境编程','乐天',97.15,210,810,'static/img/default.jpg'),(70,'javaScript高级编程','国哥',67.15,210,810,'static/img/default.jpg'),(71,'大话设计模式','国哥',87.15,20,10,'static/img/default.jpg'),(72,'人月神话','刚哥',86.15,20,80,'static/img/default.jpg'),(76,'12','23',23.00,23,23,'/static/img/default.jpg'),(78,'12','23',2323.00,23,23,'/static/img/default.jpg'),(79,'12','12',12.00,12,12,'/static/img/default.jpg'),(80,'12','12',12.00,12,12,'/static/img/default.jpg'),(81,'1212','1212112',12.00,212,121212,'/static/img/default.jpg'),(82,'1212','1212112',12.00,212,12,'/static/img/default.jpg');

/*Table structure for table `checkout` */

DROP TABLE IF EXISTS `checkout`;

CREATE TABLE `checkout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(15) NOT NULL,
  `check_code` varchar(40) NOT NULL,
  `status` int(5) NOT NULL,
  `money` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `checkout` */

insert  into `checkout`(`id`,`user_name`,`check_code`,`status`,`money`,`date`) values (1,'123456','82bfb7d85aaa495cb1bf0195ff5ed658',1,246.65,'2020-03-03'),(2,'123456','6b61cfa3902b471babeab1d768904ea0',1,174.5,'2020-03-04'),(3,'123456','363e1b6229d843deb2040e4e229f619f',1,229.8,'2020-03-05'),(4,'123456','c7925053a9fc46f9ba5c7f218d554355',1,382.8,'2020-03-05'),(5,'123456','710eddcbccf34056bc3f8bac33dbe41c',1,179.3,'2020-03-05'),(6,'123456','0769a8af14674414b9da2af638fdd828',1,141.9,'2020-03-05'),(7,'123456','8a0126436caf440c92019ac0acb65a6b',1,90.5,'2020-03-05'),(8,'1234567','ecdbcded7578467483353d505b46e406',1,369.35,'2020-03-06'),(9,'123456','1D96583EEF5D41F0B06402D58F74CB1C',1,132.5,'2020-03-06'),(10,'123456','514240C834384866B5B14C46E2C07372',1,132.5,'2020-03-06'),(11,'121212','9E435003D4CD4A4EB6556D089F772845',1,258.6,'2020-03-06');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`) values (1,'tomcat2','123456','1212'),(2,'tomcat1','123456','1212'),(4,'tomcat5','123456','1212'),(5,'曾海亮','123456','123@qq.com'),(9,'1212','121','123@qq.com'),(10,'121212','121212','12@qq.com'),(11,'121221','121221','12@qq.com'),(13,'829388293','121212','12@qq.com'),(14,'root12','root12','12@qq.com'),(16,'121232323','121212','12@qq.com'),(18,'123456','123456','123@qq.com'),(19,'121234','121212','12@qq.com'),(20,'1234562','121212','12@qq.com'),(21,'1234567','1234567','12@qq.com'),(22,'12121212','121212','12@qq.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
