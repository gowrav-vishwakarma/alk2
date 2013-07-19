-- phpMyAdmin SQL Dump
-- version 3.5.7deb1.precise~ppa.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 19, 2013 at 07:23 PM
-- Server version: 5.5.28-0ubuntu0.12.04.2
-- PHP Version: 5.3.10-1ubuntu3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `alk2`
--

-- --------------------------------------------------------

--
-- Table structure for table `fund_requests`
--

CREATE TABLE IF NOT EXISTS `fund_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `on_date` datetime NOT NULL,
  `fund_requested` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `approved_rejected_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fund_requests`
--

INSERT INTO `fund_requests` (`id`, `from_id`, `on_date`, `fund_requested`, `status`, `approved_rejected_date`) VALUES
(1, 1, '2013-07-19 00:00:00', 1000, 'Pending', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfer`
--

CREATE TABLE IF NOT EXISTS `fund_transfer` (
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `on_date` datetime NOT NULL,
  `fund` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `kit_master`
--

INSERT INTO `kit_master` (`id`, `name`, `joining_amount`, `is_active`, `pin_amount`, `sponsor_percentage`) VALUES
(1, '2000', 2000, 1, 500, 0);

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
  `bank_name` varchar(255) NOT NULL,
  `IFSC` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `fund_available` int(11) NOT NULL,
  `is_activated` tinyint(4) NOT NULL,
  `join_on` datetime NOT NULL,
  `activated_on` datetime NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `kit_id`, `name`, `username`, `password`, `bank_name`, `IFSC`, `account_number`, `fund_available`, `is_activated`, `join_on`, `activated_on`, `sponsor_id`, `is_eligible_for_growth`, `status`, `day_1_growth`, `day_2_growth`, `day_3_growth`, `day_4_growth`, `day_5_growth`, `day_6_growth`, `day_7_growth`, `level_1_fund`, `level_2_fund`, `level_3_fund`, `level_4_fund`, `level_5_fund`, `level_6_fund`, `level_7_fund`, `level_8_fund`, `level_9_fund`, `level_10_fund`, `path`) VALUES
(1, 1, 'root', 'root', '12345', '', '', '', 10000000, 1, '2013-07-19 00:00:00', '2013-07-19 00:00:00', 0, 0, 'Activated', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `request_distribution`
--

CREATE TABLE IF NOT EXISTS `request_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fund_request_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `on_date` datetime NOT NULL,
  `fund` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `request_distribution`
--

INSERT INTO `request_distribution` (`id`, `fund_request_id`, `to_id`, `status`, `on_date`, `fund`) VALUES
(1, 1, 1, 'Approved', '2013-07-01 00:00:00', 77),
(2, 1, 1, 'Approved', '2013-07-10 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_request`
--

CREATE TABLE IF NOT EXISTS `withdrawal_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `on_date` datetime NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
