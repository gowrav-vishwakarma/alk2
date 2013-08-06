-- phpMyAdmin SQL Dump
-- version 3.5.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 06, 2013 at 12:42 AM
-- Server version: 5.1.70-cll
-- PHP Version: 5.3.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fastrich_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `filestore_file`
--

CREATE TABLE IF NOT EXISTS `filestore_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filestore_type_id` int(11) NOT NULL DEFAULT '0',
  `filestore_volume_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `original_filename` varchar(255) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `filenum` int(11) NOT NULL DEFAULT '0',
  `deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `filestore_file`
--

INSERT INTO `filestore_file` (`id`, `filestore_type_id`, `filestore_volume_id`, `filename`, `original_filename`, `filesize`, `filenum`, `deleted`) VALUES
(5, 4, 1, '0/20130725061916_1_thumb-rajeev-videos-074.jpg', 'thumb_RAJEEV VIDEOS 074.jpg', 0, 0, ''),
(6, 4, 1, '0/20130725061916__rajeev-videos-074.jpg', 'RAJEEV VIDEOS 074.jpg', 576061, 0, ''),
(7, 4, 1, '0/20130725061958_1_thumb-rajeev-videos-007.jpg', 'thumb_RAJEEV VIDEOS 007.JPG', 0, 0, ''),
(8, 4, 1, '0/20130725061958__rajeev-videos-007.jpg', 'RAJEEV VIDEOS 007.JPG', 15263, 0, ''),
(9, 4, 1, '0/20130802150220_1_thumb-money-logo.jpg', 'thumb_money logo.jpg', 0, 0, ''),
(10, 4, 1, '0/20130802150220__money-logo.jpg', 'money logo.jpg', 302371, 0, ''),
(11, 3, 1, '0/20130804233415_1_thumb-rajeev-videos-014.gif', 'thumb_RAJEEV VIDEOS 014.gif', 0, 0, ''),
(12, 3, 1, '0/20130804233415__rajeev-videos-014.gif', 'RAJEEV VIDEOS 014.gif', 5640, 0, ''),
(13, 4, 1, '0/20130804233451_1_thumb-rajeev-videos-042.jpg', 'thumb_RAJEEV VIDEOS 042.jpg', 0, 0, ''),
(14, 4, 1, '0/20130804233451__rajeev-videos-042.jpg', 'RAJEEV VIDEOS 042.jpg', 11895, 0, ''),
(15, 4, 1, '0/20130805014644_1_thumb-rajeev-videos-021.jpg', 'thumb_RAJEEV VIDEOS 021.JPG', 0, 0, ''),
(16, 4, 1, '0/20130805014644__rajeev-videos-021.jpg', 'RAJEEV VIDEOS 021.JPG', 30499, 0, ''),
(17, 4, 1, '0/20130805014741_1_thumb-rajeev-videos-023.jpg', 'thumb_RAJEEV VIDEOS 023.JPG', 0, 0, ''),
(18, 4, 1, '0/20130805014741__rajeev-videos-023.jpg', 'RAJEEV VIDEOS 023.JPG', 32238, 0, ''),
(19, 4, 1, '0/20130805022024_1_thumb-rupya.jpg', 'thumb_rupya.jpg', 0, 0, ''),
(20, 4, 1, '0/20130805022024__rupya.jpg', 'rupya.jpg', 74532, 0, ''),
(21, 4, 1, '0/20130805022049_1_thumb-rupya.jpg', 'thumb_rupya.jpg', 0, 0, ''),
(22, 4, 1, '0/20130805022049__rupya.jpg', 'rupya.jpg', 74532, 0, ''),
(23, 4, 1, '0/20130805172554_1_thumb-rajeev-videos-209.jpg', 'thumb_RAJEEV VIDEOS 209.jpg', 0, 0, ''),
(24, 4, 1, '0/20130805172554__rajeev-videos-209.jpg', 'RAJEEV VIDEOS 209.jpg', 120929, 0, ''),
(25, 4, 1, '0/20130805173312_1_thumb-picture-001.jpg', 'thumb_Picture 001.jpg', 0, 0, ''),
(26, 4, 1, '0/20130805173312__picture-001.jpg', 'Picture 001.jpg', 26204, 0, ''),
(27, 4, 1, '0/20130805173900_1_thumb-rajeev-videos-186.jpg', 'thumb_RAJEEV VIDEOS 186.jpg', 0, 0, ''),
(28, 4, 1, '0/20130805173900__rajeev-videos-186.jpg', 'RAJEEV VIDEOS 186.jpg', 11261, 0, ''),
(29, 4, 1, '0/20130805181044_1_thumb-image.jpg', 'thumb_Image.jpg', 0, 0, ''),
(30, 4, 1, '0/20130805181044__image.jpg', 'Image.jpg', 188985, 0, ''),
(31, 4, 1, '0/20130805181615_1_thumb-image.jpg', 'thumb_Image.jpg', 0, 0, ''),
(32, 4, 1, '0/20130805181615__image.jpg', 'Image.jpg', 188985, 0, ''),
(33, 4, 1, '0/20130805181848_1_thumb-image.jpg', 'thumb_Image.jpg', 0, 0, ''),
(34, 4, 1, '0/20130805181848__image.jpg', 'Image.jpg', 188985, 0, ''),
(35, 4, 1, '0/20130805195052_1_thumb-img014.jpg', 'thumb_img014.jpg', 0, 0, ''),
(36, 4, 1, '0/20130805195052__img014.jpg', 'img014.jpg', 8639, 0, ''),
(37, 4, 1, '0/20130806074924_1_thumb-rajeev-kumar-rathi-rs-6000-icici-bank-internet-banking.jpg', 'thumb_Rajeev Kumar Rathi Rs 6000 ICICI Bank - Internet Banking.jpg', 0, 0, ''),
(38, 4, 1, '0/20130806074924__rajeev-kumar-rathi-rs-6000-icici-bank-internet-banking.jpg', 'Rajeev Kumar Rathi Rs 6000 ICICI Bank - Internet Banking.jpg', 46677, 0, ''),
(39, 4, 1, '0/20130806075123_1_thumb-rajeev-kumar-rathi-rs-6000-icici-bank-internet-banking.jpg', 'thumb_Rajeev Kumar Rathi Rs 6000 ICICI Bank - Internet Banking.jpg', 0, 0, ''),
(40, 4, 1, '0/20130806075123__rajeev-kumar-rathi-rs-6000-icici-bank-internet-banking.jpg', 'Rajeev Kumar Rathi Rs 6000 ICICI Bank - Internet Banking.jpg', 46677, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `filestore_image`
--

CREATE TABLE IF NOT EXISTS `filestore_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `original_file_id` int(11) NOT NULL DEFAULT '0',
  `thumb_file_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `filestore_image`
--

INSERT INTO `filestore_image` (`id`, `name`, `original_file_id`, `thumb_file_id`) VALUES
(1, NULL, 2, 1),
(2, NULL, 4, 3),
(3, NULL, 6, 5),
(4, NULL, 8, 7),
(5, NULL, 10, 9),
(6, NULL, 12, 11),
(7, NULL, 14, 13),
(8, NULL, 16, 15),
(9, NULL, 18, 17),
(10, NULL, 20, 19),
(11, NULL, 22, 21),
(12, NULL, 24, 23),
(13, NULL, 26, 25),
(14, NULL, 28, 27),
(15, NULL, 30, 29),
(16, NULL, 32, 31),
(17, NULL, 34, 33),
(18, NULL, 36, 35),
(19, NULL, 38, 37),
(20, NULL, 40, 39);

-- --------------------------------------------------------

--
-- Table structure for table `filestore_type`
--

CREATE TABLE IF NOT EXISTS `filestore_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mime_type` varchar(64) NOT NULL DEFAULT '',
  `extension` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `filestore_type`
--

INSERT INTO `filestore_type` (`id`, `name`, `mime_type`, `extension`) VALUES
(1, 'png', 'image/png', 'png'),
(2, 'jpeg', 'image/jpeg', 'jpeg'),
(3, 'gif', 'image/gif', 'gif'),
(4, 'jpg', 'image/jpg', 'jpg');

-- --------------------------------------------------------

--
-- Table structure for table `filestore_volume`
--

CREATE TABLE IF NOT EXISTS `filestore_volume` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `filestore_volume`
--

INSERT INTO `filestore_volume` (`id`, `name`, `dirname`, `total_space`, `used_space`, `stored_files_cnt`, `enabled`, `last_filenum`) VALUES
(1, 'upload', 'upload', 1000000000, 0, 108, 'Y', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fund_requests`
--

CREATE TABLE IF NOT EXISTS `fund_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `on_date` datetime NOT NULL,
  `fund_requested` int(11) NOT NULL,
  `fund_distributed` int(11) DEFAULT '0',
  `status` varchar(255) NOT NULL,
  `approved_rejected_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `fund_requests`
--

INSERT INTO `fund_requests` (`id`, `from_id`, `on_date`, `fund_requested`, `fund_distributed`, `status`, `approved_rejected_date`) VALUES
(12, 1, '2013-07-23 16:07:05', 1500, 0, 'Pending', '0000-00-00 00:00:00'),
(17, 6, '2013-07-24 08:31:09', 3000, 3000, 'Pending', '0000-00-00 00:00:00'),
(18, 7, '2013-07-24 09:02:37', 15000, 15000, 'Approved', '2013-08-04 23:36:53'),
(19, 8, '2013-07-24 10:48:12', 15000, 15000, 'Approved', '2013-08-05 01:49:38'),
(20, 9, '2013-07-25 06:56:10', 6000, 6000, 'Pending', '0000-00-00 00:00:00'),
(21, 10, '2013-07-25 07:03:06', 3000, 3000, 'Pending', '0000-00-00 00:00:00'),
(22, 11, '2013-07-25 07:17:41', 3000, 3000, 'Approved', '2013-08-05 17:35:47'),
(23, 12, '2013-07-25 07:22:40', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(24, 13, '2013-07-25 08:42:10', 3000, 3000, 'Pending', '0000-00-00 00:00:00'),
(25, 14, '2013-07-25 08:52:54', 12000, 12000, 'Pending', '0000-00-00 00:00:00'),
(26, 15, '2013-07-25 09:28:05', 3000, 3000, 'Approved', '2013-08-05 20:07:59'),
(27, 16, '2013-07-25 10:19:05', 3000, 3000, 'Approved', '2013-08-05 19:11:32'),
(28, 17, '2013-07-25 12:14:21', 1500, 0, 'Pending', '0000-00-00 00:00:00'),
(29, 18, '2013-07-25 13:36:23', 6000, 0, 'Pending', '0000-00-00 00:00:00'),
(30, 19, '2013-07-25 13:42:54', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(31, 20, '2013-07-25 13:53:09', 6000, 6000, 'Pending', '0000-00-00 00:00:00'),
(32, 21, '2013-07-26 04:30:48', 15000, 15000, 'Approved', '2013-08-05 02:21:50'),
(33, 22, '2013-07-26 04:37:20', 6000, 0, 'Pending', '0000-00-00 00:00:00'),
(34, 23, '2013-07-26 12:44:02', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(35, 24, '2013-07-26 12:57:27', 1500, 0, 'Pending', '0000-00-00 00:00:00'),
(36, 25, '2013-07-26 13:06:37', 6000, 0, 'Pending', '0000-00-00 00:00:00'),
(37, 26, '2013-07-26 13:08:35', 6000, 0, 'Pending', '0000-00-00 00:00:00'),
(38, 27, '2013-07-26 13:14:03', 15000, 0, 'Pending', '0000-00-00 00:00:00'),
(39, 28, '2013-07-27 02:56:05', 6000, 6000, 'Pending', '0000-00-00 00:00:00'),
(40, 29, '2013-07-27 08:50:58', 1500, 1500, 'Approved', '2013-08-05 17:51:47'),
(41, 30, '2013-07-27 08:55:54', 6000, 6000, 'Approved', '2013-08-05 17:51:59'),
(42, 31, '2013-07-28 05:30:42', 6000, 0, 'Pending', '0000-00-00 00:00:00'),
(43, 32, '2013-07-28 07:42:17', 1500, 0, 'Pending', '0000-00-00 00:00:00'),
(44, 33, '2013-07-28 10:26:52', 6000, 0, 'Pending', '0000-00-00 00:00:00'),
(45, 34, '2013-07-29 12:15:19', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(46, 35, '2013-07-29 13:30:47', 15000, 0, 'Pending', '0000-00-00 00:00:00'),
(47, 36, '2013-07-29 13:39:41', 15000, 0, 'Pending', '0000-00-00 00:00:00'),
(48, 37, '2013-07-29 13:43:15', 15000, 0, 'Pending', '0000-00-00 00:00:00'),
(49, 38, '2013-07-29 13:45:10', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(50, 39, '2013-07-29 13:46:57', 15000, 0, 'Pending', '0000-00-00 00:00:00'),
(51, 40, '2013-07-29 13:48:56', 15000, 0, 'Pending', '0000-00-00 00:00:00'),
(52, 41, '2013-07-30 11:59:11', 6000, 0, 'Pending', '0000-00-00 00:00:00'),
(53, 42, '2013-07-30 12:04:35', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(54, 43, '2013-07-31 07:03:40', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(55, 44, '2013-07-31 10:17:20', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(56, 45, '2013-07-31 10:44:54', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(57, 46, '2013-08-01 00:42:35', 1500, 0, 'Pending', '0000-00-00 00:00:00'),
(58, 47, '2013-08-01 00:50:23', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(59, 48, '2013-08-01 06:35:14', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(60, 49, '2013-08-01 08:18:02', 3000, 3000, 'Pending', '0000-00-00 00:00:00'),
(61, 50, '2013-08-01 09:53:52', 6000, 0, 'Pending', '0000-00-00 00:00:00'),
(62, 51, '2013-08-01 11:47:01', 1500, 0, 'Pending', '0000-00-00 00:00:00'),
(63, 52, '2013-08-01 12:27:35', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(64, 53, '2013-08-01 13:08:46', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(65, 54, '2013-08-01 13:12:57', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(66, 55, '2013-08-01 13:17:03', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(67, 56, '2013-08-01 13:20:50', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(68, 57, '2013-08-02 05:22:15', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(69, 58, '2013-08-02 09:48:38', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(70, 59, '2013-08-02 11:34:58', 6000, 6000, 'Pending', '0000-00-00 00:00:00'),
(71, 60, '2013-08-02 14:57:41', 15000, 15000, 'Approved', '2013-08-02 15:03:15'),
(72, 61, '2013-08-04 01:03:43', 3000, 3000, 'Pending', '0000-00-00 00:00:00'),
(73, 62, '2013-08-04 05:36:36', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(74, 63, '2013-08-05 18:38:14', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(75, 64, '2013-08-05 20:23:33', 1500, 0, 'Pending', '0000-00-00 00:00:00'),
(76, 65, '2013-08-05 21:29:30', 1500, 0, 'Pending', '0000-00-00 00:00:00'),
(77, 66, '2013-08-05 23:20:58', 1500, 0, 'Pending', '0000-00-00 00:00:00'),
(78, 67, '2013-08-06 00:43:19', 1500, 0, 'Pending', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfer`
--

CREATE TABLE IF NOT EXISTS `fund_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `on_date` datetime NOT NULL,
  `fund` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `fund_transfer`
--

INSERT INTO `fund_transfer` (`id`, `from_id`, `to_id`, `on_date`, `fund`) VALUES
(2, 1, 7, '2013-07-24 09:03:21', 50000),
(3, 7, 8, '2013-07-25 06:20:52', 1000),
(4, 7, 8, '2013-07-25 06:21:56', 1000),
(5, 7, 11, '2013-07-25 07:25:04', 1000),
(6, 7, 13, '2013-07-25 08:48:47', 4000),
(7, 8, 17, '2013-07-25 13:22:57', 10000),
(8, 8, 17, '2013-07-25 13:24:30', 10000),
(9, 7, 14, '2013-07-26 12:30:41', 1000),
(10, 7, 24, '2013-07-26 13:00:33', 2000),
(11, 7, 15, '2013-07-26 13:01:42', 5000),
(12, 7, 29, '2013-07-27 09:13:59', 5000),
(13, 7, 34, '2013-07-29 12:33:03', 5000),
(14, 1, 21, '2013-07-29 13:17:17', 50000),
(15, 21, 32, '2013-07-29 13:18:52', 50000),
(16, 32, 35, '2013-07-29 13:31:56', 45000),
(17, 1, 21, '2013-07-29 13:57:53', 9500),
(18, 21, 38, '2013-07-30 04:51:21', 10000),
(19, 21, 7, '2013-07-30 04:52:12', 10000),
(20, 1, 21, '2013-07-30 06:23:38', 500),
(21, 1, 21, '2013-07-30 10:02:15', 9500),
(22, 21, 22, '2013-07-30 11:51:46', 3000),
(23, 7, 43, '2013-07-31 07:04:45', 10000),
(24, 7, 44, '2013-07-31 10:18:04', 10000),
(25, 8, 7, '2013-07-31 10:38:59', 15000),
(26, 7, 48, '2013-08-01 06:36:12', 5000),
(27, 1, 49, '2013-08-01 08:23:45', 25000),
(28, 44, 50, '2013-08-01 10:12:31', 5000),
(29, 1, 7, '2013-08-02 05:15:12', 25000),
(30, 7, 29, '2013-08-02 05:24:25', 5000),
(31, 7, 58, '2013-08-02 09:51:08', 5000),
(32, 7, 59, '2013-08-02 11:35:28', 10000),
(33, 1, 62, '2013-08-04 05:39:29', 100000),
(34, 1, 59, '2013-08-04 09:03:31', 40000);

-- --------------------------------------------------------

--
-- Table structure for table `kit_master`
--

CREATE TABLE IF NOT EXISTS `kit_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `joining_amount` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `pin_amount` int(11) NOT NULL,
  `sponsor_percentage` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `kit_master`
--

INSERT INTO `kit_master` (`id`, `name`, `joining_amount`, `is_active`, `pin_amount`, `sponsor_percentage`) VALUES
(1, '2000', 2000, 1, 500, 10),
(2, '4000', 4000, 1, 1000, 12),
(3, '8000', 8000, 1, 2000, 15),
(4, '16000', 16000, 1, 4000, 18),
(5, '20000', 20000, 1, 5000, 20);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `kit_id`, `name`, `username`, `password`, `mobile_number`, `email`, `city`, `state`, `bank_name`, `IFSC`, `account_number`, `bank_branch`, `fund_available`, `is_activated`, `join_on`, `activated_on`, `sponsor_id`, `is_eligible_for_growth`, `status`, `day_1_growth`, `day_2_growth`, `day_3_growth`, `day_4_growth`, `day_5_growth`, `day_6_growth`, `day_7_growth`, `level_1_fund`, `level_2_fund`, `level_3_fund`, `level_4_fund`, `level_5_fund`, `level_6_fund`, `level_7_fund`, `level_8_fund`, `level_9_fund`, `level_10_fund`, `path`, `last_daily_run_at`) VALUES
(1, 1, 'GANESH ', 'GANESH', '1234444', '12121212', 'arawal007@gmail.com', NULL, NULL, 'MyBankName', 'MyIFSCCode', 'MyAccountNumber', 'U', 152020, 1, '2013-07-23 15:23:13', '2013-07-23 15:23:13', 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 4000, 3200, 2100, 720, 0, 0, 0, 0, 0, 0, '0', NULL),
(6, 2, 'sainath', 'sainath', 'nahikhulna', '7737500924', 'arawal007@gmail.com', 'u', 'r', 'AXIS BANK', 'UTIB0000097', '911010007052767', 'MAIN BRANCH UDAIPUR', 10740, 0, '2013-07-24 08:31:08', NULL, 1, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 8000, 2400, 840, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(7, 5, 'RAJEEV KUMAR RATHI', 'RAJEEV', '1234567891', '9719257257', 'rajeevrathi6@gmail.com', 'HARIDWAR', 'UTTARANCHAL', 'SBI', 'SBIN0012849', '20149323445', 'HARIDWAR', -500, 1, '2013-07-24 09:02:37', '2013-08-04 23:36:53', 6, 0, 'Approved', 0, 0, 0, 0, 0, 0, 0, 5160, 960, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(8, 5, 'ravinder kumar', 'kumar', '567891234', '9461242733', 'aaaaaaa', 'aaaaa', 'aaaaa', 'axis bank ltd', 'aaaa', '911010026779571', 'mukundgarh', 36000, 1, '2013-07-24 10:48:12', '2013-08-05 01:49:38', 7, 0, 'Approved', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(9, 3, 'vikash kumar singh', 'vikash', '654321', '8765297069', 'vikashmmm1983@gmail.com', 'partapgarh', 'u p', 'S B I', 'sbin0000157', '30251892079', 'partapgarh', 0, 0, '2013-07-25 06:56:10', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(10, 2, 'ashwini dattatray kulkarni', 'ashwin', '9876', '8390985929', 'ashwinipagar13@gmail.com', 'gangapur', 'maharastra', ' S B I', 'sbin0012510', '30774452556', 'nasik', 0, 0, '2013-07-25 07:03:06', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(11, 2, 'hamid ali', 'ali', 'HAMID719', '9336937719', 'hamidalipbh@gmail.com', 'partapgarh', 'u p', 'icici', 'icic0000819', '081901501241', 'partapgarh', 480, 1, '2013-07-25 07:17:41', '2013-08-05 17:35:47', 7, 0, 'Approved', 0, 0, 0, 0, 0, 0, 0, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(12, 2, 'anil kumar yadav', 'kumar1', '1234', '9706163785', 'akyonweb@gmail.com', 'dibrugarh ', 'assam', 'a', 'a', 'a', 'a', 0, 0, '2013-07-25 07:22:40', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(13, 2, 'krishna mohan kumar', 'mohan', '1234', '9899416325', 'rinki02ritesh@gmail.com', 'G Z B', 'up', 'S B I', 'sbin0001364', '31501721933', 'kasimpur aligarh', 0, 0, '2013-07-25 08:42:10', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(14, 4, 'krishna mohan kumar', 'mohan1', '1234', '9899416325', 'rinki02ritesh@gmail.com', 'G Z B', 'U P', 'S B I', 'sbin0001364', '31501721933', 'kasimpur aligarh', 0, 0, '2013-07-25 08:52:54', NULL, 13, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(15, 2, 'manmohan singh', 'jassi', '1234', '9988001646', 'manmohan.advocate@gmail.com', 'ludhiana', 'punjab', 'S B I', 'sbin0001150', '10883183095', 'kaser ganj ludhiana', 0, 1, '2013-07-25 09:28:05', '2013-08-05 20:07:59', 7, 0, 'Approved', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(16, 2, 'AVDHESH KUMAR MAURYA', 'AVD001', '9bfe1370', '9919946947', 'avdmaurya75@gmail.com', 'PRATAPGARH', 'UTTAR PRADESH', 'STATE BANK OF INDIA', 'SBIN0006674', '31441637695', 'ADB PRATAPGARH', 0, 1, '2013-07-25 10:19:05', '2013-08-05 19:11:32', 11, 0, 'Approved', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(17, 1, 'POONAM SHARMA', 'POONAM A SHARMA', 'ANAND1@1', '9694291266', 'ravindrasuroliya@gmail.com', 'JHUNJHUNU', 'RAJASTHAN', 'STATE BANK OF INDIA', 'SBIN0006098', '31253701858', 'JHUNJHUNU', 17000, 0, '2013-07-25 12:14:21', NULL, 8, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(18, 3, 'POONAM SHARMA', 'ANAND P SHARMA', 'ANAND1@1', '9462255269', 'ravindrasuroliya@gmail.com', 'jhunjhunu', 'rajasthan', 'state bank of india', 'SBIN0006098', '31253701858', 'JHUNJHUNU', 0, 0, '2013-07-25 13:36:22', NULL, 17, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(19, 2, 'MANDEEP SINGH', 'MANDEEP', 'MOGA123', '9653837172', 'mandeep.karwal@rediffmail.com', 'moga', 'panjab', 'STATE BANK OF INDIA', 'SBIN0001776', '31654142566', 'MOGA', 0, 0, '2013-07-25 13:42:54', NULL, 17, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(20, 3, 'sanjarekha mohanty', 'sanja', 'FASTRICH2013', '9090669505', 'sanjarekha.mohanty@gmail.com', 'bhubaneswer', 'odisha', 'bank of india', 'bkid0005553', '555310110003149', 'bhubneswer', 0, 0, '2013-07-25 13:53:09', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(21, 5, 'NIDHI RAWAL', 'NIDHI', '1234567', '7737500924', 'mlmkhiladi@gmail.com', 'UDAIPUR', 'RAJ', 'AXIS BANK', 'UTIB0000097', '911010007052767', 'MAIN BRANCH UDAIPUR', 25500, 1, '2013-07-26 04:30:48', '2013-08-05 02:21:50', 6, 0, 'Approved', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(22, 3, 'MURLI DHAR SAHU', 'MURLI', '0987', '8560083298', 'murli.sahu.udaipur@gmail.com', 'UDAIPUR', 'RAJASTHAN', 'AXIS BANK', 'UTIB0000097', '913010020901000', 'MAIN BRANCH UDAIPUR', 0, 0, '2013-07-26 04:37:20', NULL, 21, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(23, 2, 'farood khadri', 'khadri', '987654', '9160000400', 'fkhadri@gmail.com', 'haydrabad', 'andhraparddesh', 'S B I', 'sbin000000', '20159636819', 'vidya nagar', 0, 0, '2013-07-26 12:44:02', NULL, 14, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(24, 1, 'sanjay n thawre', 'sanjay001', '9876', '9545795046', 'sanjaythawre@gmail.com', 'khaparkheda', 'maharastra', 'S B I', 'sbin0012310', '32550124828', 'khaparkheda', 0, 0, '2013-07-26 12:57:27', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(25, 3, 'sanjay n thawre', 'sanjay002', '9876', '9545795046', 'sanjaythawre@gmail.com', 'khaparkheda', 'maharastra', 'S B I', 'sbin0012310', '32550124828', 'khaparkheda', 0, 0, '2013-07-26 13:06:37', NULL, 24, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(26, 3, 'PRABHU LAL SAHU', 'SAHU', 'sahu', '9828450365', 'plsahu.888@gmail.com', 'UDAIPUR', 'RAJASTHAN', 'PUNJAB NATIONAL BANK', 'PUNB0356600', '3566000100096655', 'UDAIPUR', 0, 0, '2013-07-26 13:08:34', NULL, 22, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(27, 5, 'manmohan singh', 'jassi1', '1234', '9988001646', 'manmohan.advocate@gmail.com', 'ludhiana', 'punjab', 'S B I', 'sbin0001150', '10883183095', 'kaser ganj', 0, 0, '2013-07-26 13:14:03', NULL, 15, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(28, 3, 'SATPAL MAHOUR', 'SATPAL', '5871623', '09810247169', 'satpalmahour@gmail.com', 'DELHI', 'DELHI', 'ICICI BANK', 'ICIC0000065', '006501040790', 'VASANT VIHAR NEW DELHI', 0, 0, '2013-07-27 02:56:05', NULL, 21, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(29, 1, 'sunil gopalrao bundele', 'gopal', '9876', '9823271073', 'sunilbmmm@gmail.com', 'kolhapur', 'maharastra', 'axis bank', 'utib0000134', '913010026889876', 'kolhapur', 5200, 1, '2013-07-27 08:50:58', '2013-08-05 17:51:47', 7, 0, 'Approved', 0, 0, 0, 0, 0, 0, 0, 1200, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(30, 3, 'sunil gopalrao bundele', 'gopal1', '9876', '9823271073', 'sunilbmmm@gmail.com', 'kolhapur', 'maharastra', 'axis bank', 'utib0000134', '913010026889876', 'kolhapur', 0, 1, '2013-07-27 08:55:54', '2013-08-05 17:51:59', 29, 0, 'Approved', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(31, 3, 'RAJESH SHANTARAM PAWAR', 'RAJESH', '1234', '09821138630', 'rajeshmmm8@gmail.com', 'MUMBAI', 'MAHARASHTRA', 'STATE BANK OF INDIA', 'SBIN0003837', '30300745279', 'MUMBAI MAHIM WEST', 0, 0, '2013-07-28 05:30:42', NULL, 21, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(32, 1, 'PANKAJ SAHU', 'PANKAJ', '123321', '9314410064', 'pankajsahu2255@gmail.com', 'UDAIPUR', 'RAJASTHAN', 'AXIS BANK', 'UTIB0000097', '911010047312757', 'MAIN BRANCH UDAIPUR', 0, 0, '2013-07-28 07:42:17', NULL, 21, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(33, 3, 'jay shinde', 'jay', '9876', '9630890663', 'arman.shinde@gmail.com', 'manawar', 'aa', 'S B I', 'sbin0030045', '31746113619', 'manawar', 0, 0, '2013-07-28 10:26:52', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(34, 2, 'vishesh boratane', 'vish', '9876', '9823660670', 'vishesh2307@gmail.com', 'amravati', 'maharastra', 'I D B I', 'ibkl0000507', '0507104000071336', 'amravati', 5000, 0, '2013-07-29 12:15:19', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(35, 5, 'Pankaj sahu', 'psahu1', 'pankajjisa', '9314410064', 'psahu2222@gmail.com', 'udaipur', 'Rajasthan', 'AXIS BANK', 'UTIB0000097', '911010047312757', 'Main Brach UDAIPUR, RAJASTHAN', 23500, 0, '2013-07-29 13:30:47', NULL, 32, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(36, 5, 'Pankaj sahu', 'psahu2', 'pankajjisa', '9314410064', 'psahu2222@gmail.com', 'udaipur', 'rajasthan', 'AXIS BANK', 'UTIB0000097', '911010047312757', 'Main Branch,UDAIPUR (RAJASTHAN)', 0, 0, '2013-07-29 13:39:41', NULL, 35, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(37, 5, 'Pankaj sahu', 'psahu3', 'pankajjisa', '9460359922', 'psahu2222@gmail.com', 'Udaipur', 'Rajasthan', 'AXIS BANK', 'UTIB0000097', '911010047312757', 'Main Branch,UDAIPUR (RAJASTHAN)', 0, 0, '2013-07-29 13:43:15', NULL, 35, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(38, 2, 'SANDEEP YADAV', 'YADAV', '58673700', '8382092968', 'sandeepwmm@gmail.com', 'LUCKHNOW', 'U.P.', 'PUNJAB NATIONAL BANK', 'PUNB0474700', '4747001500124225', 'FAZIL NAGAR', 10000, 0, '2013-07-29 13:45:10', NULL, 21, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(39, 5, 'Pankaj sahu', 'psahu4', 'pankajjisa', '9460359922', 'psahu2222@gmail.com', 'Udaipur', 'Udaipur', 'AXIS BANK', 'UTIB0000097', '911010047312757', 'Main Branch,UDAIPUR (RAJASTHAN)', 0, 0, '2013-07-29 13:46:57', NULL, 35, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(40, 5, 'Pankaj sahu', 'psahu5', 'pankajjisa', '9314410064', 'psahu2222@gmail.com', 'Udaipur', 'Rajasthan', 'AXIS BANK', 'UTIB0000097', '911010047312757', 'Main Branch,UDAIPUR (RAJASTHAN)', 0, 0, '2013-07-29 13:48:56', NULL, 35, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(41, 3, 'sushil sen', 'sen', '0987', '09828437979', 'tonegyasushil@gmail.com', 'udaipur', 'raj', 'sbi', 'sbin0011407', '20011733254', 'udaipur', 0, 0, '2013-07-30 11:59:11', NULL, 26, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(42, 2, 'sushil sen', 'sushil', '0987', '9828437979', 'tonegyasushil@gmail.com', 'udaipur', 'raj', 's.b.i', 'sbin0011407', '20011733254', 'udaipur', 0, 0, '2013-07-30 12:04:35', NULL, 26, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(43, 2, 'dheeraj kushwah', 'kush', '123123', '9300316570', 'dheerajkushwah04@gmail.com', 'gwalior', 'm p', 'P N B', '000000000', '3237001500083725', 'gwalior', 9500, 0, '2013-07-31 07:03:40', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(44, 2, 'paramjeet singh manocha', 'singh', '251066', '9827055113', 'manjeetpackersandmovers@yahoo.com', 'bhopal', 'm p', 'icici bank ltd', 'icic0000055', '005501522597', 'mp nagar', 3000, 0, '2013-07-31 10:17:20', NULL, 8, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(45, 2, 'THE GREEN GANE', 'MAHESH', '1234', '08383993738', 'greenhome145@gmail.com', 'MUMBAI', 'MAHARSTRA', 'IDBI BANK', 'IBKL0000495', '495102000001625', 'THANE', 0, 0, '2013-07-31 10:44:54', NULL, 21, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(46, 1, 'SATISH  A. MANE', 'pdm', '111111', '7385835567', 'satishmane19@gmail.com', 'Miraj', 'maharastra', 'Syndicate Bank', 'SYNB0005391', '53912010003807', 'Miraj', 0, 0, '2013-08-01 00:42:35', NULL, 35, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(47, 2, 'RAKESHKUMAR B JOSHI', 'activemlm', 'vedanta330', '8460108000', 'activemlm@gmail.com', 'Surat', 'Gujrat', 'ICICI BANK', 'ICIC0000851', '085101507190', 'Citylight, SURAT', 0, 0, '2013-08-01 00:50:23', NULL, 35, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(48, 2, 'pushpendra singh', 'push', '321321', '9458558280', 'pushpendra91nnn@gmail.com', 'mainpuri', 'u p', 'axis bank', 'utib0001093', '911010061304767', 'mainpuri', 5000, 0, '2013-08-01 06:35:14', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(49, 2, 'omprakash', 'opnigam', 'sonu123', '9719057773', 'sonu55.speak@gmail.com', 'nainital', 'uttrakhand', 'S B I', 'sbin0015458', '33058047528', 'nainital', 24000, 0, '2013-08-01 08:18:02', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(50, 3, 'baljeet singh', 'dilraj', '1234001234', '9303779393', 'dilrajmanocha@gmail.com', 'bhopal', 'm.p', 'axis bank', 'aass', '1233333', 'bhopal', 5000, 0, '2013-08-01 09:53:52', NULL, 44, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(51, 1, 'DURGESH VERMA', 'BALAJI', '123123', '7489755461', 'durgeshverma10@gmail.com', 'gwalior', 'm.p.', 'state bank of india', 'SBIN0004352', '30006746379', 'CITY CENTRE GWALIOR', 0, 0, '2013-08-01 11:47:01', NULL, 43, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(52, 2, 'DHARMENDRA PATEL', 'PATEL', '4321', '09907785214', 'dharampatel151091@gmail.com', 'MHOW', 'M.P.', 'IDBI BANK', 'IBKL0000053', '0053104000206143', 'MHOW', 0, 0, '2013-08-01 12:27:35', NULL, 21, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(53, 2, 'rajit aggarwal', 'rajit', '123123', '9318165084', 'rajitaggarwal777@gmail.com', 'baddi', 'maharastra', 'S B I', 'sbin0005397', '20101369565', 'baddi', 0, 0, '2013-08-01 13:08:46', NULL, 29, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(54, 2, 'deendayal yadav', 'yadav01', '123123', '9935728126', 'guruy939@gmail.com', 'allahabad', 'u p', 'S B I', 'sbin0003486', '10554046767', 'naini allahabad', 0, 0, '2013-08-01 13:12:57', NULL, 29, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(55, 2, 'mamta hazarika', 'mamta', '123123', '9774626439', 'mamzzhazarika1234@gmail.com', 'naharlagun', 'arunachal pardesh', 'S B I', 'sbin0003232', '32886648808', 'naharlagun', 0, 0, '2013-08-01 13:17:03', NULL, 29, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(56, 2, 'amit kane', 'kane', '123123', '9766327686', '1985@gmail.com', 'kolhapur', 'maharastra', 'icici bank', '0000166', '01669522762', 'kolhapur', 0, 0, '2013-08-01 13:20:50', NULL, 29, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(57, 2, 'ibrahim a makandar', 'ibrahim', '123123', '9270292999', 'aaaaaaaaaaa', 'kolhapur', 'maharastra', 'bank of india ', 'bkid0000936', '093610100009264', 'kolhapur', 0, 0, '2013-08-02 05:22:15', NULL, 29, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(58, 2, 'sagar nandre', 'sagar', '123123', '8888728422', 'sagaramji@gmail.com', 'bombay', 'maharastra', 'aaaa', 'aaaa', 'aaaa', 'aaaa', 5000, 0, '2013-08-02 09:48:38', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(59, 3, 'laxmikant badghare', 'laxmi', '123123', '8109138870', 'arsguds@gmail.com', 'raipur', ' chatisgarh', 'S B I', 'sbin0011739', '30336612001', 'tatibandh raipur', 49500, 0, '2013-08-02 11:34:58', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(60, 5, 'ram', 'ram', '0987654321', '0000000000', 'kjkj', 'jkuio', 'uiuiu', 'uiuioui', 'uiui', 'uiui', 'uiui', 0, 1, '2013-08-02 14:57:41', '2013-08-02 15:03:15', 1, 0, 'Approved', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(61, 2, 'rajesh', 'rajubaz', 'raju123', '9058261413', 'raj.saini2004@gmail.com', 'bazpur', 'uttrakhand', 'state bank of  india', 'SBIN0015457', '33178051243', 'bailparao', 0, 0, '2013-08-04 01:03:43', NULL, 49, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(62, 2, 'ashis kumar sahu', 'ashis', '123333', '9040019197', 'mmmashis19@gmail.com', 'cuttack', 'bhubneswer', 'S B I', 'sbin0004229', '20003787095', 'cuttack', 100000, 0, '2013-08-04 05:36:36', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(63, 2, 'ashish kanea', 'ashish', '123123', '8975751098', 'ashishkanemmm@gmail.com', 'kohlapur', 'maharastra.', 'sbi  bank', 'sbin 0004257', '31041107117.', 'kohlapur.', 0, 0, '2013-08-05 18:38:14', NULL, 29, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(64, 1, 'DHARMENDRA PATEL', 'patanahi00000', '4321', '09907785214', 'dharampatel151091@gmail.com', 'INDORE', 'MADHYA PRADESH', 'IDBI BANK', 'IBKL0000053', '0053104000206143', 'MHOW', 0, 0, '2013-08-05 20:23:33', NULL, 52, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(65, 1, 'lalit badghare', 'lalit', 'lalit', '9893334852', 'lalitbadghare@gmail.com', 'raipur', 'CHHATTISGARH', 'state bank of india', 'SBIN0011739', '30316018848', 'TATIBANDH RAIPUR', 0, 0, '2013-08-05 21:29:30', NULL, 59, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(66, 1, 'ram', 'ra', 'ra', 'ccc', 'ssdf', 'sdf', 'dfg', 'dfghhj', 'dfgh', '4520', 'sdff', 0, 0, '2013-08-05 23:20:58', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(67, 1, 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 'f', 0, 0, '2013-08-06 00:43:19', NULL, 66, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `request_distribution`
--

CREATE TABLE IF NOT EXISTS `request_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fund_request_id` int(11) NOT NULL,
  `withdrawl_request_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `on_date` datetime NOT NULL,
  `fund` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `request_distribution`
--

INSERT INTO `request_distribution` (`id`, `fund_request_id`, `withdrawl_request_id`, `status`, `on_date`, `fund`, `image_id`) VALUES
(1, 17, 3, 'Pending', '2013-07-24 00:00:00', 2000, 0),
(2, 17, 4, 'Pending', '2013-07-24 00:00:00', 1000, 0),
(3, 18, 4, 'Approved', '2013-07-24 00:00:00', 1500, 6),
(4, 18, 5, 'Approved', '2013-07-24 00:00:00', 5000, 8),
(5, 71, 6, 'Approved', '2013-08-02 00:00:00', 15000, 10),
(6, 18, 6, 'Approved', '2013-08-04 00:00:00', 5000, 12),
(7, 18, 8, 'Approved', '2013-08-04 00:00:00', 3500, 14),
(8, 19, 8, 'Approved', '2013-08-05 00:00:00', 5000, 16),
(9, 19, 10, 'Approved', '2013-08-05 00:00:00', 10000, 18),
(10, 32, 12, 'Approved', '2013-08-05 00:00:00', 15000, 22),
(11, 24, 11, 'Pending', '2013-08-05 00:00:00', 3000, 0),
(12, 25, 13, 'Pending', '2013-08-05 00:00:00', 10000, 0),
(13, 25, 14, 'Pending', '2013-08-05 00:00:00', 2000, 0),
(14, 20, 15, 'Pending', '2013-08-05 00:00:00', 6000, 0),
(15, 22, 11, 'Approved', '2013-08-05 00:00:00', 3000, 26),
(16, 26, 11, 'Approved', '2013-08-05 00:00:00', 3000, 36),
(17, 27, 16, 'Approved', '2013-08-05 00:00:00', 3000, 34),
(18, 31, 11, 'Pending', '2013-08-05 00:00:00', 1000, 0),
(19, 31, 17, 'Pending', '2013-08-05 00:00:00', 5000, 0),
(20, 21, 17, 'Pending', '2013-08-05 00:00:00', 3000, 0),
(21, 40, 18, 'Approved', '2013-08-05 00:00:00', 1500, 24),
(22, 41, 18, 'Approved', '2013-08-05 00:00:00', 6000, 28),
(23, 39, 9, 'Pending', '2013-08-05 00:00:00', 6000, 0),
(24, 70, 20, 'Pending', '2013-08-05 00:00:00', 6000, 0),
(25, 60, 27, 'Pending', '2013-08-05 00:00:00', 3000, 0),
(26, 72, 27, 'Pending', '2013-08-05 00:00:00', 3000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawl_request`
--

CREATE TABLE IF NOT EXISTS `withdrawl_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `on_date` datetime NOT NULL,
  `fund` int(11) NOT NULL,
  `alloted_fund` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `approved_on_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `withdrawl_request`
--

INSERT INTO `withdrawl_request` (`id`, `from_id`, `on_date`, `fund`, `alloted_fund`, `status`, `type`, `approved_on_date`) VALUES
(3, 1, '2013-07-24 08:05:59', 2000, 2000, 'Pending', 'Extra', NULL),
(4, 1, '2013-07-24 08:07:12', 2500, 2500, 'Pending', 'Extra', NULL),
(5, 1, '2013-07-24 08:07:44', 5000, 5000, 'Approved', 'Extra', '2013-08-01'),
(6, 1, '2013-08-02 14:58:28', 20000, 20000, 'Approved', 'Extra', '2013-08-04'),
(7, 60, '2013-08-02 15:03:15', 10000, 0, 'Pending', 'Joining', NULL),
(8, 1, '2013-08-04 23:30:54', 8500, 8500, 'Approved', 'Extra', '2013-08-05'),
(9, 7, '2013-08-04 23:36:53', 10000, 6000, 'Pending', 'Joining', NULL),
(10, 1, '2013-08-05 01:39:21', 10000, 10000, 'Approved', 'Extra', '2013-08-05'),
(11, 8, '2013-08-05 01:49:38', 10000, 10000, 'Pending', 'Joining', NULL),
(12, 1, '2013-08-05 02:18:06', 100000, 15000, 'Approved', 'Extra', '2013-08-05'),
(13, 21, '2013-08-05 02:21:50', 10000, 10000, 'Pending', 'Joining', NULL),
(14, 21, '2013-08-05 02:48:30', 2000, 2000, 'Pending', 'Extra', NULL),
(15, 21, '2013-08-05 02:50:29', 6000, 6000, 'Pending', 'Extra', NULL),
(16, 21, '2013-08-05 02:52:35', 3000, 3000, 'Approved', 'Extra', '2013-08-05'),
(17, 8, '2013-08-05 02:57:03', 8000, 8000, 'Pending', 'Extra', NULL),
(18, 21, '2013-08-05 03:02:41', 7500, 7500, 'Approved', 'Extra', '2013-08-05'),
(19, 7, '2013-08-05 03:09:21', 10000, 0, 'Pending', 'Extra', NULL),
(20, 8, '2013-08-05 03:46:34', 6000, 6000, 'Pending', 'Extra', NULL),
(21, 11, '2013-08-05 17:35:47', 2000, 0, 'Pending', 'Joining', NULL),
(22, 7, '2013-08-05 17:49:07', 22000, 0, 'Pending', 'Extra', NULL),
(23, 29, '2013-08-05 17:51:47', 1000, 0, 'Pending', 'Joining', NULL),
(24, 30, '2013-08-05 17:51:59', 4000, 0, 'Pending', 'Joining', NULL),
(25, 16, '2013-08-05 19:11:32', 2000, 0, 'Pending', 'Joining', NULL),
(26, 15, '2013-08-05 20:07:59', 2000, 0, 'Pending', 'Joining', NULL),
(27, 21, '2013-08-05 22:06:15', 6000, 6000, 'Pending', 'Extra', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
