-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 07, 2021 at 06:12 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shopping`
--
CREATE DATABASE IF NOT EXISTS `shopping` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shopping`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '4db69a7b3fe0ea3dc516b0ceef8ca1fc', '2017-01-24 16:21:18', '04-06-2021 03:55:03 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Stanley', 'Stanley Tools', '2017-01-24 19:17:37', '05-06-2021 02:30:57 PM'),
(4, 'Dewalt', 'Dewalt Tools', '2017-01-24 19:19:32', '05-06-2021 02:31:37 PM'),
(5, 'Facom', 'Facom Tools', '2017-01-24 19:19:54', '05-06-2021 02:32:18 PM');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2017-03-07 19:32:57', 'COD', NULL),
(3, 1, '4', 1, '2017-03-10 19:43:04', 'Debit / Credit card', 'Delivered'),
(4, 1, '17', 1, '2017-03-08 16:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2017-03-08 19:21:38', 'COD', NULL),
(6, 1, '4', 1, '2017-03-08 19:21:38', 'COD', NULL),
(7, 4, '21', 1, '2021-06-04 09:58:56', 'COD', 'Delivered'),
(8, 4, '2', 1, '2021-06-04 10:05:50', 'Debit / Credit card', NULL),
(9, 4, '1', 1, '2021-06-04 10:21:40', 'Internet Banking', NULL),
(10, 4, '12', 1, '2021-06-04 10:21:40', 'Internet Banking', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE IF NOT EXISTS `ordertrackhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36'),
(5, 7, 'Delivered', 'Sucessfully', '2021-06-04 10:26:18');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE IF NOT EXISTS `productreviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=75 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(21, 7, 13, '10PACK HD UTILITY BLADES', 'Indocrest', 500, 550, 'UTILITY KNIVE BLADES&nbsp;11-921T,&nbsp;10PACK HD UTILITY BLADES<br>', 'shop1.png', 'shop2.png', 'shop3.png', 0, 'In Stock', '2021-06-04 09:45:28', NULL),
(22, 3, 14, '53PC TELECOMMUNICATION SET', 'Indocrest', 14500, 14500, '53PC TELECOMMUNICATION SET<div>TELECOM-KIT</div><div><div>HSN CODE: 82060010<br></div></div>', '1.png', '1.png', '1.png', 0, 'In Stock', '2021-06-05 09:41:00', NULL),
(23, 3, 14, '15PC ESSENTIAL HOME TOOL KIT', 'Indocrest', 1685, 1685, '15PC MULTI-TOOL KIT<br><div>HOMETL-KIT1<br></div><div>HSN CODE: 82059020<br></div>', '2.png', '2.png', '2.png', 0, 'In Stock', '2021-06-05 09:48:36', NULL),
(24, 3, 14, '150PC MASTER TOOL SET', 'Indocrest', 28143, 28143, '150PC MASTER TOOL SET<br><div>94-181<br></div><div>HSN CODE: 82060010<br></div>', '3.png', '3.png', '3.png', 0, 'In Stock', '2021-06-05 09:53:39', NULL),
(25, 3, 14, '120PC MASTER TOOL SET', 'Indocrest', 18761, 18761, '120PC MASTER TOOL SET<br><div>91-931<br></div><div>HSN CODE: 82060010<br></div>', '4.png', '4.png', '4.png', 0, 'In Stock', '2021-06-05 09:57:10', NULL),
(26, 3, 14, '110PC MULTI TOOL SET', 'Indocrest', 9700, 9700, '110PC MULTI TOOL SET<br><div>STMT81243<br></div><div>HSN CODE: 82041120<br></div>', '5.png', '5.png', '5.png', 0, 'In Stock', '2021-06-05 10:02:04', NULL),
(27, 3, 14, '132PC METRIC & A/F TOOL KIT', 'Indocrest', 24714, 24714, '132PC METRIC &amp; A/F TOOL KIT<br><div>99-059<br></div><div>HSN CODE: 82060010<br></div>', '6.png', '6.png', '6.png', 0, 'In Stock', '2021-06-05 10:04:59', NULL),
(28, 3, 14, '18PC GENERAL HOME TOOL KIT', 'Indocrest', 2323, 2323, 'ESSENTIAL HOME TOOL KIT<br><div>HOMETL-KIT2<br></div><div>HSN CODE: 82059020<br></div>', '7.png', '7.png', '7.png', 0, 'In Stock', '2021-06-05 10:11:12', NULL),
(29, 3, 14, 'HONDA 2-WHEELER TOOL KIT', 'Indocrest', 15089, 15089, 'HONDA TOOLS KIT<br><div>HONDA TL-KIT<br></div><div>HSN CODE: 82059030<br></div>', '8.png', '8.png', '8.png', 0, 'In Stock', '2021-06-05 10:14:06', NULL),
(30, 3, 8, '5 DRAWER ROLLER CABINET', 'Indocrest', 26950, 26950, '681x434x663MM<br><div>96-223L<br></div><div>HSN CODE: 73269099<br></div>', '1.png', '1.png', '1.png', 0, 'In Stock', '2021-06-05 10:19:45', NULL),
(31, 3, 8, '7 DRAWER ROLLER CABINET', 'Indocrest', 50507, 50507, '674x459x857MM<br><div>93-547-23ID<br></div><div>HSN CODE: 73269099<br></div>', '2.png', '2.png', '2.png', 0, 'In Stock', '2021-06-05 10:25:06', NULL),
(32, 3, 8, '4 DRAWER ROLLER CABINET', 'Indocrest', 35890, 35890, '698x477x973MM<br><div>STMT99069-8<br></div><div>HSN CODE: 73269099<br></div>', '3.png', '3.png', '3.png', 0, 'In Stock', '2021-06-05 10:28:26', NULL),
(33, 3, 8, '7 DRAWER ROLLER CABINET', 'Indocrest', 39762, 39762, '<div>DRAWER DIMENSIONS</div><div>Top 4 540x408x72 mm</div><div>Bottom 3 540x408x105 mm</div><div><br></div><div>680x459x900MM<br></div><div>STST74306-8<br></div><div>HSN CODE: 73269099<br></div>', '4.png', '4.png', '4.png', 0, 'In Stock', '2021-06-05 10:32:31', NULL),
(34, 3, 8, 'CANTILEVER TOOL BOX (5 TRAY)', 'Indocrest', 3209, 3209, '5 TRAY METAL TOOL BOX<div>1-94-738</div><div>HSN CODE: 73269099<br><div><br></div></div>', '5.png', '5.png', '5.png', 0, 'In Stock', '2021-06-05 10:36:33', NULL),
(35, 3, 8, '7 DRAWER ROLLER CABINET', 'Indocrest', 35890, 35890, '<div>DRAWER DIMENSIONS</div><div>Top 4 579x407x39 mm</div><div>Mid 2 579x407x91.5 mm</div><div>Bottom 579x407x197 mm</div><div><br></div><div>668x458x885MM<br></div><div>93-557L<br></div><div>HSN CODE: 73269099<br></div>', '6.png', '6.png', '6.png', 0, 'In Stock', '2021-06-05 10:39:10', NULL),
(36, 3, 8, '7 DRAWER ROLLER CABINET', 'Indocrest', 35890, 35890, '<div>DRAWER DIMENSIONS</div><div>Top 4 579x407x39 mm</div><div>Mid 2 579x407x91.5 mm</div><div>Bottom 579x407x197 mm</div><div><br></div><div>668x458x885MM<br></div><div>93-557L<br></div><div>HSN CODE: 73269099<br></div>', '6.png', '6.png', '6.png', 0, 'In Stock', '2021-06-05 11:29:03', NULL),
(37, 4, 2, '7.2V, Screwdriver', 'Indocrest', 0, 0, 'DCF680G2', '1.png', '11.png', '1.png', 0, 'In Stock', '2021-06-05 11:34:25', NULL),
(38, 4, 2, '8V Li-on  Screwdriver', 'Indocrest', 0, 0, 'DCF008', '2.png', '22.png', '2.png', 0, 'In Stock', '2021-06-05 11:40:52', NULL),
(39, 4, 2, '10,8V,6,35mm,  Screwdriver', 'Indocrest', 0, 0, 'DCF610D2<br>', '3.png', '33.png', '3.png', 0, 'In Stock', '2021-06-05 11:44:43', NULL),
(40, 4, 2, '12V,6.35mm  Brushless Screwdriver', 'Indocrest', 0, 0, 'DCF601D2', '4.png', '44.png', '4.png', 0, 'In Stock', '2021-06-05 11:50:07', NULL),
(41, 4, 2, '10.8V, 10mm  Compact Drill Driver', 'Indocrest', 0, 0, 'DCD710D2', '5.png', '55.png', '5.png', 0, 'In Stock', '2021-06-05 11:53:08', NULL),
(42, 4, 2, '10.8V,  10mm,  Hammer Drill Driver', 'Indocrest', 0, 0, 'DCD716D2', '6.png', '66.png', '6.png', 0, 'In Stock', '2021-06-05 11:56:10', NULL),
(43, 4, 2, '10.8V,  6.35mm,  Impact Driver', 'Indocrest', 0, 0, 'DCF815D2', '7.png', '77.png', '7.png', 0, 'In Stock', '2021-06-05 11:58:48', NULL),
(44, 4, 3, '7.2V, Screwdriver', 'Indocrest', 0, 0, 'DCF680G2', '1.png', '11.png', '1.png', 0, 'In Stock', '2021-06-06 05:41:40', NULL),
(45, 4, 3, '8V, Li-Ion Screwdriver', 'Indocrest', 0, 0, 'DCF008', '2.png', '2.1.png', '2.2.png', 0, 'In Stock', '2021-06-06 05:47:18', NULL),
(46, 4, 3, '10.8V, 6.35mm  Screwdriver', 'Indocrest', 0, 0, 'DCF610D2', '3.png', '3.1.png', '3.2.png', 0, 'In Stock', '2021-06-06 05:53:07', NULL),
(47, 4, 3, '12V, 6.35mm Brushless Screwdriver', 'Indocrest', 0, 0, 'DCF601D2', '4.png', '4.1.png', '4.2.png', 0, 'In Stock', '2021-06-06 05:57:56', NULL),
(48, 4, 3, '10.8V, 10mm  Compact Drill Driver', 'Indocrest', 0, 0, '10.8V, 10mm  Compact Drill Driver\r\nwith 109 pcs accessories\r\nDCD700C2A', '5.png', '5.1.png', '5.2.png', 0, 'In Stock', '2021-06-06 06:04:55', NULL),
(49, 4, 3, '10.8V, 10mm  Compact Drill Driver', 'Indocrest', 0, 0, 'DCD710D2', '6.png', '6.1.png', '6.2.png', 0, 'In Stock', '2021-06-06 06:09:05', NULL),
(50, 5, 9, '5 t  Rolling Jack', 'Indocrest', 0, 0, '5 t  Rolling Jack', '1.png', '1.1.png', '1.2.png', 0, 'In Stock', '2021-06-06 06:23:18', NULL),
(51, 5, 9, '10 t  Rolling Jack', 'Indocrest', 0, 0, '10 t  Rolling Jack', '2.png', '2.1.png', '2.2.png', 0, 'In Stock', '2021-06-06 06:31:10', NULL),
(52, 5, 9, '15-25-35T Hydropneumatic Jack', 'Indocrest', 0, 0, '15-25-35T Hydropneumatic Jack', '3.png', '3.1.png', '3.2.png', 0, 'In Stock', '2021-06-06 06:36:21', NULL),
(53, 5, 9, '15-30T Hydropneumatic Jack', 'Indocrest', 0, 0, '15-30T Hydropneumatic Jack', '4.png', '4.1.png', '4.2.png', 0, 'In Stock', '2021-06-06 06:40:53', NULL),
(54, 5, 9, 'DL.BTI  Heavy Duty Series Bottle Jack', 'Indocrest', 0, 0, 'DL.BTI  Heavy Duty Series Bottle Jack', '5.png', '5.1.png', '5.2.png', 0, 'In Stock', '2021-06-06 06:45:25', NULL),
(55, 5, 10, 'Multifunction Trigger Sheath-Stripper', 'Indocrest', 0, 0, 'Multifunction Trigger Sheath-Stripper', '1.png', '1.1.png', '1.png', 0, 'In Stock', '2021-06-06 06:53:03', NULL),
(56, 5, 10, 'Sheath Stripper', 'Indocrest', 0, 0, 'Sheath Stripper', '2.png', '2.1.png', '2.2.png', 0, 'In Stock', '2021-06-06 06:58:46', NULL),
(57, 5, 10, 'Rotary Sheath and Insulation Stripping Tool', 'Indocrest', 0, 0, 'Rotary Sheath and Insulation Stripping Tool', '3.png', '3.1.png', '3.png', 0, 'In Stock', '2021-06-06 07:02:36', NULL),
(58, 5, 10, 'Multifunction Sheath Stripper', 'Indocrest', 0, 0, 'Multifunction Sheath Stripper', '4.png', '4.1.png', '4.2.png', 0, 'In Stock', '2021-06-06 07:06:14', NULL),
(59, 5, 10, 'Coax and Multipair Cable Sheat Stripper', 'Indocrest', 0, 0, 'Coax and Multipair Cable Sheat Stripper', '5.png', '5.1.png', '5.png', 0, 'In Stock', '2021-06-06 07:10:29', NULL),
(60, 5, 11, 'BVFC1.FLUO-1', 'Indocrest', 0, 0, 'BVFC1.FLUO-1\r\n143- piece set of metric fluorescent tools- foam trays and sealed box', '1.png', '1.1.png', '1.2.png', 0, 'In Stock', '2021-06-06 07:22:56', NULL),
(61, 5, 11, '440F- Metric Combination Wrenches- FLUO', 'Indocrest', 0, 0, '440F- Metric Combination Wrenches- FLUO', '2.png', '2.1.png', '2.2.png', 0, 'In Stock', '2021-06-06 07:29:45', NULL),
(62, 5, 11, '39F-  Inch Short-Reach Combination Wrenches-  FLUO', 'Indocrest', 0, 0, '39F-  Inch Short-Reach Combination Wrenches-  FLUO', '3.png', '3.1.png', '3.2.png', 0, 'In Stock', '2021-06-06 07:33:40', NULL),
(63, 5, 11, '64F-  Inch Straight Ratchet Ring Wrenches- FLUO', 'Indocrest', 0, 0, '64F-  Inch Straight Ratchet Ring Wrenches- FLUO', '4.png', '4.1.png', '4.2.png', 0, 'In Stock', '2021-06-06 07:39:52', NULL),
(64, 5, 11, '34F-  Inch 15 and 75  hinged  "midget" open end wrenches- FLUO', 'Indocrest', 0, 0, '34F-  Inch 15 and 75  hinged  "midget" open end wrenches- FLUO', '5.png', '5.1.png', '5.2.png', 0, 'In Stock', '2021-06-06 07:45:42', NULL),
(65, 5, 15, '467-  Metric Standard Ratchet Combination Wrenches-  RFID', 'Indocrest', 0, 0, '467-  Metric Standard Ratchet Combination Wrenches-  RFID', '1.png', '1.1.png', '1.2.png', 0, 'In Stock', '2021-06-06 07:53:40', NULL),
(66, 5, 15, '467F- Metric Hinged Jointed Combination Wrenches-  RFID', 'Indocrest', 0, 0, '467F- Metric Hinged Jointed Combination Wrenches-  RFID', '2.png', '2.1.png', '2.2.png', 0, 'In Stock', '2021-06-06 07:59:02', NULL),
(67, 5, 15, '64-  Metric Straight Ratchet Ring Wrenches -  RFID', 'Indocrest', 0, 0, '64-  Metric Straight Ratchet Ring Wrenches -  RFID', '3.png', '3.1.png', '3.2.png', 0, 'In Stock', '2021-06-06 08:03:39', NULL),
(68, 5, 15, '76 - Forged Metric 12x6 point angled open-Socket wrenches - RFID', 'Indocrest', 0, 0, '76 - Forged Metric 12x6 point angled open-Socket wrenches - RFID', '4.png', '4.1.png', '4.2.png', 0, 'In Stock', '2021-06-06 08:08:31', NULL),
(69, 5, 15, '74A - Forged nut Driver - Metric - RFID', 'Indocrest', 0, 0, '74A - Forged nut Driver - Metric - RFID', '5.png', '5.1.png', '5.2.png', 0, 'In Stock', '2021-06-06 08:14:41', NULL),
(70, 5, 16, 'SLS Hook Wrist Bracelet - SLS', 'Indocrest', 0, 0, 'SLS Hook Wrist Bracelet - SLS', '1.png', '1.1.png', '1.2.png', 0, 'In Stock', '2021-06-06 08:35:46', NULL),
(71, 5, 16, 'SLS Hook Holder', 'Indocrest', 0, 0, 'SLS Hook Holder', '2.png', '2.1.png', '2.2.png', 0, 'In Stock', '2021-06-06 08:40:01', NULL),
(72, 5, 16, 'Bag of 2 SLS Hook Holders', 'Indocrest', 0, 0, 'Bag of 2 SLS Hook Holders', '3.png', '3.1.png', '3.2.png', 0, 'In Stock', '2021-06-06 08:43:07', NULL),
(73, 5, 16, 'Wrist Bracelet with metal ring - SLS', 'Indocrest', 0, 0, 'Wrist Bracelet with metal ring - SLS', '4.png', '4.1.png', '4.2.png', 0, 'In Stock', '2021-06-06 08:47:04', NULL),
(74, 5, 16, 'Lanyard 20cm - Stainless Steel 50mm Spring hook + Swivel and 60mm Stainless steel snap hook with screw - SLS', 'Indocrest', 0, 0, 'Lanyard 20cm - Stainless Steel 50mm Spring hook + Swivel and 60mm Stainless steel snap hook with screw - SLS', '5.png', '5.1.png', '5.2.png', 0, 'In Stock', '2021-06-06 08:53:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE IF NOT EXISTS `subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 4, 'Professional Power Tools', '2017-01-26 16:24:52', '05-06-2021 02:40:49 PM'),
(3, 4, 'Cordless Professional Tools', '2017-01-26 16:29:09', '05-06-2021 02:41:30 PM'),
(8, 3, 'Storage', '2017-02-04 04:13:54', '05-06-2021 02:39:24 PM'),
(9, 5, 'Industrial Tools', '2017-02-04 04:36:45', '05-06-2021 02:45:51 PM'),
(10, 5, 'Electrical Tools', '2017-02-04 04:37:02', '05-06-2021 02:46:41 PM'),
(11, 5, 'Fluorescent Tools', '2017-02-04 04:37:51', '05-06-2021 02:47:43 PM'),
(14, 3, 'Hand Tools', '2021-06-05 09:08:47', '05-06-2021 02:39:53 PM'),
(15, 5, 'Rfid Tools', '2021-06-05 09:20:01', '05-06-2021 02:51:09 PM'),
(16, 5, 'Safety Lock Tools', '2021-06-05 09:20:59', '05-06-2021 02:51:18 PM');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE IF NOT EXISTS `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2017-03-16 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2018-04-29 09:30:40', '', 1),
(24, 'shahbaznaaz0098@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2021-06-04 09:55:11', '04-06-2021 03:26:54 PM', 1),
(25, 'shahbaznaaz0098@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2021-06-04 09:57:13', '04-06-2021 03:29:16 PM', 1),
(26, 'shahbaznaaz0098@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2021-06-04 10:04:45', NULL, 0),
(27, 'shahbaznaaz0098@gmail.com', '::1\0\0\0\0\0\0\0\0\0\0\0\0\0', '2021-06-04 10:05:05', '04-06-2021 03:52:53 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Anuj Kumar', 'anuj.lpu1@gmail.com', 9009857868, 'f925916e2754e5e03f75dd58a5733251', 'CS New Delhi', 'New Delhi', 'Delhi', 110001, 'New Delhi', 'New Delhi', 'Delhi', 110092, '2017-02-04 19:30:50', ''),
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '', 0, '', '', '', 0, '2017-03-15 17:21:22', ''),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0, '', '', '', 0, '2018-04-29 09:30:32', ''),
(4, 'Shahbaz Naaz', 'shahbaznaaz0098@gmail.com', 9027253083, '4db69a7b3fe0ea3dc516b0ceef8ca1fc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-04 09:54:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
