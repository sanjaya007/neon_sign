-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2021 at 06:34 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `neon_sign`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation`
--

CREATE TABLE `admin_operation` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `last_ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `color_name` varchar(255) DEFAULT NULL,
  `color_code` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `color_name`, `color_code`, `created_at`, `updated_at`) VALUES
(1, 'Orange', '#e67e22', '2021-09-28 12:40:10', '2021-09-28 12:40:10'),
(2, 'Blue', '#3498db', '2021-09-28 13:05:43', '2021-09-28 13:05:43'),
(3, 'Green', '#23cc71', '2021-09-28 13:07:18', '2021-09-28 13:07:18'),
(4, 'Yellow', '#f1c40f', '2021-09-28 13:07:55', '2021-09-28 13:07:55'),
(5, 'Red', '#e74c3c', '2021-09-28 13:08:36', '2021-09-28 13:08:36'),
(6, 'Purple', '#9b59bc', '2021-09-28 13:09:10', '2021-09-28 13:09:10');

-- --------------------------------------------------------

--
-- Table structure for table `credential`
--

CREATE TABLE `credential` (
  `id` int(11) NOT NULL,
  `oauth` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `verify` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `two_factor_authentication` int(11) DEFAULT NULL,
  `force_password_change` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `credential`
--

INSERT INTO `credential` (`id`, `oauth`, `email`, `password`, `user_id`, `type`, `verify`, `status`, `two_factor_authentication`, `force_password_change`, `created_at`, `updated_at`) VALUES
(1, NULL, 'admin@manaknight.com', '$2a$04$PYAo9o5emntJH2RSQN.vgecs7AmUmWbg7acqVP48qPL2okzol5/OC', 1, 0, 1, 1, 0, NULL, '2021-10-05 08:52:14', '2021-10-05 08:52:14'),
(2, NULL, 'member@manaknight.com', '$2a$04$jwF5kwLgQnkB8EIsa3QzrucCEStJIwqkD/xGO32DfV7n2rIg9PudK', 2, 0, 1, 1, 0, NULL, '2021-10-05 08:52:14', '2021-10-05 08:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `html` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`id`, `slug`, `subject`, `tag`, `html`, `created_at`, `updated_at`) VALUES
(1, 'reset-password', 'Reset your password', 'email,reset_token,link', 'Hi {{{email}}},<br/>You have requested to reset your password. Please click the link below to reset it.<br/><a href=\"{{{link}}}/{{{reset_token}}}\">Link</a>. <br/>Thanks,<br/> Admin', '2021-10-05 08:52:15', '2021-10-05 08:52:15'),
(2, 'register', 'Register', 'email', 'Hi {{{email}}},<br/>Thanks for registering on our platform. <br/>Thanks,<br/> Admin', '2021-10-05 08:52:15', '2021-10-05 08:52:15'),
(3, 'confirm-password', 'Confirm your account', 'email,confirm_token,link', 'Hi {{{email}}},<br/>Please click the link below to confirm your account.<br/><a href=\"{{{link}}}/{{{confirm_token}}}\">Link</a>Thanks,<br/> Admin', '2021-10-05 08:52:15', '2021-10-05 08:52:15'),
(4, 'verify', 'Account verification', 'code', 'Your verification # is {{{code}}}', '2021-10-05 08:52:15', '2021-10-05 08:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `fonts`
--

CREATE TABLE `fonts` (
  `id` int(11) NOT NULL,
  `font_name` text DEFAULT NULL,
  `tool_name` text DEFAULT NULL,
  `font_file` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fonts`
--

INSERT INTO `fonts` (`id`, `font_name`, `tool_name`, `font_file`, `created_at`, `updated_at`) VALUES
(1, 'Gilroylight', 'Simple', '/fonts/1632849565401_GilroyLight.woff', '2021-09-28 13:19:25', '2021-09-28 13:19:25'),
(2, 'Harman Script', 'Classic', '/fonts/1632849623304_font.woff', '2021-09-28 13:20:23', '2021-09-28 13:20:23'),
(3, 'Just Lovely Regular', 'Lovely', '/fonts/1632849705498_JustLovely.woff', '2021-09-28 13:21:46', '2021-09-28 13:21:46'),
(7, 'Campesina', 'Glam', '/fonts/1632850147442_CampesinaRegular.woff', '2021-09-28 13:29:07', '2021-09-28 13:29:07'),
(8, 'HanleyProMonoline', 'Rustic', '/fonts/1632850232360_HanleyProMonoline.woff', '2021-09-28 13:30:32', '2021-09-28 13:30:32');

-- --------------------------------------------------------

--
-- Table structure for table `fonts_pricing`
--

CREATE TABLE `fonts_pricing` (
  `id` int(11) NOT NULL,
  `font_id` varchar(255) DEFAULT NULL,
  `letter` varchar(255) DEFAULT NULL,
  `letter_case` int(11) DEFAULT NULL,
  `total_length_of_tube_cm` int(11) DEFAULT NULL,
  `total_length_of_tube_m` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `profit` int(11) DEFAULT NULL,
  `revenue` int(11) DEFAULT NULL,
  `profit_margin_percent` int(11) DEFAULT NULL,
  `markup_percent` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fonts_pricing`
--

INSERT INTO `fonts_pricing` (`id`, `font_id`, `letter`, `letter_case`, `total_length_of_tube_cm`, `total_length_of_tube_m`, `width`, `height`, `cost`, `profit`, `revenue`, `profit_margin_percent`, `markup_percent`, `created_at`, `updated_at`) VALUES
(1, '1', 'A', 1, 1, 1, 1, 1, 7, 1, 1, 1, 10, '2021-10-05 09:21:03', '2021-10-05 09:23:44');

-- --------------------------------------------------------

--
-- Table structure for table `headings`
--

CREATE TABLE `headings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `headings`
--

INSERT INTO `headings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'main', 'Design your NEON in Minutes', '2021-10-05 08:52:16', '2021-10-05 08:52:16'),
(2, 'write_text', 'WRITE YOUR TEXT', '2021-10-05 08:52:16', '2021-10-05 08:52:16'),
(3, 'fonts', 'CHOOSE YOUR FONTS', '2021-10-05 08:52:16', '2021-10-05 08:52:16'),
(4, 'color', 'COLOUR', '2021-10-05 08:52:16', '2021-10-05 08:52:16'),
(5, 'size', 'SIZE', '2021-10-05 08:52:16', '2021-10-05 08:52:16'),
(6, 'backing_style', 'BACKING STYLE', '2021-10-05 08:52:16', '2021-10-05 08:52:16'),
(7, 'backing_color', 'BACKING COLOUR', '2021-10-05 08:52:16', '2021-10-05 08:52:16'),
(8, 'remote', 'REMOTE', '2021-10-05 08:52:16', '2021-10-05 08:52:16'),
(9, 'extra', 'EXTRA', '2021-10-05 08:52:16', '2021-10-05 08:52:16'),
(10, 'mounting', 'MOUNTING', '2021-10-05 08:52:16', '2021-10-05 08:52:16'),
(11, 'support', 'SUPPORT', '2021-10-05 08:52:16', '2021-10-05 08:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `url` text DEFAULT NULL,
  `caption` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `url`, `caption`, `user_id`, `width`, `height`, `type`, `created_at`, `updated_at`) VALUES
(1, 'https://i.imgur.com/AzJ7DRw.png', '', 1, 581, 581, 1, '2021-10-05 08:52:16', '2021-10-05 08:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `member_operation`
--

CREATE TABLE `member_operation` (
  `id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `last_ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `refer_log`
--

CREATE TABLE `refer_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `referrer_user_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-10-05 08:52:14', '2021-10-05 08:52:14'),
(2, 'member', '2021-10-05 08:52:14', '2021-10-05 08:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `maintenance` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `key`, `type`, `value`, `maintenance`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 0, 'Manaknight Inc', NULL, '2021-10-05 08:52:13', '2021-10-05 08:52:13'),
(2, 'site_logo', 0, 'https://manaknightdigital.com/assets/img/logo.png', NULL, '2021-10-05 08:52:14', '2021-10-05 08:52:14'),
(3, 'maintenance', 1, '0', NULL, '2021-10-05 08:52:14', '2021-10-05 08:52:14'),
(4, 'version', 0, '1.0.0', NULL, '2021-10-05 08:52:14', '2021-10-05 08:52:14'),
(5, 'copyright', 0, 'Copyright © 2019 Manaknightdigital Inc. All rights reserved.', NULL, '2021-10-05 08:52:14', '2021-10-05 08:52:14'),
(6, 'license_key', 4, '4097fbd4f340955de76ca555c201b185cf9d6921d977301b05cdddeae4af54f924f0508cd0f7ca66', NULL, '2021-10-05 08:52:14', '2021-10-05 08:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sms`
--

INSERT INTO `sms` (`id`, `slug`, `tag`, `content`, `created_at`, `updated_at`) VALUES
(1, 'verify', 'code', 'Your verification # is {{{code}}}', '2021-10-05 08:52:15', '2021-10-05 08:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `stock_images`
--

CREATE TABLE `stock_images` (
  `id` int(11) NOT NULL,
  `image` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_images`
--

INSERT INTO `stock_images` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'https://i.imgur.com/7vQqHYs.png', '2021-10-05 19:20:10', '2021-10-05 19:20:10'),
(3, 'https://source.unsplash.com/1600x900/?dark', '2021-10-05 19:20:37', '2021-10-05 19:20:37'),
(4, 'https://source.unsplash.com/1600x900/?gloomy', '2021-10-05 19:20:56', '2021-10-05 19:20:56');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `token` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ttl` int(11) DEFAULT NULL,
  `issue_at` datetime DEFAULT NULL,
  `expire_at` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `refer` varchar(255) DEFAULT NULL,
  `stripe_uid` varchar(255) DEFAULT NULL,
  `paypal_uid` varchar(255) DEFAULT NULL,
  `expire_at` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role_id`, `profile_id`, `organization_id`, `first_name`, `last_name`, `phone`, `image`, `refer`, `stripe_uid`, `paypal_uid`, `expire_at`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 1, NULL, NULL, 'Admin', 'Admin', '12345678', 'https://i.imgur.com/AzJ7DRw.png', 'admin', NULL, NULL, NULL, 1, '2021-10-05 08:52:13', '2021-10-05 08:52:13', NULL),
(2, 2, NULL, NULL, 'Member', 'Member', '12345678', 'https://i.imgur.com/AzJ7DRw.png', 'member', NULL, NULL, NULL, 1, '2021-10-05 08:52:13', '2021-10-05 08:52:13', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation`
--
ALTER TABLE `admin_operation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credential`
--
ALTER TABLE `credential`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fonts`
--
ALTER TABLE `fonts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fonts_pricing`
--
ALTER TABLE `fonts_pricing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `headings`
--
ALTER TABLE `headings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_operation`
--
ALTER TABLE `member_operation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refer_log`
--
ALTER TABLE `refer_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_images`
--
ALTER TABLE `stock_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_operation`
--
ALTER TABLE `admin_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `credential`
--
ALTER TABLE `credential`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fonts`
--
ALTER TABLE `fonts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fonts_pricing`
--
ALTER TABLE `fonts_pricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `headings`
--
ALTER TABLE `headings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `member_operation`
--
ALTER TABLE `member_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refer_log`
--
ALTER TABLE `refer_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_images`
--
ALTER TABLE `stock_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
