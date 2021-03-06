-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 06, 2015 at 02:34 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `greenorganics`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_register`
--

CREATE TABLE IF NOT EXISTS `account_register` (
  `account_id` int(100) NOT NULL AUTO_INCREMENT,
  `acc_client_id` int(10) DEFAULT NULL,
  `acc_nonclientid` varchar(20) DEFAULT NULL,
  `acc_type` varchar(20) DEFAULT NULL,
  `credit_debit` varchar(20) NOT NULL,
  `acc_amount` varchar(100) NOT NULL,
  `acc_date` varchar(50) DEFAULT NULL,
  `acc_month` varchar(50) DEFAULT NULL,
  `acc_year` varchar(10) DEFAULT NULL,
  `acc_particulars` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `account_register`
--

INSERT INTO `account_register` (`account_id`, `acc_client_id`, `acc_nonclientid`, `acc_type`, `credit_debit`, `acc_amount`, `acc_date`, `acc_month`, `acc_year`, `acc_particulars`) VALUES
(19, 7, NULL, 'inward', 'credit', '5000', '1441208105569', '8', '2015', NULL),
(20, 7, NULL, 'inward', 'debit', '2000', '1441208105569', '8', '2015', 'Bill XYZ: 12121'),
(21, 7, NULL, 'inward', 'credit', '3300', '1441721741898', '8', '2015', NULL),
(22, 7, NULL, 'inward', 'debit', '3200', '1441721741898', '8', '2015', 'New Test'),
(23, 7, NULL, 'inward', 'credit', '1000', '1442499532552', '8', '2015', NULL),
(24, 7, NULL, 'inward', 'debit', '200', '1442499532552', '8', '2015', 'Testa'),
(25, 7, NULL, 'inward', 'credit', '3000', '1442413684071', '8', '2015', NULL),
(26, 7, NULL, 'inward', 'debit', '200', '1442413684071', '8', '2015', 'dsvd'),
(27, 8, NULL, 'inward', 'credit', '12500', '1441896155550', '8', '2015', NULL),
(28, 4, NULL, 'inward', 'credit', '100000', '1441982585961', '8', '2015', NULL),
(29, 5, NULL, 'inward', 'credit', '12500', '1441896214690', '8', '2015', NULL),
(30, 6, NULL, 'inward', 'credit', '39000', '1442673847013', '8', '2015', NULL),
(31, 1, NULL, 'outward', 'debit', '25000', '1442764609183', '8', '2015', NULL),
(32, 1, NULL, 'outward', 'credit', '15000', '1442764609183', '8', '2015', 'Outwrd Pay'),
(33, 2, NULL, 'outward', 'debit', '10000', '1442769093543', '8', '2015', NULL),
(34, 2, NULL, 'outward', 'credit', '10000', '1442769093543', '8', '2015', 'Ordered Complete'),
(35, 1, NULL, 'outward', 'debit', '5000', '1442769731589', '8', '2015', NULL),
(36, 6, NULL, 'inward', 'credit', '175000', '1442845698486', '8', '2015', NULL),
(37, 6, NULL, 'inward', 'debit', '50000', '1442845698486', '8', '2015', 'Paid through CC'),
(38, 8, NULL, 'inward', 'debit', '2500', '1442848771793', '8', '2015', 'Check: 001212'),
(39, 4, NULL, 'inward', 'debit', '50000', '1442848833775', '8', '2015', 'Naaz Cash'),
(40, 7, NULL, 'inward', 'debit', '700', '1442849259467', '8', '2015', 'xddfgd'),
(41, NULL, '1', NULL, 'debit', '52000', '1442739886156', '8', '2015', 'CC-12345'),
(42, NULL, '2', NULL, 'debit', '1200', '1442308527932', '8', '2015', 'Cash Pay'),
(43, NULL, '1', NULL, 'debit', '5000', '1441704928792', '8', '2015', 'abcbabc'),
(44, NULL, '2', NULL, 'debit', '1111', '1441100490904', '8', '2015', 'aaaa'),
(45, 8, NULL, 'inward', 'credit', '25000', '1441128786651', '8', '2015', NULL),
(46, 8, NULL, 'inward', 'credit', '25000', '1441128893741', '8', '2015', NULL),
(47, 8, NULL, 'inward', 'debit', '100000', '1443461746694', '8', '2015', 'lik'),
(48, 7, NULL, 'inward', 'credit', '50000', '1441808018061', '8', '2015', NULL),
(49, 7, NULL, 'inward', 'debit', '2500', '1443536252309', '8', '2015', 'sdfsdfsdfs'),
(50, 1, NULL, 'outward', 'debit', '6500', '1443536468987', '8', '2015', NULL),
(51, 1, NULL, 'outward', 'debit', '50000', '1443973935787', '9', '2015', NULL),
(52, 1, NULL, 'outward', 'debit', '49000', '1445164635368', '9', '2015', NULL),
(53, 1, NULL, 'outward', 'debit', '1500', '1445166148426', '9', '2015', NULL),
(54, 8, NULL, 'inward', 'credit', '40000', '1445758571043', '9', '2015', NULL),
(55, 3, NULL, 'outward', 'debit', '50000', '1445758860933', '9', '2015', NULL),
(56, 7, NULL, 'inward', 'credit', '500000', '1446694214915', '10', '2015', NULL),
(57, 8, NULL, 'inward', 'credit', '2500', '1447338174826', '10', '2015', NULL),
(58, 8, NULL, 'inward', 'debit', '1000', '1447338174826', '10', '2015', 'wewr'),
(59, 1, NULL, 'outward', 'debit', '4000', '1447338972658', '10', '2015', NULL),
(60, 1, NULL, 'outward', 'credit', '4000', '1447338972658', '10', '2015', 'rggdf'),
(61, 5, NULL, 'inward', 'credit', '12420', '1447252066327', '10', '2015', NULL),
(62, 5, NULL, 'inward', 'debit', '233', '1447252066327', '10', '2015', 'fvxg');

-- --------------------------------------------------------

--
-- Table structure for table `client_master`
--

CREATE TABLE IF NOT EXISTS `client_master` (
  `client_id` int(10) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(500) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `district` varchar(20) DEFAULT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `vat_no` varchar(50) DEFAULT NULL,
  `client_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `client_master`
