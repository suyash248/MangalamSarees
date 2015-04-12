/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.6.20 : Database - personaldb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`personaldb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `personaldb`;

/*Table structure for table `authorities` */

DROP TABLE IF EXISTS `authorities`;

CREATE TABLE `authorities` (
  `AUTH_ID` int(10) NOT NULL AUTO_INCREMENT,
  `AUTHORITY_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AUTH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `authorities` */

insert  into `authorities`(`AUTH_ID`,`AUTHORITY_NAME`) values (1,'ROLE_USER'),(2,'ROLE_AUDIENCE'),(3,'ROLE_DIRECTOR'),(4,'ROLE_ADMIN'),(5,'ROLE_PRODUCER'),(6,'ROLE_OPENID');

/*Table structure for table `group_authorities` */

DROP TABLE IF EXISTS `group_authorities`;

CREATE TABLE `group_authorities` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(10) NOT NULL,
  `AUTH_ID` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_3vv0hp8pfdwi7kfqhqwjedry3` (`AUTH_ID`),
  KEY `FK_od0behvix3bo1t025vif36tk7` (`GROUP_ID`),
  CONSTRAINT `FK_3vv0hp8pfdwi7kfqhqwjedry3` FOREIGN KEY (`AUTH_ID`) REFERENCES `authorities` (`AUTH_ID`),
  CONSTRAINT `FK_od0behvix3bo1t025vif36tk7` FOREIGN KEY (`GROUP_ID`) REFERENCES `groups` (`GROUP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `group_authorities` */

insert  into `group_authorities`(`ID`,`GROUP_ID`,`AUTH_ID`) values (1,1,3),(2,1,5);

/*Table structure for table `group_members` */

DROP TABLE IF EXISTS `group_members`;

