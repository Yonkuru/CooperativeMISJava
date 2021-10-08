-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2021 at 05:45 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cooperative`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adm_id` int(11) NOT NULL,
  `adm_username` varchar(30) NOT NULL,
  `adm_password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cooperatives`
--

CREATE TABLE `tbl_cooperatives` (
  `cop_id` int(11) NOT NULL,
  `cop_name` varchar(50) NOT NULL,
  `cop_email` varchar(30) NOT NULL,
  `cop_address` varchar(50) NOT NULL,
  `cop_username` varchar(30) NOT NULL,
  `cop_password` varchar(64) NOT NULL,
  `cop_status` int(11) NOT NULL DEFAULT 1,
  `cop_registered_date` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cooperatives`
--

INSERT INTO `tbl_cooperatives` (`cop_id`, `cop_name`, `cop_email`, `cop_address`, `cop_username`, `cop_password`, `cop_status`, `cop_registered_date`) VALUES
(1, 'Ikijumba Cooperative', 'ikijumba@coo.rw', 'Musanze-Muhoza', 'ikijumba', 'ikijumba', 1, '1631721784'),
(2, 'Muhoza Cooperative', 'haha@ibirayi.com', 'Kivuruga', 'muhoza', 'muhoza', 1, '1631725723'),
(3, 'COTAMUNYA', 'cotamunya@gmail.com', 'Nyamasheke', 'ntazinda', 'ntazinda', 1, '1631978353');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_members`
--

CREATE TABLE `tbl_members` (
  `mbr_id` int(11) NOT NULL,
  `mbr_cooperative` int(11) NOT NULL,
  `mbr_firstname` varchar(30) NOT NULL,
  `mbr_lastname` varchar(30) NOT NULL,
  `mbr_phone` varchar(15) NOT NULL,
  `mbr_email` varchar(30) NOT NULL,
  `mbr_password` varchar(64) NOT NULL,
  `mbr_utype` int(11) NOT NULL,
  `mbr_status` int(11) NOT NULL DEFAULT 1,
  `mbr_registered_date` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_members`
--

INSERT INTO `tbl_members` (`mbr_id`, `mbr_cooperative`, `mbr_firstname`, `mbr_lastname`, `mbr_phone`, `mbr_email`, `mbr_password`, `mbr_utype`, `mbr_status`, `mbr_registered_date`) VALUES
(3, 2, 'IRADUKUNDA', 'Alice', '0788888888', 'alice@gmail.com', 'alice', 1, 1, '1631725785'),
(4, 1, 'MUZEHE', 'Emmanuel', '0784585658', 'muzehe@gmail.com', 'muzehe', 2, 1, '1631872826'),
(5, 2, 'MUHIRE', 'Erenest', '0788888887', 'muhire@gmail.com', 'muhire', 2, 1, '1631874436'),
(6, 3, 'KALISA', 'Eric', '0785526598', 'eric@gmail.com', 'eric', 2, 1, '1631978576');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_member_account`
--

CREATE TABLE `tbl_member_account` (
  `acc_id` int(11) NOT NULL,
  `acc_member_id` int(11) NOT NULL,
  `acc_balance` double NOT NULL,
  `acc_status` int(11) NOT NULL DEFAULT 1,
  `acc_created_date` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transactions`
--

CREATE TABLE `tbl_transactions` (
  `trs_id` int(11) NOT NULL,
  `trs_acc_id` int(11) NOT NULL,
  `trs_action` varchar(20) NOT NULL,
  `trs_date` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_types`
--

CREATE TABLE `tbl_user_types` (
  `utp_id` int(11) NOT NULL,
  `utp_desc` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user_types`
--

INSERT INTO `tbl_user_types` (`utp_id`, `utp_desc`) VALUES
(1, 'Manager'),
(2, 'Member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `tbl_cooperatives`
--
ALTER TABLE `tbl_cooperatives`
  ADD PRIMARY KEY (`cop_id`);

--
-- Indexes for table `tbl_members`
--
ALTER TABLE `tbl_members`
  ADD PRIMARY KEY (`mbr_id`),
  ADD KEY `mbr_cooperative` (`mbr_cooperative`),
  ADD KEY `mbr_utype` (`mbr_utype`);

--
-- Indexes for table `tbl_member_account`
--
ALTER TABLE `tbl_member_account`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indexes for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  ADD PRIMARY KEY (`trs_id`);

--
-- Indexes for table `tbl_user_types`
--
ALTER TABLE `tbl_user_types`
  ADD PRIMARY KEY (`utp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adm_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cooperatives`
--
ALTER TABLE `tbl_cooperatives`
  MODIFY `cop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_members`
--
ALTER TABLE `tbl_members`
  MODIFY `mbr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_member_account`
--
ALTER TABLE `tbl_member_account`
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  MODIFY `trs_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user_types`
--
ALTER TABLE `tbl_user_types`
  MODIFY `utp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_members`
--
ALTER TABLE `tbl_members`
  ADD CONSTRAINT `tbl_members_ibfk_1` FOREIGN KEY (`mbr_cooperative`) REFERENCES `tbl_cooperatives` (`cop_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_members_ibfk_2` FOREIGN KEY (`mbr_utype`) REFERENCES `tbl_user_types` (`utp_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
