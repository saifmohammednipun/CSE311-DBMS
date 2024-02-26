-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2024 at 05:28 AM
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
-- Database: `assignment1_2121913642`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartment`
--

CREATE TABLE `apartment` (
  `Apart_id` int(11) NOT NULL,
  `Size` int(11) DEFAULT NULL,
  `Building_name` varchar(255) DEFAULT NULL,
  `TotalFloor_num` int(11) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `child`
--

CREATE TABLE `child` (
  `C_BRN` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `BirthTime_height` decimal(5,2) DEFAULT NULL,
  `BirthTime_weight` decimal(5,2) DEFAULT NULL,
  `Gender` char(5) DEFAULT NULL,
  `M_BRN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_id` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Credit_hour` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mother`
--

CREATE TABLE `mother` (
  `M_BRN` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Number_sons` int(11) DEFAULT NULL,
  `NUmber_daughters` int(11) DEFAULT NULL,
  `Total_child` int(11) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Profession` varchar(255) DEFAULT NULL,
  `Income` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `NID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Gender` char(5) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Profession` varchar(255) DEFAULT NULL,
  `Income` decimal(7,2) DEFAULT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Birth_registration` int(11) DEFAULT NULL,
  `Apart_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `T_id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `Total_salary` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `T_id` int(11) NOT NULL,
  `Course_id` int(11) NOT NULL,
  `Semester` varchar(255) NOT NULL,
  `Year_Teaching` year(4) NOT NULL,
  `Remuneration` decimal(4,2) DEFAULT NULL,
  `Section` int(11) DEFAULT NULL,
  `Number_students` int(11) DEFAULT NULL,
  `Course_fee` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartment`
--
ALTER TABLE `apartment`
  ADD PRIMARY KEY (`Apart_id`);

--
-- Indexes for table `child`
--
ALTER TABLE `child`
  ADD PRIMARY KEY (`C_BRN`),
  ADD KEY `M_BRN` (`M_BRN`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_id`);

--
-- Indexes for table `mother`
--
ALTER TABLE `mother`
  ADD PRIMARY KEY (`M_BRN`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`NID`),
  ADD KEY `Apart_id` (`Apart_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`T_id`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`T_id`,`Course_id`,`Semester`,`Year_Teaching`),
  ADD KEY `Course_id` (`Course_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `child`
--
ALTER TABLE `child`
  ADD CONSTRAINT `child_ibfk_1` FOREIGN KEY (`M_BRN`) REFERENCES `mother` (`M_BRN`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`Apart_id`) REFERENCES `apartment` (`Apart_id`);

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`T_id`) REFERENCES `teacher` (`T_id`),
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`Course_id`) REFERENCES `course` (`Course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
