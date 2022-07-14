-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 14, 2022 at 11:48 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `natoorservice`
--

-- --------------------------------------------------------

--
-- Table structure for table `aminities`
--

DROP TABLE IF EXISTS `aminities`;
CREATE TABLE IF NOT EXISTS `aminities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aminities`
--

INSERT INTO `aminities` (`id`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Active', '2022-06-07 10:40:34', '2022-06-07 10:40:34'),
(4, 'Active', '2022-06-07 12:50:09', '2022-06-07 12:50:09'),
(5, 'Active', '2022-06-07 12:50:22', '2022-06-07 12:50:22'),
(6, 'Active', '2022-06-07 13:01:12', '2022-06-07 13:01:12'),
(7, 'Active', '2022-06-07 13:01:46', '2022-06-07 13:01:46'),
(8, 'Active', '2022-06-07 13:02:09', '2022-06-07 13:02:09'),
(9, 'Active', '2022-06-07 13:02:27', '2022-06-07 13:02:27'),
(10, 'Active', '2022-06-07 13:02:47', '2022-06-07 13:02:47'),
(11, 'Active', '2022-06-08 04:44:10', '2022-06-08 04:44:10'),
(12, 'Active', '2022-06-08 04:45:10', '2022-06-08 04:45:10'),
(13, 'Active', '2022-06-08 04:46:20', '2022-06-08 04:46:20'),
(14, 'Active', '2022-06-08 04:46:42', '2022-06-08 04:46:42'),
(15, 'Active', '2022-06-08 05:21:24', '2022-06-08 05:21:24'),
(16, 'Active', '2022-06-08 05:25:36', '2022-06-08 05:25:36'),
(17, 'Active', '2022-06-09 04:55:40', '2022-06-09 04:55:40'),
(18, 'Active', '2022-06-09 04:56:12', '2022-06-09 04:56:12'),
(19, 'Active', '2022-06-09 05:06:57', '2022-06-09 05:06:57'),
(20, 'Active', '2022-06-09 05:07:26', '2022-06-09 05:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
CREATE TABLE IF NOT EXISTS `buildings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `latitude` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat_long` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `city_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `latitude`, `longitude`, `lat_long`, `country_id`, `city_id`, `address`, `tenant_id`, `created_at`, `updated_at`) VALUES
(1, '123421', '124321', '123421,124321', 1, 2, 'jkhjkh', 'rooms', '2022-06-08 12:22:33', '2022-06-08 12:27:55'),
(3, '123421', '124321', '123421,124321', 1, 2, NULL, 'rooms', '2022-06-09 05:24:14', '2022-06-09 05:24:14'),
(4, '123421', '124321', '123421,124321', 1, 2, NULL, 'rooms', '2022-06-09 05:24:49', '2022-06-09 05:24:49'),
(5, '123421', '124321', '123421,124321', 1, 2, NULL, NULL, '2022-07-05 08:06:47', '2022-07-05 08:06:47'),
(6, '123421', '124321', '123421,124321', 1, 2, NULL, 'rooms', '2022-07-13 10:55:33', '2022-07-13 10:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `building_supervisors`
--

DROP TABLE IF EXISTS `building_supervisors`;
CREATE TABLE IF NOT EXISTS `building_supervisors` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `building_id` bigint UNSIGNED NOT NULL,
  `tenant_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_id` bigint UNSIGNED NOT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'Active', '2022-06-07 12:43:26', '2022-06-07 12:43:26'),
(3, 1, 'Active', '2022-06-30 07:18:34', '2022-06-30 07:18:34'),
(4, 1, 'Active', '2022-06-30 07:18:56', '2022-06-30 07:18:56'),
(5, 1, 'Active', '2022-06-30 08:36:57', '2022-06-30 08:36:57'),
(6, 1, 'Active', '2022-06-30 08:52:42', '2022-06-30 08:52:42'),
(7, 1, 'Active', '2022-06-30 10:17:40', '2022-06-30 10:17:40');

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
CREATE TABLE IF NOT EXISTS `contracts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `tenent_id` varchar(190) DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Active', '2022-06-07 12:11:32', '2022-06-07 12:11:32'),
(2, 'Active', '2022-06-07 12:12:00', '2022-06-07 12:12:00'),
(3, 'Active', '2022-06-30 06:51:42', '2022-06-30 06:51:42'),
(4, 'Active', '2022-06-30 07:01:45', '2022-06-30 07:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
CREATE TABLE IF NOT EXISTS `domains` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `domains`
--

INSERT INTO `domains` (`id`, `domain`, `tenant_id`, `created_at`, `updated_at`) VALUES
(3, 'room', 'rooms', '2022-06-08 02:27:46', '2022-06-08 02:27:46'),
(4, 'mysite.test', 'mysite', '2022-06-08 02:36:21', '2022-06-08 02:36:21');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `floors`
--

DROP TABLE IF EXISTS `floors`;
CREATE TABLE IF NOT EXISTS `floors` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `floor_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building_id` bigint UNSIGNED NOT NULL,
  `tenant_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive','','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `floors`
--

INSERT INTO `floors` (`id`, `floor_no`, `building_id`, `tenant_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '21B', 1, 'rooms', 'Active', '2022-06-09 06:30:05', '2022-06-09 06:33:24'),
(2, '21C', 1, 'mysite', 'Active', '2022-07-04 11:29:57', '2022-07-04 11:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `issue_requests`
--

DROP TABLE IF EXISTS `issue_requests`;
CREATE TABLE IF NOT EXISTS `issue_requests` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `raised_by` bigint UNSIGNED DEFAULT NULL,
  `building_id` bigint UNSIGNED NOT NULL,
  `floor_id` bigint UNSIGNED NOT NULL,
  `priority` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `tenant_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('requested','Processing','RequestCompleted','Completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issue_requests`
--

INSERT INTO `issue_requests` (`id`, `title`, `raised_by`, `building_id`, `floor_id`, `priority`, `room_id`, `tenant_id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 2, 1, 2, 'low', 2, 'rooms', 'hello i am developer', 'requested', '2022-07-05 08:30:54', '2022-07-05 08:30:54'),
(2, NULL, 2, 1, 2, 'low', 2, 'rooms', 'hello i am developer', 'requested', '2022-07-05 08:40:33', '2022-07-05 08:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `languages_contents`
--

DROP TABLE IF EXISTS `languages_contents`;
CREATE TABLE IF NOT EXISTS `languages_contents` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_id` bigint DEFAULT NULL,
  `item_type` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `short_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `long_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages_contents`
--

INSERT INTO `languages_contents` (`id`, `item_id`, `item_type`, `lang_code`, `content_title`, `content_detail`, `short_content`, `long_content`, `created_at`, `updated_at`) VALUES
(3, 2, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 10:23:16', '2022-06-07 10:23:16'),
(4, 2, 'Aminity', 'ar', 'Demo Aminity Ar', NULL, NULL, NULL, '2022-06-07 10:23:16', '2022-06-07 10:40:14'),
(5, 3, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 10:40:34', '2022-06-07 10:40:34'),
(6, 3, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 10:40:34', '2022-06-09 05:08:31'),
(7, 1, 'Country', 'en', 'Kuwait', NULL, NULL, NULL, '2022-06-07 12:11:32', '2022-06-07 12:11:32'),
(8, 1, 'Country', 'ar', 'الكويت', NULL, NULL, NULL, '2022-06-07 12:11:32', '2022-06-07 12:11:32'),
(9, 2, 'Country', 'en', 'Dubai', NULL, NULL, NULL, '2022-06-07 12:12:00', '2022-06-07 12:12:00'),
(10, 2, 'Country', 'ar', 'دبي', NULL, NULL, NULL, '2022-06-07 12:12:00', '2022-06-07 12:12:00'),
(11, 3, 'Country', 'en', 'Egypt', NULL, NULL, NULL, '2022-06-07 12:12:24', '2022-06-07 12:14:48'),
(12, 3, 'Country', 'ar', 'مصر', NULL, NULL, NULL, '2022-06-07 12:12:24', '2022-06-07 12:14:32'),
(15, 1, 'City', 'en', 'Al Wafrah', NULL, NULL, NULL, '2022-06-07 12:35:09', '2022-06-07 12:37:42'),
(16, 1, 'City', 'ar', 'الوفرة', NULL, NULL, NULL, '2022-06-07 12:35:09', '2022-06-07 12:37:42'),
(17, 2, 'City', 'en', 'Al Wafrah', NULL, NULL, NULL, '2022-06-07 12:43:26', '2022-06-07 12:43:26'),
(18, 2, 'City', 'ar', 'الوفرة', NULL, NULL, NULL, '2022-06-07 12:43:26', '2022-06-07 12:43:26'),
(19, 4, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 12:50:09', '2022-06-07 12:50:09'),
(20, 4, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 12:50:09', '2022-06-07 12:50:09'),
(21, 5, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 12:50:22', '2022-06-07 12:50:22'),
(22, 5, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 12:50:22', '2022-06-07 12:50:22'),
(23, 6, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 13:01:12', '2022-06-07 13:01:12'),
(24, 6, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 13:01:12', '2022-06-07 13:01:12'),
(25, 7, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 13:01:46', '2022-06-07 13:01:46'),
(26, 7, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 13:01:46', '2022-06-07 13:01:46'),
(27, 8, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 13:02:09', '2022-06-07 13:02:09'),
(28, 8, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 13:02:09', '2022-06-07 13:02:09'),
(29, 9, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 13:02:27', '2022-06-07 13:02:27'),
(30, 9, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 13:02:27', '2022-06-07 13:02:27'),
(31, 10, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 13:02:47', '2022-06-07 13:02:47'),
(32, 10, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-07 13:02:47', '2022-06-07 13:02:47'),
(33, 11, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-08 04:44:10', '2022-06-08 04:44:10'),
(34, 11, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-08 04:44:10', '2022-06-08 04:44:10'),
(35, 12, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-08 04:45:10', '2022-06-08 04:45:10'),
(36, 12, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-08 04:45:10', '2022-06-08 04:45:10'),
(37, 13, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-08 04:46:20', '2022-06-08 04:46:20'),
(38, 13, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-08 04:46:20', '2022-06-08 04:46:20'),
(39, 14, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-08 04:46:42', '2022-06-08 04:46:42'),
(40, 14, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-08 04:46:42', '2022-06-08 04:46:42'),
(41, 15, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-08 05:21:24', '2022-06-08 05:21:24'),
(42, 15, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-08 05:21:24', '2022-06-08 05:21:24'),
(43, 16, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-08 05:25:36', '2022-06-08 05:25:36'),
(44, 16, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-08 05:25:36', '2022-06-08 05:25:36'),
(53, 1, 'Package', 'ar', 'الوفرة', NULL, NULL, NULL, '2022-06-08 10:16:55', '2022-06-08 10:27:53'),
(54, 1, 'Package', 'en', 'Al Wafrah', NULL, NULL, NULL, '2022-06-08 10:16:55', '2022-06-08 10:27:53'),
(55, 2, 'Package', 'en', 'الوفرة', NULL, NULL, NULL, '2022-06-08 10:30:59', '2022-06-08 10:30:59'),
(56, 2, 'Package', 'ar', 'Al Wafrah', NULL, NULL, NULL, '2022-06-08 10:30:59', '2022-06-08 10:30:59'),
(57, 1, 'Building', 'en', 'My Building', NULL, NULL, NULL, '2022-06-08 12:22:33', '2022-06-09 05:46:52'),
(58, 1, 'Building', 'ar', 'بنايتي', NULL, NULL, NULL, '2022-06-08 12:22:33', '2022-06-08 12:22:33'),
(59, 2, 'Building', 'en', 'My Building', NULL, NULL, NULL, '2022-06-08 12:47:57', '2022-06-08 12:47:57'),
(60, 2, 'Building', 'ar', 'بنايتي', NULL, NULL, NULL, '2022-06-08 12:47:57', '2022-06-08 12:47:57'),
(61, 17, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-09 04:55:40', '2022-06-09 04:55:40'),
(62, 17, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-09 04:55:40', '2022-06-09 04:55:40'),
(63, 18, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-09 04:56:12', '2022-06-09 04:56:12'),
(64, 18, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-09 04:56:12', '2022-06-09 04:56:12'),
(65, 19, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-09 05:06:57', '2022-06-09 05:06:57'),
(66, 19, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-09 05:06:57', '2022-06-09 05:06:57'),
(67, 20, 'Aminity', 'en', 'Demo Aminity', NULL, NULL, NULL, '2022-06-09 05:07:26', '2022-06-09 05:07:26'),
(68, 20, 'Aminity', 'ar', 'Demo Aminity', NULL, NULL, NULL, '2022-06-09 05:07:26', '2022-06-09 05:07:26'),
(69, 3, 'Building', 'en', 'My Building', NULL, NULL, NULL, '2022-06-09 05:24:14', '2022-06-09 05:24:14'),
(70, 3, 'Building', 'ar', 'بنايتي', NULL, NULL, NULL, '2022-06-09 05:24:14', '2022-06-09 05:24:14'),
(71, 4, 'Building', 'en', 'My Building', NULL, NULL, NULL, '2022-06-09 05:24:49', '2022-06-09 05:24:49'),
(72, 4, 'Building', 'ar', 'بنايتي', NULL, NULL, NULL, '2022-06-09 05:24:49', '2022-06-09 05:24:49'),
(73, 1, 'Service', 'en', 'Demo Service 0', NULL, NULL, NULL, '2022-06-09 08:46:35', '2022-06-09 08:49:06'),
(74, 1, 'Service', 'ar', 'Demo Service 1', NULL, NULL, NULL, '2022-06-09 08:46:35', '2022-06-09 08:46:35'),
(75, 2, 'Service', 'en', 'Demo Service', NULL, NULL, NULL, '2022-06-09 11:34:01', '2022-06-09 11:34:01'),
(76, 2, 'Service', 'ar', 'Demo Service 1', NULL, NULL, NULL, '2022-06-09 11:34:01', '2022-06-09 11:34:01'),
(77, 3, 'Service', 'en', 'Demo Service', NULL, NULL, NULL, '2022-06-09 11:34:13', '2022-06-09 11:34:13'),
(78, 3, 'Service', 'ar', 'Demo Service 1', NULL, NULL, NULL, '2022-06-09 11:34:13', '2022-06-09 11:34:13'),
(79, 3, 'Country', 'en', NULL, NULL, NULL, NULL, '2022-06-30 06:51:42', '2022-06-30 06:51:42'),
(80, 3, 'Country', 'ar', NULL, NULL, NULL, NULL, '2022-06-30 06:51:42', '2022-06-30 06:51:42'),
(81, 4, 'Country', 'en', NULL, NULL, NULL, NULL, '2022-06-30 07:01:45', '2022-06-30 07:01:45'),
(82, 4, 'Country', 'ar', 'ar', NULL, NULL, NULL, '2022-06-30 07:01:45', '2022-06-30 07:01:45'),
(83, 3, 'City', 'en', 'Al Wafrah', NULL, NULL, NULL, '2022-06-30 07:18:34', '2022-06-30 07:18:34'),
(84, 3, 'City', 'ar', 'الوفرة', NULL, NULL, NULL, '2022-06-30 07:18:34', '2022-06-30 07:18:34'),
(85, 4, 'City', 'en', 'Al Wafrah', NULL, NULL, NULL, '2022-06-30 07:18:56', '2022-06-30 07:18:56'),
(86, 4, 'City', 'ar', 'الوفرة', NULL, NULL, NULL, '2022-06-30 07:18:56', '2022-06-30 07:18:56'),
(87, 5, 'City', 'en', 'Al Wafrah', NULL, NULL, NULL, '2022-06-30 08:36:58', '2022-06-30 08:36:58'),
(88, 5, 'City', 'ar', 'الوفرة', NULL, NULL, NULL, '2022-06-30 08:36:58', '2022-06-30 08:36:58'),
(89, 6, 'City', 'en', 'Al Wafrah', NULL, NULL, NULL, '2022-06-30 08:52:42', '2022-06-30 08:52:42'),
(90, 6, 'City', 'ar', 'الوفرة', NULL, NULL, NULL, '2022-06-30 08:52:42', '2022-06-30 08:52:42'),
(91, 7, 'City', 'en', 'Al Wafrah', NULL, NULL, NULL, '2022-06-30 10:17:40', '2022-06-30 10:17:40'),
(92, 7, 'City', 'ar', 'الوفرة', NULL, NULL, NULL, '2022-06-30 10:17:40', '2022-06-30 10:17:40'),
(93, 5, 'Building', 'en', 'My Building', NULL, NULL, NULL, '2022-07-05 08:06:47', '2022-07-05 08:06:47'),
(94, 5, 'Building', 'ar', 'بنايتي', NULL, NULL, NULL, '2022-07-05 08:06:47', '2022-07-05 08:06:47'),
(95, 6, 'Building', 'en', 'My Building', NULL, NULL, NULL, '2022-07-13 10:55:33', '2022-07-13 10:55:33'),
(96, 6, 'Building', 'ar', 'بنايتي', NULL, NULL, NULL, '2022-07-13 10:55:33', '2022-07-13 10:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
CREATE TABLE IF NOT EXISTS `media_files` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_id` bigint DEFAULT NULL,
  `item_type` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_alias` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_ext` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_mime` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_caption` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `item_id`, `item_type`, `file_path`, `file_alias`, `file_name`, `file_ext`, `file_type`, `file_mime`, `file_size`, `file_caption`, `file_detail`, `created_at`, `updated_at`) VALUES
(2, 11, 'User', 'https://marque.naufilsakran.com/marqee/img/logo/logo-color.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-07 08:44:16', '2022-06-07 08:44:16'),
(3, 12, 'User', 'https://marque.naufilsakran.com/marqee/img/logo/logo-color.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-07 08:44:31', '2022-06-07 08:44:31'),
(4, 3, 'Building', 'http://room.mysite.test/uploads/images/16547494790.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-09 05:24:14', '2022-06-09 05:24:14'),
(5, 4, 'Building', 'http://room.mysite.test/uploads/images/16547494790.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-09 05:24:49', '2022-06-09 05:24:49'),
(6, 4, 'Building', 'http://room.mysite.test/uploads/images/16547494791.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-09 05:24:49', '2022-06-09 05:24:49'),
(10, 3, 'User', 'http://room.mysite.test/uploads/1654693491.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-10 07:07:14', '2022-06-10 07:07:14'),
(11, 5, 'User', 'https://marque.naufilsakran.com/marqee/img/logo/logo-color.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-27 05:50:10', '2022-06-27 05:50:10'),
(12, 6, 'User', 'https://marque.naufilsakran.com/marqee/img/logo/logo-color.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-30 06:50:42', '2022-06-30 06:50:42'),
(13, 5, 'Building', 'http://room.mysite.test/uploads/images/16547494790.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-05 08:06:47', '2022-07-05 08:06:47'),
(14, 5, 'Building', 'http://room.mysite.test/uploads/images/16547494791.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-05 08:06:47', '2022-07-05 08:06:47'),
(15, 7, 'User', 'https://marque.naufilsakran.com/marqee/img/logo/logo-color.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-07 06:38:59', '2022-07-07 06:38:59'),
(16, 8, 'User', 'https://marque.naufilsakran.com/marqee/img/logo/logo-color.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-07 11:26:26', '2022-07-07 11:26:26'),
(17, 6, 'Building', 'http://room.mysite.test/uploads/images/16547494790.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-13 10:55:33', '2022-07-13 10:55:33'),
(18, 6, 'Building', 'http://room.mysite.test/uploads/images/16547494791.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-13 10:55:33', '2022-07-13 10:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_06_101444_create_packages_table', 1),
(6, '2022_06_06_101510_create_buildings_table', 1),
(7, '2022_06_06_101534_create_floors_table', 1),
(8, '2022_06_06_101555_create_rooms_table', 1),
(9, '2022_06_06_101614_create_services_table', 1),
(10, '2022_06_06_101704_create_service_providers_table', 1),
(11, '2022_06_06_102125_create_settings_table', 1),
(12, '2022_06_06_110058_create_media_files_table', 1),
(13, '2022_06_06_110121_create_languages_contents_table', 1),
(14, '2022_06_06_110211_create_user_log_table', 1),
(15, '2022_06_06_110504_create_aminities_table', 1),
(16, '2022_06_06_112551_create_building_supervisors_table', 1),
(17, '2022_06_06_113215_create_user_rooms_table', 1),
(18, '2022_06_06_114942_create_issue_requests_table', 1),
(19, '2022_06_06_121831_create_countries_table', 1),
(20, '2022_06_06_121848_create_cities_table', 1),
(21, '2019_09_15_000010_create_tenants_table', 2),
(22, '2019_09_15_000020_create_domains_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
CREATE TABLE IF NOT EXISTS `packages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `no_of_users` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'In Months',
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `no_of_users`, `price`, `discount`, `duration`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 50, 1200, 10, '24', 'Active', 'andasjkndasjkdnasjkdnasjkdnasjk', '2022-06-08 10:16:55', '2022-06-08 10:16:55');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('SuperAdmin@natoorservices.com', '$2y$10$0nMWpM/0ekOIRPm4DOfh4OZ8VmzECgTZeoH38aH9taG5.QOPNUNjW', '2022-06-07 02:13:27'),
('Usama786.sa@gmail.com', '$2y$10$4/vWYbpcEUhw5uEGNuswaeCaEHTkwInIJrIedrnN8.VeUbVYKwKfO', '2022-06-07 02:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reason` varchar(190) DEFAULT NULL,
  `payment_type` enum('Cash','Cheque') NOT NULL DEFAULT 'Cash',
  `amount` double NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `status` enum('Paid','Unpaid','Check Return','') NOT NULL DEFAULT 'Unpaid',
  `tenant_id` varchar(190) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
CREATE TABLE IF NOT EXISTS `problems` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `floor_id` bigint UNSIGNED NOT NULL,
  `priority` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `record_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_comments`
--

DROP TABLE IF EXISTS `request_comments`;
CREATE TABLE IF NOT EXISTS `request_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `request_id` bigint UNSIGNED NOT NULL,
  `tenent_id` varchar(190) NOT NULL,
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `building_id` bigint UNSIGNED NOT NULL,
  `floor_id` bigint UNSIGNED NOT NULL,
  `tenant_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_no` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Residential','Commercial','Other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Residential',
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `building_id`, `floor_id`, `tenant_id`, `room_no`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'rooms', '13B', 'Residential', 'Active', '2022-06-09 07:25:57', '2022-06-09 07:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `tenant_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `status`, `tenant_id`, `created_at`, `updated_at`) VALUES
(2, 'Active', 'rooms', '2022-06-09 11:34:01', '2022-06-09 11:34:01'),
(3, 'Active', 'rooms', '2022-06-09 11:34:13', '2022-06-09 11:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `services_services_providers`
--

DROP TABLE IF EXISTS `services_services_providers`;
CREATE TABLE IF NOT EXISTS `services_services_providers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_providers_id` bigint UNSIGNED NOT NULL,
  `services_id` bigint UNSIGNED NOT NULL,
  `tenant_id` varchar(190) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `services_services_providers`
--

INSERT INTO `services_services_providers` (`id`, `service_providers_id`, `services_id`, `tenant_id`, `created_at`, `updated_at`) VALUES
(3, 4, 1, 'rooms', '2022-06-10 07:39:20', '2022-06-10 07:39:20'),
(4, 4, 2, 'rooms', '2022-06-10 07:39:20', '2022-06-10 07:39:20'),
(5, 5, 1, 'rooms', '2022-06-10 07:39:59', '2022-06-10 07:39:59'),
(6, 5, 2, 'rooms', '2022-06-10 07:39:59', '2022-06-10 07:39:59'),
(7, 6, 1, 'rooms', '2022-06-10 07:42:25', '2022-06-10 07:42:25'),
(8, 6, 2, 'rooms', '2022-06-10 07:42:25', '2022-06-10 07:42:25'),
(9, 7, 1, 'rooms', '2022-06-10 07:42:44', '2022-06-10 07:42:44'),
(10, 7, 2, 'rooms', '2022-06-10 07:42:44', '2022-06-10 07:42:44'),
(11, 8, 1, 'rooms', '2022-06-10 07:43:08', '2022-06-10 07:43:08'),
(12, 8, 2, 'rooms', '2022-06-10 07:43:08', '2022-06-10 07:43:08'),
(13, 9, 1, 'rooms', '2022-06-10 07:44:06', '2022-06-10 07:44:06'),
(14, 9, 2, 'rooms', '2022-06-10 07:44:06', '2022-06-10 07:44:06'),
(15, 10, 1, 'rooms', '2022-06-10 07:44:39', '2022-06-10 07:44:39'),
(16, 10, 2, 'rooms', '2022-06-10 07:44:39', '2022-06-10 07:44:39'),
(17, 11, 1, 'rooms', '2022-06-10 07:44:57', '2022-06-10 07:44:57'),
(18, 11, 2, 'rooms', '2022-06-10 07:44:57', '2022-06-10 07:44:57'),
(19, 12, 1, 'rooms', '2022-06-10 07:45:03', '2022-06-10 07:45:03'),
(20, 12, 2, 'rooms', '2022-06-10 07:45:03', '2022-06-10 07:45:03'),
(21, 13, 1, 'rooms', '2022-06-10 07:45:13', '2022-06-10 07:45:13'),
(22, 13, 2, 'rooms', '2022-06-10 07:45:13', '2022-06-10 07:45:13'),
(23, 14, 1, 'rooms', '2022-06-10 07:46:37', '2022-06-10 07:46:37'),
(24, 14, 2, 'rooms', '2022-06-10 07:46:37', '2022-06-10 07:46:37'),
(25, 1, 1, 'rooms', '2022-06-10 08:00:05', '2022-06-10 08:00:05'),
(26, 1, 2, 'rooms', '2022-06-10 08:00:05', '2022-06-10 08:00:05'),
(27, 1, 1, 'rooms', '2022-06-10 08:00:09', '2022-06-10 08:00:09'),
(28, 1, 2, 'rooms', '2022-06-10 08:00:09', '2022-06-10 08:00:09'),
(29, 1, 1, 'rooms', '2022-06-10 08:00:27', '2022-06-10 08:00:27'),
(30, 1, 2, 'rooms', '2022-06-10 08:00:27', '2022-06-10 08:00:27'),
(31, 1, 1, 'rooms', '2022-06-10 08:01:21', '2022-06-10 08:01:21'),
(32, 1, 2, 'rooms', '2022-06-10 08:01:21', '2022-06-10 08:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `service_providers`
--

DROP TABLE IF EXISTS `service_providers`;
CREATE TABLE IF NOT EXISTS `service_providers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive','','') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `tenant_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_providers`
--

INSERT INTO `service_providers` (`id`, `name`, `phone_no`, `address`, `status`, `tenant_id`, `created_at`, `updated_at`) VALUES
(2, 'Demo Company', '03176310603', 'Demo address akjklajs', 'Active', 'rooms', '2022-06-09 06:08:32', '2022-06-09 06:08:32'),
(3, 'Demo Company', '03176310603', 'Demo address akjklajs', 'Active', 'rooms', '2022-06-09 06:08:57', '2022-06-09 06:08:57'),
(4, 'Demo Company', '03176310603', 'Demo address akjklajs', 'Active', 'rooms', '2022-06-10 02:39:20', '2022-06-10 02:39:20'),
(5, 'Demo Company', '03176310603', 'Demo address akjklajs', 'Active', 'rooms', '2022-06-10 02:39:59', '2022-06-10 02:39:59'),
(6, 'Demo Company', '03176310603', 'Demo address akjklajs', 'Active', 'rooms', '2022-06-10 02:42:25', '2022-06-10 02:42:25'),
(7, 'Demo Company', '03176310603', 'Demo address akjklajs', 'Active', 'rooms', '2022-06-10 02:42:44', '2022-06-10 02:42:44'),
(8, 'Demo Company', '03176310603', 'Demo address akjklajs', 'Active', 'rooms', '2022-06-10 02:43:08', '2022-06-10 02:43:08'),
(9, 'Demo Company', '03176310603', 'Demo address akjklajs', 'Active', 'rooms', '2022-06-10 02:44:06', '2022-06-10 02:44:06'),
(10, 'Demo Company', '03176310603', 'Demo address akjklajs', 'Active', 'rooms', '2022-06-10 02:44:39', '2022-06-10 02:44:39'),
(11, 'Demo Company', '03176310603', 'Demo address akjklajs', 'Active', 'rooms', '2022-06-10 02:44:57', '2022-06-10 02:44:57'),
(12, 'Demo Company', '03176310603', 'Demo address akjklajs', 'Active', 'rooms', '2022-06-10 02:45:03', '2022-06-10 02:45:03'),
(13, 'Demo Company', '03176310603', 'Demo address akjklajs', 'Active', 'rooms', '2022-06-10 02:45:13', '2022-06-10 02:45:13'),
(14, 'Demo Company', '03176310603', 'Demo address akjklajs', 'Active', 'rooms', '2022-06-10 02:46:37', '2022-06-10 02:46:37');

-- --------------------------------------------------------

--
-- Table structure for table `service_providers_contacts`
--

DROP TABLE IF EXISTS `service_providers_contacts`;
CREATE TABLE IF NOT EXISTS `service_providers_contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(190) DEFAULT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `comment` text,
  `service_providers_id` bigint UNSIGNED NOT NULL,
  `tenant_id` varchar(190) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `service_providers_contacts`
--

INSERT INTO `service_providers_contacts` (`id`, `full_name`, `contact_no`, `comment`, `service_providers_id`, `tenant_id`, `created_at`, `updated_at`) VALUES
(1, 'Usama Javed', '03000000000', 'Electrical', 0, 'rooms', '2022-06-10 07:39:59', '2022-06-10 07:39:59'),
(2, 'Usama Javed', '03000000000', 'Electrical', 0, 'rooms', '2022-06-10 07:45:03', '2022-06-10 07:45:03'),
(3, 'Usama Javed', '03000000000', 'Electrical', 0, 'rooms', '2022-06-10 07:45:13', '2022-06-10 07:45:13'),
(4, 'Usama Javed', '03000000000', 'Electrical', 0, 'rooms', '2022-06-10 07:45:13', '2022-06-10 07:45:13'),
(5, 'Usama Javed', '03000000000', 'Electrical', 0, 'rooms', '2022-06-10 07:46:37', '2022-06-10 07:46:37'),
(6, 'Usama Javed', '03000000000', 'Electrical', 0, 'rooms', '2022-06-10 07:46:37', '2022-06-10 07:46:37'),
(7, 'Usama Javed', '03000000000', 'Electrical', 1, 'rooms', '2022-06-10 08:00:05', '2022-06-10 08:00:05'),
(8, 'Usama Javed', '03000000000', 'Electrical', 1, 'rooms', '2022-06-10 08:00:05', '2022-06-10 08:00:05'),
(9, 'Usama Javed', '0311000000000', 'Electrical', 1, 'rooms', '2022-06-10 08:00:09', '2022-06-10 08:00:09'),
(10, 'Usama Javed', '0321000000000', 'Electrical', 1, 'rooms', '2022-06-10 08:00:09', '2022-06-10 08:01:21'),
(11, 'Usama Javed', '03000000000', 'Electrical', 1, 'rooms', '2022-06-10 08:00:27', '2022-06-10 08:01:21'),
(12, 'Usama Javed', '03000000000', 'Electrical', 1, 'rooms', '2022-06-10 08:00:27', '2022-06-10 08:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
CREATE TABLE IF NOT EXISTS `tenants` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `created_at`, `updated_at`, `data`) VALUES
('mysite', '2022-06-08 02:36:15', '2022-06-08 02:36:15', '{\"tenancy_db_name\":\"tenantmysite\"}'),
('rooms', '2022-06-08 02:27:43', '2022-06-08 02:27:43', '{\"tenancy_db_name\":\"tenantrooms\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int DEFAULT NULL COMMENT '0 => SuperAdmin, 1 => Admin, 2 => Customers',
  `fcm_token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gender` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile_number` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dns` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenant_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_identifier` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `city_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `address` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `type`, `fcm_token`, `gender`, `dob`, `mobile_number`, `email_verified_at`, `password`, `dns`, `remember_token`, `status`, `company_name`, `tenant_id`, `company_identifier`, `country_id`, `city_id`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Super', 'Admin', 'Super Admin', 'SuperAdmin@natoorservices.com', 0, NULL, 'Male', NULL, '+923000000000', NULL, '$2y$10$dBX4ZZudhAjWIQ8EKn/L8.6eNJu8cstzBu5v1HMuIgQzGTeTtqln.', '', NULL, 'Active', NULL, 'mysite', NULL, 0, 0, NULL, NULL, NULL),
(7, 'Kashif', 'Khan', 'kashkhan', 'khanji091190@gmail.com', 1, '', '', '2000-05-28', '', NULL, '$2y$10$MXLzWj16I5Vj0fyTD0KVm.A.QHcgRpdImuSKq88xNo58iRVow6cz6', 'test1.localhost:8000', NULL, 'Active', NULL, 'rooms', 'W4tZMa', 1, 1, 'asdlkjaskldas', '2022-07-07 06:38:59', '2022-07-07 06:38:59'),
(8, 'Kashif', 'Khan', 'kashkhan', 'khanji091190@gmail.com', 1, '', '', '2000-05-28', '', NULL, '$2y$10$LZ0KYxUvXsqEFvr4sITRpeVoAbHSK5KVLqwP.iL4IhbS5pJOELhES', 'test1.localhost:8000', NULL, 'Active', NULL, NULL, 'wXebP1', 1, 1, 'asdlkjaskldas', '2022-07-07 11:26:26', '2022-07-07 11:26:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
CREATE TABLE IF NOT EXISTS `user_log` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tenant_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_rooms`
--

DROP TABLE IF EXISTS `user_rooms`;
CREATE TABLE IF NOT EXISTS `user_rooms` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `building_id` bigint UNSIGNED NOT NULL,
  `floor_id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `dns` bigint UNSIGNED NOT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
