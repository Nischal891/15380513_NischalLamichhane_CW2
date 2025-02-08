-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2025 at 03:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `video_game_parlour`
--

-- --------------------------------------------------------

--
-- Table structure for table `arcade_machines`
--

CREATE TABLE `arcade_machines` (
  `Machine_ID` int(11) NOT NULL,
  `Game` varchar(50) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `arcade_machines`
--

INSERT INTO `arcade_machines` (`Machine_ID`, `Game`, `Year`, `Floor`) VALUES
(23, 'COC', 2010, 1),
(45, 'Spiderman', 2016, 2),
(1234, 'PUBG', 2004, 2);

-- --------------------------------------------------------

--
-- Table structure for table `consoles`
--

CREATE TABLE `consoles` (
  `CONSOLE_NAME` varchar(50) DEFAULT NULL,
  `CONSOLE_QTY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consoles`
--

INSERT INTO `consoles` (`CONSOLE_NAME`, `CONSOLE_QTY`) VALUES
('XBOX 360', 3),
('PS3', 2),
('PS2', 3),
('NINTENDO 64', 2),
('NINTENDO SWITCH', 4);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Customer_ID` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Join_Date` date DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Membership_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`Customer_ID`, `First_Name`, `Surname`, `Address`, `Join_Date`, `Date_of_Birth`, `Membership_id`) VALUES
(1, 'Saanvi', 'Bhatta', 'Baneshwor, Kathmandu', '2024-01-01', '2015-03-01', 1),
(2, 'Bill', 'Gates', 'Maitidevi, Kathmandu', '2024-07-06', '2001-10-12', 2),
(3, 'Elon', 'Musk', 'Putalisadak, Kathmandu', '2024-03-28', '2003-07-20', 2),
(4, 'Kamala', 'Harris', 'Kapan, Kathmandu', '2024-01-05', '1973-05-01', 1),
(5, 'Jack', 'Ma', NULL, NULL, NULL, NULL),
(6, 'Rishi', 'Sunak', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_payment`
--

CREATE TABLE `customer_payment` (
  `Customer_ID` int(11) NOT NULL,
  `Fee` int(11) DEFAULT NULL,
  `Prepaid_Y_N` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_payment`
--

INSERT INTO `customer_payment` (`Customer_ID`, `Fee`, `Prepaid_Y_N`) VALUES
(1, NULL, NULL),
(2, 1500, 'N'),
(3, 1000, 'Y'),
(4, 1000, 'N'),
(5, 1500, 'N'),
(6, 1000, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `Game_ID` int(11) NOT NULL,
  `Game_Name` varchar(100) DEFAULT NULL,
  `PEGI` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`Game_ID`, `Game_Name`, `PEGI`) VALUES
(1, 'Elden Ring: Shadow of the Erdtree', 'PG'),
(2, 'Final Fantasy VII Rebirth', 'PG'),
(3, 'Destiny 2: The Final Shape', 'PG'),
(4, 'Tekken 8', 'PG'),
(5, 'Persona 3 Reload', 'PG'),
(6, 'Cavern of Dreams', '15');

-- --------------------------------------------------------

--
-- Table structure for table `membership_fee`
--

CREATE TABLE `membership_fee` (
  `Membership_id` int(11) NOT NULL,
  `Member_Type` varchar(50) DEFAULT NULL,
  `Membership_Fee` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership_fee`
--

INSERT INTO `membership_fee` (`Membership_id`, `Member_Type`, `Membership_Fee`) VALUES
(1, 'Standard', 1500.00),
(2, 'Premium', 20000.00);

-- --------------------------------------------------------

--
-- Table structure for table `session_booking`
--

CREATE TABLE `session_booking` (
  `Booking_ID` int(11) NOT NULL,
  `Session_ID` int(11) DEFAULT NULL,
  `Booking_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_booking`
--

INSERT INTO `session_booking` (`Booking_ID`, `Session_ID`, `Booking_Date`) VALUES
(1, 1, '2024-07-22'),
(2, 1, '2024-07-22'),
(3, 1, '2024-07-22'),
(4, 1, '2024-08-25'),
(5, 2, '2024-07-22'),
(6, 4, '2024-07-05');

-- --------------------------------------------------------

--
-- Table structure for table `session_consoles`
--

CREATE TABLE `session_consoles` (
  `Session_ID` int(11) DEFAULT NULL,
  `Console` varchar(50) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_consoles`
--

INSERT INTO `session_consoles` (`Session_ID`, `Console`, `Qty`) VALUES
(1, 'PS2', 2),
(2, 'PS3', 2),
(3, 'PS4', 3),
(4, 'XBOX 360', 1);

-- --------------------------------------------------------

--
-- Table structure for table `session_fees`
--

CREATE TABLE `session_fees` (
  `Session_ID` int(11) NOT NULL,
  `Session_Day` varchar(10) DEFAULT NULL,
  `Start_Time` time DEFAULT NULL,
  `End_Time` time DEFAULT NULL,
  `Session_Type` varchar(10) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL,
  `Floor_Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_fees`
--

INSERT INTO `session_fees` (`Session_ID`, `Session_Day`, `Start_Time`, `End_Time`, `Session_Type`, `Floor`, `Floor_Price`) VALUES
(1, 'SUNDAY', '09:00:00', '21:00:00', 'FREE', 1, 1500),
(2, 'SUNDAY', '09:00:00', '21:00:00', 'FREE', 2, 1000),
(3, 'SATURDAY', '09:00:00', '21:00:00', 'FREE', 1, 1500),
(4, 'FRIDAY', '18:00:00', '22:00:00', 'SPECIAL', 2, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `staff_details`
--

CREATE TABLE `staff_details` (
  `Staff_ID` int(11) NOT NULL,
  `Staff_Name` varchar(50) DEFAULT NULL,
  `Role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_details`
--

INSERT INTO `staff_details` (`Staff_ID`, `Staff_Name`, `Role`) VALUES
(1, 'Sagar Aryal', 'Cafe'),
(2, 'Bikesh Khagdi', 'Maintenance'),
(3, 'Saroj Sapkota', 'Counter'),
(4, 'Jonathan Shrestha', 'Counter'),
(5, 'Rohan Chaudhary', 'Maintenance'),
(6, 'Rajeev Karmacharya', 'Cafe');

-- --------------------------------------------------------

--
-- Table structure for table `staff_session`
--

CREATE TABLE `staff_session` (
  `Staff_ID` int(11) NOT NULL,
  `Session_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_session`
--

INSERT INTO `staff_session` (`Staff_ID`, `Session_ID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arcade_machines`
--
ALTER TABLE `arcade_machines`
  ADD PRIMARY KEY (`Machine_ID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Customer_ID`),
  ADD KEY `Membership_id` (`Membership_id`);

--
-- Indexes for table `customer_payment`
--
ALTER TABLE `customer_payment`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`Game_ID`);

--
-- Indexes for table `membership_fee`
--
ALTER TABLE `membership_fee`
  ADD PRIMARY KEY (`Membership_id`);

--
-- Indexes for table `session_booking`
--
ALTER TABLE `session_booking`
  ADD PRIMARY KEY (`Booking_ID`),
  ADD KEY `Session_ID` (`Session_ID`);

--
-- Indexes for table `session_consoles`
--
ALTER TABLE `session_consoles`
  ADD KEY `Session_ID` (`Session_ID`);

--
-- Indexes for table `session_fees`
--
ALTER TABLE `session_fees`
  ADD PRIMARY KEY (`Session_ID`);

--
-- Indexes for table `staff_details`
--
ALTER TABLE `staff_details`
  ADD PRIMARY KEY (`Staff_ID`);

--
-- Indexes for table `staff_session`
--
ALTER TABLE `staff_session`
  ADD PRIMARY KEY (`Staff_ID`,`Session_ID`),
  ADD KEY `Session_ID` (`Session_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`Membership_id`) REFERENCES `membership_fee` (`Membership_id`);

--
-- Constraints for table `customer_payment`
--
ALTER TABLE `customer_payment`
  ADD CONSTRAINT `customer_payment_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`);

--
-- Constraints for table `session_booking`
--
ALTER TABLE `session_booking`
  ADD CONSTRAINT `session_booking_ibfk_1` FOREIGN KEY (`Session_ID`) REFERENCES `session_fees` (`Session_ID`);

--
-- Constraints for table `session_consoles`
--
ALTER TABLE `session_consoles`
  ADD CONSTRAINT `session_consoles_ibfk_1` FOREIGN KEY (`Session_ID`) REFERENCES `session_fees` (`Session_ID`);

--
-- Constraints for table `staff_session`
--
ALTER TABLE `staff_session`
  ADD CONSTRAINT `staff_session_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff_details` (`Staff_ID`),
  ADD CONSTRAINT `staff_session_ibfk_2` FOREIGN KEY (`Session_ID`) REFERENCES `session_fees` (`Session_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