--

INSERT INTO `client_master` (`client_id`, `client_name`, `address`, `city`, `district`, `contact_no`, `contact_person`, `vat_no`, `client_status`) VALUES
(1, 'MAHARASHTRA AGRO AGENCIES', 'RAJAPUR', 'RAJAPUR', 'RAJAPUR', '12345678', 'Maan Tomar', 'V121232', 'deactive'),
(2, 'SAMARTH TRADING CO.', 'ATPADI', 'ATPADI', 'ATPADI', '987654321', 'Samarth', 'V65478', 'active'),
(3, 'DELHI AGROS', 'Parihar Chowk 1212 Delhi', 'Delhi', 'Delhi', '2123212311', 'Mr. Singh', 'V123212321', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `inward_product_master`
--

CREATE TABLE IF NOT EXISTS `inward_product_master` (
  `prod_id` int(10) NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `inward_product_master`
--

INSERT INTO `inward_product_master` (`prod_id`, `prod_name`) VALUES
(12, 'Filler Powder'),
(13, 'Raw Organic Manure'),
(14, 'Slaughter House Waste'),
(15, 'Animal Waste Filler'),
(17, 'HDPE Bags');

-- --------------------------------------------------------

--
-- Table structure for table `lorry_register`
--

CREATE TABLE IF NOT EXISTS `lorry_register` (
  `lorry_id` int(10) NOT NULL AUTO_INCREMENT,
  `lorry_number` varchar(20) NOT NULL,
  PRIMARY KEY (`lorry_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `lorry_register`
--

INSERT INTO `lorry_register` (`lorry_id`, `lorry_number`) VALUES
(1, 'MH 20/BT 4890'),
(2, 'MH 20/AA 8682\n'),
(6, 'MH 12/LL 2803'),
(7, 'KA 10/AA 1234'),
(8, 'MH 12/MM 3556');

-- --------------------------------------------------------

--
-- Table structure for table `otherexpense_master`
--

CREATE TABLE IF NOT EXISTS `otherexpense_master` (
  `expense_id` int(10) NOT NULL AUTO_INCREMENT,
  `expense_name` varchar(500) NOT NULL,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `otherexpense_master`
--

INSERT INTO `otherexpense_master` (`expense_id`, `expense_name`) VALUES
(1, 'Travel to Bagdad'),
(2, 'Rent');

-- --------------------------------------------------------

--
-- Table structure for table `outward_product_master`
--

CREATE TABLE IF NOT EXISTS `outward_product_master` (
  `prod_id` int(10) NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `outward_product_master`
--

INSERT INTO `outward_product_master` (`prod_id`, `prod_name`) VALUES
(1, 'echomeal');

-- --------------------------------------------------------

--
-- Table structure for table `production_batch_register`
--

CREATE TABLE IF NOT EXISTS `production_batch_register` (
  `production_id` int(10) NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(50) NOT NULL,
  `product_produced` varchar(20) DEFAULT NULL,
  `product_remained` varchar(30) DEFAULT NULL,
  `filler_powder` varchar(10) DEFAULT NULL,
  `organic_manure` varchar(10) DEFAULT NULL,
  `shw` varchar(10) DEFAULT NULL,
  `awf` varchar(10) DEFAULT NULL,
  `bags_used` varchar(10) DEFAULT NULL,
  `production_date` varchar(20) DEFAULT NULL,
  `production_month` varchar(10) DEFAULT NULL,
  `production_year` varchar(10) DEFAULT NULL,
  `batch_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`production_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `production_batch_register`
--

INSERT INTO `production_batch_register` (`production_id`, `batch_no`, `product_produced`, `product_remained`, `filler_powder`, `organic_manure`, `shw`, `awf`, `bags_used`, `production_date`, `production_month`, `production_year`, `batch_status`) VALUES
(1, '2', '10', '0', '4.400', '3.100', '1.700', '0.800', '200', '1441464320493', '8', '2015', 'closed'),
(2, '7', '10', '0', '4.400', '3.100', '1.700', '0.800', '150', '1442501183151', '8', '2015', 'closed'),
(3, '20', '10', '0', '4.400', '3.100', '1.700', '0.800', '200', '1442499499593', '8', '2015', 'closed'),
(4, '19', '10', '1', '4.400', '3.100', '1.700', '0.800', '100', '1443104328062', '8', '2015', 'open'),
(5, '101', '10', '10', '30', '2', '10', '30', '500', '1447251921109', '10', '2015', 'open'),
(6, '123', '10', '10', '5', '2', '10', '10', '100', '1448952199788', '11', '2015', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `production_profile_master`
--

CREATE TABLE IF NOT EXISTS `production_profile_master` (
  `profile_id` int(10) NOT NULL AUTO_INCREMENT,
  `filler_powder` varchar(10) DEFAULT NULL,
  `organic_manure` varchar(10) DEFAULT NULL,
  `shw` varchar(10) DEFAULT NULL,
  `gypsum` varchar(10) DEFAULT NULL,
  `awf` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `production_profile_master`
--

INSERT INTO `production_profile_master` (`profile_id`, `filler_powder`, `organic_manure`, `shw`, `gypsum`, `awf`) VALUES
(5, '5', '2', '10', '5', '10'),
(6, '4.400', '3.100', '1.700', NULL, '0.800'),
(7, '10', '10', '10', NULL, '10');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_bag_register`
--

CREATE TABLE IF NOT EXISTS `purchase_bag_register` (
  `purchasebag_id` int(10) NOT NULL AUTO_INCREMENT,
  `lorry_id` int(10) NOT NULL,
  `supplier_id` int(10) NOT NULL,
  `prod_id` int(10) NOT NULL,
  `number_bags` varchar(10) NOT NULL,
  `billno` varchar(10) DEFAULT NULL,
  `bill_amount` varchar(50) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `net_amount` varchar(50) DEFAULT NULL,
  `purchase_date` varchar(50) DEFAULT NULL,
  `purchase_month` varchar(50) DEFAULT NULL,
  `purchase_year` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`purchasebag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `purchase_bag_register`
--

INSERT INTO `purchase_bag_register` (`purchasebag_id`, `lorry_id`, `supplier_id`, `prod_id`, `number_bags`, `billno`, `bill_amount`, `discount`, `net_amount`, `purchase_date`, `purchase_month`, `purchase_year`) VALUES
(3, 1, 7, 17, '100', '12', '5000', '0', '5000', '1441119932021', '8', '2015'),
(4, 1, 7, 17, '100', '21', '3000', '0', '3000', '1441206409369', '8', '2015'),
(5, 6, 7, 17, '100', '100', '10000', '0', '10000', '1441120112394', '8', '2015'),
(6, 2, 7, 17, '100', '100', '1000', '0', '1000', '1441293015477', '8', '2015'),
(7, 6, 7, 17, '100', '100', '100', '0', '100', '1441811552123', '8', '2015'),
(8, 1, 7, 17, '200', '1213', '5000', '0', '5000', '1441208105569', '8', '2015'),
(9, 2, 7, 17, '200', '1212', '3500', '200', '3300', '1441721741898', '8', '2015'),
(10, 6, 7, 17, '100', '312', '1000', '0', '1000', '1442499532552', '8', '2015'),
(11, 1, 7, 17, '500', '20', '3000', '0', '3000', '1442413684071', '8', '2015'),
(12, 2, 7, 17, '350', '2', '50000', '0', '50000', '1441808018061', '8', '2015'),
(13, 1, 7, 17, '200', '123', '500000', '0', '500000', '1446694214915', '10', '2015');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_register`
--

CREATE TABLE IF NOT EXISTS `purchase_register` (
  `purchase_id` int(10) NOT NULL AUTO_INCREMENT,
  `lorry_id` int(10) NOT NULL,
  `supplier_id` int(10) NOT NULL,
  `prod_id` int(10) NOT NULL,
  `billno` varchar(50) NOT NULL,
  `weight` varchar(200) NOT NULL,
  `rate` varchar(100) NOT NULL,
  `lorryfreight` varchar(100) NOT NULL,
  `finalAmt` varchar(100) NOT NULL,
  `purchase_date` varchar(50) NOT NULL,
  `purchase_month` varchar(10) DEFAULT NULL,
  `purchase_year` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `purchase_register`
--

INSERT INTO `purchase_register` (`purchase_id`, `lorry_id`, `supplier_id`, `prod_id`, `billno`, `weight`, `rate`, `lorryfreight`, `finalAmt`, `purchase_date`, `purchase_month`, `purchase_year`) VALUES
(1, 2, 8, 12, '12', '25', '500', '0', '12500', '1441896155550', '8', '2015'),
(2, 2, 4, 13, '122', '50', '2000', '0', '100000', '1441982585961', '8', '2015'),
(3, 1, 5, 14, '32', '50', '250', '0', '12500', '1441896214690', '8', '2015'),
(4, 6, 6, 15, '2123', '60', '650', '0', '39000', '1442673847013', '8', '2015'),
(5, 2, 6, 15, '12', '50', '3500', '0', '175000', '1442845698486', '8', '2015'),
(6, 1, 8, 12, '11', '50', '500', '0', '25000', '1441128786651', '8', '2015'),
(7, 1, 8, 12, '3434', '50', '500', '0', '25000', '1441128893741', '8', '2015'),
(8, 8, 8, 12, 'BOBOBO', '2', '20000', '0', '40000', '1445758571043', '9', '2015'),
(9, 1, 8, 12, '212', '10', '250', '0', '2500', '1447338174826', '10', '2015'),
(10, 6, 5, 14, '4334', '345', '36', '0', '12420', '1447252066327', '10', '2015');

-- --------------------------------------------------------

--
-- Table structure for table `sales_batch_register`
--

CREATE TABLE IF NOT EXISTS `sales_batch_register` (
  `sales_batch_id` int(10) NOT NULL AUTO_INCREMENT,
  `sales_id` int(10) NOT NULL,
  `batch_no` varchar(10) DEFAULT NULL,
  `volume` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sales_batch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sales_batch_register`
--

INSERT INTO `sales_batch_register` (`sales_batch_id`, `sales_id`, `batch_no`, `volume`) VALUES
(1, 1, '20', '1'),
(2, 1, '20', '1'),
(3, 2, '19', '4'),
(4, 3, '19', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sales_register`
--

CREATE TABLE IF NOT EXISTS `sales_register` (
  `sales_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(25) DEFAULT NULL,
  `dc_no` varchar(10) DEFAULT NULL,
  `order_date` varchar(20) DEFAULT NULL,
  `dispatch_date` varchar(20) DEFAULT NULL,
  `client_id` int(10) NOT NULL,
  `lorry_id` int(10) DEFAULT NULL,
  `quantity` varchar(10) DEFAULT NULL,
  `billno` varchar(10) DEFAULT NULL,
  `bill_date` varchar(20) DEFAULT NULL,
  `bill_amount` varchar(50) DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `net_amount` varchar(10) DEFAULT NULL,
  `vat_amount` varchar(10) DEFAULT NULL,
  `sale_date` varchar(20) DEFAULT NULL,
  `sale_month` varchar(10) DEFAULT NULL,
  `sale_year` varchar(10) DEFAULT NULL,
  `order_completion_date` varchar(30) DEFAULT NULL,
  `order_completion_month` varchar(10) DEFAULT NULL,
  `order_completion_year` varchar(10) DEFAULT NULL,
  `sale_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sales_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sales_register`
--

INSERT INTO `sales_register` (`sales_id`, `order_no`, `dc_no`, `order_date`, `dispatch_date`, `client_id`, `lorry_id`, `quantity`, `billno`, `bill_date`, `bill_amount`, `discount`, `net_amount`, `vat_amount`, `sale_date`, `sale_month`, `sale_year`, `order_completion_date`, `order_completion_month`, `order_completion_year`, `sale_status`) VALUES
(1, 'MOMO12', 'DCMOMO12', '1444473435367', '1445164635367', 1, NULL, '1', 'BMOMO1212', '1445337435368', '50000', '1000', '49000', '0', '1445164635368', '9', '2015', NULL, NULL, NULL, 'closed'),
(2, 'a', '22', '1444906948426', '1445166148426', 1, 1, '4', '3222', '1445511748426', '2000', '500', '1500', '0', '1445166148426', '9', '2015', '1446188576798', '10', '1446188576', 'closed'),
(3, 'MU1', 'DC1', '1444981260932', '1445758860932', 3, 1, '1', 'B1', '1445758860933', '60000', '0', '50000', '0', '1445758860933', '9', '2015', '1446191052267', '10', '1446191052', 'closed'),
(4, '345', '45', '1446647772657', '1447338972657', 1, NULL, '20', '6576', '1447338972658', '5000', '1000', '4000', '1000', '1447338972658', '10', '2015', NULL, NULL, NULL, 'open');

-- --------------------------------------------------------

--
-- Table structure for table `stock_master`
--

CREATE TABLE IF NOT EXISTS `stock_master` (
  `stock_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_type` varchar(100) NOT NULL,
  `prod_id` int(10) NOT NULL,
  `stock_avail` varchar(50) DEFAULT NULL,
  `stock_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `stock_master`
--

INSERT INTO `stock_master` (`stock_id`, `product_type`, `prod_id`, `stock_avail`, `stock_date`) VALUES
(1, 'Inward', 12, '7', '1448952199788'),
(2, 'Inward', 13, '6', '1448952199788'),
(3, 'Inward', 14, '345', '1448952199788'),
(4, 'Inward', 15, '0', '1448952199788'),
(5, 'Inward', 17, '100', '1448952199788'),
(6, 'Outward', 1, '-20', '1448952199788');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_master`
--

CREATE TABLE IF NOT EXISTS `supplier_master` (
  `supplier_id` int(10) NOT NULL AUTO_INCREMENT,
  `prod_id` int(10) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_contact` varchar(20) NOT NULL,
  `supplier_contact_person` varchar(50) NOT NULL,
  `supplier_address` varchar(500) NOT NULL,
  `supplier_city` varchar(100) NOT NULL,
  `vat_no` varchar(50) NOT NULL,
  `supplier_status` varchar(20) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `supplier_master`
--

INSERT INTO `supplier_master` (`supplier_id`, `prod_id`, `supplier_name`, `supplier_contact`, `supplier_contact_person`, `supplier_address`, `supplier_city`, `vat_no`, `supplier_status`) VALUES
(2, 12, 'ABC FIRM', '9090909090', 'Mr. ABC', 'nagar', 'Nagar', '112312313', 'deactive'),
(3, 16, 'Gypsum Mill', '9999999999', 'Mr. Patil', 'Nashik Main Road', 'Nashik', 'N123456', 'active'),
(4, 13, 'Lucky Bone Mill', '8888888888', 'Mr. Baig', 'Aurangabad', 'Aurangabad', '12456', 'active'),
(5, 14, 'KK', '123456', 'Wasim', 'NagarRoad', 'Pune', 'V123498765', 'active'),
(6, 15, 'Animal Filler Firm', '123456789', 'Mr. Govind', 'Bombay', 'Bombay', 'V123456789', 'active'),
(7, 17, 'AADI Plastic Ind. P. Ltd', '10741485', 'AADI', 'India', 'Pune', 'V187645', 'active'),
(8, 12, 'KK Pvt Ltd', '1212121212', '878787878', 'Kolhapur', 'Kolhapur', 'V212121212', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE IF NOT EXISTS `user_master` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`username`, `password`) VALUES
('admin', 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
