/*
SQLyog Community Edition- MySQL GUI v5.21
Host - 5.5.16 : Database - phalcon-app
*********************************************************************
Server version : 5.5.16
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `phalcon-app`;

USE `phalcon-app`;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `attributes` */

DROP TABLE IF EXISTS `attributes`;

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `attrname` varchar(100) DEFAULT NULL,
  `attrdesc` varchar(250) DEFAULT NULL,
  `attrtype` varchar(10) DEFAULT NULL,
  `length` int(3) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `class` varchar(150) DEFAULT NULL,
  `required` smallint(1) DEFAULT '0',
  `searchtype` enum('NONE','EXACT','TEXT','WILDCARD') DEFAULT 'NONE',
  `autonumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `attributes` */

insert  into `attributes`(`id`,`object_id`,`attrname`,`attrdesc`,`attrtype`,`length`,`domain`,`class`,`required`,`searchtype`,`autonumber`) values (1,1,'orderid','Order ID','INT',11,NULL,NULL,1,'NONE','_DEFAULT_'),(2,1,'ordernum','Order Number','VARCHAR',10,NULL,NULL,0,'WILDCARD',NULL),(3,1,'orderdate','Order DateTime','DATETIME',10,NULL,NULL,0,'EXACT',NULL),(4,1,'requestby','Request By','VARCHAR',10,NULL,NULL,0,'TEXT',NULL),(5,1,'status','Order Status','VARCHAR',5,NULL,NULL,0,'WILDCARD',NULL);

/*Table structure for table `modules` */

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(100) DEFAULT NULL,
  `classname` varchar(300) DEFAULT NULL,
  `path` varchar(300) DEFAULT NULL,
  `status` smallint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `modules` */

insert  into `modules`(`id`,`module`,`classname`,`path`,`status`) values (1,'frontend','Modules\\Frontend\\Module','../apps/frontend/Module.php',1),(2,'backend','Modules\\Backend\\Module','../apps/backend/Module.php',1);

/*Table structure for table `objects` */

DROP TABLE IF EXISTS `objects`;

CREATE TABLE `objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objname` varchar(150) DEFAULT NULL,
  `objdesc` varchar(200) DEFAULT NULL,
  `class` varchar(250) DEFAULT NULL,
  `mainobj` smallint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `objects` */

insert  into `objects`(`id`,`objname`,`objdesc`,`class`,`mainobj`) values (1,'orders','Order main object','app.frontend.order',1),(2,'orderitems','List of detail order item','app.frontend.orderitem',0),(3,'items','List of items','app.frontend.item',1);

/*Table structure for table `relationships` */

DROP TABLE IF EXISTS `relationships`;

CREATE TABLE `relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relationname` varchar(100) DEFAULT NULL,
  `relationtype` enum('belongsTo','hasMany','hasOne','hasManyToMany') DEFAULT 'hasOne',
  `fieldsource` varchar(100) DEFAULT NULL,
  `fieldtarget` varchar(100) DEFAULT NULL,
  `alias` varchar(150) DEFAULT NULL,
  `reusable` smallint(1) DEFAULT '0',
  `foregnkey` varchar(100) DEFAULT NULL,
  `msg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `relationships` */

/*Table structure for table `routes` */

DROP TABLE IF EXISTS `routes`;

CREATE TABLE `routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route` varchar(300) DEFAULT NULL,
  `module` varchar(100) DEFAULT NULL,
  `controller` varchar(100) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `status` smallint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `routes` */

insert  into `routes`(`id`,`route`,`module`,`controller`,`action`,`status`) values (1,'/admin','backend','index','index',1),(2,'/index','frontend','index','index',1),(3,'/','frontend','index','index',1),(4,'/coba','frontend','index','test',1);

/*Table structure for table `usr_orders` */

DROP TABLE IF EXISTS `usr_orders`;

CREATE TABLE `usr_orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `ordernum` varchar(10) DEFAULT NULL,
  `orderdate` datetime DEFAULT NULL,
  `requestby` varchar(10) DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usr_orders` */

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
