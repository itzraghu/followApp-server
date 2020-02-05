-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2020 at 04:37 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `follow_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(300) NOT NULL,
  `address` text NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `remarks` text DEFAULT NULL,
  `visiting_card` varchar(255) DEFAULT NULL,
  `other_document` varchar(255) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `address`, `website`, `contact_number`, `city`, `state_id`, `country_id`, `remarks`, `visiting_card`, `other_document`, `latitude`, `longitude`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'test@gmail.com', 'test address', '', '', '', 1, 1, '', '', '', '', '', 1, '2020-02-01 16:26:27', '2020-02-01 16:26:27');

-- --------------------------------------------------------

--
-- Table structure for table `client_contact_persons`
--

CREATE TABLE `client_contact_persons` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_contact_persons`
--

INSERT INTO `client_contact_persons` (`id`, `client_id`, `name`, `email`, `contact_number`, `address`, `designation`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test', 'test@gmail.com', '', 'test address', '', 1, '2020-02-01 16:32:13', '2020-02-01 16:32:13');

-- --------------------------------------------------------

--
-- Table structure for table `client_enquiries`
--

CREATE TABLE `client_enquiries` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `contact_person_id` int(11) NOT NULL,
  `communication_mode_id` int(11) NOT NULL,
  `enquiry_date` date NOT NULL,
  `enquiry_time` time NOT NULL,
  `remark` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_followups`
--

CREATE TABLE `client_followups` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `next_followup_date` date DEFAULT NULL,
  `next_followup_time` time DEFAULT NULL,
  `priority_id` int(11) NOT NULL,
  `communication_mode_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_meetings`
--

CREATE TABLE `client_meetings` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_product_id` int(11) NOT NULL,
  `meeting_date` date NOT NULL,
  `meeting_time` time DEFAULT NULL,
  `communication_mode_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `is_completed` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_products`
--

CREATE TABLE `client_products` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `product` varchar(255) NOT NULL,
  `product_service_type_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_products`
--

INSERT INTO `client_products` (`id`, `client_id`, `product`, `product_service_type_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test', 1, 1, '2020-02-01 16:42:47', '2020-02-01 16:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `communication_modes`
--

CREATE TABLE `communication_modes` (
  `id` int(11) NOT NULL,
  `communication_mode` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `communication_modes`
--

INSERT INTO `communication_modes` (`id`, `communication_mode`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Email', 0, '2020-02-01 16:00:01', '2020-02-01 16:00:23');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '1', 1, '2020-02-01 16:45:08', '2020-02-01 16:45:08');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_subjects`
--

CREATE TABLE `enquiry_subjects` (
  `id` int(11) NOT NULL,
  `enquiry_subject` text NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry_subjects`
--

INSERT INTO `enquiry_subjects` (`id`, `enquiry_subject`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Test', 1, '2020-02-01 15:58:14', '2020-02-01 16:49:54');

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `id` int(11) NOT NULL,
  `priority` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `priority`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'High', 1, '2020-02-01 15:53:17', '2020-02-01 16:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `product_service_types`
--

CREATE TABLE `product_service_types` (
  `id` int(11) NOT NULL,
  `product_service_type` varchar(300) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_service_types`
--

INSERT INTO `product_service_types` (`id`, `product_service_type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'IT Product', 1, '2020-02-01 15:40:52', '2020-02-01 16:49:42');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `state`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Andhra Pradesh', 1, '2020-02-01 16:46:03', '2020-02-01 16:46:03'),
(2, 1, 'Arunachal Pradesh', 1, '2020-02-01 16:46:03', '2020-02-01 16:46:03'),
(3, 1, 'Assam', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(4, 1, 'Bihar', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(5, 1, 'Chhattisgarh', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(6, 1, 'Goa', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(7, 1, 'Gujarat', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(8, 1, 'Haryana', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(9, 1, 'Himachal Pradesh', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(10, 1, 'Jharkhand', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(11, 1, 'Karnataka', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(12, 1, 'Kerala', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(13, 1, 'Madhya Pradesh', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(14, 1, 'Maharashtra', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(15, 1, 'Manipur', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(16, 1, 'Meghalaya', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(17, 1, 'Mizoram', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(18, 1, 'Nagaland', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(19, 1, 'Odisha', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(20, 1, 'Punjab', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(21, 1, 'Rajasthan', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(22, 1, 'Sikkim', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(23, 1, 'Tamil Nadu', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(24, 1, 'Telangana', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(25, 1, 'Tripura', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(26, 1, 'Uttarakhand', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(27, 1, 'Uttar Pradesh', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21'),
(28, 1, 'West Bengal', 1, '2020-02-01 16:49:21', '2020-02-01 16:49:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `plain_password` varchar(255) NOT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `plain_password`, `contact_number`, `api_key`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Raghvendra', 'raghu@gmail.com', '$2y$10$jetVQqDIPxPVsgSdLXM54.pDfM5esomVTWoA.OW21SXZPsyz7bp6u', 'password', NULL, 'MVZ3YktIR0NxaEVxS1g4bDdVaDlTWFZNSnNPVUxPUWpKSnNUU1Rmag==', 1, '2020-01-19 07:53:37', '2020-02-01 15:26:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_contact_persons`
--
ALTER TABLE `client_contact_persons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_enquiries`
--
ALTER TABLE `client_enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_followups`
--
ALTER TABLE `client_followups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_meetings`
--
ALTER TABLE `client_meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_products`
--
ALTER TABLE `client_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `communication_modes`
--
ALTER TABLE `communication_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_subjects`
--
ALTER TABLE `enquiry_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_service_types`
--
ALTER TABLE `product_service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client_contact_persons`
--
ALTER TABLE `client_contact_persons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client_enquiries`
--
ALTER TABLE `client_enquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_followups`
--
ALTER TABLE `client_followups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_meetings`
--
ALTER TABLE `client_meetings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_products`
--
ALTER TABLE `client_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `communication_modes`
--
ALTER TABLE `communication_modes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enquiry_subjects`
--
ALTER TABLE `enquiry_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_service_types`
--
ALTER TABLE `product_service_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
