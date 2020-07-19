-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2019 at 03:54 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pikkanode`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL DEFAULT '',
  `picture_id` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `text`, `picture_id`, `created_by`, `created_at`) VALUES
(1, 'Nice Shot!', '1fe6f50a-152c-49b6-b7e9-c1f5e606c65c', 8, '2019-07-18 08:11:05'),
(2, 'Hungry cool!', '0bf5127e-9b67-486c-a3d2-478c337301e6', 5, '2019-07-19 03:27:09'),
(3, 'Wowww such a good festival', 'e82ace05-3689-48c0-aa67-5b4bd560db35', 5, '2019-07-19 03:28:58'),
(4, 'maybe I should join next year??', 'e82ace05-3689-48c0-aa67-5b4bd560db35', 5, '2019-07-19 03:32:12'),
(5, 'Suicide Squads <3', 'f4ccd2bf-b130-4e88-99f5-07550f048a9f', 5, '2019-07-19 03:33:07'),
(6, 'I love this shot!', '51163e66-a55b-4f30-b657-7da6ec523c2a', 5, '2019-07-19 03:44:56'),
(7, 'This is secret weapon.', '011c1a06-b004-43f8-a3ad-6a941af956ae', 5, '2019-07-19 07:19:25'),
(8, 'Say hi from Indos!', '0bf5127e-9b67-486c-a3d2-478c337301e6', 5, '2019-07-19 07:21:49'),
(9, 'Who is the man on the left? #curious?', '0bf5127e-9b67-486c-a3d2-478c337301e6', 5, '2019-07-19 07:22:31'),
(10, 'idk, maybe a lonely man', '0bf5127e-9b67-486c-a3d2-478c337301e6', 5, '2019-07-19 07:22:57'),
(11, 'Nice work!', '5241f14e-635d-43cb-b17c-600825065c0f', 5, '2019-07-19 07:23:43'),
(12, 'poor man #bruh :(', '0bf5127e-9b67-486c-a3d2-478c337301e6', 5, '2019-07-19 07:29:43'),
(13, 'what', '0bf5127e-9b67-486c-a3d2-478c337301e6', 5, '2019-07-20 07:29:12'),
(14, 'Yoyoyo', '0bf5127e-9b67-486c-a3d2-478c337301e6', 5, '2019-07-23 09:22:56'),
(15, 'test auth', '0e96354b-8318-4c4a-993c-59bac8b16a77', 5, '2019-07-23 09:39:00'),
(16, 'test auth2', '51163e66-a55b-4f30-b657-7da6ec523c2a', 5, '2019-07-23 09:39:14'),
(17, 'testt jaa', '011c1a06-b004-43f8-a3ad-6a941af956ae', 15, '2019-07-23 10:47:52'),
(18, 'come backkk', '0bf5127e-9b67-486c-a3d2-478c337301e6', 15, '2019-07-23 10:48:05'),
(19, 'Sweat Go Go!!', '1fe6f50a-152c-49b6-b7e9-c1f5e606c65c', 16, '2019-07-23 11:04:59'),
(20, 'Diamond P!!!', 'f4ccd2bf-b130-4e88-99f5-07550f048a9f', 16, '2019-07-23 11:10:43'),
(21, 'Good one', '5241f14e-635d-43cb-b17c-600825065c0f', 15, '2019-07-23 11:58:41'),
(22, 'who is he?', '83c111d0-a165-40dd-84b7-b7fb19e198b0', 15, '2019-07-23 12:03:22'),
(23, '<3', '4f2756da-d5b8-44e9-9653-fc82071ee261', 15, '2019-07-23 12:19:09'),
(24, 'Cute mak', 'c9c78673-1a03-45c4-b824-d6558c53847a', 15, '2019-07-23 12:28:53'),
(25, 'Where can I buy this wonderful t-shirt?', '60e5849b-dc08-4154-add0-41efa9f4055f', 18, '2019-07-24 04:30:29'),
(26, 'Front row, Minto!', '4f2756da-d5b8-44e9-9653-fc82071ee261', 18, '2019-07-24 04:31:08'),
(27, 'Luv mak mak', '1c94d037-a667-42d5-9611-4d2c3b0b8c19', 21, '2019-07-24 10:43:42'),
(28, 'finish!!!!', '172f331e-b70e-4539-94f3-50f567877a91', 19, '2019-07-24 13:49:21');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `user_id` int(11) NOT NULL,
  `picture_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`user_id`, `picture_id`) VALUES
