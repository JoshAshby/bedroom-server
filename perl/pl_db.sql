-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 23, 2009 at 06:13 AM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `perl`
--

-- --------------------------------------------------------

--
-- Table structure for table `pl_db`
--

CREATE TABLE IF NOT EXISTS `pl_db` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `post` text NOT NULL,
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pl_db`
--

INSERT INTO `pl_db` (`id`, `date`, `name`, `email`, `post`) VALUES
(0, '2009-10-21', 'Joshua Ashby', 'joshuaashby@joshashby.com', 'Welcome to the BeagleBarn Private Web Server, this text is being brought to you via a combination of Perl, and MySQL'),
(1, '2009-10-22', 'this', 'is', 'a test'),
(1, '2009-10-22', 'this', 'is', 'a test'),
(1, '2009-10-22', 'this', 'is', 'a test'),
(1, '2009-10-22', 'Josh Ashby', 'joshuaashby@joshashby.com', 'Greetings Earthling'),
(1, '2009-10-22', 'this', 'is', 'a test');
