-- phpMyAdmin SQL Dump
-- version 3.5.7deb1.precise~ppa.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 18, 2013 at 06:51 PM
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
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `on_date` datetime NOT NULL,
  `fund_requested` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `approved_rejected_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `joining_amount` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `pin_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `stauts` varchar(255) NOT NULL,
  `day_1_growth` int(11) NOT NULL,
  `day_2_growth` int(11) NOT NULL,
  `day_3_growth` int(11) NOT NULL,
  `day_4_growth` int(11) NOT NULL,
  `day_5_growth` int(11) NOT NULL,
  `day_6_growth` int(11) NOT NULL,
  `day_7_growth` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
