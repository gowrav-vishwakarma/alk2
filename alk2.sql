-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: alk2
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `alk2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `alk2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `alk2`;

--
-- Table structure for table `filestore_file`
--

DROP TABLE IF EXISTS `filestore_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filestore_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filestore_type_id` int(11) NOT NULL DEFAULT '0',
  `filestore_volume_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `original_filename` varchar(255) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `filenum` int(11) NOT NULL DEFAULT '0',
  `deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filestore_file`
--

LOCK TABLES `filestore_file` WRITE;
/*!40000 ALTER TABLE `filestore_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `filestore_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filestore_image`
--

DROP TABLE IF EXISTS `filestore_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filestore_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `original_file_id` int(11) NOT NULL DEFAULT '0',
  `thumb_file_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filestore_image`
--

LOCK TABLES `filestore_image` WRITE;
/*!40000 ALTER TABLE `filestore_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `filestore_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filestore_type`
--

DROP TABLE IF EXISTS `filestore_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filestore_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mime_type` varchar(64) NOT NULL DEFAULT '',
  `extension` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filestore_type`
--

LOCK TABLES `filestore_type` WRITE;
/*!40000 ALTER TABLE `filestore_type` DISABLE KEYS */;
INSERT INTO `filestore_type` VALUES (1,'png','image/png','png'),(2,'jpeg','image/jpeg','jpeg'),(3,'gif','image/gif','gif'),(4,'jpg','image/jpg','jpg');
/*!40000 ALTER TABLE `filestore_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filestore_volume`
--

DROP TABLE IF EXISTS `filestore_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filestore_volume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `dirname` varchar(255) NOT NULL DEFAULT '',
  `total_space` bigint(20) NOT NULL DEFAULT '0',
  `used_space` bigint(20) NOT NULL DEFAULT '0',
  `stored_files_cnt` int(11) NOT NULL DEFAULT '0',
  `enabled` enum('Y','N') DEFAULT 'Y',
  `last_filenum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filestore_volume`
--

LOCK TABLES `filestore_volume` WRITE;
/*!40000 ALTER TABLE `filestore_volume` DISABLE KEYS */;
INSERT INTO `filestore_volume` VALUES (1,'upload','upload',1000000000,0,68,'Y',NULL);
/*!40000 ALTER TABLE `filestore_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_requests`
--

DROP TABLE IF EXISTS `fund_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `on_date` datetime NOT NULL,
  `fund_requested` int(11) NOT NULL,
  `fund_distributed` int(11) DEFAULT '0',
  `status` varchar(255) NOT NULL,
  `approved_rejected_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_requests`
--

LOCK TABLES `fund_requests` WRITE;
/*!40000 ALTER TABLE `fund_requests` DISABLE KEYS */;
INSERT INTO `fund_requests` VALUES (12,1,'2013-07-23 16:07:05',1500,0,'Pending','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `fund_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_transfer`
--

DROP TABLE IF EXISTS `fund_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `on_date` datetime NOT NULL,
  `fund` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_transfer`
--

LOCK TABLES `fund_transfer` WRITE;
/*!40000 ALTER TABLE `fund_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kit_master`
--

DROP TABLE IF EXISTS `kit_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kit_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `joining_amount` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `pin_amount` int(11) NOT NULL,
  `sponsor_percentage` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kit_master`
--

LOCK TABLES `kit_master` WRITE;
/*!40000 ALTER TABLE `kit_master` DISABLE KEYS */;
INSERT INTO `kit_master` VALUES (1,'2000',2000,1,500,10),(2,'4000',4000,1,1000,12),(3,'8000',8000,1,2000,15),(4,'16000',16000,1,4000,18),(5,'20000',20000,1,5000,20);
/*!40000 ALTER TABLE `kit_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kit_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile_number` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) NOT NULL,
  `IFSC` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `bank_branch` varchar(255) NOT NULL,
  `fund_available` int(11) NOT NULL,
  `is_activated` tinyint(4) NOT NULL,
  `join_on` datetime NOT NULL,
  `activated_on` datetime DEFAULT NULL,
  `sponsor_id` int(11) NOT NULL,
  `is_eligible_for_growth` tinyint(4) NOT NULL,
  `status` varchar(255) NOT NULL,
  `day_1_growth` int(11) NOT NULL,
  `day_2_growth` int(11) NOT NULL,
  `day_3_growth` int(11) NOT NULL,
  `day_4_growth` int(11) NOT NULL,
  `day_5_growth` int(11) NOT NULL,
  `day_6_growth` int(11) NOT NULL,
  `day_7_growth` int(11) NOT NULL,
  `level_1_fund` int(11) NOT NULL,
  `level_2_fund` int(11) NOT NULL,
  `level_3_fund` int(11) NOT NULL,
  `level_4_fund` int(11) NOT NULL,
  `level_5_fund` int(11) NOT NULL,
  `level_6_fund` int(11) NOT NULL,
  `level_7_fund` int(11) NOT NULL,
  `level_8_fund` int(11) NOT NULL,
  `level_9_fund` int(11) NOT NULL,
  `level_10_fund` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `last_daily_run_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,1,'root','root','12344','12121212','arawal007@gmail.com',NULL,NULL,'MyBankName','MyIFSCCode','MyAccountNumber','',100000,1,'2013-07-23 15:23:13','2013-07-23 15:23:13',0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0',NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_distribution`
--

DROP TABLE IF EXISTS `request_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fund_request_id` int(11) NOT NULL,
  `withdrawl_request_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `on_date` datetime NOT NULL,
  `fund` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_distribution`
--

LOCK TABLES `request_distribution` WRITE;
/*!40000 ALTER TABLE `request_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawl_request`
--

DROP TABLE IF EXISTS `withdrawl_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdrawl_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `on_date` datetime NOT NULL,
  `fund` int(11) NOT NULL,
  `alloted_fund` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `approved_on_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawl_request`
--

LOCK TABLES `withdrawl_request` WRITE;
/*!40000 ALTER TABLE `withdrawl_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdrawl_request` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-25 11:03:07
