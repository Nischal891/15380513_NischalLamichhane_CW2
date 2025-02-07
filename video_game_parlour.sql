-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2025 at 07:31 PM
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
  `MACHINE_ID` int(11) NOT NULL,
  `GAME` varchar(100) NOT NULL,
  `YEAR` int(11) NOT NULL,
  `FLOOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `arcade_machines`
--

INSERT INTO `arcade_machines` (`MACHINE_ID`, `GAME`, `YEAR`, `FLOOR`) VALUES
(1, 'COC', 2010, 1),
(2, 'GTA', 2013, 1),
(3, 'SPIDERMAN', 2016, 2),
(4, 'PUBG', 2004, 1);

-- --------------------------------------------------------

--
-- Table structure for table `booking_list`
--

CREATE TABLE `booking_list` (
  `BOOKING_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `SESSION_ID` int(11) DEFAULT NULL,
  `DATE` date NOT NULL,
  `MEMBER_Y_N` varchar(1) NOT NULL,
  `FEE` decimal(10,2) NOT NULL,
  `PREPAID_Y_N` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consoles_games`
--

CREATE TABLE `consoles_games` (
  `GAME_NAME` varchar(100) NOT NULL,
  `PEGI` varchar(10) NOT NULL,
  `CONSOLE_NAME` varchar(50) NOT NULL,
  `QTY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consoles_games`
--

INSERT INTO `consoles_games` (`GAME_NAME`, `PEGI`, `CONSOLE_NAME`, `QTY`) VALUES
('CAVERN OF DREAMS 15', 'PG', 'NINTENDO SWITCH', 4),
('DESTINY 2: THE FINAL SHAPE', 'PG', 'PS2', 3),
('ELDEN RING: SHADOW OF THE ERDTREE', 'PG', 'XBOX 360', 3),
('FINAL FANTASY VII REBIRTH', 'PG', 'PS3', 2),
('PERSONA 3 RELOAD', 'PG', 'NINTENDO 64', 2),
('TEKKEN 8', 'PG', 'PS3', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CUSTOMER_ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(50) NOT NULL,
  `SURNAME` varchar(50) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `MEMBERSHIP_ID` int(11) DEFAULT NULL,
  `JOIN_DATE` date DEFAULT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CUSTOMER_ID`, `FIRST_NAME`, `SURNAME`, `ADDRESS`, `MEMBERSHIP_ID`, `JOIN_DATE`, `DATE_OF_BIRTH`) VALUES
