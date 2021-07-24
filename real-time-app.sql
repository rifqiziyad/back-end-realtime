-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2021 at 09:44 AM
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
(1, 1234, 5, 6, 'Hai !', '2021-05-31 07:03:47'),
(2, 4321, 5, 7, 'asdsadsaasdsa', '2021-05-31 07:03:47'),
(3, 1124, 5, 12, 'Hai !', '2021-05-31 07:03:50'),
(4, 2121, 5, 13, 'hai !', '2021-05-31 07:03:50'),
(5, 1234, 6, 5, 'Halo !', '2021-05-31 07:04:49'),
(7, 4321, 7, 5, 'adsasdasadasasdasdasdsad', '2021-05-31 07:08:09'),
(8, 1124, 12, 5, 'Halo !', '2021-05-31 07:08:09'),
(9, 2121, 13, 5, 'halo !', '2021-05-31 07:08:11'),
(11, 3344, 6, 7, 'asdasd', '2021-05-31 07:39:12'),
(12, 3344, 7, 6, 'asdaasdasd', '2021-05-31 08:05:21'),
(13, 5543, 7, 8, 'asdaasdasd', '2021-05-31 08:20:02'),
(14, 5543, 8, 7, 'asdaasdasd', '2021-05-31 08:20:47'),
(15, 5543, 8, 7, 'das', '2021-07-05 13:14:58'),
(16, 4321, 5, 7, 'asdasd', '2021-07-05 13:19:31'),
(17, 4321, 7, 5, 'apa', '2021-07-05 13:20:22'),
(18, 4321, 7, 5, 'woy', '2021-07-05 13:25:29'),
(19, 4321, 5, 7, 'apa', '2021-07-05 13:25:33'),
(20, 4321, 5, 7, 'woy', '2021-07-05 13:28:30'),
(21, 4321, 7, 5, 'panteq', '2021-07-05 13:28:34'),
(22, 4321, 7, 5, 'woy', '2021-07-05 13:53:23'),
(23, 4321, 7, 5, 'woy', '2021-07-05 13:53:38'),
(24, 4321, 7, 5, 'woy', '2021-07-05 14:00:23'),
(25, 4321, 5, 7, 'p', '2021-07-05 14:01:37'),
(26, 4321, 7, 5, 'apa', '2021-07-05 14:01:47'),
(27, 4321, 7, 5, 'woy', '2021-07-05 14:02:50'),
(28, 4321, 5, 7, 'hai', '2021-07-05 14:06:20'),
(29, 4321, 5, 7, 'woy', '2021-07-05 14:07:46'),
(30, 4321, 5, 7, 'woy', '2021-07-05 14:08:27'),
(31, 4321, 5, 7, 'mabar', '2021-07-05 14:08:28'),
(32, 4321, 7, 5, 'ogah', '2021-07-05 14:08:33'),
(33, 4321, 5, 7, 'dih', '2021-07-05 14:08:39'),
(34, 4321, 7, 5, 'apa', '2021-07-05 14:08:52'),
(35, 4321, 7, 5, 'woy', '2021-07-05 14:08:53'),
(36, 4321, 5, 7, 'gas lah', '2021-07-05 14:09:18'),
(37, 4321, 5, 7, 'woy', '2021-07-05 14:09:37'),
(38, 4321, 7, 5, 'p', '2021-07-05 14:10:16'),
(39, 1124, 5, 12, 'p', '2021-07-06 00:35:32'),
(40, 4321, 5, 7, 'asdasd', '2021-07-06 00:48:09'),
(41, 4321, 5, 7, 'asd', '2021-07-06 01:03:10'),
(42, 4321, 5, 7, 'asdasd', '2021-07-06 01:03:13'),
(43, 4321, 7, 5, 'jgn spam', '2021-07-06 01:03:25'),
(44, 4321, 5, 7, 'iy', '2021-07-06 01:03:33'),
(45, 4321, 5, 7, 'apa', '2021-07-06 01:03:40'),
(46, 4321, 7, 5, 'w', '2021-07-06 01:03:46'),
(47, 4321, 5, 7, 'asd', '2021-07-06 01:04:03'),
(48, 4321, 7, 5, 'a', '2021-07-06 01:04:12'),
(49, 4321, 5, 7, 'woy', '2021-07-06 01:04:52'),
(50, 4321, 7, 5, 'apa', '2021-07-06 01:04:59'),
(51, 4321, 5, 7, 'as', '2021-07-06 01:05:25'),
(52, 4321, 7, 5, 'asd', '2021-07-06 01:05:29'),
(53, 4321, 5, 7, 'as', '2021-07-06 01:05:45'),
(54, 4321, 7, 5, 'as', '2021-07-06 01:05:52'),
(55, 1234, 5, 6, 'asd', '2021-07-06 16:56:20'),
(56, 4321, 5, 7, 'woy', '2021-07-07 07:32:07'),
(57, 4321, 5, 7, 'p', '2021-07-07 07:35:27'),
(58, 4321, 5, 7, 'woy', '2021-07-08 16:07:32'),
(59, 4321, 7, 5, 'p', '2021-07-08 16:07:37'),
(60, 4321, 5, 7, 'w', '2021-07-08 16:07:53'),
(61, 4321, 5, 7, 'w', '2021-07-08 16:08:23'),
(62, 4321, 7, 5, 'asd', '2021-07-08 16:09:00'),
(63, 4321, 5, 7, 'asdsad', '2021-07-08 16:09:30'),
(64, 4321, 5, 7, 'asdasdsasa', '2021-07-08 16:12:04'),
(65, 4321, 5, 7, 'sadasd', '2021-07-08 16:12:41'),
(66, 4321, 7, 5, 'www', '2021-07-08 16:12:45'),
(67, 4321, 5, 7, 'sad]', '2021-07-08 16:13:13'),
(68, 4321, 7, 5, 'ww', '2021-07-08 16:13:19'),
(69, 4321, 5, 7, 'asd', '2021-07-08 16:13:58'),
(70, 4321, 5, 7, 'asdas', '2021-07-08 16:15:23'),
(71, 4321, 7, 5, 'asd', '2021-07-08 16:15:28'),
(72, 4321, 7, 5, 'qqq', '2021-07-08 16:15:50'),
(73, 4321, 5, 7, 'wwasdsa', '2021-07-08 16:16:07'),
(74, 4321, 5, 7, 'asd', '2021-07-08 16:16:48'),
(75, 4321, 5, 7, 'qqqq', '2021-07-08 16:17:12'),
(76, 4321, 5, 7, 'asd', '2021-07-08 16:17:28'),
(77, 4321, 5, 7, 'asdasd', '2021-07-08 16:17:50'),
(78, 4321, 7, 5, 'asdasd', '2021-07-08 16:18:04'),
(79, 4321, 7, 5, 'asadsa', '2021-07-08 16:18:11'),
(80, 4321, 7, 5, 'q', '2021-07-08 16:18:30'),
(81, 4321, 7, 5, 'q', '2021-07-08 16:19:45'),
(82, 4321, 5, 7, 'wasd', '2021-07-08 16:19:54'),
(83, 4321, 7, 5, 'asd', '2021-07-08 16:21:40'),
(84, 4321, 7, 5, 'qq', '2021-07-08 16:21:44'),
(85, 4321, 5, 7, 'asd', '2021-07-08 16:22:11'),
(86, 4321, 7, 5, 'qq', '2021-07-08 16:22:20'),
(87, 4321, 5, 7, 'woy', '2021-07-08 16:23:01'),
(88, 4321, 5, 7, 'asd', '2021-07-08 16:24:27'),
(89, 4321, 7, 5, 'asd', '2021-07-08 16:24:44'),
(90, 4321, 5, 7, 'asd', '2021-07-08 16:24:57'),
(91, 4321, 5, 7, 'q', '2021-07-08 16:26:52'),
(92, 2121, 5, 13, 'apa kabar ?', '2021-07-09 08:56:59'),
(93, 2121, 13, 5, 'baik ', '2021-07-09 08:57:38'),
(94, 2121, 13, 5, 'mabar kuy ', '2021-07-09 08:57:44'),
(95, 2121, 5, 13, 'kuy', '2021-07-09 08:57:51'),
(96, 48524, 5, 35, 'hai', '2021-07-10 10:18:20');

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
(7, 6, 12, '2021-06-01 14:42:33'),
(8, 12, 6, '2021-06-01 14:42:33'),
(21, 5, 7, '2021-07-10 08:22:58'),
(22, 7, 5, '2021-07-10 08:22:58'),
(23, 5, 12, '2021-07-10 08:23:28'),
(24, 12, 5, '2021-07-10 08:23:28'),
(25, 5, 13, '2021-07-10 08:26:11'),
(26, 13, 5, '2021-07-10 08:26:11'),
(27, 5, 35, '2021-07-10 09:43:11'),
(28, 35, 5, '2021-07-10 09:43:11');

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
(1, 4321, 5, 7, '2021-05-30 07:47:15'),
(2, 1234, 6, 5, '2021-05-30 07:47:15'),
(5, 4321, 7, 5, '2021-05-30 07:50:27'),
(6, 1124, 12, 5, '2021-05-30 08:42:40'),
(7, 2121, 13, 5, '2021-05-30 08:42:40'),
(8, 2121, 5, 13, '2021-07-09 08:46:32'),
(22, 23833, 23, 34, '2021-07-09 16:43:00'),
(23, 23833, 34, 23, '2021-07-09 16:43:00'),
(24, 48524, 5, 35, '2021-07-10 09:49:02'),
(25, 48524, 35, 5, '2021-07-10 09:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(225) NOT NULL,
  `user_verification` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(250) NOT NULL,
  `username` varchar(255) NOT NULL,
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

INSERT INTO `user` (`user_id`, `user_verification`, `user_name`, `username`, `user_email`, `user_password`, `user_image`, `user_phone`, `user_bio`, `user_is_online`, `user_created_at`, `user_updated_at`) VALUES
('12', 1, 'Theresa Webb', '', 'ziyad@gmail.com', '$2b$10$YDajW1w9D8YG3./ow7zMHe7bkxS9yBuIjYW9o6f61bwubua03w4li', '2021-07-09T08-40-25.654ZRectangle 3.png', '423423432432', 'asdas', 0, '2021-05-30 08:41:42', '2021-07-09 08:40:41'),
('13', 1, 'admin', '', 'imtinan@gmail.com', '$2b$10$6IoW1KRmwqStcZpvyc2cU.52EMnMdVqJ0Ao/cuCa.WmRBCFsivXEi', '', '423423432432', 'asdas', 0, '2021-05-30 08:41:46', '2021-07-09 08:44:00'),
('27', 0, 'weveh', '', 'weveh95312@herrain.com', '$2b$10$RNKCJsvb.NiCPDbhuR4zH.sgcgNEgHZMXmfgMnln.tDLoxoepQ2cW', '', '', '', 0, '2021-07-07 09:45:37', NULL),
('29', 0, 'vakira', '', 'vakira4217@noobf.com', '$2b$10$F/rbN92fY4UJETOSFiaGSOOBrGWqyhUPfb6V2o5mD51GMIs6RLKJq', '', '', '', 0, '2021-07-07 09:48:27', NULL),
('31', 1, 'sitaj66170', '', 'sitaj66170@herrain.com', '$2b$10$BOVGDgcSspFIak32KOVwvO5.Fa62dbxfTe2bfz5p6Fe9oxs9GO8ry', '', '', '', 0, '2021-07-07 09:58:13', NULL),
('33', 0, 'contoh', '', 'cikop47000@noobf.com', '$2b$10$cc6cA1w9j9sqZmFBERwT6e.jqAH/Z2Gw0jIU8Zeulfjc/GtEbQdR2', '', '', '', 0, '2021-07-07 10:13:28', NULL),
('34', 1, 'rajan', '', 'rajan21275@noobf.com', '$2b$10$rZpViDRDftJ5OOJl6umwv.oBZO6jNim6enhpIq/FD8D.xplKblTHu', '', '032849327341', '', 0, '2021-07-07 14:06:29', NULL),
('35', 0, 'vakira', '643377240759', 'vakira4217@noobf.com2', '$2b$10$D4R1/5kMnBCX8xBsHVpm2e//aBRwPHd6HnJ2yzHeKr0ESgaCe3qCm', '', '089304248932', '', 0, '2021-07-07 18:36:39', NULL),
('36', 0, 'vakira', 'user665972268472', 'vakira4217@noobf.com22', '$2b$10$p5v5/22AplBBvtmunkbK/uqJ4pR0El4J8EYZGACDTOqB7v9m/bwpi', '', '089304248932', '', 0, '2021-07-07 18:37:12', NULL),
('37', 0, 'vakira', 'user238882185314', 'vakira4217@noobf.com221', '$2b$10$BiiHQmZ.s.6g5D2f6ifYFuke93sOsqRAtx6WUaH4IKgwF4z7DSyg.', '', '089304248932', '', 0, '2021-07-07 18:43:22', NULL),
('5', 1, 'Rifqi Ziyad Imtinan', '3ee43rifqi', 'rifqiimtinan@gmail.com', '$2b$10$RboRBFIxOSJnYv46KDbI9u8WZPGESJa0zEAzrQkw.STDXAd6A5CQS', '2021-07-10T02-54-19.377ZEllipse 327.png', '08932432749324', 'i am a full stack web developer', 0, '2021-05-27 12:58:15', '2021-07-10 02:54:19'),
('6', 1, 'Gregory Bell', '', 'rifqiimtinan123@gmail.com', '$2b$10$6Ec3RscByzIh6kv/FkYv9.KaJPWUC..BldPtuMOR4l4uJDNSaHyY6', '2021-07-09T09-01-38.109Zphoto6262768406352735192.jpg', '', '', 0, '2021-05-27 13:59:44', '2021-07-09 09:01:38'),
('7', 1, 'Calvin Flores', 'admin1234523', 'admin@admin.com', '$2b$10$JVjTSrX5EJT386i9tA3a6uVv4ApdMSQnx649LozUBH9vvQR7jQw9G', '2021-07-09T08-41-20.526ZRectangle 8 (1).png', '01374398472', 'admin', 0, '2021-05-28 15:18:21', '2021-07-09 08:41:30'),
('bwz0gzep1dqkqttzi5e', 0, 'vakira', 'user233433761796', 'aasdas@asd', '$2b$10$FT3vQ9mMwjbg3ycdI4lEjuA5yuVURKWtSZT5FvFyD0Cem6iI1YHS.', '', '089304248932', '', 0, '2021-07-07 18:45:07', NULL);

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
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `room_chat`
--
ALTER TABLE `room_chat`
  MODIFY `room_chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