CREATE TABLE `group_members` (
  `GROUP_MEMBER_ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(200) NOT NULL,
  `GROUP_ID` int(10) NOT NULL,
  PRIMARY KEY (`GROUP_MEMBER_ID`),
  KEY `FK_dw0515xfyfi4o5bla1ya1yqfc` (`GROUP_ID`),
  KEY `FK_jngujmbxgyqvlodgcehdqp0yh` (`USER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `group_members` */

insert  into `group_members`(`GROUP_MEMBER_ID`,`USER_NAME`,`GROUP_ID`) values (1,'audience',1);

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `GROUP_ID` int(10) NOT NULL AUTO_INCREMENT,
  `GROUP_NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`GROUP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

insert  into `groups`(`GROUP_ID`,`GROUP_NAME`) values (1,'Director');

/*Table structure for table `merchants` */

DROP TABLE IF EXISTS `merchants`;

CREATE TABLE `merchants` (
  `MERCHANT_ID` int(10) NOT NULL AUTO_INCREMENT,
  `MERCHANT_NAME` varchar(50) NOT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`MERCHANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `merchants` */

insert  into `merchants`(`MERCHANT_ID`,`MERCHANT_NAME`,`PHONE`,`ADDRESS`) values (1,'Saaree Museum','8403808290','Hi-Tech, Jhansi'),(4,'saroj','9838633535','nowgong'),(5,'Matu Saaree','9889203002','Compu, Gwalior'),(7,'Tanishq Saaree','8930820184','Suit-1, Ludhiana'),(8,'Saree Ghar','8903672890','Sector-21, Delhi'),(9,'Gwalior Saree','7892096289','Compu, Gwalior'),(10,'Nathu ram','923409209','Kochhi'),(11,'Trituvantpuram Saree','7890267831','Sector-20, Kerala');

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `TRANSACTION_ID` int(10) NOT NULL AUTO_INCREMENT,
  `MERCHANT_ID` int(10) NOT NULL,
  `AMOUNT` decimal(8,2) NOT NULL,
  `TRANSACTION_NUMBER` varchar(50) DEFAULT NULL,
  `TRANSACTION_TYPE` varchar(100) NOT NULL,
  `TRANSACTION_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TRANSACTION_ID`),
  KEY `FK_rsqm09js41kglsjvldi1hk6g0` (`MERCHANT_ID`),
  CONSTRAINT `FK_rsqm09js41kglsjvldi1hk6g0` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `merchants` (`MERCHANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `transactions` */

insert  into `transactions`(`TRANSACTION_ID`,`MERCHANT_ID`,`AMOUNT`,`TRANSACTION_NUMBER`,`TRANSACTION_TYPE`,`TRANSACTION_DATE`) values (1,5,'25000.00','101','Debit','2015-03-05 00:00:00'),(2,1,'22000.00','102','Credit','2015-02-07 00:00:00'),(3,4,'30000.00','103','Credit','2015-02-09 00:00:00'),(4,4,'35000.00','104','Debit','2015-02-15 00:00:00'),(5,7,'75000.00','105','GR','2015-04-02 00:00:00'),(6,1,'345435.00','106','GR','2015-04-06 00:00:00'),(7,7,'9384.00','107','Credit','2015-04-07 00:00:00'),(8,5,'534546.00','108','Credit','2015-02-16 00:00:00'),(9,4,'96576.00','108','GR','2015-01-21 00:00:00'),(10,1,'74564.00','109','GR','2015-02-10 00:00:00'),(11,7,'95566.00','110','Debit','2015-04-25 00:00:00'),(12,4,'47656.00','113','Credit','2015-03-18 00:00:00'),(13,1,'500000.00','114','Debit','2015-04-09 00:00:00'),(14,7,'400000.00','115','Debit','2015-04-02 00:00:00'),(15,8,'50000.00','120','Debit','2015-04-02 00:00:00'),(16,8,'22000.00','121','Credit','2015-04-03 00:00:00'),(17,5,'34000.00','121','Debit','2015-04-08 00:00:00'),(18,7,'35000.00','122','Debit','2015-04-07 00:00:00'),(19,5,'15000.00','123','Credit','2015-04-09 00:00:00'),(20,7,'20000.00','125','Credit','2015-04-14 00:00:00'),(21,9,'80000.00','130','Debit','2015-03-14 00:00:00'),(22,9,'20000.00','131','Credit','2015-03-28 00:00:00');

/*Table structure for table `user_authorities` */

DROP TABLE IF EXISTS `user_authorities`;

CREATE TABLE `user_authorities` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(200) NOT NULL,
  `AUTH_ID` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ihsn0h5ni6gvesvusfiv7xf2i` (`AUTH_ID`),
  KEY `FK_5qd13nxr8p5yhycfonrurwi2d` (`USER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `user_authorities` */

insert  into `user_authorities`(`ID`,`USER_NAME`,`AUTH_ID`) values (1,'admin',1),(2,'admin',2),(3,'admin',3),(4,'admin',4),(5,'director',1),(6,'director',3),(7,'audience',1),(8,'audience',2),(9,'https://www.google.com/accounts/o8/id?id=AItOawncSJjr0fm7BURvuC1KlnyswE2oc9iI54Y',1),(10,'https://www.google.com/accounts/o8/id?id=AItOawncSJjr0fm7BURvuC1KlnyswE2oc9iI54Y',2),(11,'https://www.google.com/accounts/o8/id?id=AItOawncSJjr0fm7BURvuC1KlnyswE2oc9iI54Y',6),(12,'https://www.google.com/accounts/o8/id?id=AItOawmS3VTQ8nF2lw5K-9L7TEuOHjPgx4qbqyc',1),(13,'https://www.google.com/accounts/o8/id?id=AItOawmS3VTQ8nF2lw5K-9L7TEuOHjPgx4qbqyc',2),(14,'https://www.google.com/accounts/o8/id?id=AItOawmS3VTQ8nF2lw5K-9L7TEuOHjPgx4qbqyc',6);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `USER_ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(200) NOT NULL,
  `USER_PASS` varchar(40) NOT NULL,
  `ACTIVE` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`USER_NAME`),
  UNIQUE KEY `USER_NAME` (`USER_NAME`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`USER_ID`,`USER_NAME`,`USER_PASS`,`ACTIVE`) values (1,'admin','admin',1),(2,'audience','audience',1),(3,'director','director',1),(11,'https://www.google.com/accounts/o8/id?id=AItOawmS3VTQ8nF2lw5K-9L7TEuOHjPgx4qbqyc','',1),(10,'https://www.google.com/accounts/o8/id?id=AItOawncSJjr0fm7BURvuC1KlnyswE2oc9iI54Y','',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
