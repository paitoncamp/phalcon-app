/*
SQLyog Community Edition- MySQL GUI v5.21
Host - 5.5.16 : Database - pp_01
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
  `attrname` varchar(100) DEFAULT NULL,
  `attrdesc` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `attributes` */

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `routes` */

insert  into `routes`(`id`,`route`,`module`,`controller`,`action`,`status`) values (1,'/admin','backend','index','index',1),(2,'/index','frontend','index','index',1),(3,'/','frontend','index','index',1);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
