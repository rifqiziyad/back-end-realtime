-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2021 at 11:27 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `real-time-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `chat_id` int(11) NOT NULL,
  `room_chat` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `chat_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`chat_id`, `room_chat`, `sender_id`, `receiver_id`, `message`, `chat_created_at`) VALUES
(1, 1234, 5, 6, 'woy asdasd', '2021-05-31 07:03:47'),
(2, 4321, 5, 7, 'asdsadsaasdsa', '2021-05-31 07:03:47'),
(3, 1124, 5, 12, 'woy asdasd', '2021-05-31 07:03:50'),
(4, 2121, 5, 13, 'asdsadsaasdsa', '2021-05-31 07:03:50'),
(5, 1234, 6, 5, 'asdasdsadsadad', '2021-05-31 07:04:49'),
(7, 4321, 7, 5, 'adsasdasadasasdasdasdsad', '2021-05-31 07:08:09'),
(8, 1124, 12, 5, 'asdasasdasdsadasdssdasdad', '2021-05-31 07:08:09'),
(9, 2121, 13, 5, 'adsasdasadasasdasdasdsad', '2021-05-31 07:08:11'),
(11, 3344, 6, 7, 'asdasd', '2021-05-31 07:39:12'),
(12, 3344, 7, 6, 'asdaasdasd', '2021-05-31 08:05:21'),
(13, 5543, 7, 8, 'asdaasdasd', '2021-05-31 08:20:02'),
(14, 5543, 8, 7, 'asdaasdasd', '2021-05-31 08:20:47');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `contact_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `user_id`, `friend_id`, `contact_created_at`) VALUES
(1, 5, 6, '2021-05-27 13:26:05'),
(2, 6, 5, '2021-05-27 13:34:57'),
(3, 7, 5, '2021-05-30 16:44:23'),
(4, 12, 5, '2021-05-30 16:44:23'),
(5, 13, 5, '2021-05-30 16:44:31'),
(7, 6, 12, '2021-06-01 14:42:33'),
(8, 12, 6, '2021-06-01 14:42:33');

-- --------------------------------------------------------

--
-- Table structure for table `room_chat`
--

CREATE TABLE `room_chat` (
  `room_chat_id` int(11) NOT NULL,
  `room_chat` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `room_chat_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_chat`
--

INSERT INTO `room_chat` (`room_chat_id`, `room_chat`, `user_id`, `friend_id`, `room_chat_created_at`) VALUES
(1, 1234, 5, 7, '2021-05-30 07:47:15'),
(2, 1234, 6, 5, '2021-05-30 07:47:15'),
(5, 4321, 7, 5, '2021-05-30 07:50:27'),
(6, 1124, 12, 5, '2021-05-30 08:42:40'),
(7, 2121, 13, 5, '2021-05-30 08:42:40');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_verification` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(250) NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `user_password` varchar(250) NOT NULL,
  `user_image` varchar(150) NOT NULL,
  `user_phone` varchar(50) NOT NULL,
  `user_bio` varchar(255) NOT NULL,
  `user_is_online` tinyint(1) NOT NULL DEFAULT 0,
  `user_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_verification`, `user_name`, `user_email`, `user_password`, `user_image`, `user_phone`, `user_bio`, `user_is_online`, `user_created_at`, `user_updated_at`) VALUES
(5, 1, 'Rifqi Ziyad Imtinan', 'rifqiimtinan@gmail.com', '$2b$10$RboRBFIxOSJnYv46KDbI9u8WZPGESJa0zEAzrQkw.STDXAd6A5CQS', '2021-05-31T17-04-26.175Zpp4.png', '03249243', 'Sip', 0, '2021-05-27 12:58:15', '2021-05-27 16:01:30'),
(6, 1, 'Ziyad', 'rifqiimtinan123@gmail.com', '$2b$10$6Ec3RscByzIh6kv/FkYv9.KaJPWUC..BldPtuMOR4l4uJDNSaHyY6', '', '', '', 0, '2021-05-27 13:59:44', NULL),
(7, 1, 'admin', 'admin@admin.com', '$2b$10$JVjTSrX5EJT386i9tA3a6uVv4ApdMSQnx649LozUBH9vvQR7jQw9G', '', '', '', 0, '2021-05-28 15:18:21', NULL),
(12, 0, 'ziyad', 'ziyad@gmail.com', 'asd', '', '423423432432', 'asdas', 0, '2021-05-30 08:41:42', NULL),
(13, 0, 'imtinan', 'imtinan@gmail.com', 'asd', '', '423423432432', 'asdas', 0, '2021-05-30 08:41:46', NULL),
(15, 1, 'Rifqi Ziyad Imtinan', 'rifqiziyad4@gmail.com', '$2b$10$3YS3btWPKOBUSEO45KB1j.3gHUFign0krMJLJ/rBXH4aq5.S8aW1O', '', '', '', 0, '2021-06-01 14:26:59', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `room_chat`
--
ALTER TABLE `room_chat`
  ADD PRIMARY KEY (`room_chat_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room_chat`
--
ALTER TABLE `room_chat`
  MODIFY `room_chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