(1, 'SAANVI', 'BHATTA', 'BANESHWOR, KATHMANDU', 1, '2024-01-01', '2015-03-01'),
(2, 'BILL', 'GATES', 'MAITIDEVI, KATHMANDU', 2, '2024-07-06', '2001-10-12'),
(3, 'ELON', 'MUSK', 'PUTALISADAK, KATHMANDU', 2, '2024-03-28', '2003-07-20'),
(4, 'KAMALA', 'HARRIS', 'KAPAN, KATHMANDU', 1, '2024-01-05', '1973-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `customer_payments`
--

CREATE TABLE `customer_payments` (
  `PAYMENT_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `PAYMENT_DATE` date NOT NULL,
  `AMOUNT` decimal(10,2) NOT NULL,
  `PAYMENT_TYPE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `machine_assignments`
--

CREATE TABLE `machine_assignments` (
  `SESSION_ID` int(11) NOT NULL,
  `MACHINE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `MEMBERSHIP_ID` int(11) NOT NULL,
  `MEMBER_TYPE` varchar(50) NOT NULL,
  `MEMBERSHIP_FEE` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`MEMBERSHIP_ID`, `MEMBER_TYPE`, `MEMBERSHIP_FEE`) VALUES
(1, 'STANDARD', 1500.00),
(2, 'PREMIUM', 20000.00);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `SESSION_ID` int(11) NOT NULL,
  `SESSION_DAY` varchar(10) NOT NULL,
  `START_TIME` time NOT NULL,
  `END_TIME` time NOT NULL,
  `SESSION_TYPE` varchar(50) NOT NULL,
  `FLOOR` int(11) NOT NULL,
  `PRICE` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`SESSION_ID`, `SESSION_DAY`, `START_TIME`, `END_TIME`, `SESSION_TYPE`, `FLOOR`, `PRICE`) VALUES
(1, 'SUNDAY', '09:00:00', '21:00:00', 'FREE', 1, 1500.00),
(2, 'SUNDAY', '09:00:00', '21:00:00', 'FREE', 2, 1000.00),
(3, 'SATURDAY', '09:00:00', '21:00:00', 'FREE', 1, 1500.00),
(4, 'FRIDAY', '18:00:00', '22:00:00', 'SPECIAL', 2, 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `session_consoles`
--

CREATE TABLE `session_consoles` (
  `SESSION_ID` int(11) NOT NULL,
  `CONSOLE_NAME` varchar(50) NOT NULL,
  `QTY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_consoles`
--

INSERT INTO `session_consoles` (`SESSION_ID`, `CONSOLE_NAME`, `QTY`) VALUES
(1, 'PS2', 2),
(2, 'PS3', 2);

-- --------------------------------------------------------

--
-- Table structure for table `session_fees`
--

CREATE TABLE `session_fees` (
  `SESSION_ID` int(11) NOT NULL,
  `FEE_TYPE` varchar(50) NOT NULL,
  `AMOUNT` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_fees`
--

INSERT INTO `session_fees` (`SESSION_ID`, `FEE_TYPE`, `AMOUNT`) VALUES
(1, 'FREE', 1500.00),
(2, 'FREE', 1000.00),
(3, 'FREE', 1500.00),
(4, 'SPECIAL', 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `session_staff`
--

CREATE TABLE `session_staff` (
  `SESSION_ID` int(11) NOT NULL,
  `STAFF_NAME` varchar(50) NOT NULL,
  `ROLE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_staff`
--

INSERT INTO `session_staff` (`SESSION_ID`, `STAFF_NAME`, `ROLE`) VALUES
(1, 'BIKESH KHAGDI', 'MAINTENANCE'),
(1, 'SAGAR ARYAL', 'CAFE'),
(1, 'SAROJ SAPKOTA', 'COUNTER'),
(2, 'JONATHAN SHRESTHA', 'COUNTER'),
(2, 'RAJEEV KARMACHARYA', 'CAFE'),
(2, 'ROHAN CHAUDHARY', 'MAINTENANCE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arcade_machines`
--
ALTER TABLE `arcade_machines`
  ADD PRIMARY KEY (`MACHINE_ID`);

--
-- Indexes for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD PRIMARY KEY (`BOOKING_ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  ADD KEY `SESSION_ID` (`SESSION_ID`);

--
-- Indexes for table `consoles_games`
--
ALTER TABLE `consoles_games`
  ADD PRIMARY KEY (`GAME_NAME`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CUSTOMER_ID`),
  ADD KEY `MEMBERSHIP_ID` (`MEMBERSHIP_ID`);

--
-- Indexes for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD PRIMARY KEY (`PAYMENT_ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`);

--
-- Indexes for table `machine_assignments`
--
ALTER TABLE `machine_assignments`
  ADD PRIMARY KEY (`SESSION_ID`,`MACHINE_ID`),
  ADD KEY `MACHINE_ID` (`MACHINE_ID`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`MEMBERSHIP_ID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`SESSION_ID`);

--
-- Indexes for table `session_consoles`
--
ALTER TABLE `session_consoles`
  ADD PRIMARY KEY (`SESSION_ID`,`CONSOLE_NAME`);

--
-- Indexes for table `session_fees`
--
ALTER TABLE `session_fees`
  ADD PRIMARY KEY (`SESSION_ID`,`FEE_TYPE`);

--
-- Indexes for table `session_staff`
--
ALTER TABLE `session_staff`
  ADD PRIMARY KEY (`SESSION_ID`,`STAFF_NAME`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arcade_machines`
--
ALTER TABLE `arcade_machines`
  MODIFY `MACHINE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `booking_list`
--
ALTER TABLE `booking_list`
  MODIFY `BOOKING_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_payments`
--
ALTER TABLE `customer_payments`
  MODIFY `PAYMENT_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `MEMBERSHIP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `SESSION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD CONSTRAINT `booking_list_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customers` (`CUSTOMER_ID`),
  ADD CONSTRAINT `booking_list_ibfk_2` FOREIGN KEY (`SESSION_ID`) REFERENCES `sessions` (`SESSION_ID`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`MEMBERSHIP_ID`) REFERENCES `memberships` (`MEMBERSHIP_ID`);

--
-- Constraints for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD CONSTRAINT `customer_payments_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customers` (`CUSTOMER_ID`);

--
-- Constraints for table `machine_assignments`
--
ALTER TABLE `machine_assignments`
  ADD CONSTRAINT `machine_assignments_ibfk_1` FOREIGN KEY (`SESSION_ID`) REFERENCES `sessions` (`SESSION_ID`),
  ADD CONSTRAINT `machine_assignments_ibfk_2` FOREIGN KEY (`MACHINE_ID`) REFERENCES `arcade_machines` (`MACHINE_ID`);

--
-- Constraints for table `session_consoles`
--
ALTER TABLE `session_consoles`
  ADD CONSTRAINT `session_consoles_ibfk_1` FOREIGN KEY (`SESSION_ID`) REFERENCES `sessions` (`SESSION_ID`);

--
-- Constraints for table `session_fees`
--
ALTER TABLE `session_fees`
  ADD CONSTRAINT `session_fees_ibfk_1` FOREIGN KEY (`SESSION_ID`) REFERENCES `sessions` (`SESSION_ID`);

--
-- Constraints for table `session_staff`
--
ALTER TABLE `session_staff`
  ADD CONSTRAINT `session_staff_ibfk_1` FOREIGN KEY (`SESSION_ID`) REFERENCES `sessions` (`SESSION_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
