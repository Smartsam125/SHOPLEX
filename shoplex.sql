-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 09, 2022 at 05:29 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `human_resource`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cartID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(50) NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Location` varchar(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Date_of_Birth` date NOT NULL,
  `creationDate` date NOT NULL,
  `role` varchar(30) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
CREATE TABLE IF NOT EXISTS `preferences` (
  `CustomerID` int(11) NOT NULL,
  `pdt_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `pdt_name` varchar(40) NOT NULL,
  `unitPrice` double NOT NULL,
  `category_id` int(10) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `line` varchar(30) NOT NULL,
  `Description` varchar(2000) NOT NULL,
  `image_source` varchar(50) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `pdt_lineName` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_line`
--

DROP TABLE IF EXISTS `product_line`;
CREATE TABLE IF NOT EXISTS `product_line` (
  `category_id` int(10) NOT NULL,
  `pdt_lineName` varchar(10) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_line`
--

INSERT INTO `product_line` (`category_id`, `pdt_lineName`) VALUES
(1, 'Tecno'),
(2, 'Samsung'),
(3, 'Iphone'),
(4, 'Itel');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `category_id` int(10) NOT NULL,
  `totalSales` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`category_id`, `totalSales`, `date`) VALUES
(1, 20, '2022-07-13'),
(2, 32, '2022-07-13'),
(1, 20, '2022-07-13'),
(2, 32, '2022-07-13'),
(3, 10, '2022-07-13'),
(4, 46, '2022-07-13'),
(1, 21, '2022-07-14'),
(2, 50, '2022-07-14'),
(3, 30, '2022-07-14'),
(4, 10, '2022-07-14'),
(1, 20, '2022-08-03'),
(2, 5, '2022-08-03'),
(3, 18, '2022-08-03'),
(4, 15, '2022-08-03'),
(1, 40, '2022-08-04'),
(2, 30, '2022-08-04'),
(3, 25, '2022-08-04'),
(4, 40, '2022-08-04');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staffID` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `category_id` int(10) NOT NULL,
  PRIMARY KEY (`staffID`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `firstname`, `lastname`, `contact`, `category_id`) VALUES
(1, 'Hairatu', 'Nagawa', '075963250', 1),
(2, 'Simon', 'Achuka', '80278993', 1),
(3, 'Raymond', 'Nsubuga', '892y36920', 1),
(4, 'Allan', 'Duku', '682037920', 1),
(5, 'Aggrey', 'Zijja', '9807891890', 1),
(6, 'Christine', 'Asiimwe', '0799207642', 2),
(7, 'Shamsa', 'Masaba', '791691906', 3),
(8, 'Adrian', 'Ayiko', '078957252', 3),
(9, 'Muhammed', 'Kanyike', '979120376', 3),
(10, 'Edith', 'Akullu', '25714217', 3),
(11, 'Isaac', 'Kirabo', '323424601', 4),
(12, 'Samson', 'Mujabi', '808937492', 4),
(23, 'Benjamin', 'Jjumba', '0701728368', 4);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
