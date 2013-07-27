-- phpMyAdmin SQL Dump
-- version 3.5.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 25, 2013 at 08:33 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `filestore_file`
--

INSERT INTO `filestore_file` (`id`, `filestore_type_id`, `filestore_volume_id`, `filename`, `original_filename`, `filesize`, `filenum`, `deleted`) VALUES
(5, 4, 1, '0/20130725061916_1_thumb-rajeev-videos-074.jpg', 'thumb_RAJEEV VIDEOS 074.jpg', 0, 0, ''),
(6, 4, 1, '0/20130725061916__rajeev-videos-074.jpg', 'RAJEEV VIDEOS 074.jpg', 576061, 0, ''),
(7, 4, 1, '0/20130725061958_1_thumb-rajeev-videos-007.jpg', 'thumb_RAJEEV VIDEOS 007.JPG', 0, 0, ''),
(8, 4, 1, '0/20130725061958__rajeev-videos-007.jpg', 'RAJEEV VIDEOS 007.JPG', 15263, 0, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `filestore_image`
--

INSERT INTO `filestore_image` (`id`, `name`, `original_file_id`, `thumb_file_id`) VALUES
(1, NULL, 2, 1),
(2, NULL, 4, 3),
(3, NULL, 6, 5),
(4, NULL, 8, 7);

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
(1, 'upload', 'upload', 1000000000, 0, 76, 'Y', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `fund_requests`
--

INSERT INTO `fund_requests` (`id`, `from_id`, `on_date`, `fund_requested`, `fund_distributed`, `status`, `approved_rejected_date`) VALUES
(12, 1, '2013-07-23 16:07:05', 1500, 0, 'Pending', '0000-00-00 00:00:00'),
(17, 6, '2013-07-24 08:31:09', 3000, 3000, 'Pending', '0000-00-00 00:00:00'),
(18, 7, '2013-07-24 09:02:37', 15000, 6500, 'Pending', '0000-00-00 00:00:00'),
(19, 8, '2013-07-24 10:48:12', 15000, 0, 'Pending', '0000-00-00 00:00:00'),
(20, 9, '2013-07-25 06:56:10', 6000, 0, 'Pending', '0000-00-00 00:00:00'),
(21, 10, '2013-07-25 07:03:06', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(22, 11, '2013-07-25 07:17:41', 3000, 0, 'Pending', '0000-00-00 00:00:00'),
(23, 12, '2013-07-25 07:22:40', 3000, 0, 'Pending', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `fund_transfer`
--

INSERT INTO `fund_transfer` (`id`, `from_id`, `to_id`, `on_date`, `fund`) VALUES
(2, 1, 7, '2013-07-24 09:03:21', 50000),
(3, 7, 8, '2013-07-25 06:20:52', 1000),
(4, 7, 8, '2013-07-25 06:21:56', 1000),
(5, 7, 11, '2013-07-25 07:25:04', 1000);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `kit_id`, `name`, `username`, `password`, `mobile_number`, `email`, `city`, `state`, `bank_name`, `IFSC`, `account_number`, `bank_branch`, `fund_available`, `is_activated`, `join_on`, `activated_on`, `sponsor_id`, `is_eligible_for_growth`, `status`, `day_1_growth`, `day_2_growth`, `day_3_growth`, `day_4_growth`, `day_5_growth`, `day_6_growth`, `day_7_growth`, `level_1_fund`, `level_2_fund`, `level_3_fund`, `level_4_fund`, `level_5_fund`, `level_6_fund`, `level_7_fund`, `level_8_fund`, `level_9_fund`, `level_10_fund`, `path`, `last_daily_run_at`) VALUES
(1, 1, 'GANESH ', 'GANESH', '12344', '12121212', 'arawal007@gmail.com', NULL, NULL, 'MyBankName', 'MyIFSCCode', 'MyAccountNumber', 'U', 345000, 1, '2013-07-23 15:23:13', '2013-07-23 15:23:13', 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', NULL),
(6, 2, 'alok', 'ram', '1234', '67676767', 'arawal007@gmail.com', 'u', 'r', '11', 'yyyu787', '45646', '11', 0, 0, '2013-07-24 08:31:08', NULL, 1, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(7, 5, 'RAJEEV KUMAR RATHI', 'RAJEEV', '1234567891', '9719257257', 'rajeevrathi6@gmail.com', 'HARIDWAR', 'UTTARANCHAL', 'SBI', 'SBIN00098', '999877655', 'HARIDWAR', 37000, 0, '2013-07-24 09:02:37', NULL, 6, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(8, 5, 'ravinder kumar', 'kumar', '567891234', '9461242733', 'aaaaaaa', 'aaaaa', 'aaaaa', 'aaaaaa', 'aaaaaa', 'aaaaa', 'aaaaaa', 52000, 0, '2013-07-24 10:48:12', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(9, 3, 'vikash kumar singh', 'vikash', '654321', '8765297069', 'vikashmmm1983@gmail.com', 'partapgarh', 'u p', 'S B I', 'sbin0000157', '30251892079', 'partapgarh', 0, 0, '2013-07-25 06:56:10', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(10, 2, 'ashwini dattatray kulkarni', 'ashwin', '9876', '8390985929', 'ashwinipagar13@gmail.com', 'gangapur', 'maharastra', ' S B I', 'sbin0012510', '30774452556', 'nasik', 0, 0, '2013-07-25 07:03:06', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(11, 2, 'hamid ali', 'ali', '6789', '9336937719', 'hamidalipbh@gmail.com', 'partapgarh', 'u p', 'icici', 'icic0000819', '081901501241', 'partapgarh', 1000, 0, '2013-07-25 07:17:41', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL),
(12, 2, 'anil kumar yadav', 'kumar1', '1234', '9706163785', 'akyonweb@gmail.com', 'dibrugarh ', 'assam', 'a', 'a', 'a', 'a', 0, 0, '2013-07-25 07:22:40', NULL, 7, 0, 'Joined', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `request_distribution`
--

INSERT INTO `request_distribution` (`id`, `fund_request_id`, `withdrawl_request_id`, `status`, `on_date`, `fund`, `image_id`) VALUES
(1, 17, 3, 'Pending', '2013-07-24 00:00:00', 2000, 0),
(2, 17, 4, 'Pending', '2013-07-24 00:00:00', 1000, 0),
(3, 18, 4, 'Pending', '2013-07-24 00:00:00', 1500, 6),
(4, 18, 5, 'Pending', '2013-07-24 00:00:00', 5000, 8);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `withdrawl_request`
--

INSERT INTO `withdrawl_request` (`id`, `from_id`, `on_date`, `fund`, `alloted_fund`, `status`, `type`, `approved_on_date`) VALUES
(3, 1, '2013-07-24 08:05:59', 2000, 2000, 'Pending', 'Extra', NULL),
(4, 1, '2013-07-24 08:07:12', 2500, 2500, 'Pending', 'Extra', NULL),
(5, 1, '2013-07-24 08:07:44', 5000, 5000, 'Pending', 'Extra', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