(2, 'c065d9da-9234-4e81-bc33-0a9612a337b9'),
(4, '011c1a06-b004-43f8-a3ad-6a941af956ae'),
(4, '0bf5127e-9b67-486c-a3d2-478c337301e6'),
(4, '0e96354b-8318-4c4a-993c-59bac8b16a77'),
(4, '51163e66-a55b-4f30-b657-7da6ec523c2a'),
(4, 'e4495203-7cbc-4233-a6b7-a7834407d6f3'),
(5, '2b6377a0-0814-421e-b201-033358756b6b'),
(6, '011c1a06-b004-43f8-a3ad-6a941af956ae'),
(7, '83c111d0-a165-40dd-84b7-b7fb19e198b0'),
(10, '0bf5127e-9b67-486c-a3d2-478c337301e6'),
(15, '011c1a06-b004-43f8-a3ad-6a941af956ae'),
(15, '0bf5127e-9b67-486c-a3d2-478c337301e6'),
(15, '0e96354b-8318-4c4a-993c-59bac8b16a77'),
(15, '12ddc906-e7ba-4958-a02b-3cb4b50e7a1f'),
(15, '1c94d037-a667-42d5-9611-4d2c3b0b8c19'),
(15, '4f2756da-d5b8-44e9-9653-fc82071ee261'),
(15, '5241f14e-635d-43cb-b17c-600825065c0f'),
(15, '83c111d0-a165-40dd-84b7-b7fb19e198b0'),
(15, 'c065d9da-9234-4e81-bc33-0a9612a337b9'),
(15, 'c9c78673-1a03-45c4-b824-d6558c53847a'),
(15, 'f4ccd2bf-b130-4e88-99f5-07550f048a9f'),
(16, '011c1a06-b004-43f8-a3ad-6a941af956ae'),
(16, '1fe6f50a-152c-49b6-b7e9-c1f5e606c65c'),
(16, '9e4cca4d-36b2-4130-8093-ab07773d7bff'),
(16, 'f4ccd2bf-b130-4e88-99f5-07550f048a9f'),
(18, '4f2756da-d5b8-44e9-9653-fc82071ee261'),
(18, '60e5849b-dc08-4154-add0-41efa9f4055f'),
(19, '172f331e-b70e-4539-94f3-50f567877a91'),
(21, '0bf5127e-9b67-486c-a3d2-478c337301e6'),
(21, '1c94d037-a667-42d5-9611-4d2c3b0b8c19');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`id`, `caption`, `created_at`, `created_by`) VALUES
('011c1a06-b004-43f8-a3ad-6a941af956ae', 'Just a normal day', '2019-07-17 07:34:08', 1),
('0bf5127e-9b67-486c-a3d2-478c337301e6', 'let\'s try once', '2019-07-16 17:50:43', 1),
('0e96354b-8318-4c4a-993c-59bac8b16a77', 'Supersonic! #oasis #forever #noel #liam #gallager', '2019-07-19 07:27:52', 1),
('12ddc906-e7ba-4958-a02b-3cb4b50e7a1f', 'One of my fav cartoon!! Chowder~', '2019-07-23 11:12:08', 16),
('172f331e-b70e-4539-94f3-50f567877a91', 'Team of the year #Sweat16! #16!', '2019-07-24 05:02:14', 18),
('1c94d037-a667-42d5-9611-4d2c3b0b8c19', 'PorkBelly~~~ MahnMook <3', '2019-07-24 04:51:16', 19),
('1fe6f50a-152c-49b6-b7e9-c1f5e606c65c', 'Love you 3000 times', '2019-07-16 17:53:45', 1),
('2b6377a0-0814-421e-b201-033358756b6b', 'first try', '2019-07-16 17:46:19', 1),
('2dffa85d-b2e3-4caf-8510-fb8c62f99e1e', 'My team! Check this out. #sweat16! #16', '2019-07-23 11:05:59', 16),
('4f2756da-d5b8-44e9-9653-fc82071ee261', 'My idol! #Minto #Sweat16!', '2019-07-23 12:17:05', 10),
('51163e66-a55b-4f30-b657-7da6ec523c2a', 'I want to stay somewhere.', '2019-07-16 17:53:26', 1),
('5241f14e-635d-43cb-b17c-600825065c0f', 'game of life, I like that.', '2019-07-16 17:54:20', 1),
('60e5849b-dc08-4154-add0-41efa9f4055f', 'Never Give Up Mo Salah', '2019-07-23 09:43:15', 10),
('83c111d0-a165-40dd-84b7-b7fb19e198b0', 'test info', '2019-07-17 07:33:47', 1),
('9e4cca4d-36b2-4130-8093-ab07773d7bff', 'xxn', '2019-07-16 17:54:44', 1),
('c065d9da-9234-4e81-bc33-0a9612a337b9', 'lemme c', '2019-07-17 07:44:14', 1),
('c9c78673-1a03-45c4-b824-d6558c53847a', 'Pansa Sweat16! My Savior :D', '2019-07-23 12:18:36', 15),
('e4495203-7cbc-4233-a6b7-a7834407d6f3', 'Lionsgate has signed Michael Gracey to direct an adaptation of the popular Japanese manga series “Naruto.”', '2019-07-19 06:33:27', 1),
('e82ace05-3689-48c0-aa67-5b4bd560db35', 'Call me by your name', '2019-07-17 08:04:50', 1),
('f4ccd2bf-b130-4e88-99f5-07550f048a9f', 'Couple 16!', '2019-07-18 08:55:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created_at`) VALUES
(1, 'root@pikkanode.io', '$2a$12$95SkHmjFpOkhCQt4cQ32PO3rXPcsX62hhty.xddBVV1daSBB1YX9y', '2019-07-14 07:02:45'),
(2, 'sss@gmail.com', '12345', '2019-07-16 05:18:27'),
(4, 'test1@hotmail.com', 'jiaza123', '2019-07-16 05:19:20'),
(5, 'test4@gmail.com', '12345', '2019-07-16 05:23:49'),
(6, 'gopro@outlook.com', '111222333', '2019-07-16 05:43:27'),
(7, 'ikwai-ol@gmail.com', '123456', '2019-07-16 07:08:56'),
(8, 'kowaii@gmail.com', 'jojoboba', '2019-07-16 07:55:23'),
(9, 'jarbjj.p@gmail.com', '12345', '2019-07-22 05:29:29'),
(10, 'ttay21@gmail.com', '$2b$10$S6NxckXdkLz3Q8gdVmDEruQWrNW8hMu8wOnOnj/uktQ8EMtGb8Zh6', '2019-07-22 05:32:13'),
(13, 'testValidate1@hotmail.com', '$2b$10$GFuCobwpLygs7Zqt2dETPeU77o/IIb97s4k6QH0oC2hSyAWwTqXDy', '2019-07-23 08:23:02'),
(14, 'testValidate2@gmail.com', '$2b$10$VDoDz.WjKQpSD8HBojLEI.63mKVbPV3txmtE7JHh5H8pgFkAhSMK2', '2019-07-23 08:52:38'),
(15, 'iloveu@gmail.com', '$2b$10$mx/ac1opyJpysJoRtJRn1Oxm5CvxPKJ3nP6LHuvgs4wrCVlLvagAG', '2019-07-23 10:40:26'),
(16, 's16c@gmail.com', '$2b$10$xue65xV05qMj63y6xzGJyuzpL0Qv91KDJMKyaq8W2zaI04mmQ2NrS', '2019-07-23 11:03:00'),
(18, 'fffooo@gmail.com', '$2b$10$Dmnn9n9MNFTOTVFhpqsN/ej1UIGXtDrdF3zdx5XdVvdOEf3iu93h.', '2019-07-24 04:17:11'),
(19, 'howru@gmail.com', '$2b$10$94NscZlCY1ewnMjH9sT7/OPhHDuLqRBhxlgEjZBJDQBKJ.M.aTr6W', '2019-07-24 04:39:16'),
(20, 'testlanding1@gmail.com', '$2b$10$WQQUJoYStuvJwDgXucTCnuHjU1zUr1jaN5fr6tf5QeNid2fdNU6o6', '2019-07-24 06:01:59'),
(21, 'testnewform@gmail.com', '$2b$10$pQrqNi5GeHxrnk2qeVNj9OCOW57qDbf/dGdj4nA7gL4ZabhdrB5Jy', '2019-07-24 10:42:16'),
(22, 'malee21@gmail.com', '$2b$10$zh1j//XkcrZUjZ2mxXWqQefZdeaOBzzXadFXN4/fcd1a4JjVqde8u', '2019-07-24 12:43:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `picture_id` (`picture_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `created_at_idx` (`created_at`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`user_id`,`picture_id`),
  ADD KEY `picture_id` (`picture_id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `created_at_idx` (`created_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_idx` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`id`);

--
-- Constraints for table `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `pictures_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
