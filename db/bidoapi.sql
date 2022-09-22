-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 22, 2022 at 08:41 AM
-- Server version: 10.3.36-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zenjuwqu_bidoapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active , 0 = inactive',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `email`, `phone`, `avatar`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Shakhawat', 'admin@admin.com', '09394293423', 'profile_1623653511.jpeg', NULL, '$2y$10$bAwh75icMHBMlOCZGhPPt.wk2OdZcuapR.DCnCafMJDdZdXCqZ62K', 1, NULL, NULL, '2021-06-14 06:51:51'),
(2, 1, 'Arifzaman', 'arifuzzaman.rb@gmail.com', NULL, 'profile_1623653646.jpeg', NULL, '$2y$10$6iECVvL2lNH2.6Z5E5Eg5uSmzy7gkKvHMwllBN2aeRYZFNToIScp2', 1, NULL, '2021-06-14 06:52:18', '2021-11-22 04:38:29'),
(3, 1, 'zaman', 'zaman.rb@gmail.com', NULL, 'profile_1623653637.jpeg', NULL, '$2y$10$qbLvYcqLiOetlAE37UiVl.iCYRTM0sYYcg9o3t4UNApGs2rP6gPd2', 1, NULL, '2021-06-14 06:53:57', '2021-06-14 06:53:57');

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `album_images`
--

CREATE TABLE `album_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `area_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_english_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = inactive 1 = active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `area_name`, `area_english_name`, `status`, `created_at`, `updated_at`) VALUES
(3, 'ঢাকা', 'Dhaka', 1, '2020-12-15 00:38:25', '2020-12-15 04:20:32'),
(4, 'চট্টগ্রাম', 'Chittogong', 1, '2020-12-15 00:39:04', '2020-12-15 00:39:04'),
(5, 'কুমিল্লা', 'Cumilla', 1, '2020-12-15 00:41:36', '2020-12-15 00:41:36'),
(6, 'বরিশাল', 'Barisal', 1, '2020-12-15 00:41:54', '2020-12-15 00:41:54'),
(7, 'রংপুর', 'Rongpur', 1, '2020-12-15 00:42:35', '2020-12-15 00:42:35'),
(8, 'গাজীপুর', 'Gazipur', 1, '2020-12-15 00:42:51', '2020-12-15 00:42:51'),
(9, 'খুলনা', 'khulna', 1, '2020-12-15 03:16:34', '2020-12-15 03:16:34'),
(10, 'নোয়াখালী', 'Noakhali', 1, '2020-12-15 03:17:05', '2020-12-15 03:17:05'),
(11, 'ফেনী', 'Feni', 1, '2020-12-15 03:17:20', '2020-12-15 03:17:20'),
(12, 'সিলেট', 'Sylet', 1, '2020-12-15 03:25:11', '2020-12-15 03:25:11'),
(13, 'ময়মনসিং', 'Moymenshing', 1, '2020-12-15 03:25:56', '2020-12-15 03:25:56'),
(14, 'অখাউড়া', 'Akhauda', 1, '2021-03-09 07:59:39', '2021-03-09 07:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `demand_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'bidder id',
  `demander_id` bigint(20) UNSIGNED NOT NULL COMMENT 'id for demander',
  `proposal_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'description of proposel',
  `work_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'if proposal having any link',
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'if prosposal have any file',
  `bid_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_due_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'bid delivery date',
  `bid_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'bid date',
  `confirmed_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `done_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_amount_type` tinyint(4) DEFAULT 1 COMMENT '0 = negatiable , 1 = having budget',
  `offer_amount` double DEFAULT 0 COMMENT '0 = negatiable , 1 = having budget',
  `confirmed_amount` double DEFAULT 0 COMMENT '0 = negatiable , 1 = having budget',
  `is_shortlisted` tinyint(4) DEFAULT 0 COMMENT '0 = not shortlisted , 1 = short_listed',
  `is_confirmed` tinyint(4) DEFAULT 0 COMMENT '0 = not confirmed , 1 = confirmed',
  `is_done_from_seller` tinyint(4) DEFAULT 0 COMMENT '0 = not done , 1 = done',
  `is_done_from_buyer` tinyint(4) DEFAULT 0 COMMENT '0 = not done , 1 = done',
  `is_done` tinyint(4) DEFAULT 0 COMMENT '0 = not done , 1 = done',
  `is_seller_reviewed` tinyint(4) DEFAULT 0 COMMENT '0 = not  , 1 = done',
  `is_buyer_reviewed` tinyint(4) DEFAULT 0 COMMENT '0 = not , 1 = done',
  `status` tinyint(4) DEFAULT 0 COMMENT '0 = not active , 1 = active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `demand_id`, `user_id`, `demander_id`, `proposal_description`, `work_link`, `file`, `bid_image`, `work_due_date`, `bid_date`, `confirmed_date`, `done_date`, `offer_amount_type`, `offer_amount`, `confirmed_amount`, `is_shortlisted`, `is_confirmed`, `is_done_from_seller`, `is_done_from_buyer`, `is_done`, `is_seller_reviewed`, `is_buyer_reviewed`, `status`, `created_at`, `updated_at`) VALUES
(2, 57, 1013, 1013, 'Ami siraj ganj theek 820 kore dite parbo apni agrohi hole jogajog korun', NULL, '', NULL, '2021-01-27', '2021-01-19', NULL, NULL, NULL, 877, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-19 07:13:40', '2021-01-19 07:13:40'),
(3, 42, 1013, 1013, 'ami dite parbo chayna theke niye eshe', NULL, '', NULL, '2021-01-27', '2021-01-19', NULL, '2021-02-01 14:41:34', NULL, 655, 0, 1, 1, 0, 1, 1, 0, 1, NULL, '2021-01-19 08:03:19', '2021-02-01 08:41:34'),
(4, 53, 1006, 1006, 'To dynamically import a component, also known as lazy loading a component, all you need to do is add the To dynamically import a component, also known as lazy loading a component, all you need to do is add the.', NULL, '', NULL, '2021-01-06', '2021-01-19', NULL, NULL, NULL, 34221, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2021-01-19 10:14:37', '2021-02-10 07:15:51'),
(6, 49, 1006, 1006, 'fream tream sob paba, taka besi lagbe. Using the lazy prefix you can also dynamically import a component when an event is triggered.', NULL, '', NULL, '2021-01-27', '2021-01-19', NULL, NULL, NULL, 570, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-19 10:16:20', '2021-02-10 10:06:00'),
(7, 51, 1006, 1006, 'Hey Lorem ispum dolor suit imor', NULL, '', NULL, '2021-01-28', '2021-01-19', NULL, '2021-02-02 16:26:47', NULL, 23, 0, 1, 0, 1, 1, 1, 1, 1, NULL, '2021-01-19 10:26:48', '2021-02-10 05:56:36'),
(8, 58, 1006, 1006, 'Ai malda ami kinte chai', NULL, '', NULL, '2021-01-28', '2021-01-19', '2021-01-31 12:54:16', '2021-02-01 17:15:57', NULL, 55, 0, 1, 0, 1, 1, 1, 1, 1, NULL, '2021-01-19 10:27:21', '2021-02-10 05:33:56'),
(10, 3, 1006, 1006, 'amar ai model er excavetor ache so amar theke nite paren', NULL, '', NULL, '2021-01-27', '2021-01-19', NULL, '2021-02-01 17:39:15', NULL, 87, 0, 1, 0, 1, 1, 1, 1, 1, NULL, '2021-01-19 10:28:39', '2021-02-10 05:36:41'),
(11, 55, 1002, 1002, '10000 piece will given at cost of 0.7', NULL, '', NULL, '2021-01-27', '2021-01-19', '2021-02-07 17:48:42', NULL, NULL, 30000, 0, 0, 1, 0, 0, 0, 0, 0, NULL, '2021-01-19 10:34:44', '2022-03-16 10:00:52'),
(12, 53, 1002, 1002, 'Hello lorem ispum dolor', NULL, '', NULL, '2021-01-28', '2021-01-19', NULL, NULL, NULL, 564, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-19 10:35:43', '2021-01-25 05:00:30'),
(13, 43, 1002, 1002, 'Hello How are you doing', NULL, '', NULL, '2021-01-27', '2021-01-19', NULL, '2021-02-01 14:40:08', NULL, 900, 0, 0, 1, 1, 1, 1, 1, 1, NULL, '2021-01-19 10:44:19', '2021-02-02 12:34:02'),
(14, 60, 1002, 1002, 'Hello lorem ispum dolor', NULL, '', NULL, '2021-01-27', '2021-01-19', NULL, NULL, NULL, 544444, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-19 10:44:41', '2021-01-19 10:44:41'),
(15, 42, 1002, 1002, 'ami dite parbo ai juta jora', NULL, '', NULL, '2021-01-28', '2021-01-20', NULL, NULL, NULL, 900, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2021-01-20 05:55:59', '2021-01-31 11:18:56'),
(16, 33, 1002, 1002, 'Hey this is my bid', NULL, '', NULL, '2021-01-28', '2021-01-20', NULL, NULL, NULL, 565, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-20 09:57:19', '2021-01-20 09:57:19'),
(17, 64, 1002, 1002, 'Hello', NULL, '', NULL, '2021-01-28', '2021-01-20', NULL, NULL, NULL, 66, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2021-01-20 09:59:34', '2021-01-31 11:37:15'),
(18, 65, 1002, 1002, 'I can delivered this shit per piece price will be 56', NULL, '', NULL, '2021-01-29', '2021-01-20', NULL, NULL, NULL, 54, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-20 10:02:15', '2021-01-20 10:02:15'),
(19, 46, 1002, 1002, 'আমি জাপান থেকে এনে দিতে পারবো ১৫ দিনের মধ্যে', NULL, '', NULL, '2021-01-30', '2021-01-20', '2021-01-31 18:47:39', '2021-01-31 18:48:10', NULL, 9000000, 0, 0, 1, 1, 1, 1, 1, 1, NULL, '2021-01-20 10:28:42', '2021-02-03 06:34:48'),
(20, 62, 1002, 1002, 'Hello lorem ispum', NULL, '', NULL, '2021-01-30', '2021-01-20', NULL, NULL, NULL, 877, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-20 10:31:29', '2021-01-20 10:31:29'),
(21, 27, 1014, 1014, 'vai ami dite parbo, reasonable price er modde amr garite jaite pariben. amr BUS onek VIP', NULL, '', NULL, '2021-01-20', '2021-01-20', NULL, NULL, NULL, 50000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-20 10:33:47', '2021-01-20 10:33:47'),
(22, 53, 1015, 1009, 'আমি এনা বাসের সাথে যুক্ত আছি ৭০ বছর দরে আমি প্রতি বাস ৩০০০ টাকায় দিতে পারবো সাথে পরটা ফ্রী', NULL, '', NULL, '2021-01-30', '2021-01-21', NULL, '2021-01-28 18:36:53', NULL, 7000, 0, 1, 1, 1, 1, 1, 1, 1, NULL, '2021-01-21 04:45:03', '2021-12-05 10:03:55'),
(23, 63, 1002, 1014, 'great', NULL, '', NULL, '2021-01-21', '2021-01-21', NULL, NULL, NULL, 500, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-21 04:45:25', '2021-01-21 04:45:25'),
(24, 43, 1015, 1009, 'সাইবার সিকিউরিটি নিয়ে আমি ২০ সাল কাজ করেছি আমি আপনাকে সার্বিস দিতে পারবো', NULL, '', NULL, '2021-01-29', '2021-01-21', NULL, NULL, NULL, 5444, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-21 04:48:16', '2021-01-21 04:48:16'),
(25, 24, 1015, 1002, 'আমার গাজীপুরে এক্সাভেটর এর বিজনেস আছে আমি আপনাকে সাহায্য করতে পারবো .', NULL, '', NULL, '2021-01-30', '2021-01-21', '2021-02-03 11:38:10', '2021-02-03 14:36:24', NULL, 50000, 0, 0, 1, 1, 1, 1, 1, 1, NULL, '2021-01-21 04:49:46', '2021-12-05 10:02:26'),
(26, 42, 1015, 1009, 'আমি চায়না থেকে আপেল ব্র্যান্ড  এর জুতো এনে দিতে পারবো প্রতি জোড়া ২০০০ টাকা করে রাখা যাবে', NULL, '', NULL, '2021-01-29', '2021-01-21', NULL, NULL, NULL, 2000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-21 04:54:55', '2021-01-21 04:54:55'),
(27, 70, 1015, 1014, 'আমার মঙ্গলে আর চাঁদে যাওয়ার ৭০ বছরের অভিজ্ঞতা আছে আমি আপনাকে স্পেসেক্স থেকে ও ভালো রকেট দিতে পারবো।', NULL, '', NULL, '2021-01-30', '2021-01-21', NULL, NULL, NULL, 68888, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-21 05:11:35', '2021-01-21 05:11:35'),
(28, 59, 1014, 1002, 'LOL', NULL, '', NULL, '2021-01-21', '2021-01-21', '2021-01-31 12:07:31', '2021-02-01 17:14:51', NULL, 500, 0, 1, 1, 0, 1, 1, 0, 1, NULL, '2021-01-21 05:22:42', '2021-02-01 11:14:51'),
(29, 58, 1014, 1002, 'এই খুনিকে দরিয়ে দিন। দরিয়ে দিতে পারলে ৫০০০ টাকা দেয়া হবে।', NULL, '', NULL, '2021-01-29', '2021-01-21', NULL, NULL, NULL, 5000, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2021-01-21 05:26:59', '2021-01-31 06:52:43'),
(30, 61, 1014, 1002, 'আমি দিতে পারবো। প্লিজ কন্ট্রাক্ট মি', NULL, '', NULL, '2021-01-30', '2021-01-21', NULL, NULL, NULL, 1000, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2021-01-21 05:35:06', '2021-01-26 10:02:33'),
(31, 53, 1014, 1009, 'ami dite parboami dite parboami dite parboami dite parboami dite parboami dite parbo', NULL, '', NULL, '2021-01-29', '2021-01-21', NULL, NULL, NULL, 30000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-21 05:38:10', '2021-01-25 06:35:20'),
(32, 31, 1014, 1005, 'আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।আমি দিতে পারবো। আমার ঢাকা মিরপুর দোকান আছে।', NULL, '', NULL, '2021-01-30', '2021-01-21', NULL, NULL, NULL, 23, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-21 05:40:12', '2021-01-21 05:40:12'),
(33, 31, 1015, 1005, 'Will give you beats headphone', NULL, '', NULL, '2021-01-29', '2021-01-21', '2022-08-22 16:45:29', '2022-08-22 16:45:44', NULL, 5444, 0, 1, 1, 0, 1, 1, 0, 1, NULL, '2021-01-21 05:46:42', '2022-08-22 16:45:44'),
(34, 54, 1015, 1009, 'ami cha banate late howate amake jari diche hetere bina poysay marum', NULL, '', NULL, '2021-01-30', '2021-01-21', NULL, NULL, NULL, 108, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2021-01-21 05:48:20', '2021-06-08 09:37:56'),
(35, 54, 1014, 1009, 'আমি আছি। আমি ইতিমধ্যে ১০ জনকে খুন করচি।', NULL, '', NULL, '2021-01-30', '2021-01-21', NULL, NULL, NULL, 50000, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2021-01-21 05:48:33', '2021-02-07 11:02:28'),
(36, 74, 1015, 1014, 'আগে গ্রালফ্রেন্ড বাদ দেন পরে ফ্রীতে আপনারে বই দিমু', NULL, '', NULL, '2021-01-30', '2021-01-21', '2021-02-02 11:16:53', '2021-02-02 11:17:06', NULL, 8099, 0, 0, 1, 1, 1, 1, 1, 1, NULL, '2021-01-21 06:19:34', '2021-12-05 09:59:26'),
(37, 64, 1009, 1014, 'sdfsdfsdfsdf', NULL, '', NULL, '2021-01-27', '2021-01-24', NULL, NULL, NULL, 233, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-24 05:16:30', '2021-01-24 05:16:30'),
(38, 54, 1002, 1009, 'i will make this t shirt on no where', NULL, '', NULL, '2021-12-23', '2021-01-24', NULL, '2021-01-28 18:29:49', NULL, 200, 0, 1, 1, 1, 1, 1, 1, 1, NULL, '2021-01-24 05:24:25', '2021-02-03 05:35:15'),
(39, 80, 1010, 1014, 'Refresh your wardrobe with the Chest Logo T Shirt from Paul and Shark. Crafted in a soft cotton construction, this t shirt features a ribbed crew neck, short sleeves and elasticated trims. The look is finished with the brand\'s signature logo embroidered to the chest.', NULL, '', NULL, '2021-01-29', '2021-01-26', '2021-01-31 17:30:59', '2021-01-31 17:32:24', NULL, 5000, 0, 1, 1, 1, 1, 1, 1, 1, NULL, '2021-01-26 05:36:26', '2021-02-04 12:36:34'),
(40, 33, 1009, 1011, 'Lorem Ipsum passage, and going through the cites of the word in classical', NULL, '', NULL, '2021-05-23', '2021-01-26', NULL, NULL, NULL, 7844, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-26 06:48:09', '2021-04-01 07:04:57'),
(41, 61, 1009, 1002, 'Hello lroem ispum dolor', NULL, '', NULL, '2021-01-31', '2021-01-26', NULL, '2021-01-28 18:33:04', NULL, 899, 0, 1, 1, 1, 1, 1, 1, 1, NULL, '2021-01-26 06:49:58', '2021-02-03 05:02:51'),
(42, 70, 1009, 1014, '544 takar modde rocket boira dibo', NULL, '', NULL, '2021-02-06', '2021-01-26', NULL, NULL, NULL, 544, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-26 07:59:39', '2021-01-26 07:59:39'),
(43, 71, 1002, 1014, 'Tv sell korar 20 year er obiggota ache', NULL, '', NULL, '2021-01-31', '2021-01-26', '2021-02-02 11:23:23', NULL, NULL, 7666, 0, 0, 1, 0, 0, 0, 0, 0, NULL, '2021-01-26 10:04:11', '2021-02-02 05:23:23'),
(44, 78, 1002, 1014, 'অর্থহীন লেখা যার মাঝে আছে অনেক কিছু। হ্যাঁ, এই লেখার মাঝেই আছে অনেক কিছু। যদি তুমি মনে করো, এটা তোমার কাজে লাগবে, তাহলে তা লাগবে কাজে। নিজের ভাষায় লেখা দেখতে অভ্যস্ত হও। মনে রাখবে লেখা অর্থহীন হয়, যখন তুমি তাকে অর্থহীন মনে করো; আর লেখা অর্থবোধকতা তৈরি করে, যখন তুমি তাতে অর্থ ঢালো। যেকোনো লেখাই তোমার কাছে অর্থবোধকতা তৈরি করতে পারে, যদি তুমি সেখানে অর্থদ্যোতনা দেখতে পাও। …ছিদ্রান্বেষণ? না, তা হবে কেন?', NULL, '', NULL, '2021-02-06', '2021-01-27', NULL, NULL, NULL, 555, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2021-01-27 10:12:10', '2021-01-31 11:35:28'),
(45, 38, 1009, 1002, 'I can give youu whole package jacket with people just in 200tk only', NULL, '', NULL, '2021-02-06', '2021-01-28', '2021-02-02 15:04:27', '2021-02-02 16:40:02', NULL, 2000, 0, 0, 1, 1, 1, 1, 1, 1, NULL, '2021-01-28 06:59:04', '2021-02-03 08:19:44'),
(46, 51, 1009, 1010, 'hey', NULL, '', NULL, '2021-02-03', '2021-01-28', NULL, NULL, NULL, 444, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-01-28 09:13:15', '2021-01-31 09:56:10'),
(47, 82, 1009, 1002, 'Hey i can give u that shit', NULL, '', NULL, '2021-02-06', '2021-01-31', '2021-02-01 18:12:20', '2021-02-01 18:12:57', NULL, 900, 0, 0, 1, 1, 1, 1, 1, 1, NULL, '2021-01-31 07:07:01', '2021-02-03 05:00:58'),
(49, 65, 1010, 1014, 'vxcvv vxczdsf fasdfv', NULL, '', NULL, '2021-02-27', '2021-02-02', NULL, NULL, NULL, 1e16, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-02-02 12:38:19', '2021-02-02 12:38:19'),
(50, 32, 1002, 1010, 'আপনার গাদা গাদা পায়ের জন্যে এই জুতো ৫৫৫ টাকার নিছে দেওয়া সম্ভব না । আপনি নিতে চাইলে যোগাযোগ করুন ধন্যবাদ', NULL, '', NULL, '2021-03-06', '2021-02-03', '2021-02-07 16:59:21', '2021-02-07 16:59:41', NULL, 555, 0, 1, 1, 0, 1, 1, 0, 1, NULL, '2021-02-03 05:57:29', '2021-02-07 10:59:41'),
(51, 85, 1002, 1009, 'i can give you all t shirt within 455 tk please contact with me', NULL, '', NULL, '2021-02-27', '2021-02-03', '2021-02-03 14:33:13', '2021-02-03 14:33:51', NULL, 455, 0, 1, 1, 1, 1, 1, 1, 1, NULL, '2021-02-03 08:32:25', '2021-02-03 08:34:36'),
(52, 63, 1009, 1014, 'Hello lorem ispum dolor suit imor simply dummy text loxsq olishom sdeh', NULL, '', NULL, '2021-02-26', '2021-02-03', NULL, NULL, NULL, 999, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-02-03 09:34:34', '2021-02-03 09:34:34'),
(53, 52, 1009, 1010, 'ki bujaichen janina but ami dite parbo', NULL, '', NULL, '2021-02-25', '2021-02-03', '2021-02-07 17:50:35', NULL, NULL, 666, 0, 0, 1, 0, 0, 0, 0, 0, NULL, '2021-02-03 10:08:32', '2022-08-28 13:25:39'),
(55, 34, 1010, 1002, 'This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.', NULL, '', NULL, '2021-02-28', '2021-02-04', NULL, NULL, NULL, 2552, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-02-04 11:29:05', '2021-02-04 11:29:05'),
(56, 87, 1009, 1012, 'i have 65 unit of car . and having a lot of experience driver please contact with me', NULL, '', NULL, '2021-02-26', '2021-02-04', NULL, NULL, NULL, 6000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-02-04 12:22:06', '2021-02-04 12:22:06'),
(58, 1, 1009, 1002, 'Hello lorem ispum dolor suit imor', NULL, '', NULL, '2021-02-27', '2021-02-07', '2021-02-07 13:46:25', '2021-02-07 13:48:38', NULL, 544, 0, 0, 1, 0, 1, 1, 0, 1, NULL, '2021-02-07 07:04:03', '2021-02-07 07:48:38'),
(59, 88, 1002, 1009, 'In 1995, Bangladeshi immigrant living in Geneva, Switzerland formed a club named \'\'Probas\'\'. After continuing for few years', NULL, '', NULL, '2021-02-27', '2021-02-07', '2021-02-07 16:42:44', '2021-02-07 16:43:50', NULL, 555, 0, 0, 1, 0, 1, 1, 0, 1, NULL, '2021-02-07 08:05:02', '2021-02-07 10:43:50'),
(60, 11, 1010, 1002, 'Hello', NULL, '', NULL, '2021-02-25', '2021-02-07', '2021-02-07 16:33:41', '2021-02-07 16:35:12', NULL, 233, 0, 0, 1, 1, 1, 1, 1, 1, NULL, '2021-02-07 08:46:41', '2022-03-15 11:51:11'),
(61, 4, 1009, 1002, 'Hello it\'s another bid', NULL, '', NULL, '2021-02-22', '2021-02-07', '2021-02-07 17:08:08', '2021-02-07 17:09:02', NULL, 655, 0, 0, 1, 1, 1, 1, 1, 1, NULL, '2021-02-07 11:03:05', '2021-02-08 05:11:51'),
(62, 89, 1006, 1010, 'অফিস শেষে নিজের ছোট গার্মেন্টস বিজনেস (Garments Business) প্রতিষ্ঠানের কাজে গার্মেন্টসে আসলাম। আজ একটা কর্পোরেট কোম্পানীর ১০০০০(দশ হাজার) পিছ এর শিপমেন্ট (Delivery) রয়েছে যার কোয়ালিটি Inspection (QC) সহ ডেলিভারী চালান ও ভ্যাট চালান সম্পন্ন করতে হবে ।', NULL, '', NULL, '2021-02-28', '2021-02-16', '2022-03-16 16:13:43', NULL, NULL, 4798, 0, 0, 1, 0, 0, 0, 0, 0, NULL, '2021-02-16 10:52:32', '2022-03-16 10:15:15'),
(123, 95, 1015, 1008, 'our order has been updated to the following status: Didn', NULL, NULL, NULL, '2021-07-21', '2021-07-19', NULL, NULL, NULL, 145, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-07-19 17:15:23', '2021-07-19 17:15:23'),
(124, 102, 1015, 1008, 'dghhfg fjgfh fgghdfghjdfg fgjhhffgfgj fghgjhh fghdf', NULL, NULL, NULL, '2021-07-21', '2021-07-19', NULL, NULL, NULL, 75, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-07-19 17:29:18', '2021-07-19 17:29:18'),
(125, 103, 1015, 1008, 'I can supply your needed product.', NULL, NULL, NULL, '2021-07-22', '2021-07-19', NULL, NULL, NULL, 695, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-07-19 17:30:54', '2021-12-05 08:52:05'),
(126, 107, 1015, 1008, 'fghdfghh fhjfgyhg fhjghhdfg fgghghjdfg', NULL, NULL, NULL, '2021-07-23', '2021-07-19', NULL, NULL, NULL, 983, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-07-19 17:33:30', '2021-07-19 17:33:30'),
(127, 100, 1015, 1008, 'hello gys', NULL, NULL, NULL, '2021-07-22', '2021-07-19', '2021-12-02 18:43:29', '2021-12-02 18:44:19', NULL, 853, 0, 1, 1, 1, 1, 1, 1, 1, NULL, '2021-07-19 17:43:48', '2021-12-02 12:45:11'),
(128, 101, 1015, 1008, 'unshift new notification', NULL, NULL, NULL, '2021-07-22', '2021-07-19', NULL, NULL, NULL, 846, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2021-07-19 17:52:04', '2022-03-16 13:08:43'),
(129, 105, 1012, 1008, 'another bidder added for bid', NULL, NULL, NULL, '2021-07-23', '2021-07-20', '2021-12-02 18:19:28', '2021-12-02 18:40:08', NULL, 574, 0, 1, 1, 0, 1, 1, 0, 1, NULL, '2021-07-19 20:01:11', '2021-12-02 12:40:08'),
(130, 107, 1012, 1008, 'check about image file', NULL, NULL, NULL, '2021-07-22', '2021-07-20', NULL, NULL, NULL, 284, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2021-07-19 20:07:04', '2022-02-23 15:00:41'),
(131, 85, 1005, 1015, 'dsfsdfsdfsdf ssdf', NULL, NULL, NULL, '2021-08-18', '2021-08-18', NULL, NULL, NULL, 44, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-08-18 06:47:57', '2021-08-18 06:47:57'),
(132, 103, 1005, 1008, 'sdfsdfsd', NULL, NULL, '2021-08-18-1629269316.jpeg', '2021-08-25', '2021-08-18', NULL, NULL, NULL, 44, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-08-18 06:48:37', '2021-08-18 06:48:37'),
(134, 83, 1008, 1015, 'Taylor swift ending evermore album with “this pain wouldn’t be for evermore” was so sick', NULL, NULL, NULL, '2021-08-20', '2021-08-18', NULL, NULL, NULL, 457, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2021-08-18 08:03:36', '2022-08-28 13:47:26'),
(135, 97, 1015, 1008, 'Taylor swift ending evermore album with “this pain wouldn’t be for evermore” was so sick', NULL, NULL, NULL, '2021-08-19', '2021-08-18', NULL, NULL, NULL, 646, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-08-18 08:08:42', '2021-08-18 08:08:42'),
(136, 101, 1005, 1008, 'dfsdfsdfsd', NULL, NULL, '2021-08-18-1629275343.jpeg', '2021-08-25', '2021-08-18', NULL, NULL, NULL, 766, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2021-08-18 08:29:04', '2021-08-18 08:29:04'),
(138, 108, 1010, 1015, 'parbo', NULL, NULL, '2021-10-25-1635146975.jpeg', '2021-10-31', '2021-10-25', NULL, NULL, NULL, 5822, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2021-10-25 07:29:35', '2022-03-13 06:20:02'),
(139, 110, 1008, 1010, 'fjtr yjfghjgjg ghjhghjfgh fgjhgjhgh ftgreyuf dhghjhrt gfhhghrty', NULL, NULL, '2022-02-01-1643696510.jpeg', '2022-02-23', '2022-02-01', '2022-02-02 16:21:13', '2022-02-02 16:22:39', NULL, 649, 0, 0, 1, 1, 1, 1, 1, 1, NULL, '2022-02-01 06:21:50', '2022-03-20 06:31:28'),
(140, 109, 1008, 1010, 'leaving your current location in the editor. If you are a keyboard', NULL, NULL, '2022-02-02-1643798693.jpeg', '2022-02-17', '2022-02-02', '2022-02-02 17:11:48', '2022-02-02 17:13:56', NULL, 476, 0, 1, 1, 0, 1, 1, 0, 1, NULL, '2022-02-02 10:44:53', '2022-03-15 12:40:59'),
(141, 98, 1010, 1008, 'sd dsf sf', NULL, NULL, '2022-02-03-1643888659.jpeg', '2022-02-28', '2022-02-03', '2022-02-03 17:45:56', '2022-02-03 18:21:59', NULL, 5000000, 0, 1, 1, 1, 1, 1, 1, 1, NULL, '2022-02-03 11:44:19', '2022-02-03 13:10:51'),
(142, 102, 1010, 1008, 'fh ghjfgjhh ghjfygtyj fghjgh', NULL, NULL, '2022-02-03-1643893406.jpeg', '2022-02-26', '2022-02-03', '2022-02-03 19:04:19', NULL, NULL, 567, 0, 1, 1, 0, 0, 0, 0, 0, NULL, '2022-02-03 13:03:26', '2022-02-03 13:04:19'),
(143, 104, 1010, 1008, 'dsfa dsfd fasdfdsfdsfdsfadsafasdf\nsadf\nsda\nf\nadf\nasd\nf\nasdf\nasd\nf\nsadf', NULL, NULL, '2022-02-15-1644908104.jpeg', '2022-02-28', '2022-02-15', NULL, NULL, NULL, 200, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-02-15 06:55:04', '2022-02-15 06:55:04'),
(144, 62, 1010, 1014, 'klphjnjmnk,k', NULL, NULL, '2022-02-15-1644908876.jpeg', '2022-02-28', '2022-02-15', NULL, NULL, NULL, 855, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-02-15 07:07:56', '2022-02-15 07:07:56'),
(145, 89, 1018, 1010, 'fhjghg ghjhfdjghj fhgjghfgjhdf fgjhfghfhj', NULL, NULL, '2022-02-15-1644911302.jpeg', '2022-02-27', '2022-02-15', NULL, NULL, NULL, 845, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2022-02-15 07:48:22', '2022-03-16 10:13:33'),
(151, 89, 1008, 1010, 'I want to thank all foreign players who participated in the PSL! It was a wonderful show and one of the most memorable events ever staged in the country. A special thanks to all law enforcing agencies, Army, police and the die-hard cricket fans in Karachi and Lahore', NULL, NULL, '2022-03-01-1646113291.jpeg', '2022-03-23', '2022-03-01', NULL, NULL, NULL, 951, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-03-01 05:41:31', '2022-03-01 05:41:31'),
(153, 101, 1008, 1015, 'I think all Pakistanis are die hard fan of Cricket and PSL so why you mentioned just Karachi & Lahore?\nEvery Pakistani is fan of cricket and always supported to every sports.', NULL, NULL, '2022-03-01-1646114948.jpeg', '2022-03-23', '2022-03-01', '2022-09-21 15:34:30', NULL, NULL, 962, 0, 1, 1, 0, 0, 0, 0, 0, NULL, '2022-03-01 06:09:08', '2022-09-21 15:34:30'),
(154, 106, 1015, 1008, 'yhfjufh hjkfgjjhhfg ghjkfhgj', NULL, NULL, NULL, '2022-3-30', '2022-03-16', NULL, NULL, NULL, 676, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-03-16 06:05:20', '2022-03-16 06:05:20'),
(155, 104, 1015, 1008, 'rtytrft yjydthg fyjhghh hdtgh fjfryy', NULL, NULL, '2022-03-16-1647415027.jpeg', '2022-3-30', '2022-03-16', NULL, NULL, NULL, 578, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-03-16 07:17:07', '2022-03-16 07:17:07'),
(156, 103, 1008, 1015, 'Fhdhgdhv fhcjhdb cchjdvcj fnsgvsjvjch ghjhfbdjchv gsjbchcbf vjnvbch vfjjcbfb vfjjdjvg wkchnch sjgf', NULL, NULL, '2022-03-16-1647422769.jpeg', '2022-3-28', '2022-03-16', NULL, NULL, NULL, 521, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-03-16 09:26:10', '2022-03-16 09:26:10'),
(157, 97, 1008, 1015, 'Fgujbfg hgghk hfghb sghbf hfhhg hfghb', NULL, NULL, '2022-03-16-1647423806.jpeg', '2022-3-31', '2022-03-16', NULL, NULL, NULL, 394, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-03-16 09:43:27', '2022-03-16 09:43:27'),
(158, 93, 1010, 1008, 'Ghhv', NULL, NULL, '2022-03-20-1647763953.jpeg', '2022-3-31', '2022-03-20', '2022-03-20 19:07:08', '2022-03-20 19:07:18', NULL, 58660, 0, 1, 1, 0, 1, 1, 0, 1, NULL, '2022-03-20 08:12:33', '2022-03-20 13:07:18'),
(159, 103, 1010, 1015, 'Vyy huuh huhh', NULL, NULL, '2022-03-20-1647764658.jpeg', '2022-3-31', '2022-03-20', NULL, NULL, NULL, 8868, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-03-20 08:24:20', '2022-03-20 08:24:20'),
(160, 124, 1008, 1015, 'fghhfg fghdfgjh fghjfgfj ftgjgth ujurtj', NULL, NULL, '2022-03-20-1647780932.jpeg', '2022-4-21', '2022-03-20', NULL, NULL, NULL, 658, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-03-20 12:55:32', '2022-03-20 12:55:32'),
(161, 108, 1029, 1015, 'hhhhhhhhhhhhhhhhhhjjjj', NULL, NULL, '2022-08-24-1661332107.jpeg', '2022-08-27', '2022-08-24', '2022-09-05 00:18:46', NULL, NULL, 3700, 0, 1, 1, 0, 0, 0, 0, 0, NULL, '2022-08-24 15:08:27', '2022-09-05 00:18:46'),
(162, 134, 1031, 1029, 'best calculator', NULL, NULL, NULL, '2022-08-25', '2022-08-24', '2022-08-24 15:24:57', '2022-08-24 15:31:07', NULL, 80, 0, 1, 1, 0, 1, 1, 0, 1, NULL, '2022-08-24 15:17:48', '2022-08-24 15:31:07'),
(163, 134, 1030, 1029, 'Good Condition', NULL, NULL, '2022-08-24-1661332766.jpeg', '2022-08-28', '2022-08-24', NULL, NULL, NULL, 150, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2022-08-24 15:19:26', '2022-08-24 15:20:59'),
(164, 135, 1029, 1031, NULL, NULL, NULL, '2022-08-24-1661333709.jpeg', '2022-08-25', '2022-08-24', NULL, NULL, NULL, 1300, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2022-08-24 15:35:09', '2022-08-24 15:35:33'),
(165, 135, 1030, 1031, NULL, NULL, NULL, NULL, '2022-08-25', '2022-08-24', '2022-08-24 15:37:24', NULL, NULL, 1200, 0, 0, 1, 0, 0, 0, 0, 0, NULL, '2022-08-24 15:36:08', '2022-08-24 15:41:34'),
(166, 136, 1029, 1030, NULL, NULL, NULL, '2022-08-24-1661333797.jpeg', '2022-08-26', '2022-08-24', '2022-08-24 15:38:30', '2022-08-24 15:44:17', NULL, 1600, 0, 1, 1, 0, 1, 1, 0, 1, NULL, '2022-08-24 15:36:38', '2022-08-24 15:44:17'),
(167, 133, 1030, 1029, NULL, NULL, NULL, NULL, '2022-08-28', '2022-08-24', '2022-08-24 16:22:56', '2022-08-24 16:23:08', NULL, 220000, 0, 1, 1, 0, 1, 1, 0, 1, NULL, '2022-08-24 16:21:10', '2022-08-24 16:23:08'),
(168, 143, 1029, 1010, NULL, NULL, NULL, NULL, '2022-08-26', '2022-08-25', NULL, NULL, NULL, 4, 0, 1, 0, 0, 0, 0, 0, 0, NULL, '2022-08-25 16:05:59', '2022-08-31 10:52:08'),
(169, 131, 1015, 1024, 'বড় শট খেলাটাকে অভ্যাসে পরিণত করার চেষ্টায় সৌম্য; ফিটনেসেও দিচ্ছেন বাড়তি মনোযোগ..', NULL, NULL, '2022-09-08-1662629557.jpeg', '2022-10-01', '2022-09-08', NULL, NULL, NULL, 682, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-09-08 15:32:37', '2022-09-08 15:32:37'),
(170, 144, 1008, 1024, 'Exams badges are shown on all your bids and on your profile after you pass each Exam. They\'re a great way to win more work by showing off your credibility and trustworthiness to employers', NULL, NULL, '2022-09-10-1662812230.jpeg', '2022-09-29', '2022-09-10', NULL, NULL, NULL, 589, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-09-10 18:17:10', '2022-09-10 18:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `bid_settings`
--

CREATE TABLE `bid_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bid_charge` double NOT NULL,
  `min_point_for_bid` double NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bid_settings`
--

INSERT INTO `bid_settings` (`id`, `bid_charge`, `min_point_for_bid`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 12, 1, '2021-09-13 07:03:43', '2021-09-13 07:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tag`
--

CREATE TABLE `blog_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buyer_ratings`
--

CREATE TABLE `buyer_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bid_id` bigint(20) UNSIGNED NOT NULL,
  `demand_id` bigint(20) UNSIGNED NOT NULL,
  `reviewer_id` bigint(20) UNSIGNED NOT NULL COMMENT 'both user id on user',
  `buyer_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user id on user',
  `ratings` double NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buyer_ratings`
--

INSERT INTO `buyer_ratings` (`id`, `bid_id`, `demand_id`, `reviewer_id`, `buyer_id`, `ratings`, `review`, `created_at`, `updated_at`) VALUES
(1, 13, 43, 1002, 1009, 5, 'he is  very good seller', '2021-02-02 12:34:02', '2021-02-02 12:34:02'),
(3, 47, 82, 1009, 1002, 4, 'he is very professional buyer well recomanded', '2021-02-03 05:00:58', '2021-02-03 05:00:58'),
(4, 41, 61, 1009, 1002, 5, 'he is quite good seller will work again definitely', '2021-02-03 05:02:51', '2021-02-03 05:02:51'),
(5, 38, 54, 1002, 1009, 3, 'i always work with him but this time i am dis pointed', '2021-02-03 05:35:15', '2021-02-03 05:35:15'),
(6, 19, 46, 1002, 1009, 4, 'very excellent seller to work with', '2021-02-03 06:34:48', '2021-02-03 06:34:48'),
(7, 45, 38, 1009, 1002, 5, 'Good Experience to work with him', '2021-02-03 08:19:44', '2021-02-03 08:19:44'),
(8, 51, 85, 1002, 1009, 5, 'Good buyer well recomanded', '2021-02-03 08:34:36', '2021-02-03 08:34:36'),
(9, 57, 87, 1002, 1012, 3, 'kharooj kapjap not recomanded', '2021-02-04 12:26:39', '2021-02-04 12:26:39'),
(10, 39, 80, 1010, 1014, 5, 'ok', '2021-02-04 12:36:34', '2021-02-04 12:36:34'),
(11, 61, 4, 1009, 1002, 3, 'he is not a very good buyer i hate him too much', '2021-02-08 05:11:51', '2021-02-08 05:11:51'),
(12, 8, 58, 1006, 1002, 3, 'kono onubuti nai', '2021-02-10 05:33:56', '2021-02-10 05:33:56'),
(13, 10, 3, 1006, 1002, 4, 'no onubuti', '2021-02-10 05:36:41', '2021-02-10 05:36:41'),
(14, 7, 51, 1006, 1010, 3, 'layer murgi', '2021-02-10 05:56:36', '2021-02-10 05:56:36'),
(15, 127, 100, 1015, 1008, 3, 'thank you boys', '2021-12-02 12:45:11', '2021-12-02 12:45:11'),
(16, 36, 74, 1015, 1014, 4, 'onuvuti valo, ei onuvuti vut dorar kaje o asena.', '2021-12-05 09:59:26', '2021-12-05 09:59:26'),
(17, 25, 24, 1015, 1002, 3, 'ACBSP Accredited MBA & EMBA Admissions for Spring 2022 at IUB is now open.\nEnroll Now', '2021-12-05 10:02:26', '2021-12-05 10:02:26'),
(18, 22, 53, 1015, 1009, 4, 'I am excited to inform you that, I joined Wipro in its Risk and Cybersecurity Services( iCORE-CRS) team as Architect.', '2021-12-05 10:03:55', '2021-12-05 10:03:55'),
(19, 139, 110, 1008, 1010, 3, 'Preview. VS Code will automatically show a selector in CSS when yo', '2022-02-02 11:32:53', '2022-02-02 11:32:53'),
(20, 141, 98, 1010, 1008, 4, 'sfdg dfgdfg', '2022-02-03 13:10:51', '2022-02-03 13:10:51'),
(21, 60, 11, 1010, 1002, 1, NULL, '2022-03-15 11:51:11', '2022-03-15 11:51:11');

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `english_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_demand` int(11) DEFAULT 0,
  `status` tinyint(4) NOT NULL COMMENT '1= active , 0 = disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `english_name`, `icon`, `image`, `seo_image`, `banner`, `total_demand`, `status`, `created_at`, `updated_at`) VALUES
(5, 'পোশাক আশাক', 'Clothing', 'icon_6177aa75e4367.png', 'cat_image_617e6a8f7db47.jpeg', NULL, 'banner_5fe9cbd2773cb.jpeg', 19, 1, '2020-12-28 12:13:06', '2022-09-10 18:15:52'),
(8, 'ইলেক্ট্রনিক্স', 'Electronics', 'icon_6177ab24369f7.png', 'cat_image_617e6a8356c0f.jpeg', NULL, 'banner_5fe9d01b8b482.jpeg', 13, 1, '2020-12-28 12:31:23', '2022-03-20 10:46:11'),
(9, 'ট্র্যাবলিং', 'Travel', 'icon_6177ab7a1565a.png', 'cat_image_617e69f4f11db.jpeg', NULL, 'banner_5feabb6224cb0.jpeg', 22, 1, '2020-12-29 05:15:14', '2022-09-08 13:08:58'),
(10, 'কাস্টম টিশার্ট', 'Custom T Shirt', 'icon_6177ac4f68600.png', 'cat_image_617e69e467163.jpeg', NULL, 'banner_5feabc2a4bf04.jpeg', 34, 1, '2020-12-29 05:18:34', '2022-08-23 17:25:54'),
(11, 'ষ্টেশনারী', 'Stationary', 'icon_6177c189ef998.png', 'cat_image_617e6a4c1f634.jpeg', NULL, 'banner_5feac41e486c9.jpeg', 19, 1, '2020-12-29 05:52:30', '2022-08-24 15:32:55'),
(12, 'হেভী ইকুইপমেন্ট', 'Heavy Equipment', 'icon_60db6e6af2928.png', 'cat_image_60db6e6b0211c.jpeg', 'seo_5feaca733809d.jpeg', 'banner_5feaca734bb4a.jpeg', 9, 1, '2020-12-29 06:19:31', '2022-08-25 14:23:45'),
(13, 'পরিবহন', 'Trasnportaion', 'icon_6177abc065c15.png', 'cat_image_617e6a3cb13e7.jpeg', 'seo_5feacd7252d3a.jpeg', 'banner_5feacd7273ad5.jpeg', 19, 1, '2020-12-29 06:32:18', '2022-08-25 14:13:32'),
(14, 'ডেসকো', 'DESCO', 'icon_60db6eb34906c.png', 'cat_image_60db6eb34cc42.jpeg', 'seo_60472a2460c07.jpeg', 'banner_60472a247cf54.jpeg', 2, 1, '2021-03-09 07:56:20', '2022-08-28 09:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `category_quantity_units`
--

CREATE TABLE `category_quantity_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `quantity_unit_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_quantity_units`
--

INSERT INTO `category_quantity_units` (`id`, `category_id`, `quantity_unit_id`, `created_at`, `updated_at`) VALUES
(1, 5, 9, '2020-12-28 12:13:06', '2020-12-28 12:13:06'),
(2, 5, 1, '2020-12-28 12:13:06', '2020-12-28 12:13:06'),
(3, 5, 4, '2020-12-28 12:13:06', '2020-12-28 12:13:06'),
(4, 5, 3, '2020-12-28 12:13:06', '2020-12-28 12:13:06'),
(7, 8, 13, NULL, NULL),
(9, 9, 9, NULL, NULL),
(10, 9, 15, NULL, NULL),
(11, 9, 3, NULL, NULL),
(12, 9, 4, NULL, NULL),
(13, 9, 14, NULL, NULL),
(14, 10, 9, NULL, NULL),
(15, 10, 1, NULL, NULL),
(16, 10, 13, NULL, NULL),
(17, 10, 15, NULL, NULL),
(18, 10, 4, NULL, NULL),
(19, 11, 9, NULL, NULL),
(20, 11, 13, NULL, NULL),
(21, 11, 1, NULL, NULL),
(22, 11, 15, NULL, NULL),
(23, 11, 4, NULL, NULL),
(24, 12, 9, NULL, NULL),
(25, 12, 13, NULL, NULL),
(26, 12, 15, NULL, NULL),
(27, 12, 1, NULL, NULL),
(28, 12, 4, NULL, NULL),
(29, 13, 1, NULL, NULL),
(30, 13, 9, NULL, NULL),
(31, 13, 13, NULL, NULL),
(32, 13, 14, NULL, NULL),
(33, 14, 7, NULL, NULL),
(34, 5, 14, NULL, NULL),
(35, 5, 2, NULL, NULL),
(36, 8, 14, NULL, NULL),
(37, 8, 2, NULL, NULL),
(38, 8, 12, NULL, NULL),
(39, 8, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `org_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_i` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_ii` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tw_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 for specific user, 1 for all user',
  `amount_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 for Amount, 2 for percentage',
  `amount` double NOT NULL,
  `max_amount_limit` double DEFAULT NULL,
  `valid_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `coupon_type`, `amount_type`, `amount`, `max_amount_limit`, `valid_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DKFH100', 0, 2, 7, 60, '2021-04-03', 1, '2021-02-22 05:57:56', '2021-02-22 11:30:31'),
(2, 'BKKRT', 0, 2, 9, 30, '2022-12-19', 1, '2021-02-22 09:11:53', '2022-08-22 06:20:38'),
(3, 'PLJS34', 1, 1, 17, NULL, '2022-11-17', 1, '2021-02-22 09:13:53', '2022-08-22 06:48:43'),
(4, 'BAKRI', 1, 2, 3, 19, '2022-11-24', 1, '2022-08-22 06:51:19', '2022-08-22 06:51:19');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nilam_id` int(11) NOT NULL,
  `bid_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_histories`
--

INSERT INTO `delivery_histories` (`id`, `nilam_id`, `bid_id`, `date`, `comment`, `delivery_status`, `created_at`, `updated_at`, `admin_id`) VALUES
(1, 5, 2, '2021-06-16 13:17:19', 'method verifies that the value of the given column', 4, '2021-06-16 10:45:12', '2021-06-16 10:45:12', 1),
(2, 5, 2, '2021-06-14 20:21:29', 'No difference really, they both return an instance', 1, '2021-06-16 10:51:08', '2021-06-16 10:51:08', 2),
(3, 5, 2, '2021-06-13 19:21:28', 'so to use the facade you also have to provide the full namespace', 0, '2021-06-16 10:53:49', '2021-06-16 10:53:49', 1),
(4, 5, 2, '2021-06-14 22:14:12', 'One is just accessing the currently authenticated user via a global helper', 2, '2021-06-16 11:02:18', '2021-06-16 11:02:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `demands`
--

CREATE TABLE `demands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'demander',
  `category_id` bigint(20) UNSIGNED DEFAULT 0 COMMENT 'category of demand or post',
  `area_id` bigint(20) UNSIGNED DEFAULT 0 COMMENT 'Area of demander',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'demand title',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'demand description',
  `image_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'image one',
  `image_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'image two',
  `image_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'image three',
  `quantity` double DEFAULT NULL COMMENT 'quantity of demanded product',
  `quantity_unit_id` bigint(20) UNSIGNED DEFAULT 0 COMMENT 'Quantity Unit Of the quantity',
  `budget_type` tinyint(4) DEFAULT 0 COMMENT '1 = budget , 0 = negatiable',
  `minimum_budget` double DEFAULT 0 COMMENT 'buget getting start from',
  `maximum_budget` double DEFAULT 0 COMMENT 'Maximum Limit of budget',
  `fixed_budget` double(22,0) DEFAULT 0 COMMENT 'optional for now needed in future',
  `confirmed_amount` double DEFAULT 0 COMMENT 'confirmed bid amount',
  `confirmed_to` bigint(20) UNSIGNED DEFAULT 0 COMMENT 'user_id which the bid confirmed',
  `expire_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'post will not appear after this expire_date',
  `total_like` int(11) DEFAULT 0 COMMENT 'Like to post',
  `total_bid` int(11) DEFAULT 0 COMMENT 'totl amount of bid',
  `bid_status` tinyint(4) DEFAULT 0 COMMENT '0 = not confirmed , 1 = confirmed',
  `is_done` tinyint(4) DEFAULT 0,
  `status` tinyint(4) DEFAULT 1 COMMENT '1 = active , 0 = terminated',
  `sms_status` tinyint(4) DEFAULT 0 COMMENT '1 = sended , 0 = not sended',
  `notification_status` tinyint(4) DEFAULT 0 COMMENT '1 = sended , 0 = not sended',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `demands`
--

INSERT INTO `demands` (`id`, `user_id`, `category_id`, `area_id`, `title`, `description`, `image_one`, `image_two`, `image_three`, `quantity`, `quantity_unit_id`, `budget_type`, `minimum_budget`, `maximum_budget`, `fixed_budget`, `confirmed_amount`, `confirmed_to`, `expire_date`, `total_like`, `total_bid`, `bid_status`, `is_done`, `status`, `sms_status`, `notification_status`, `created_at`, `updated_at`) VALUES
(1, 1002, 5, 3, 'Every validator can save parameters. Validators are responsible for saving their', '<h2>Validator parameters</h2><p>Every validator can save parameters. Validators are responsible for saving their type and parameters, because they are simple functions, and we may want to inform the user about them.</p><p>Use withParams to apply parameters to a validator. Declared parameters bubble up by one level, so they are included in the $params of the parent validation object. Vuelidate is designed in a way that does not allow the validation result to directly include params.</p><p>You may call the $flattenParams method on a validation object to get an array of validator params for all validators that exist in that validation object. For example, let\'s say a validation object contains a between validator to check that a value is between 5 and 10. Calling $flattenParams returns the following array.</p><p><code>[{ path: [], name: \'between\', params: { type: \'between\', min: 5, max: 10 } }]</code></p>', '1002_one_5ffaca57a0574.jpeg', NULL, NULL, 12, 1, 1, 12, 12, 0, NULL, 1009, '2023-11-30', 0, 1, 1, 1, 1, 0, 0, '2023-01-10 09:35:20', '2023-02-07 07:48:38'),
(2, 1002, 12, 4, 'আমার গাজীপুরে  পয়েন্ট সেভেন এক্সকাবেটর লাগবে', '<p>‘সত্যবচনে’ এবার নিজের বড় ভাই সড়ক পরিবহন ও সেতুমন্ত্রী ওবায়দুল কাদেরকে সতর্ক হতে বললেন ছোট ভাই আবদুল কাদের মির্জা। তিনি বলেন, ‘তাঁর (ওবায়দুল কাদের) ওপরও আমার ক্ষোভ আছে। এখানে জিততে হলে তাঁর আমাদের লাগবে। সামনে জিততে হলে ওনাকেও সতর্ক হতে হবে। এত সহজ নয়, কঠিন ব্যাপার। বউটউ (স্ত্রী) সামলাতে হবে। আর ওনার সঙ্গে যাঁরা হাঁটেন, তাঁরা কার থেকে মাসোহারা পান, তার খোঁজখবর নিতে হবে।’</p><p>আজ রোববার সকালে কোম্পানীগঞ্জের বসুরহাট পৌরসভার ৯ নম্বর ওয়ার্ডে নির্বাচনী পথসভায় বক্তৃতা দেওয়ার সময় আওয়ামী লীগের সাধারণ সম্পাদক ওবায়দুল কাদেরের ছোট ভাই আবদুল কাদের মির্জা এসব কথা বলেন। তিনি বলেন, ‘মুঠোফোনে আমাকে যুব মহিলা লীগের পরিচয় দিয়ে অকথ্য ভাষায় গালমন্দ করেছে। প্রশাসনকে জানিয়েছি, তাঁরা কোনো ব্যবস্থা গ্রহণ করেনি। তাহলে এই মহিলার হাত অনেক শক্তিশালী, না হয় ব্যবস্থা গ্রহণ করেনি েন?’া</p>', NULL, NULL, NULL, 2, 13, 1, 12000, 30000, 0, 0, 0, '2023-11-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-10 09:50:24', '2023-01-10 09:50:24'),
(3, 1002, 12, 5, 'আমার ক্যট এক্সকাবেটর লাগবে রুপপুর পারমাণবিক কেন্দ্রে কাজ করার জন্যে', '<p>‘সত্যবচনে’ এবার নিজের বড় ভাই সড়ক পরিবহন ও সেতুমন্ত্রী ওবায়দুল কাদেরকে সতর্ক হতে বললেন ছোট ভাই আবদুল কাদের মির্জা। তিনি বলেন, ‘তাঁর (ওবায়দুল কাদের) ওপরও আমার ক্ষোভ আছে। এখানে জিততে হলে তাঁর আমাদের লাগবে। সামনে জিততে হলে ওনাকেও সতর্ক হতে হবে। এত সহজ নয়, কঠিন ব্যাপার। বউটউ (স্ত্রী) সামলাতে হবে। আর ওনার সঙ্গে যাঁরা হাঁটেন, তাঁরা কার থেকে মাসোহারা পান, তার খোঁজখবর নিতে হবে।’</p><p>আজ রোববার সকালে কোম্পানীগঞ্জের বসুরহাট পৌরসভার ৯ নম্বর ওয়ার্ডে নির্বাচনী পথসভায় বক্তৃতা দেওয়ার সময় আওয়ামী লীগের সাধারণ সম্পাদক ওবায়দুল কাদেরের ছোট ভাই আবদুল কাদের মির্জা এসব কথা বলেন। তিনি বলেন, ‘মুঠোফোনে আমাকে যুব মহিলা লীগের পরিচয় দিয়ে অকথ্য ভাষায় গালমন্দ করেছে। প্রশাসনকে জানিয়েছি, তাঁরা কোনো ব্যবস্থা গ্রহণ করেনি। তাহলে এই মহিলার হাত অনেক শক্তিশালী, না হয় ব্যবস্থা গ্রহণ করেনি কেন?’</p>', '1002_one_5fface3227a5f.jpeg', '1002_two_5fface33bfce4.jpeg', '1002_three_5fface33daff6.jpeg', 23, 13, 1, 12000, 20000, 0, 0, 1006, '2023-12-30', 0, 1, 1, 1, 1, 0, 0, '2023-01-10 09:51:48', '2023-02-01 11:39:15'),
(4, 1002, 9, 6, '12', NULL, '1002_one_5ffad12ec46b9.jpeg', NULL, NULL, 12, 15, 1, 12, 12, 0, NULL, 1009, '2023-12-30', 0, 1, 1, 1, 1, 0, 0, '2023-01-10 10:04:30', '2023-02-07 11:09:02'),
(5, 1002, 10, 7, 'গাজীপুরে গ্যাস সিলিন্ডার বিস্ফোরণে স্বামী-স্ত্রীসহ নিহত ৪', '<p>গাজীপুরে বাড়িতে রান্নার কাজে ব্যবহৃত গ্যাস সিলিন্ডার বিস্ফোরণে স্বামী-স্ত্রীসহ চারজন নিহত হয়েছেন। বিস্ফোরণের পর সৃষ্ট আগুনে পাশাপাশি থাকা চারটি বাসার প্রায় ৫০টি টিনশেড ঘর পুড়ে গেছে।</p><p>কালিয়াকৈর উপজেলার কালামপুরে আজ সোমবার ভোর সোয়া পাঁচটার দিকে একটি বাড়িতে গ্যাস সিলিন্ডার বিস্ফোরণের এ ঘটনা ঘটে। সকালে রান্না করতে গিয়ে গ্যাসের চুলা জ্বালাতে গেলে এ বিস্ফোরণ ঘটে। বিস্ফোরণে চারজন ঘটনাস্থলেই নিহত হন।</p>', '1002_one_5ffbdaf8cea25.jpeg', NULL, NULL, 12, 1, 1, 233, 322, 0, 0, 0, '2023-11-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 04:58:33', '2023-01-11 04:58:33'),
(6, 1010, 8, 11, 'Amazfit GTR 2 AMOLED Curved Display Smart Watch', '<h1><strong>Amazfit GTR 2 AMOLED Curved Display Smart Watch</strong></h1><p><br></p><h2>Features</h2><ol><li>Model: GTR 2</li><li>All-round Health and Fitness Tracking</li><li>3D Curved Bezel-less Design</li><li>Music Storage and Playback</li><li>Ultra-long Battery Life</li></ol><p><br></p><p><br></p>', '1010_one_5ffbe329b3128.jpeg', '1010_two_5ffbe329d7ea6.jpeg', NULL, 1, 0, 1, 1000, 2000, 0, 0, 0, '2023-12-20', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 05:33:29', '2023-01-11 05:33:29'),
(7, 1002, 13, 8, 'sss', '<p>hello</p>', '1002_one_5ffbecd28ebce.jpeg', NULL, NULL, 12, 1, 1, 12, 12, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 06:14:43', '2023-01-11 06:14:43'),
(8, 1006, 10, 9, 'hello', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '1002_one_5ffbf0880979c.jpeg', '1002_two_5ffbf08856e23.jpeg', '1002_three_5ffbf08878ae0.jpeg', 12, 9, 1, 121, 122, 0, 0, 0, '2023-12-30', 0, 1, 0, 0, 1, 0, 0, '2023-01-11 06:30:33', '2023-01-11 06:30:33'),
(9, 1006, 10, 10, 'sss', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '1002_one_5ffbf0b090903.jpeg', '1002_two_5ffbf0b0a3b3a.jpeg', '1002_three_5ffbf0b1126f8.jpeg', 12, 1, 1, 12, 33, 0, 0, 0, '2023-12-30', 0, 1, 0, 1, 1, 0, 0, '2023-01-11 06:31:13', '2023-01-11 06:31:13'),
(10, 1002, 10, 7, 'sss', '<p>lorem ispum odlor </p>', '1002_one_5ffbf17cf2e32.jpeg', '1002_two_5ffbf17d2c84d.jpeg', '1002_three_5ffbf17d62dc0.jpeg', 12, 1, 1, 343, 444, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 06:34:38', '2023-01-11 06:34:38'),
(11, 1002, 5, 5, 'amar kno ksiu dorkar nai', '<p>hello lorem isupm dolor suit imor simply dummy </p>', '1002_one_5ffbf20c5a840.jpeg', '1002_two_5ffbf20ca8ff0.jpeg', '1002_three_5ffbf20cca2be.jpeg', 32, 1, 1, 123, 222, 0, NULL, 1010, '2023-12-30', 0, 1, 1, 1, 1, 0, 0, '2023-01-11 06:37:01', '2023-02-07 10:35:12'),
(13, 1002, 13, 3, 'hello this is just a post', '<p>hello lorem ispum dolor</p>', '1002_one_5ffbf64f631ea.jpeg', '1002_two_5ffbf64f94716.jpeg', '1002_three_5ffbf650a7708.jpeg', 123, 1, 1, 233, 331, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 06:55:12', '2023-01-11 06:55:12'),
(14, 1002, 13, 5, 'ssss', '<p>fsdsdf</p>', '1002_one_5ffbf69042866.jpeg', '1002_two_5ffbf69090a85.jpeg', '1002_three_5ffbf6911708b.jpeg', 343, 1, 1, 343, 3444, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 06:56:18', '2023-01-11 06:56:18'),
(15, 1002, 10, 7, 'sss', NULL, '1002_one_5ffbf8d646387.jpeg', '1002_two_5ffbf8d6700a5.jpeg', '1002_three_5ffbf8d687752.jpeg', 123, 9, 1, 222, 333, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 07:05:59', '2023-01-11 07:05:59'),
(17, 1002, 10, 1, 'hello', '<p>hey how are you</p>', '1002_one_5ffbfb1d9f94a.jpeg', '1002_two_5ffbfb1e56176.jpeg', '1002_three_5ffbfb1f6553a.jpeg', 12, 13, 1, 433, 555, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 07:15:43', '2023-01-11 07:15:43'),
(19, 1002, 8, 1, 'sss', '<p>sdfsdf</p>', '1002_one_5ffbfd2c21058.jpeg', NULL, NULL, 23, 1, 1, 34, 2333, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 07:24:28', '2023-01-11 07:24:28'),
(20, 1006, 10, 3, 'dummy text of the printing and typesetting', '<p class=\"ql-align-justify\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p class=\"ql-align-justify\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.</p>', '1006_one_603e02bf35a08.jpeg', '1006_two_603e154314ed1.jpeg', '1006_three_603e0b6213ea5.jpeg', 2323, 1, 1, 12, 33, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 08:07:57', '2023-03-02 10:36:51'),
(21, 1002, 10, 1, 'ss', '<p>sdfsdf</p>', '1002_one_5ffc0e24a43c3.jpeg', '1002_two_5ffc0e24d312a.jpeg', '1002_three_5ffc0e25e6ed1.jpeg', 23, 1, 1, 22, 33, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 08:36:54', '2023-01-11 08:36:54'),
(22, 1002, 8, 1, 'i need a custom mobile for apple i phone', '<p><span style=\"color: rgb(158, 206, 106);\">buyer_badge_title</span></p>', '1002_one_5ffc25ebe2576.jpeg', '1002_two_5ffc25ec2b7dc.jpeg', '1002_three_5ffc25ec5df7e.jpeg', 21, 13, 1, 1234, 2222, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 10:18:20', '2023-01-11 10:18:20'),
(23, 1006, 10, 1, 'i need this type of cutom t shirt', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '1002_one_5ffc2e700b1c3.jpeg', '1002_two_5ffc2e703f7dd.jpeg', '1002_three_5ffc2e7059509.jpeg', 123, 15, 1, 220, 230, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 10:54:40', '2023-01-11 10:54:40'),
(24, 1002, 12, 1, 'i need .7 erxsdf ve kltoor oiasfojsdfk sdlkfjsdlk j', '<p><em style=\"color: rgb(137, 221, 255);\">:</em><em style=\"color: rgb(187, 154, 247);\">src</em><em style=\"color: rgb(137, 221, 255);\">=</em><span style=\"color: rgb(137, 221, 255);\">\"</span><span style=\"color: rgb(192, 202, 245);\">demand</span><span style=\"color: rgb(137, 221, 255);\">.</span><span style=\"color: rgb(125, 207, 255);\">image_one_medium</span><span style=\"color: rgb(137, 221, 255);\">\"</span></p>', '1002_one_5ffc30cd6a955.jpeg', '1002_two_5ffc30cd90e09.jpeg', '1002_three_5ffc30cea4d6f.jpeg', 123, 13, 1, 343, 444, 0, NULL, 1015, '2023-12-30', 0, 1, 1, 1, 1, 0, 0, '2023-01-11 11:04:46', '2023-02-03 08:36:24'),
(25, 1002, 10, 1, 'i need this custom t short for arifuggaman', '<p><strong>নেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবলললললললললললললললললললললললললললললল</strong></p>', '1002_one_5ffc344cf311d.jpeg', '1002_two_5ffc344d2b92c.jpeg', '1002_three_5ffc344d48432.jpeg', 344, 13, 0, NULL, NULL, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 11:19:41', '2023-01-11 11:19:41'),
(26, 1006, 10, 1, 'i need trable custom t shirt for arifu', '<p><strong>নেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবলললল</strong></p>', '1002_one_5ffc34a5d66a7.jpeg', '1002_two_5ffc34a60c48f.jpeg', '1002_three_5ffc34a6272e4.jpeg', 23, 13, 1, 133, 333, 0, 0, 0, '2023-12-30', 0, 1, 0, 1, 1, 0, 0, '2023-01-11 11:21:10', '2023-01-11 11:21:10'),
(27, 1002, 13, 1, 'আমার ১৬ টি বাস লাগবে ঢাকা টু চট্রগ্রাম', '<p><strong>নেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবনেগেশিয়েবলললললললললললললললললললললললল</strong></p>', '1002_one_5ffc37a88bf00.jpeg', NULL, NULL, 16, 1, 1, 2344, 5555, 0, 0, 0, '2023-12-30', 0, 1, 0, 0, 1, 0, 0, '2023-01-11 11:34:00', '2023-01-20 10:33:47'),
(28, 1002, 10, 1, 'hello i am another custom t shirt', '<p>\'latestDemand\' =&gt; fucntion($query)</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$query-&gt;orderBy(\'id\',\'desc\')-&gt;take(4);</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\'latestDemand\' =&gt; fucntion($query)</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$query-&gt;orderBy(\'id\',\'desc\')-&gt;take(4);</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\'latestDemand\' =&gt; fucntion($query)</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$query-&gt;orderBy(\'id\',\'desc\')-&gt;take(4);</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</p>', '1002_one_5ffc3f40aea2a.jpeg', '1002_two_5ffc3f40c38e5.jpeg', NULL, 12, 13, 1, 345, 444, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-11 12:06:24', '2023-01-11 12:06:24'),
(29, 1005, 5, 9, 'আমার ২ জোড়া নাইকি  ধরকার', '<p>Google ইনপুট সরঞ্জামগুলি ওয়েবে যেকোনো স্থানে আপনার পছন্দের ভাষা টাইপ করা আরো সহজ করে তোলে৷<a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">আরো জানুন</a></p><p>এটি ব্যবহার করে দেখতে, নীচে আপনার ভাষা এবং ইনপুট সরঞ্জাম চয়ন করুন এবং টাইপ করা শুরু করুনGoogle ইনপুট সরঞ্জামগুলি ওয়েবে যেকোনো স্থানে আপনার পছন্দের ভাষা টাইপ করা আরো সহজ করে তোলে৷ <a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">আরো জানু</a></p><p><a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">এটি ব্যবহার করে দেখতে, নীচে আপনার ভাষা এবং ইনপুট সরঞ্জাম চয়ন করুন এবং টাইপ করা শুরু করুন</a>Google ইনপুট সরঞ্জামগুলি ওয়েবে যেকোনো স্থানে আপনার পছন্দের ভাষা টাইপ করা আরো সহজ করে তোলে৷<a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">আরো জানুন</a></p><p>এটি ব্যবহার করে দেখতে, নীচে আপনার ভাষা এবং ইনপুট সরঞ্জাম চয়ন করুন এবং টাইপ করা শুরু করুনGoogle ইনপুট সরঞ্জামগুলি ওয়েবে যেকোনো স্থানে আপনার পছন্দের ভাষা টাইপ করা আরো সহজ করে তোলে৷ <a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">আরো জানু</a></p><p><a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">এটি ব্যবহার করে দেখতে, নীচে আপনার ভাষা এবং ইনপুট সরঞ্জাম চয়ন করুন এবং টাইপ করা শুরু করুন</a>Google ইনপুট সরঞ্জামগুলি ওয়েবে যেকোনো স্থানে আপনার পছন্দের ভাষা টাইপ করা আরো সহজ করে তোলে৷<a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">আরো জানুন</a></p><p>এটি ব্যবহার করে দেখতে, নীচে আপনার ভাষা এবং ইনপুট সরঞ্জাম চয়ন করুন এবং টাইপ করা শুরু করুন৷ <a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">৷ন</a>৷ <a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">৷ন</a>৷ </p>', '1005_one_5ffd26d9d1ea3.jpeg', '1005_two_5ffd26da80363.jpeg', '1005_three_5ffd26da9b02d.jpeg', 23, 3, 1, 321, 444, 0, 0, 0, '2023-12-30', 0, 1, 0, 0, 1, 0, 0, '2023-01-12 04:34:34', '2023-01-19 10:27:41'),
(30, 1005, 10, 9, 'নীচে আপনার ভাষা এবং ইনপুট সরঞ্জাম চয়ন করুন এবং টাইপ করা শুরু করুন৷', '<p>Google ইনপুট সরঞ্জামগুলি ওয়েবে যেকোনো স্থানে আপনার পছন্দের ভাষা টাইপ করা আরো সহজ করে তোলে৷<a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">আরো জানুন</a></p><p>এটি ব্যবহার করে দেখতে, নীচে আপনার ভাষা এবং ইনপুট সরঞ্জাম চয়ন করুন এবং টাইপ করা শুরু করুনGoogle ইনপুট সরঞ্জামগুলি ওয়েবে যেকোনো স্থানে আপনার পছন্দের ভাষা টাইপ করা আরো সহজ করে তোলে৷ <a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">আরো জানু</a></p><p><a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">এটি ব্যবহার করে দেখতে, নীচে আপনার ভাষা এবং ইনপুট সরঞ্জাম চয়ন করুন এবং টাইপ করা শুরু করুন</a>Google ইনপুট সরঞ্জামগুলি ওয়েবে যেকোনো স্থানে আপনার পছন্দের ভাষা টাইপ করা আরো সহজ করে তোলে৷<a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">আরো জানুন</a></p><p>এটি ব্যবহার করে দেখতে, নীচে আপনার ভাষা এবং ইনপুট সরঞ্জাম চয়ন করুন এবং টাইপ করা শুরু করুনGoogle ইনপুট সরঞ্জামগুলি ওয়েবে যেকোনো স্থানে আপনার পছন্দের ভাষা টাইপ করা আরো সহজ করে তোলে৷ <a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">আরো জানু</a></p><p><a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">এটি ব্যবহার করে দেখতে, নীচে আপনার ভাষা এবং ইনপুট সরঞ্জাম চয়ন করুন এবং টাইপ করা শুরু করুন৷ন</a>৷ <a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">৷ন</a>৷ </p>', '1005_one_5ffd2921d1c83.jpeg', '1005_two_5ffd292209591.jpeg', NULL, 2, 0, 1, 322, 444, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-12 04:44:18', '2023-01-12 04:44:18'),
(31, 1005, 8, 9, 'I need 2 d headphone lorem ispum dolor', '<p>Google ইনপুট সরঞ্জামগুলি ওয়েবে যেকোনো স্থানে আপনার পছন্দের ভাষা টাইপ করা আরো সহজ করে তোলে৷<a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">আরো জানুন</a></p><p>এটি ব্যবহার করে দেখতে, নীচে আপনার ভাষা এবং ইনপুট সরঞ্জাম চয়ন করুন এবং টাইপ করা শুরু করুনGoogle ইনপুট সরঞ্জামগুলি ওয়েবে যেকোনো স্থানে আপনার পছন্দের ভাষা টাইপ করা আরো সহজ করে তোলে৷ <a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">আরো জানু</a></p><p><a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">এটি ব্যবহার করে দেখতে, নীচে আপনার ভাষা এবং ইনপুট সরঞ্জাম চয়ন করুন এবং টাইপ করা শুরু করুন</a>Google ইনপুট সরঞ্জামগুলি ওয়েবে যেকোনো স্থানে আপনার পছন্দের ভাষা টাইপ করা আরো সহজ করে তোলে৷<a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">আরো জানুন</a></p><p>এটি ব্যবহার করে দেখতে, নীচে আপনার ভাষা এবং ইনপুট সরঞ্জাম চয়ন করুন এবং টাইপ করা শুরু করুন৷ <a href=\"https://www.google.com/intl/bn/inputtools/\" rel=\"noopener noreferrer\" target=\"_blank\">৷ন</a>৷ </p>', '1005_one_5ffd2ddb3829f.jpeg', '1005_two_5ffd2ddb64d92.jpeg', NULL, 12, 13, 1, 23, 33, 0, NULL, 1015, '2023-12-30', 0, 2, 1, 1, 1, 0, 0, '2023-01-12 05:04:27', '2022-08-22 16:45:44'),
(32, 1010, 9, 11, 'Power Slip-on Shoe in Navy Blue for Men', '<p>Power Slip-on Shoe in Navy Blue for Men - batabdPower Slip-on Shoe in Navy Blue for Men </p><p>Power Slip-on Shoe in Navy Blue for Men - batabdPower Slip-on Shoe in Navy Blue for Men</p>', '1010_one_5ffd30530a7c5.jpeg', '1010_two_5ffd305323fe9.jpeg', '1010_three_5ffd30532c1a7.jpeg', 1, 14, 1, 1000, 1500, 0, NULL, 1002, '2023-12-30', 0, 1, 1, 1, 1, 0, 0, '2023-01-12 05:14:59', '2023-02-07 10:59:41'),
(33, 1011, 13, 4, '10 ta leguna lagbe', '<p><span style=\"background-color: rgb(255, 255, 255); color: rgb(53, 73, 94);\">When working with objects, you must provide additional pr When working with objects, you must provide additional prWhen working with objects, you must provide additional pr</span></p>', '1011_one_5ffd31d65115a.jpeg', NULL, NULL, 13, 14, 1, 350000, 380000, 0, 0, 0, '2023-12-30', 0, 3, 0, 0, 1, 0, 0, '2023-01-12 05:21:26', '2023-01-26 06:48:09'),
(34, 1002, 9, 1, 'Amar trable bag dorkar for lorem ispum dolor', '<p>Hello loren ispum doleo</p>', '1002_one_5ffe9103928bc.jpeg', '1002_two_5ffe910694f57.jpeg', NULL, 21, 3, 1, 2111, 3333, 0, 0, 0, '2023-12-30', 0, 1, 0, 0, 1, 0, 0, '2023-01-13 06:19:52', '2023-02-04 11:29:05'),
(35, 1002, 10, 1, 'Amar custom t shirt dorkar', '<p>Hello lorem ispum dolor suit imor </p>', '1002_one_5ffe91d816776.jpeg', NULL, NULL, 21, 13, 1, 211, 334, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-13 06:23:22', '2023-01-13 06:23:22'),
(36, 1002, 10, 1, 'I need two piec of lorem ispum dolor suit imor', '<p>Hello </p>', '1002_one_5ffe996081053.jpeg', NULL, NULL, 12, 13, 1, 567, 777, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-13 06:55:29', '2023-01-13 06:55:29'),
(37, 1002, 10, 1, 'Hello lorem ispum dolor', '<p>Hello potrait</p>', '1002_one_5ffe99bfb1172.jpeg', NULL, NULL, 32, 9, 1, 21, 33, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-13 06:57:06', '2023-01-13 06:57:06'),
(38, 1002, 5, 1, 'Need tshirt 40 pcs', NULL, '1002_one_5ffe9c11b6244.jpeg', '1002_two_5ffe9c148f63c.jpeg', NULL, 40, 3, 0, NULL, NULL, 0, NULL, 1009, '2023-12-30', 0, 1, 1, 1, 1, 0, 0, '2023-01-13 07:07:02', '2023-02-02 10:40:02'),
(40, 1009, 10, 8, 'sss', '<p><code>&lt;blockquote class=\"twitter-tweet\"&gt;&lt;p lang=\"en\" dir=\"ltr\"&gt;Legalize comedy&lt;/p&gt;&amp;mdash; Elon Musk (@elonmusk) &lt;a href=\"https://twitter.com/elonmusk/status/1349286488618491904?ref_src=twsrc%5Etfw\"&gt;January 13, 2023&lt;/a&gt;&lt;/blockquote&gt; &lt;script async src=\"https://platform.twitter.com/widgets.js\" charset=\"utf-8\"&gt;&lt;/script&gt; </code></p>', '1009_one_5ffeca987d216.jpeg', NULL, NULL, 2, 9, 1, 23, 33, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-13 10:25:29', '2023-01-13 10:25:29'),
(41, 1009, 10, 8, 'hhh', NULL, '1009_one_5ffeec067d400.jpeg', NULL, NULL, 88, 9, 1, 99, 889, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-13 12:48:06', '2023-01-13 12:48:06'),
(42, 1009, 5, 8, 'Amar 2 belt er juta dorkar', '<p>This article is intended to demonstrate use cases and awesomeness of new Nuxt <code>fetch</code> functionality <a href=\"https://nuxtjs.org/docs/2.x/components-glossary/pages-fetch#nuxt-gt-2-12\" rel=\"noopener noreferrer\" target=\"_blank\">introduced in release v2.12</a>, and show you how to apply its power in your own projects. For in-depth technical analysis and details of the new <code>fetch</code> you can check <a href=\"https://nuxtjs.org/blog/understanding-how-fetch-works-in-nuxt-2-12\" rel=\"noopener noreferrer\" target=\"_blank\">Krutie Patel’s article</a>.</p>', '1009_one_5fffe7e7e8c3b.jpeg', NULL, NULL, 2, 3, 1, 33, 44, 0, 0, 1013, '2023-12-30', 0, 3, 1, 1, 1, 0, 0, '2023-01-14 06:42:48', '2023-02-01 08:41:34'),
(43, 1009, 9, 8, '4343', '<p>http://192.168.0.8/demand-back/public/images/demand/medium/1009_one_5fffe7e7e8c3b.jpeg</p>', '1009_one_5fffe860b7285.jpeg', NULL, NULL, 34, 3, 1, 44, 55, 0, 0, 1002, '2023-12-30', 0, 2, 1, 1, 1, 0, 0, '2023-01-14 06:44:51', '2023-02-01 08:40:08'),
(44, 1009, 10, 8, 'hello', '<p>sdfsdfsdf</p>', '1009_one_5fffe9b17f838.jpeg', NULL, NULL, 33, 13, 1, 22, 33, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-14 06:50:27', '2023-01-14 06:50:27'),
(45, 1009, 10, 8, '44', '<p>sdsdfsdfsdf</p>', '1009_one_5fffea2264009.jpeg', NULL, NULL, 33, 1, 1, 33, 44, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-14 06:52:18', '2023-01-14 06:52:18'),
(46, 1009, 12, 8, 'HHello i need exacetor', '<p>sdsfd</p>', '1009_one_5fffea702d32a.jpeg', NULL, NULL, 3, 13, 1, 321, 333, 0, NULL, 1002, '2023-12-30', 0, 1, 1, 1, 1, 0, 0, '2023-01-14 06:53:36', '2023-01-31 12:48:10'),
(47, 1009, 10, 8, 'title lorem ispum dolor suit imor suim sarif uzzaman lore ispum dolor suit imor simply dummy text', '<p>সামাজিক যোগাযোগমাধ্যমে সম্ভাব্য গ্রাহকের কাছে পৌঁছানো এখন ছোট ও মাঝারি ব্যবসায়ের জন্য অপরিহার্য বলা যেতে পারে। তা ছাড়া করোনাকালে অনলাইনে কেনাকাটা বেড়েছে বলে একাধিক প্রতিবেদন পাওয়া যায়। আর কেনাকাটার কাজ এখন কম্পিউটারের চেয়ে স্মার্টফোনেই বেশি সারছেন ভোক্তারা। অ্যাপলের উদ্যোগের ফলে এই ভোক্তাদের লক্ষ্য করে ডিজিটাল মাধ্যমে বিজ্ঞাপন প্রচার তুলনামূলক কঠিন হবে। আবার মোবাইল গেমিং খাতের জন্যও দুঃসংবাদ। বিশেষ করে বিনা মূল্যে যে গেমগুলো খেলা যায়, সেগুলোর নির্মাতাদের আয়ের প্রধান উৎস বিজ্ঞাপন। এখন তাদের ‘ইন-অ্যাপ পারচেজ’ ব্যবসায়িক মডেলে এগোতে হবে। অর্থাৎ, খেলা যাবে বিনা মূল্যেই, তবে গেমে বিশেষ কোনো দক্ষতা বা উপাদান চাইলে তা অর্থ খরচ করতে হবে। গেমনির্মাতারা অবশ্য এরই মধ্যে সেদিকে এগোনো শুরু করে দিয়েছেন।</p>', '1009_one_6000031d7db1c.jpeg', NULL, NULL, 23, 1, 1, 12, 44, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-14 08:38:53', '2023-01-14 08:38:53'),
(48, 1009, 10, 8, 'Arifuggaman need a lal goru', '<p>সামাজিক যোগাযোগমাধ্যমে সম্ভাব্য গ্রাহকের কাছে পৌঁছানো এখন ছোট ও মাঝারি ব্যবসায়ের জন্য অপরিহার্য বলা যেতে পারে। তা ছাড়া করোনাকালে অনলাইনে কেনাকাটা বেড়েছে বলে একাধিক প্রতিবেদন পাওয়া যায়।</p>', NULL, NULL, NULL, 43, 13, 1, 222, 444, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-14 09:46:03', '2023-01-14 09:46:03'),
(49, 1002, 10, 1, 'i need natural frame', '<p>সামাজিক যোগাযোগমাধ্যমে সম্ভাব্য গ্রাহকের কাছে পৌঁছানো এখন ছোট ও মাঝারি ব্যবসায়ের জন্য অপরিহার্য বলা যেতে পারে। তা ছাড়া করোনাকালে অনলাইনে কেনাকাটা বেড়েছে বলে একাধিক প্রতিবেদন পাওয়া যায়।</p>', '1002_one_60001537eede6.jpeg', '1002_two_6000153bb6483.jpeg', '1002_three_6000153e5138d.jpeg', 23, 13, 1, 233, 444, 0, 0, 0, '2023-12-30', 0, 1, 0, 0, 1, 0, 0, '2023-01-14 09:56:15', '2023-01-19 10:16:20'),
(50, 1002, 5, 1, 'Honululu', '<p>Hello </p>', '1002_one_600015a97f153.jpeg', NULL, NULL, 20, 4, 1, 209, 900, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-14 09:58:04', '2023-01-14 09:58:04'),
(52, 1010, 11, 11, 'The exclamation point after write-quit is to override the read-only status of the file.', '<p><span style=\"background-color: rgb(255, 255, 255); color: rgba(109, 122, 140, 0.9);\">The exclamation point after write-quit is to override the read-only status of the file.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(109, 122, 140, 0.9);\">The exclamation point after write-quit is to override the read-only status of the file.The exclamation point after write-quit is to override the read-only status of the file.</span></p>', '1010_one_6000223e9aa44.jpeg', '1010_two_6000223f2cb44.jpeg', NULL, 25, 15, 1, 1500, 2500, 0, NULL, 1009, '2023-12-30', 0, 1, 1, 0, 1, 0, 0, '2023-01-14 10:51:43', '2023-02-07 11:50:35'),
(53, 1009, 13, 8, 'আমার ২ টা এনা বাস লাগবে ঢাকা - লন্ডন', '<p>আমার বাংলা নিয়ে প্রথম কাজ করবার সুযোগ তৈরি হয়েছি<a href=\"http://www.omicronlab.com/avro-keyboard.html\" rel=\"noopener noreferrer\" target=\"_blank\">অভ্র^</a> নামক এক যুগান্তকারী বাংলা সফ্‌টওয়্যার হাতে পাবার মধ্য দিয়ে। এর পর একে একে বাংলা উইকিপিডিয়া, ওয়ার্ডপ্রেস বাংলা কোডেক্সসহ বিভিন্ন বাংলা অনলাইন পত্রিকা তৈরির কাজ করতে করতে বাংলার সাথে নিজেকে বেঁধে নিয়েছি আষ্টেপৃষ্ঠে। বিশেষ করে অনলাইন পত্রিকা তৈরি করতে ডিযাইন করার সময়, সেই ডিযাইনকে কোডে রূপান্তর করবার সময় বারবার অনুভব করেছি কিছু নমুনা লেখার। যে লেখাগুলো ফটোশপে বসিয়ে বাংলায় ডিযাইন করা যাবে, আবার সেই লেখাই অনলাইনে ব্যবহার করা যাবে। কিন্তু দুঃখজনক হলেও সত্য যে, ইংরেজিতে লাতিন Lorem Ipsum… সূচক নমুনা লেখা (dummy texts) থাকলেও বাংলা ভাষায় এরকম কোনো লেখা নেই। তাই নিজের তাগিদেই বাংলা ভাষার জন্য প্রথম নমুনা লেখা তৈরি করলাম, এ হলো বাংলা Lorem ipsum&nbsp;– কিন্তু তার অনুবাদ নয়। আমি একে নামকরণ করেছি:<strong>অর্থহীন লেখা!</strong>ল </p>', '1009_one_6003c703a466f.jpeg', '1009_two_6003c7047a2ff.jpeg', NULL, 2, 13, 1, 3200, 4000, 0, 0, 1015, '2023-12-30', 0, 5, 1, 1, 1, 0, 0, '2023-01-17 05:11:32', '2023-01-28 12:36:53'),
(54, 1009, 12, 8, 'নিন্মে বর্ণিত ছেলেটিকে মারার জন্যে ২ জন গুন্ডা দরকার', '<p>ছেলেটির গায়ের রং সিরাজুদ্দোলার মত তাকে সোনাগাজী দেশে পাওয়া যাবে ।</p><p>আমার ২ জন গুন্ডা লাগবে তারে মারার জন্যে </p><p><br></p>', '1009_one_6003cc4205845.jpeg', NULL, NULL, 2, 4, 1, 3000, 6000, 0, 0, 1002, '2023-12-30', 0, 3, 1, 1, 1, 0, 0, '2023-01-17 05:33:54', '2023-01-28 12:29:49'),
(55, 1010, 10, 11, 'hfhfuhj kjhgkj', '<p>gstyuhik</p>', '1010_one_6004021417e0b.jpeg', '1010_two_600402169db4a.jpeg', NULL, 89, 1, 1, 788, 999, 0, NULL, 1002, '2023-12-30', 0, 1, 1, 0, 1, 0, 0, '2023-01-17 09:23:41', '2023-02-07 11:48:42'),
(56, 1002, 8, 1, 'Ilish Lagbe', NULL, '1002_one_60053f0d5fa94.jpeg', NULL, NULL, 34, 1, 1, 33, 44, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-18 07:55:58', '2023-01-18 07:55:58'),
(57, 1002, 10, 1, 'ss', '<p>shassss</p>', '1002_one_600547356edc8.jpeg', NULL, NULL, 44, 13, 1, 34, 55, 0, 0, 0, '2023-12-30', 0, 1, 0, 0, 1, 0, 0, '2023-01-18 08:30:45', '2023-01-19 07:13:40'),
(58, 1002, 13, 1, 'ssfsdfsd', '<p>sfsfs</p>', '1002_one_60054dfa550aa.jpeg', NULL, NULL, 3, 14, 1, 444, 666, 0, NULL, 1006, '2023-12-30', 0, 2, 1, 1, 1, 0, 0, '2023-01-18 08:59:38', '2023-02-01 11:15:57'),
(59, 1002, 10, 1, 'shakhawat hossain', '<p>Hello Lorem ispum dolor </p>', NULL, NULL, NULL, 33, 13, 1, 55, 66, 0, NULL, 1014, '2023-12-30', 0, 1, 1, 1, 1, 0, 0, '2023-01-18 09:08:09', '2023-02-01 11:14:51'),
(60, 1013, 9, 3, 'Hello i am John abraham lorem ispum', '<p>i need this pc trable </p>', '1013_one_6006aa9f4a624.jpeg', NULL, NULL, 55, 14, 1, 55, 66, 0, 0, 0, '2023-12-30', 0, 1, 0, 0, 1, 0, 0, '2023-01-19 09:47:12', '2023-01-19 10:44:41'),
(61, 1002, 9, 1, 'sss', '<p>মানুষটিকে সচরাচর কেউ হাসতে দেখেননি। প্রখ্যাত ফটোসাংবাদিক লুৎফর রহমান বীণু শুধু একটি ছবি তুলতে পেরেছিলেন যেখানে তাকে হাসতে দেখা যায়। কঠোর, কঠিন এক সৈনিকের ছায়া ছিল মানুষটির মুখাবয়বে, চলায়, আচরণে। তার পরও কী যে হলো? মাত্র বছরচারেক রাজনীতির মাঠে থেকে কাঁপিয়ে গেলেন পুরো দেশ, রেখে গেলেন একসমুদ্র ভালোবাসা। ত্রিশ, চল্লিশ, পঞ্চাশ বছর রাজনীতিতে এপথ-ওপথ করে যারা যেটুকু জনপ্রিয়তা, গ্রহণযোগ্যতা ও সর্বোপরি জাতিগত, কৌশলগত দিকনির্দেশনা দিয়ে যেতে পেরেছেন, চার বছরের রাজনীতি অনেক ক্ষেত্রেই তা ছাপিয়ে গেছে। এ এক বিস্ময়, মেসমেরাইজিং এক নেতৃত্বের অবাক করা বাস্তবতার ইতিহাস।</p>', '1002_one_6007b4524ba34.jpeg', NULL, NULL, 44, 4, 1, 33, 55, 0, 0, 1009, '2023-12-30', 0, 2, 1, 1, 1, 0, 0, '2023-01-20 04:40:50', '2023-01-28 12:33:04'),
(62, 1014, 8, 11, 'amar ekti led tv dorkar', '<p><span style=\"background-color: rgb(20, 21, 24); color: rgb(154, 160, 166);\">Screen Size: 50′′ Display Format: UHDTV Aspect Ratio: 16:10 Wide Screen: Wide Screen Backlight: LED Display: TFT-LCD</span></p>', '1014_one_6007c00c39230.jpeg', NULL, NULL, 5, 0, 1, 50000, 70000, 0, 0, 0, '2023-12-30', 0, 2, 0, 0, 1, 1, 0, '2023-01-20 05:30:53', '2022-02-15 07:07:56'),
(63, 1014, 10, 11, 'Trendy Cotton Casual Half Sleeve Printed T-Shirt for Menen(null)', '<p>Cosmic Mart is a trusted and reliable source for all your garment related needs from Bangladesh. Cosmic Mart manufactures and supplies quality products in all categories at a competitive price range from their own and sister production facility. It\'s a 100% cotton t-shirt with a premium finishing goods.</p><p><br></p><p><br></p>', '1014_one_6007ca5fb0361.jpeg', NULL, NULL, 8, 0, 1, 70, 100, 0, 0, 0, '2023-12-30', 0, 2, 0, 0, 1, 0, 0, '2023-01-20 06:14:56', '2023-02-03 09:34:34'),
(65, 1014, 10, 11, 'Custom Tshirt Printing With Your Photo and Text (White Round Neck) - M, L, XL', '<p><strong>**আপনি যদি এই টিশার্টটি অর্ডার করেন তাহলে আমাদেরকে অবশ্যই আপনার পছন্দের ছবি, লেখা, যেকোনো ডিজাইন বা লোগো দারাজের Chat/Chat Now তে ক্লিক করে মেসেজ করে পাঠাবেন যা আপনি টিশার্টে প্রিন্ট করে নিতে চাচ্ছেন। যদি আমরা আপনার কাছ থেকে কোন মেসেজ/রিপ্লাই না পাই তাহলে অর্ডারটি নির্ধারিত সময়ের পর বাতিল হয়ে যাবে। **</strong><span style=\"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);\">স্কুল, কলেজ, র‍্যাগ ডে , গিফট বা আপনার যে কোনো প্রয়োজনে আপনি আপনার মনের মতো</span><strong>টিশার্ট এখন হাতের মুঠোয় ।অর্ডার করার আগে আমাদের সাথেChat/Chat Now এর মাধ্যমে কথা বলে নিবেন । যে কোনো কিছু আপনি আপনারটিশার্ট এ দিতে পারবেন ।কিছু নিম্নলিখিতজিনিস আপনার ছবি দেওয়ার আগে লক্ষ্য রাখতে হবে১. ছবির সাইজ JPEG / PNG / PSD ফাইলে শেয়ার করতে পারবেন ।২.JPEG ফাইল শেয়ার করলে রেসুলেশন ভালো হতে হবে, না হলে প্রিন্ট ভাল হবে না ।৩. ফাইল শেয়ার করে ফটো আমাদের দিক থেকে অকে থাকলে অডার করবেন ।</strong></p><p><strong>*</strong></p><p><br></p>', '1014_one_6007e06f06b56.jpeg', '1014_two_6007e06f230be.jpeg', '1014_three_6007e06f59940.jpeg', 6, 0, 1, 100, 150, 0, 0, 0, '2023-12-30', 0, 2, 0, 0, 1, 0, 0, '2023-01-20 07:49:03', '2023-02-02 12:38:19'),
(66, 1014, 9, 11, 'আমি ঢাকা থেকে ফেনী যাবো। আমার একটা বাস দরকার।', '<p><span style=\"color: rgb(146, 147, 151);\">স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন স্টার লাইন </span></p>', '1014_one_6009092c59425.jpeg', '1014_two_6009092d07393.jpeg', NULL, 1, 0, 1, 5000, 5500, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-21 04:55:09', '2023-01-21 04:55:09'),
(67, 1014, 9, 11, 'আমি ফেনী থেকে ঢাকা যাবো। আমার একটা হেলিকাপ্টার দরকার।', '<p><span style=\"color: rgb(146, 147, 151);\">অবশ্যই হ্যালিকাপ্টার VIP হতে হবে, পিক্সট টাইমে আমাকে পিক করতে হবে।অবশ্যই হ্যালিকাপ্টার VIP হতে হবে, পিক্সট টাইমে আমাকে পিক করতে হবে।অবশ্যই হ্যালিকাপ্টার VIP হতে হবে, পিক্সট টাইমে আমাকে পিক করতে হবে।অবশ্যই হ্যালিকাপ্টার VIP হতে হবে, পিক্সট টাইমে আমাকে পিক করতে হবে।অবশ্যই হ্যালিকাপ্টার VIP হতে হবে, পিক্সট টাইমে আমাকে পিক করতে হবে।</span></p>', '1014_one_60090a582e989.jpeg', '1014_two_60090a584aec4.jpeg', NULL, 1, 14, 0, NULL, NULL, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-21 05:00:08', '2023-01-21 05:00:08'),
(68, 1014, 9, 11, 'আমি ঢাকা থেকে কক্সবাজার যাবো, আমার একটি রিজার্ব বাস দরকার।', '<p><span style=\"color: rgb(146, 147, 151);\">আমাকে সঠিক টাইমে পিক করতে হবে।আমাকে সঠিক টাইমে পিক করতে হবে।আমাকে সঠিক টাইমে পিক করতে হবে।আমাকে সঠিক টাইমে পিক করতে হবে।আমাকে সঠিক টাইমে পিক করতে হবে।আমাকে সঠিক টাইমে পিক করতে হবে।আমাকে সঠিক টাইমে পিক করতে হবে।আমাকে সঠিক টাইমে পিক করতে হবে।</span></p>', '1014_one_60090b61e2bf1.jpeg', NULL, NULL, 1, 14, 0, 1, NULL, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-21 05:04:34', '2023-01-21 05:04:34'),
(69, 1015, 13, 11, 'আমি একটা বাইক নিবো। শুধুমাত্র তারাই বিড করুন, যারা ভালো মানের বাইক দিতে পারবেন।', NULL, '1014_one_60090bed7b895.jpeg', NULL, NULL, 1, 14, 0, NULL, NULL, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-21 05:06:53', '2023-01-21 05:06:53'),
(70, 1014, 13, 11, 'আমি চন্দ্র গ্রহে যাবো। আমার একটা রকেট দরকার।', '<p><span style=\"color: rgb(146, 147, 151);\">VIP রকেট দিতে হবে।VIP রকেট দিতে হবে।VIP রকেট দিতে হবে।VIP রকেট দিতে হবে।VIP রকেট দিতে হবে।VIP রকেট দিতে হবে।VIP রকেট দিতে হবে।VIP রকেট দিতে হবে।VIP রকেট দিতে হবে।</span></p>', '1014_one_60090c8bdb9aa.jpeg', NULL, NULL, 1, 14, 0, NULL, NULL, 0, 0, 0, '2023-12-30', 0, 2, 0, 0, 1, 0, 0, '2023-01-21 05:09:31', '2023-01-26 07:59:39'),
(71, 1014, 8, 11, 'আমার ১০ টিভি দরকার।', '<p><span style=\"color: rgb(146, 147, 151);\">TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV TV </span></p>', '1014_one_60090e26d6cfc.jpeg', '1014_two_60090e290ef2d.jpeg', '1014_three_60090e291d852.jpeg', 10, 0, 0, NULL, NULL, 0, NULL, 1002, '2023-12-30', 0, 1, 1, 0, 1, 0, 0, '2023-01-21 05:16:25', '2023-02-02 05:23:23'),
(72, 1014, 11, 11, 'আমার আর্ট পেন লাগবে।', '<p><span style=\"color: rgb(146, 147, 151);\">art penart penart penart penart penart penart penart penart penart penart penart penart penart penart penart penart penart penart penart penart penart penart penart penart pen</span></p>', '1014_one_60090f43f17e6.jpeg', '1014_two_60090f448e78d.jpeg', NULL, 50, 0, 0, NULL, NULL, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-21 05:21:08', '2023-01-21 05:21:08'),
(73, 1014, 11, 11, 'আমার খাতা দরকার।', '<p>খাতা দরকার।</p>', '1014_one_6009179cd1959.jpeg', '1014_two_6009179f5c6c8.jpeg', '1014_three_600917a050f1a.jpeg', 7, 0, 1, 500, 600, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-21 05:56:51', '2023-01-21 05:56:51'),
(74, 1014, 11, 11, 'গার্ল ফ্রেন্ড এর বার্ডডে তে বই গিপ্ট দিতে চাচ্ছি। আমার কিছু ইসমামিক বই দরকার।', '<p><span style=\"color: rgb(146, 147, 151);\">ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।ইসলামিক বই।</span></p>', '1014_one_6009196f53984.jpeg', NULL, NULL, 10, 0, 0, NULL, NULL, 0, NULL, 1015, '2023-12-30', 0, 1, 1, 1, 1, 0, 0, '2023-01-21 06:04:31', '2023-02-02 05:17:06'),
(75, 1015, 11, 11, 'আমার স্টেশনারি জিনিসপত্র দরকার।', '<p><span style=\"color: rgb(146, 147, 151);\">stationery stationery stationery stationery stationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationery stationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationerystationery stationery stationery stationery</span></p>', '1014_one_60091a7808576.jpeg', '1014_two_60091a7b670b4.jpeg', '1014_three_60091a7e9dea1.jpeg', 80, 0, 0, NULL, NULL, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-21 06:09:02', '2023-01-21 06:09:02'),
(76, 1014, 11, 11, 'আমার অফিস ফাইল দরকার।', NULL, NULL, NULL, NULL, 100, 0, 1, 60, 70, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-21 06:12:06', '2023-01-21 06:12:06'),
(77, 1014, 11, 11, 'আমার অফিসের কলম দরকার।', NULL, '1014_one_60091bdb40580.jpeg', '1014_two_60091bdb9cc6b.jpeg', '1014_three_60091bdc0c4b7.jpeg', 20, 0, 1, 5, 10, 0, 0, 0, '2023-12-30', 0, 1, 0, 0, 1, 0, 0, '2023-01-21 06:14:55', '2023-03-07 11:14:48'),
(78, 1015, 11, 11, 'আমার কিছু ইসলামিক বই দরকার। ১০০ টাকার মধ্য যারা পারবেন তারা বিড করুন', '<p>শুধুমাত্র তারাই বিড করুন , যারা ১০০ টাকার মধ্য দিতে পারবেন।<span style=\"color: rgb(146, 147, 151);\">শুধুমাত্র তারাই বিড করুন , যারা ১০০ টাকার মধ্য দিতে পারবেন।শুধুমাত্র তারাই বিড করুন , যারা ১০০ টাকার মধ্য দিতে পারবেন।শুধুমাত্র তারাই বিড করুন , যারা ১০০ টাকার মধ্য দিতে পারবেন।শুধুমাত্র তারাই বিড করুন , যারা ১০০ টাকার মধ্য দিতে পারবেন।শুধুমাত্র তারাই বিড করুন , যারা ১০০ টাকার মধ্য দিতে পারবেন।শুধুমাত্র তারাই বিড করুন , যারা ১০০ টাকার মধ্য দিতে পারবেন।শুধুমাত্র তারাই বিড করুন , যারা ১০০ টাকার মধ্য দিতে পারবেন।</span></p>', '1014_one_60091f703b080.jpeg', '1014_two_60091f7088164.jpeg', '1014_three_60091f708ee3d.jpeg', 100, 0, 1, 99, 100, 0, 0, 0, '2023-12-30', 0, 1, 0, 0, 1, 0, 0, '2023-01-21 06:30:08', '2023-01-27 10:12:10'),
(79, 1014, 10, 11, 'আমার ৫০০ টা T-Shirt লাগবে, কে দিতে পারবেন?', '<p><span style=\"color: rgb(146, 147, 151);\">t-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirtt-shirt</span></p>', '1014_one_6009208d7d422.jpeg', NULL, NULL, 500, 0, 1, 99, 100, 0, 0, 0, '2023-12-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-21 06:34:58', '2023-01-21 06:34:58'),
(80, 1015, 10, 11, 'SELLING FAST New Look striped t-shirt with print in navy', '<p>Refresh your wardrobe with the Chest Logo T Shirt from&nbsp;<a href=\"https://www.houseoffraser.co.uk/paul-and-shark\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 0, 0);\"><strong>Paul and Shark</strong></a>. Crafted in a soft cotton construction, this t shirt features a ribbed crew neck, short sleeves and elasticated trims. The look is finished with the brand\'s signature logo embroidered to the chest.</p><ul><li>Size selection: Standard sizing</li><li>Fits true to size, take your normal size</li><li>Cut in a regular fit</li><li>100% Cotton</li><li>Machine washable at 30 degrees</li><li>Keep away from fire</li></ul><p><br></p>', '1014_one_60092194e8756.jpeg', '1014_two_600921955c10e.jpeg', '1014_three_60092195ae7ff.jpeg', 15, 0, 1, 25, 50, 0, 6400, 1010, '2023-12-30', 0, 1, 1, 1, 1, 0, 0, '2023-01-21 06:39:17', '2023-01-31 11:32:24'),
(81, 1009, 11, 8, 'I need this ukele', '<p>Hello i need this uekele for my business</p><p>hello </p>', '1009_one_600e504d93dc3.jpeg', '1009_two_600e504eb41ac.jpeg', NULL, 3, 13, 1, 44, 444, 0, 0, 0, '2023-12-30', 0, 1, 0, 0, 1, 0, 0, '2023-01-25 04:59:58', '2023-03-07 11:13:08');
INSERT INTO `demands` (`id`, `user_id`, `category_id`, `area_id`, `title`, `description`, `image_one`, `image_two`, `image_three`, `quantity`, `quantity_unit_id`, `budget_type`, `minimum_budget`, `maximum_budget`, `fixed_budget`, `confirmed_amount`, `confirmed_to`, `expire_date`, `total_like`, `total_bid`, `bid_status`, `is_done`, `status`, `sms_status`, `notification_status`, `created_at`, `updated_at`) VALUES
(82, 1008, 8, 8, 'simply d1008ummy text of the printing and typesetting industry', 'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries', '1002_one_60114e5ab3e22.jpeg', NULL, NULL, 54, 3, 0, 5899, 6488, 0, NULL, 1009, '2023-11-30', 0, 1, 1, 1, 1, 0, 0, '2023-01-27 11:28:27', '2023-04-01 05:10:19'),
(83, 1010, 9, 8, 'SELLING FAST New Look striped t-shirt with print in navy', '<p>Hey,</p><p>Recently project is survey dashboard is designed to make your survey results for the customer. survey data allows users to explore and filter survey items. we are really happy to share those things. I hope that you will like the design work.</p><p>if you want to take your small business to the next level. I\'m here get in touch so we can discuss your requirements.</p><p>Recently project is survey dashboard is designed to make your survey results for the customer. survey data allows users to explore and filter survey items. we are really happy to share those things. I hope that you will like the design work.</p><p>if you want to take your small business to the next level. I\'m here get in touch so we can discuss your requirements.</p><p>Don\'t forget to press L</p><p><br></p><p><br></p>', '1010_one_60129c4c87957.jpeg', '1010_two_60129c4d76946.jpeg', '1010_three_60129c512a7aa.jpeg', 5222871878978, 14, 1, 55555555, 5555555555, 0, NULL, 1002, '2023-11-30', 0, 1, 1, 0, 1, 0, 0, '2023-01-28 11:13:21', '2023-02-02 12:18:49'),
(84, 1009, 5, 8, 'i need this shirt will be exact same', '<p>Hello people i need this arifuggaman shirt</p>', '1009_one_6016389a2ede1.jpeg', '1009_two_6016389ae121b.jpeg', NULL, 12, 3, 1, 233, 444, 0, 0, 0, '2023-11-30', 0, 0, 0, 0, 1, 0, 0, '2023-01-31 04:56:59', '2023-01-31 04:56:59'),
(85, 1015, 5, 8, 'i need this t shirt for tour', '<p>lorem ispum dolor </p>', '1009_one_601a5f444a8f3.jpeg', '1009_two_601a5f4504acb.jpeg', NULL, 20, 3, 1, 3000, 4000, 0, NULL, 1002, '2023-11-30', 0, 1, 1, 1, 1, 0, 0, '2023-02-03 08:31:01', '2023-02-03 08:33:51'),
(87, 1012, 13, 3, 'noakhali jabar jonnno hiace dorkar', NULL, NULL, NULL, NULL, 1, 14, 1, 5000, 5000, 0, NULL, 1002, '2023-11-30', 0, 2, 1, 1, 1, 0, 0, '2023-02-04 12:20:36', '2023-02-04 12:25:37'),
(88, 1009, 9, 8, 'ami ai biral ta dekhte jaite chai', '<p>আমার গিগটি দেখার জন্য আপনাকে ধন্যবাদ। আপনি গিগটি অর্ডার করার আগে চাইলে আমার সাথে ম্যাসেজে কথা বলে নিতে পারেন। ম্যাসেজে কথা বলার জন্য \'ম্যাসেজ করুন\' বাটন থেকে আমাকে ম্যাসেজ পাঠাতে পারবেন।</p>', '1009_one_601bebc0c7945.jpeg', NULL, NULL, 33, 3, 1, 22, 33, 0, NULL, 1002, '2023-11-30', 0, 1, 1, 1, 1, 0, 0, '2023-02-04 12:42:46', '2023-02-07 10:43:50'),
(89, 1010, 12, 8, 'I need an excavetor for gazipur', '<p>Hellonlorem </p>', '1010_one_601fa7a1bc455.jpeg', NULL, NULL, 2, 13, 1, 220, 320, 0, NULL, 1006, '2023-11-30', 0, 3, 1, 0, 1, 1, 0, '2023-02-07 08:41:09', '2022-03-16 10:13:43'),
(90, 1008, 8, 8, '1008I need this electronics data for lorem ispum odlor', '<p>hello this is bid details </p>', '1009_one_6020c9bd0b56c.jpeg', NULL, NULL, 23, 13, 1, 344, 555, 0, NULL, 0, '2023-11-30', 0, 1, 1, 1, 1, 0, 0, '2023-02-08 05:18:54', '2023-03-31 10:43:53'),
(91, 1002, 11, 3, 'I need this images product', '<p>Hey lorem ispum dolor</p>', '1002_one_6020d147e6fa3.jpeg', NULL, NULL, 2, 13, 1, 220, 320, 0, 0, 0, '2023-11-30', 0, 0, 0, 0, 1, 0, 0, '2023-02-08 05:51:05', '2023-02-08 05:51:05'),
(92, 1002, 5, 3, 'Need t shirt which imran wear', '<p>Hello lorem </p>', '1002_one_6020d1b04c2d6.jpeg', NULL, NULL, 3, 3, 1, 344, 554, 0, 0, 0, '2023-11-30', 0, 1, 0, 0, 1, 0, 0, '2023-02-08 05:52:50', '2023-03-31 09:33:43'),
(93, 1008, 9, 8, 'i need this nature', '<p>nature image lorem ispum</p><p>dolor suit imor</p><p>simply </p>', '1008_one_61fbacef8896d.jpeg', NULL, NULL, 3, 14, 1, 34444, 55555, 0, NULL, 1010, '2022-03-24', 0, 1, 1, 1, 1, 1, 0, '2023-02-08 05:54:53', '2022-03-20 13:07:18'),
(94, 1015, 10, 8, 'hudai one demand1008', '<p>hey 8 mb image </p>', '1009_one_6020d35c0893b.jpeg', NULL, NULL, 12, 13, 1, 34444, 55555, 0, 0, 0, '2023-11-30', 0, 1, 0, 0, 1, 0, 0, '2023-02-08 05:59:59', '2023-03-08 11:52:07'),
(95, 1008, 9, 3, 'Amar ai kocchop ta lagbe1008', '<p>Hello i need this kocchop for lorem</p><p>ispum</p><p>dolor </p><p>suit imor simply dmunny text</p>', '1002_one_6020dcf7dfa32.jpeg', NULL, NULL, 12, 14, 1, 344, 555, 0, 0, 0, '2023-11-30', 0, 1, 0, 0, 1, 1, 0, '2023-02-08 06:41:00', '2023-07-19 17:15:23'),
(96, 1008, 9, 8, 'need a car for tour', '<p>Well, that won\'t work the way I want. It will not allow me to set the end date to be the same as start date. It will only accepts dates older than start_date.</p>', '1008_one_61fbac905ccba.jpeg', '1005_two_60448fefc16fc.jpeg', NULL, 2, 3, 1, 1200, 1499, 0, 0, 0, '2022-10-20', 0, 0, 0, 0, 1, 0, 0, '2023-03-07 08:33:51', '2022-02-03 10:21:04'),
(97, 1015, 9, 8, 'dxfhhfg dfhggdhdfg fghfghdfdfg1008', 'Stop slacking, start rocking. Rock is an intuitive messaging and collaboration tool that is purpose-built for remote work.', '1008_one_605c89de64877.jpeg', NULL, NULL, 7, 3, 1, 456, 645, 0, 0, 0, '2023-11-30', 0, 2, 0, 0, 1, 1, 0, '2023-03-25 13:02:25', '2022-03-16 09:43:27'),
(98, 1008, 10, 8, 'It is a long established fact that a reader', '<p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text</p>', '1008_one_61fbad4694449.jpeg', NULL, NULL, 32, 7, 0, 2300, 4500, 0, NULL, 1010, '2022-04-23', 0, 1, 1, 1, 1, 1, 0, '2023-03-31 08:26:56', '2022-02-03 12:21:59'),
(99, 1015, 8, 8, 'sdf dsf1008', 'df', '1010_demand_60b489cb4e1f3.jpeg', NULL, NULL, 1, 1, 1, 1, 2, 0, 0, 0, '2023-11-30', 0, 1, 0, 0, 1, 0, 0, '2023-05-31 07:01:47', '2023-06-02 12:05:41'),
(100, 1008, 12, 3, '1008ei rokom ekta haas kinte chai manush  korar jonno', 'I saw your profile online and wanted to reach out! You might be a great fit for many of the remote software engineering roles that top U.S. companies are hiring for on Turing.', '1016_demand_60b7733f976d8.jpeg', NULL, NULL, 2, 0, 1, 199, 298, 0, NULL, 1015, '2023-11-30', 0, 6, 1, 1, 1, 0, 0, '2023-06-02 12:04:31', '2022-08-25 21:13:21'),
(101, 1015, 11, 9, 'Le lo boro anaros1008', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '1015_demand_60bf318f2601f.jpeg', NULL, NULL, 3, 1, 1, 78, 95, 0, NULL, 1008, '2023-11-30', 0, 5, 1, 0, 1, 1, 0, '2023-06-08 09:01:48', '2022-09-21 15:34:30'),
(102, 1008, 13, 9, 'misty color kurti niya lapao1008', 'combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '1015_demand_60bf324073e41.jpeg', NULL, NULL, 6, 14, 1, 675, 1036, 0, NULL, 1010, '2023-11-30', 0, 4, 1, 0, 1, 1, 0, '2023-06-08 09:04:34', '2022-02-03 13:04:19'),
(103, 1015, 11, 9, 'Mosur daal sell hobe, rukho, lelo daal1008', 'With your permission we and our partners may use precise geolocation data and identification through device scanning. You may click to consent to our and our partners’ processing as described above.', '1015_demand_60c72e7756a76.jpeg', NULL, NULL, 1, 1, 1, 110, 140, 0, 0, 0, '2023-11-30', 0, 7, 0, 0, 1, 1, 0, '2023-06-14 10:26:22', '2022-03-20 08:24:20'),
(104, 1008, 8, 11, 'Narikel er daav1008', '<p>জেনে রেখো তোমার মুখের দিকে চেয়ে পাথর বেঁধেছি এ বুকে</p><pre class=\"ql-syntax\" spellcheck=\"false\">if($route.path == \'/\') {\n   //following 2 line code are sample code here put your need codes\n   this.isLogin = false;\n   this.user_full_name = \'My Account\';\n} else {\n   // this.$router.push(\"/\");\n   this.$router.push({ path: \'/\'} );\n}\n</pre><p><br></p>', '1015_demand_60cb0db92cbd0.jpeg', NULL, NULL, 1, 1, 1, 157, 189, 0, 0, 0, '2023-11-30', 0, 4, 0, 0, 1, 1, 0, '2022-02-19 08:56:44', '2022-03-16 07:17:07'),
(105, 1008, 5, 8, '1st this posted by arifuzzaman 1008', '<p>fgdfgdhg dsgfhd rdgfgh dfgdfgertert sdffgdhdd srrdrgdsfgsfgdfdg srgdfgfdg dsggdfg dsfgfdgdfg dsfgdfgfd sgfdgfdgsdterhhsdffd drfsfgfghgfg srdggh dfggh</p>', '1008_demand_60e4be2f32a64.jpeg', NULL, NULL, 1, 1, 1, 322, 433, 0, NULL, 1012, '2023-11-30', 0, 14, 1, 1, 1, 0, 0, '2023-07-06 20:34:41', '2023-12-02 12:40:08'),
(106, 1008, 14, 8, '2nd this posted by arifuzzaman1008', '<p>vn fxggfg fghuytgf ghnt fghfgjj . its rainy day.</p>', '1008_demand_60e52ad475877.jpeg', NULL, NULL, 2, 7, 1, 545, 675, 0, 0, 0, '2023-11-30', 0, 9, 0, 0, 1, 1, 0, '2022-02-22 14:18:17', '2022-03-16 06:05:20'),
(107, 1008, 13, 8, '3rd this posted by arifuzzaman 1008', '<p>the medicine was made by bangladesh, it use for come back from fever</p>', '1008_demand_60e52b2288794.jpeg', NULL, NULL, 2, 14, 1, 45, 46, 0, 0, 0, '2023-11-30', 0, 14, 0, 0, 1, 0, 0, '2023-07-07 04:20:14', '2023-07-19 20:07:04'),
(108, 1015, 12, 11, 'need some big fish, like wk', '<p>dghfgg fghdfgg dhdfgfg dfghdffgh dhgfggh dhfhgd dffghdtyert</p>', '1015_demand_6113804c37572.jpeg', NULL, NULL, 5, 1, 1, 3534, 3960, 0, NULL, 1029, '2023-12-30', 0, 4, 1, 0, 1, 1, 0, '2023-08-11 07:50:59', '2022-09-05 00:18:46'),
(109, 1010, 5, 3, 'sdfasdf', '<p>sdaf fasdfdsa</p><p>dsf</p><p> dsa</p>', NULL, NULL, NULL, 2, 4, 1, 12, 3555, 0, NULL, 1008, '2023-11-06', 0, 1, 1, 1, 1, 1, 0, '2023-10-31 09:13:23', '2022-02-02 11:13:56'),
(110, 1010, 13, 3, 'adfs f df', '<p>sfg fdsg fdgdf f sg gs</p>', '1010_demand_61f8c824be8c5.jpeg', '1010_demand_61f8c826acbaf.jpeg', '1010_demand_61f8c8328c474.jpeg', 2, 1, 1, 123, 456, 0, NULL, 1008, '2022-02-28', 0, 1, 1, 1, 1, 1, 0, '2022-02-01 05:42:41', '2022-02-02 10:22:39'),
(111, 1010, 11, 3, 'tghh btyu', 'Gyuu ghj', NULL, NULL, NULL, 56, 0, 1, 566, 56663, 0, 0, 0, '2022-3-31', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:03:08', '2022-03-20 10:03:08'),
(112, 1010, 11, 3, 'tghh btyu', 'Gyuu ghj', NULL, NULL, NULL, 56, 0, 1, 566, 56663, 0, 0, 0, '2022-3-31', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:03:14', '2022-03-20 10:03:14'),
(113, 1010, 11, 3, 'tghh btyu', 'Gyuu ghj', NULL, NULL, NULL, 56, 0, 1, 566, 56663, 0, 0, 0, '2022-3-31', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:04:09', '2022-03-20 10:04:09'),
(114, 1010, 5, 3, 'Fg gh', 'Hh', NULL, NULL, NULL, 85, 0, 1, 896, 36685, 0, 0, 0, '2022-6-30', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:06:10', '2022-03-20 10:06:10'),
(115, 1010, 5, 3, 'Fg gh', 'Hh', '1010_demand_6236fcff7f6dc.jpeg', NULL, NULL, 85, 0, 1, 896, 36685, 0, 0, 0, '2022-6-30', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:09:05', '2022-03-20 10:09:05'),
(116, 1010, 5, 3, 'Fg gh', 'Hh', '1010_demand_6236fd2371054.jpeg', NULL, NULL, 85, 0, 1, 896, 36685, 0, 0, 0, '2022-6-30', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:09:06', '2022-03-20 10:09:06'),
(117, 1010, 5, 3, 'Fg gh', 'Hh', '1010_demand_6236fd2ae8df1.jpeg', NULL, NULL, 85, 0, 1, 896, 36685, 0, 0, 0, '2022-6-30', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:09:06', '2022-03-20 10:09:06'),
(118, 1010, 5, 3, 'Fg gh', 'Hh', '1010_demand_6236fd50972a2.jpeg', NULL, NULL, 85, 0, 1, 896, 36685, 0, 0, 0, '2022-6-30', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:09:23', '2022-03-20 10:09:23'),
(119, 1015, 5, 11, 'need pair shoe', 'lorem ispam is simply dummy text of the printing and typesittting', NULL, NULL, NULL, 56, 3, 1, 5963, 6354, 0, 0, 0, '2022-4-20', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:12:28', '2022-03-20 10:12:28'),
(120, 1015, 8, 11, 'rftd ghjhdffjgh ghjfh ftgyjtygn fhjghdfhy', 'gjhgh ghkjgfhjh hjkfghry jklryhui gjktrryuk tgkhujrsty67f tryjguhhr ghjghhf', '1015_demand_623701bc15109.jpeg', '1015_demand_623701d1d6cc7.jpeg', NULL, 65, 2, 1, 756, 834, 0, 0, 0, '2022-4-28', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:29:50', '2022-03-20 10:29:50'),
(121, 1015, 8, 11, 'ftyu ghjghhg ghjdfgjh fhjdfgh', 'hello guys!! welcome to my modi dokan.', NULL, NULL, NULL, 6, 14, 0, NULL, NULL, 0, 0, 0, '2022-4-27', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:38:24', '2022-03-20 10:38:24'),
(122, 1015, 8, 11, 'ftyu ghjghhg ghjdfgjh fhjdfgh', 'hello guys!! welcome to my modi dokan.', NULL, NULL, NULL, 6, 14, 0, NULL, NULL, 0, 0, 0, '2022-4-27', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:40:19', '2022-03-20 10:40:19'),
(123, 1015, 8, 11, 'ftyu ghjghhg ghjdfgjh fhjdfgh', 'hello guys!! welcome to my modi dokan.', NULL, NULL, NULL, 6, 14, 0, NULL, NULL, 0, 0, 0, '2022-4-27', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:44:50', '2022-03-20 10:44:50'),
(124, 1015, 8, 11, 'ftyu ghjghhg ghjdfgjh fhjdfgh', 'hello guys!! welcome to my modi dokan.', NULL, NULL, NULL, 6, 14, 0, NULL, NULL, 0, 0, 0, '2022-4-27', 0, 1, 0, 0, 1, 1, 0, '2022-03-20 10:46:11', '2022-03-20 12:55:32'),
(125, 1015, 11, 11, 'jkfdgghhg ghjfdg asertuyur ghjuyrft fghgh', 'fghdgghd fghdfhfghsfh rfhsdtghghjsdf fgfdgjh ryuyrse wsttyxcgvghjm fjfsddffhfg rfjfgdasttyj', NULL, NULL, NULL, 87, 1, 0, NULL, NULL, 0, 0, 0, '2022-4-30', 0, 0, 0, 0, 1, 0, 0, '2022-03-20 10:50:13', '2022-03-20 10:50:13'),
(126, 1010, 9, 3, 'ddd', '33455', NULL, NULL, NULL, 22, 0, 1, 22, 333, 0, 0, 0, '2022-3-31', 0, 0, 0, 0, 1, 0, 0, '2022-03-21 10:19:40', '2022-03-21 10:19:40'),
(127, 1010, 13, 3, 'Hvj', 'Gghb', '1010_demand_6239c4033dd83.jpeg', NULL, NULL, 6, 0, 1, 589, 989, 0, 0, 0, '2022-6-30', 0, 0, 0, 0, 1, 0, 0, '2022-03-22 12:42:18', '2022-03-22 12:42:18'),
(128, 1008, 9, 3, 'hytgrfghc juygf', NULL, NULL, NULL, NULL, 4, 14, 1, 45, 67, 0, 0, 0, '2022-07-26', 0, 0, 0, 0, 1, 0, 0, '2022-07-24 07:03:46', '2022-07-24 07:03:46'),
(129, 1005, 5, 5, 'amar t shirt lagbe 500 Ta', NULL, NULL, NULL, NULL, 50, 14, 1, 100, 200, 0, 0, 0, '2022-08-31', 0, 0, 0, 0, 1, 0, 0, '2022-08-22 16:43:46', '2022-08-22 16:43:46'),
(130, 1024, 13, 11, '100 pcs bus lagbe andolon er jonno', '<p><span style=\"background-color: rgba(250, 251, 255, 0.95); color: rgb(0, 0, 0);\">In 1995, Bangladeshi immigrant living in Geneva, Switzerland formed a club named \'\'Probas\'\'. After continuing for few years, it was renamed \'\'Bangladesh Club Geneva\'\'. The purpose of the club is to make a platform where the interest of the Bangladeshi immigrant living in Geneva will served and secured. Along with to make a multilateral relations with other communities existed in Geneva.</span></p>', '1024_demand_630474f27de82.jpeg', NULL, NULL, 100, 14, 1, 1850, 2584, 0, 0, 0, '2022-09-29', 0, 0, 0, 0, 1, 0, 0, '2022-08-23 12:36:11', '2022-08-23 12:36:11'),
(131, 1024, 13, 11, '50 ti shirt lagbe', '<p><span style=\"color: rgb(68, 87, 129);\">Can you avoid technology in modern life? If ‘NO’ then we find you as our speaker, our walk finder. You’ll tell us your suggestion, fascination, need, everything! Trust us</span></p>', '1024_demand_630482d6e8fbc.jpeg', NULL, NULL, 25, 14, 0, NULL, NULL, 0, 0, 0, '2022-10-18', 0, 1, 0, 0, 1, 1, 0, '2022-08-23 13:34:50', '2022-09-08 15:32:38'),
(132, 1005, 10, 5, 'i need this type of t shirt', NULL, '1005_demand_6304b91ee51d7.jpeg', NULL, NULL, 20, 13, 1, 200, 400, 0, 0, 0, '2022-08-30', 0, 0, 0, 0, 1, 0, 0, '2022-08-23 17:25:54', '2022-08-23 17:25:54'),
(133, 1029, 12, 3, 'I need an excavator for 2 months', NULL, '1029_demand_6305b8475faa2.jpeg', NULL, NULL, 1, 0, 0, NULL, NULL, 0, NULL, 1030, '2022-08-26', 0, 1, 1, 1, 1, 1, 0, '2022-08-24 11:35:12', '2022-08-24 16:23:08'),
(134, 1029, 11, 3, 'আমার একটা ক্যালকুলেটর লাগবে', '<p><span style=\"color: rgb(32, 33, 36);\">Basic calculators can do only&nbsp;</span><strong style=\"color: rgb(32, 33, 36);\">addition, subtraction, multiplication and division mathematical calculations</strong><span style=\"color: rgb(32, 33, 36);\">. However, more sophisticated calculators can handle exponential operations, square roots, logarithms, trigonometric functions and hyperbolic functions.</span></p>', '1029_demand_6305eb18d4d1c.jpeg', NULL, NULL, 1, 0, 1, 100, 500, 0, NULL, 1031, '2022-08-25', 0, 2, 1, 1, 1, 1, 0, '2022-08-24 15:13:07', '2022-08-24 15:31:07'),
(135, 1031, 11, 3, 'আমার একটি সিলিন্ডার লাগবে', NULL, '1031_demand_6305ef8556da8.jpeg', NULL, NULL, 12, 1, 1, 1100, 1200, 0, NULL, 1030, '2022-08-25', 0, 2, 1, 0, 1, 1, 0, '2022-08-24 15:30:27', '2022-08-24 15:37:24'),
(136, 1030, 11, 3, 'আমার একটা বড় লক লাগবে।', '<p>জাপানি হলে অগ্রাধিকার পাবে।</p>', '1030_demand_6305f0431aab4.jpeg', NULL, NULL, 1, 0, 1, 500, 1200, 0, NULL, 1029, '2022-08-31', 0, 1, 1, 1, 1, 1, 0, '2022-08-24 15:32:55', '2022-08-24 15:44:17'),
(137, 1010, 13, 3, 'Hhfudiw fu', '<p>Bhh hhu</p>', '1010_demand_6305f8d486a75.jpeg', NULL, NULL, 8, 13, 0, NULL, NULL, 0, 0, 0, '2022-09-03', 0, 0, 0, 0, 1, 0, 0, '2022-08-24 16:09:28', '2022-08-24 16:09:28'),
(138, 1010, 5, 3, '178 piece shirt lagbe', '<p>Fgf gdhhfggjdjj fixjdbr fjcjd cufjejd</p><p><br></p>', '1010_demand_6306fa0d604ea.jpeg', NULL, NULL, 178, 2, 1, 4500, 6400, 0, 0, 0, '2022-09-29', 0, 0, 0, 0, 1, 0, 0, '2022-08-25 10:29:04', '2022-08-25 10:29:04'),
(139, 1010, 13, 3, 'Gfyh bhj', '<p>Vhhh guh</p>', NULL, NULL, NULL, 6, 9, 0, NULL, NULL, 0, 0, 0, '2022-08-31', 0, 0, 0, 0, 1, 0, 0, '2022-08-25 14:13:32', '2022-08-25 14:13:32'),
(140, 1024, 12, 11, 'dgh fghdghd fgjhdhfghdfgh', '<p><span style=\"color: rgb(102, 102, 102);\">When the PHP engine is handling an incoming POST, it needs to keep some of the incoming data in memory. This directive only affects if you have used the&nbsp;</span><em style=\"color: rgb(102, 102, 102);\">--enable-memory-limit</em><span style=\"color: rgb(102, 102, 102);\">&nbsp;option during configuration. Setting too high a value can be very dangerous, as several uploads being handled concurrently can lead to memory limits maxing out and server performance issues.</span></p>', NULL, NULL, NULL, 43, 4, 0, NULL, NULL, 0, 0, 0, '2022-09-21', 0, 0, 0, 0, 1, 0, 0, '2022-08-25 14:16:34', '2022-08-25 14:16:34'),
(141, 1024, 12, 11, 'dghhgjk fhjjgfgj fhjfgj', '<p><span style=\"color: rgb(102, 102, 102);\">When the PHP engine is handling an incoming POST, it needs to keep some of the incoming data in memory. This directive only affects if you have used the&nbsp;</span><em style=\"color: rgb(102, 102, 102);\">--enable-memory-limit</em><span style=\"color: rgb(102, 102, 102);\">&nbsp;option during configuration. Setting too high a value can be very dangerous, as several uploads being handled concurrently can lead to memory limits maxing out and server performance issues.</span></p>', '1024_demand_6307316d1f52f.jpeg', NULL, NULL, 54, 4, 0, NULL, NULL, 0, 0, 0, '2022-09-29', 0, 0, 0, 0, 1, 0, 0, '2022-08-25 14:23:45', '2022-08-25 14:23:45'),
(142, 1010, 9, 3, 'Guunj hjn', '<p>Vgu hh</p>', '1010_demand_630731b49d06e.jpeg', NULL, NULL, 559, 9, 0, NULL, NULL, 0, 0, 0, '2022-09-03', 0, 0, 0, 0, 1, 0, 0, '2022-08-25 14:24:47', '2022-08-25 14:24:47'),
(143, 1010, 9, 3, 'Ghuuh hhh', '<p>Gggcggg hhbvh</p><p><br></p>', '1010_demand_63073230c2885.jpeg', '1010_demand_630732386e697.jpeg', '1010_demand_630732414b199.jpeg', 1, 14, 1, 1, 5, 0, 0, 0, '2022-09-03', 0, 1, 0, 0, 1, 1, 0, '2022-08-25 14:27:11', '2022-08-25 16:05:59'),
(144, 1024, 14, 11, '3.5 mb image test upload time', '<p><a href=\"http://www.espncricinfo.com/player/alzarri-joseph-670031\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255); color: rgba(var(--color-ui-typo-primary),var(--tw-text-opacity));\">Alzarri Joseph</a><span style=\"color: rgb(43, 44, 45);\">&nbsp;bowls a slower offcutter into the pitch, wide-ish outside off, cutting in, ending up on off and middle. Suryakumar is in his power position when the ball is delivered: back foot on middle, front foot outside leg, hands high, bat in the air.</span></p>', '1024_demand_630ae6caea760.jpeg', NULL, NULL, 2, 7, 0, NULL, NULL, 0, 0, 0, '2022-10-20', 0, 1, 0, 0, 1, 1, 0, '2022-08-28 09:55:08', '2022-09-10 18:17:11'),
(145, 1008, 5, 3, 'event er jonno tshirt lagbe', '<p>Bangladesh-Korea Technical Training Centre is a technical training centre in Dhaka, Bangladesh. This institution is located in Mirpur, Dhaka. It was founded in 1942 as a training centre for veterans of World War II. It runs under the Bureau of Manpower Employment and Training.</p>', '1008_demand_6316f90a4efde.jpeg', '1008_demand_6316f91232fc3.jpeg', NULL, 54, 14, 0, NULL, NULL, 0, 0, 0, '2022-10-19', 0, 0, 0, 0, 1, 0, 0, '2022-09-06 13:39:56', '2022-09-06 13:39:56'),
(146, 1008, 9, 3, 'travel time phone harabe-e', '<h3 class=\"ql-align-center\"><u>ভর্তি তথ্য</u></h3><ul><li><strong> ১ বছর মেয়াদি স্কীল সার্টিফিকেট কোর্সের ভর্তি তথ্য ক) ভর্তির যোগ্যতাঃ  এস এস সি / সমমান ।</strong></li><li><strong>খ) ক্লাশ শুরুর তারিখে বয়সঃ  অনূর্ধ্ব ২০ বছর।</strong></li><li><strong>গ) মেয়াদঃ  ০১ বছর ।</strong></li><li><strong>ঘ) ভর্তির আবেদনপত্রঃ ৬০/- টাকা ।</strong></li><li><strong>ঙ) সর্বমোট ভর্তি ফিঃ  ১২৭১/- টাকা ।</strong></li><li><strong>০৬ মাস / ০৩ মাস মেয়াদি কোর্সে ভর্তির মাসসমূহঃ ডিসেম্বর / মার্চ / জুন / সেপ্টেম্বর ।</strong></li><li><strong>০২ মাস / স্বল্প মেয়াদি কোর্সে সবসময় ভর্তি করানো হয় ।</strong></li><li><strong>ক) ক্লাশের সময়ঃ  ৭.৩০ টা - ১.৩০ টা এবং বৈকালীন (স্ব-অর্থায়ন) ২.৩০ - ৬.০০ টা)।</strong></li><li><strong>খ) ক্লাশ শুরুর তারিখে বয়সঃ  প্রাতঃ ১৬ - ২৫ বছর এবং বৈকালীন ১৮ - ৩৭ বছর।</strong></li><li><strong>গ) গার্মেন্টস ট্রেডের ক্ষেত্রে বয়সঃ  প্রাতঃ ও বৈকালীন ১৬ - ৩৫ বছর ।</strong></li><li><strong>ঘ) ভর্তির সময় মনোগ্রাম যুক্ত গেঞ্জির জন্য অতিরিক্ত ৭০/- টাকা দিতে হবে।</strong></li></ul><p><strong>ঙ্)  বিস্তারিত তথ্যের জন্য কেন্দ্রের তথ্য কেন্দ্রে / প্রশিক্ষণ শাখায় / হিসাব শাখায় যোগাযোগ ক</strong>রুন।</p>', '1008_demand_6316f9e20b2b6.jpeg', '1008_demand_6316f9e63069e.jpeg', NULL, 1, 14, 0, NULL, NULL, 0, 0, 0, '2022-10-26', 0, 0, 0, 0, 1, 0, 0, '2022-09-06 13:44:05', '2022-09-06 13:44:05'),
(147, 1015, 9, 11, 'Tomas had traveling in purpuri nagar', '<p>I don\'t use SSR myself and am unfamiliar with debugging approaches. What\'s the standard way of debugging, logging, and/or raising errors during SSR hydration?</p><p><br></p><p>I don\'t use SSR myself and am unfamiliar with debugging approaches. What\'s the standard way of debugging, logging, and/or raising errors during SSR hydration?</p>', '1015_demand_63199494a3296.jpeg', '1015_demand_631994acd56a4.jpeg', NULL, 1, 4, 1, 965, 996, 0, 0, 0, '2022-10-27', 0, 0, 0, 0, 1, 0, 0, '2022-09-08 13:08:58', '2022-09-08 13:08:58'),
(148, 1008, 5, 3, '100 pcs shirt lagbe', '<p><span style=\"background-color: rgb(240, 240, 240); color: rgb(14, 23, 36);\">Exams badges are shown on all your bids and on your profile after you pass each Exam. They\'re a great way to win more work by showing off your credibility and trustworthiness to employers</span></p>', '1008_demand_631c7fa0d6bbd.jpeg', '1008_demand_631c7fb7c883e.jpeg', NULL, 100, 2, 0, NULL, NULL, 0, 0, 0, '2022-09-30', 0, 0, 0, 0, 1, 0, 0, '2022-09-10 18:15:52', '2022-09-10 18:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `f_a_q_s`
--

CREATE TABLE `f_a_q_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `f_a_q_s`
--

INSERT INTO `f_a_q_s` (`id`, `question`, `answer`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 'What does FAQ mean?', 'Frequently Asked Questions (FAQ) is a list of common questions and answers about a particular topic, product, or service. The FAQ section can be found in articles, websites, and online forums intended to help people understand a particular topic or subject.', 0, 1, '2021-04-01 10:56:04', '2021-04-01 10:56:05');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `president` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `name`, `icon`, `menu_url`, `president`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Settings', 'fa fa-cogs', NULL, 2, 1, NULL, NULL),
(2, 1, 'Area Setting', NULL, 'area.index', 2, 1, NULL, NULL),
(3, 1, 'Category', '', 'category.index', 1, 1, NULL, NULL),
(4, 0, 'Adminstration', 'fa fa-users', NULL, 1, 1, NULL, NULL),
(5, 4, 'Role ', NULL, 'role.index', 2, 1, NULL, NULL),
(6, 4, 'Admin', NULL, 'admin.index', 1, 1, NULL, NULL),
(7, 0, 'Customer', 'fa fa-users', 'seller', 3, 1, NULL, NULL),
(10, 0, 'Demand', 'fa fa-book', 'get-demands', 4, 1, NULL, NULL),
(11, 1, 'Payment-Settings', NULL, 'payment-settings.index', 5, 1, NULL, NULL),
(12, 0, 'Payment', 'fa fa-money', 'payment/report', 6, 1, NULL, NULL),
(13, 0, 'Offers', 'fa fa-gift', NULL, 7, 1, NULL, NULL),
(14, 13, 'Coupon', NULL, 'coupon.index', 1, 1, NULL, NULL),
(15, 13, 'Send Coupon', NULL, 'send-coupon.index', 2, 1, NULL, NULL),
(16, 1, 'Subscription Plan', NULL, 'subscription.index', 4, 1, NULL, NULL),
(17, 1, 'SEO', NULL, 'seo.index', 5, 1, NULL, NULL),
(18, 1, 'SMS', NULL, 'sms.index', 6, 1, '2021-03-28 11:01:19', '2021-03-28 11:01:21'),
(19, 0, 'Nilam', 'fa fa-gift', NULL, 8, 1, NULL, NULL),
(23, 19, 'Pending Nilam', NULL, 'nilam.index', 1, 1, '2021-06-15 11:40:52', '2021-06-15 11:40:53'),
(24, 19, 'Expired Nilam', NULL, 'expired-nilam', 2, 1, '2021-06-15 12:04:35', '2021-06-15 12:04:36'),
(25, 19, 'Completed Nilam', NULL, 'complete-nilam', 3, 1, '2021-06-15 12:05:24', '2021-06-15 12:05:25'),
(26, 0, 'Withdraw', 'fa fa-rss', 'view-withdraw-request', 9, 1, '2021-06-20 06:46:05', '2021-06-20 06:46:06'),
(27, 1, 'Bid Setting', NULL, 'bid-setting.index', 7, 1, '2021-09-13 05:51:58', '2021-09-13 05:51:59');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2020_09_21_101239_create_admins_table', 1),
(10, '2020_10_15_092114_create_contacts_table', 1),
(11, '2020_10_28_100605_create_testimonials_table', 1),
(12, '2020_11_04_110248_create_roles_table', 1),
(13, '2020_11_08_055313_create_permissions_table', 1),
(14, '2020_11_08_063419_create_menus_table', 1),
(15, '2020_11_09_045218_create_blogs_table', 1),
(16, '2020_11_11_065207_create_sliders_table', 1),
(17, '2020_11_12_070605_create_careers_table', 1),
(18, '2020_11_15_061946_create_tags_table', 1),
(19, '2020_11_15_075047_create_seos_table', 1),
(20, '2020_11_15_081714_create_blog_tag_table', 1),
(21, '2020_11_16_171118_create_about_table', 1),
(22, '2020_11_22_114818_create_albums_table', 1),
(23, '2020_11_22_115625_create_album_image_table', 1),
(24, '2020_12_08_083141_create_o_t_p_s_table', 1),
(25, '2020_12_09_071156_create_categories_table', 1),
(26, '2020_12_09_071330_create_user_categories_table', 1),
(28, '2020_12_13_043652_create_areas_table', 2),
(29, '2020_12_13_063724_create_user_information_table', 3),
(33, '2020_12_22_102141_create_demands_table', 5),
(34, '2020_12_14_060156_create_quantity_units_table', 6),
(35, '2020_12_28_115036_create_category_quantity_units_table', 6),
(41, '2021_01_06_150101_create_bids_table', 7),
(42, '2021_01_12_164813_create_subscriptions_table', 7),
(43, '2021_01_14_143825_create_jobs_table', 7),
(44, '2021_01_17_151820_create_sendsms_table', 7),
(45, '2021_01_28_172533_create_seller_ratings_table', 8),
(46, '2021_01_28_172558_create_buyer_ratings_table', 8),
(47, '2021_02_11_104653_create_payment_settings_table', 9),
(48, '2021_02_11_131055_create_payments_table', 10),
(49, '2021_02_18_164924_create_coupons_table', 11),
(50, '2021_02_18_165014_create_user_coupons_table', 11),
(51, '2021_02_25_115122_create_subscription_plans_table', 12),
(52, '2021_03_28_151513_create_sms_table', 13),
(53, '2021_03_31_150420_create_f_a_q_s_table', 14),
(54, '2021_04_10_113211_create_nilams_table', 15),
(55, '2021_04_10_120901_create_nilam_bids_table', 15),
(56, '2021_04_15_144601_add_points_column_user', 16),
(57, '2021_04_18_114918_create_points_table', 16),
(58, '2021_05_06_151452_create_delivery_histories_table', 17),
(59, '2021_05_06_152137_add_address_to_nilams_table', 17),
(60, '2021_05_06_152719_add_delivery_charge_to_nilam_bids_table', 17),
(61, '2021_05_08_113344_create_withdraw_requests_table', 18),
(62, '2021_05_09_113224_add_user_bid_status_in_nilam_bids', 19),
(63, '2021_05_30_175009_create_point_withdraw_requests_table', 19),
(64, '0000_00_00_000000_create_websockets_statistics_entries_table', 20),
(65, '2021_07_09_050928_create_notifications_table', 21),
(66, '2021_09_13_121518_create_bid_settings_table', 22);

-- --------------------------------------------------------

--
-- Table structure for table `nilams`
--

CREATE TABLE `nilams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_one` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_four` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `quantity_unit_id` bigint(20) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_price` double NOT NULL,
  `expire_date` datetime NOT NULL,
  `video_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_condition` tinyint(4) NOT NULL COMMENT '1= new , 0 = old',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `delivery_status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0,
  `buyer_payment_date` datetime DEFAULT NULL,
  `seller_payment_date` datetime DEFAULT NULL,
  `seller_payment_status` tinyint(4) NOT NULL DEFAULT 0,
  `is_return` tinyint(4) NOT NULL DEFAULT 0,
  `is_pickup` tinyint(4) NOT NULL DEFAULT 0,
  `pickup_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `payment_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_payment_note` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nilams`
--

INSERT INTO `nilams` (`id`, `user_id`, `area_id`, `category_id`, `title`, `image_one`, `image_two`, `image_three`, `image_four`, `quantity`, `quantity_unit_id`, `description`, `base_price`, `expire_date`, `video_link`, `product_condition`, `status`, `delivery_status`, `created_at`, `updated_at`, `delivery_address`, `from_address`, `payment_status`, `buyer_payment_date`, `seller_payment_date`, `seller_payment_status`, `is_return`, `is_pickup`, `pickup_date`, `delivery_date`, `payment_details`, `seller_payment_note`) VALUES
(1, 1013, 0, 9, 'sell the product on this Action', '1005_one_60714cafa9bdd.jpeg', NULL, NULL, NULL, 0, 0, 'because a resource class will automatically proxy property and method access down to the underlying model for convenient access', 3466, '2021-11-04 17:19:55', 'https://www.facebook.com/', 0, 1, NULL, '2021-04-11 05:38:29', '2021-04-11 05:38:32', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(2, 1008, 0, 8, 'dummy text of the printing and typesetting', '1005_one_60714cb28ca48.jpeg', NULL, NULL, NULL, 0, 0, 'Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock', 5999, '2021-11-14 17:19:55', 'https://laravel.com/docs/8.x/eloquent-resources', 1, 1, NULL, '2021-04-11 07:11:14', '2021-05-26 08:41:28', NULL, 'পাওয়ার ফুল জ‍্যাঙ্গো ওয়েব ফের্মওয়ার্ক দিয়ে', 1, NULL, NULL, 1, 0, 1, NULL, NULL, 'dfgf dfhfgh dhfg dtty', 'cash'),
(3, 1014, 0, 13, 'the undoubtable source. Lorem Ipsum', '1002_one_6072b7e179f0d.jpeg', NULL, NULL, NULL, 0, 0, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which', 4599, '2021-11-23 17:19:55', 'https://twitter.com/home', 0, 1, NULL, '2021-04-11 07:15:32', '2021-04-11 07:15:33', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(4, 1005, 0, 6, 'The complete code to write validation for min and max is below', '1005_one_60714cb54ec84.jpeg', NULL, NULL, NULL, 0, 0, 'The field under validation must be less than or equal to a maximum value. Strings, numerics, and files are evaluated in the same fashion as the size rule', 5599, '2021-12-12 11:15:22', NULL, 1, 0, NULL, '2021-04-13 06:10:55', '2021-04-13 06:10:55', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(5, 1008, 0, 12, 'khezur', '1008_demand_6087abb96a110.jpeg', NULL, NULL, NULL, 1, 1, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution', 358, '2021-11-15 18:15:22', 'https://www.youtube.com/watch?v=zmvqdKcRGnM', 1, 1, 2, '2021-04-27 06:20:57', '2021-06-16 10:56:34', NULL, NULL, 1, '2021-06-16 03:03:04', NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(6, 1006, 0, 11, 'Sobji kola', '1008_demand_6087ad69be56e.jpeg', NULL, NULL, NULL, 12, 1, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature', 80, '2021-12-20 00:00:00', 'https://www.youtube.com/watch?v=zmvqdKcRGnM', 1, 1, NULL, '2021-04-27 06:25:46', '2021-04-27 06:25:46', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(7, 1008, 8, 5, 'T-shirt', '1008_demand_60b3248ddd895.jpeg', NULL, NULL, NULL, 1, 0, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look', 540, '2021-12-02 02:14:00', 'https://www.youtube.com/watch?v=Zos2mLL85PU', 0, 1, NULL, '2021-05-30 05:40:51', '2021-05-30 07:40:17', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(8, 1015, 9, 5, 'neel jama daame kom maane valo', '1015_demand_60bf32c30ca14.jpeg', NULL, NULL, NULL, 1, 0, 'Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.', 245, '2021-12-17 23:59:00', NULL, 0, 1, NULL, '2021-06-08 09:07:08', '2021-08-11 07:45:18', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(9, 1015, 9, 11, 'tour bag sell hocce, jara lelo', '1015_demand_60bf349234d11.jpeg', NULL, NULL, NULL, 20, 0, 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 150, '2021-12-19 23:59:00', NULL, 0, 1, NULL, '2021-06-08 09:14:26', '2021-08-11 07:45:08', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(10, 1015, 9, 11, 'tour bag sell hocce, jara lelo', '1015_demand_60bf349234d11.jpeg', NULL, NULL, NULL, 20, 0, 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 150, '2021-11-22 23:59:00', NULL, 0, 1, NULL, '2021-06-08 09:14:26', '2021-08-11 07:45:34', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(11, 1015, 9, 14, 'puraton nosto jelly sell hobe', '1015_demand_60bf39b4d6590.jpeg', NULL, NULL, NULL, 1, 0, 'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem', 99, '2021-11-18 23:59:00', NULL, 0, 1, NULL, '2021-06-08 09:35:59', '2021-08-11 07:44:57', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(12, 1006, 9, 9, 'Ei jinis gula sell hobe', '1015_demand_60c740207205d.jpeg', '1015_demand_60c7402bb519e.jpeg', '1015_demand_60c740332b34a.jpeg', NULL, 1, 14, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightl', 120, '2021-11-01 21:58:59', 'https://www.youtube.com/watch?v=VwzvIk5ctJE', 1, 1, NULL, '2021-06-14 11:42:31', '2021-06-14 11:42:31', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(13, 1015, 11, 8, 'Eno means kutta', '1015_demand_60cb0c213b586.jpeg', NULL, NULL, NULL, 1, 13, '<p><span style=\"background-color: rgb(255, 255, 255); color: rgb(36, 39, 41);\">I was dependant on Firebase onAuthStateChanged to update the states and I was trying</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">if($route.path == \'/\') {\n   //following 2 line code are sample code here put your need codes\n   this.isLogin = false;\n   this.user_full_name = \'My Account\';\n} else {\n   // this.$router.push(\"/\");\n   this.$router.push({ path: \'/\'} );\n}\n</pre>', 125, '2021-12-26 23:59:00', 'https://www.youtube.com/watch?v=_GJIyOpwcyk', 1, 1, NULL, '2021-06-17 08:50:26', '2021-08-11 07:45:27', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(14, 1012, 8, 11, 'dsaf fdsaf', '1010_demand_60d03f274fa44.jpeg', NULL, NULL, NULL, 1, 1, '<p><strong>sdar</strong></p><p>sdaf</p><ol><li><strong><em>sda</em></strong></li><li><strong><em>f</em></strong></li><li><strong><em>sdaf</em></strong></li><li><strong><em>ads</em></strong></li></ol><p> sad fsdaf dsfhkfhkasdhfiads</p><p>sd fds</p>', 256, '2021-12-21 13:32:00', NULL, 1, 1, NULL, '2021-06-21 07:27:28', '2021-06-21 07:27:28', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(15, 1012, 11, 8, 'Mobile for sell', '1015_demand_60db6a4f18317.jpeg', NULL, NULL, NULL, 1, 0, '<p><span style=\"color: rgb(43, 46, 56);\">Note that our Ably Echo configuration references a&nbsp;</span><code style=\"color: rgb(202, 71, 63); background-color: rgb(251, 251, 253);\">MIX_ABLY_PUBLIC_KEY</code><span style=\"color: rgb(43, 46, 56);\">&nbsp;environment variable. This variable\'s value should be your Ably public key.&nbsp;</span></p>', 1900, '2021-12-03 11:59:00', NULL, 0, 1, NULL, '2021-06-29 18:46:51', '2021-06-29 18:46:51', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(16, 1012, 11, 11, 'Purana osud sell hobe', '1015_demand_60db6b832fa88.jpeg', NULL, NULL, NULL, 150, 13, '<p><span style=\"color: rgb(43, 46, 56);\">Next, you should configure your Ably credentials in the&nbsp;</span><code style=\"color: rgb(202, 71, 63); background-color: rgb(251, 251, 253);\">config/broadcasting.php</code><span style=\"color: rgb(43, 46, 56);\">&nbsp;configuration file. An example Ably configuration is already included</span></p>', 140, '2021-12-03 14:59:00', NULL, 0, 1, NULL, '2021-06-29 18:52:12', '2021-06-29 18:52:12', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(17, 1012, 11, 13, 'new tablet for killing', '1015_demand_60db6bf1de8c8.jpeg', NULL, NULL, NULL, 80, 14, '<p><span style=\"color: rgb(43, 46, 56);\">Pusher compatible WebSocket package for Laravel. This package allows you to leverage the full power of Laravel</span></p>', 120, '2021-12-03 23:59:00', NULL, 0, 1, NULL, '2021-06-29 18:53:37', '2021-06-29 18:53:37', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(18, 1008, 8, 5, 'tshirt', '1008_demand_60f6cea01f680.jpeg', NULL, NULL, NULL, 1, 14, '<p>this is for sell</p>', 28, '2021-12-22 11:59:00', NULL, 0, 1, NULL, '2021-07-20 13:25:27', '2021-07-20 13:25:27', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(19, 1008, 8, 11, 'glass', '1008_demand_60f6cedf15475.jpeg', NULL, NULL, NULL, 15, 13, '<p>this glass for sell</p>', 125, '2021-12-23 12:01:00', NULL, 1, 1, NULL, '2021-07-20 13:26:40', '2021-07-20 13:26:40', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(20, 1008, 8, 12, 'furniture', '1008_demand_60f6cf265fe4e.jpeg', NULL, NULL, NULL, 1, 13, '<p>this furniture for sell</p>', 165, '2021-11-23 12:02:00', NULL, 0, 1, NULL, '2021-07-20 13:28:01', '2021-07-20 13:28:01', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nilam_bids`
--

CREATE TABLE `nilam_bids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nilam_id` bigint(20) UNSIGNED NOT NULL,
  `nilam_user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'id who post the nilam',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'id who bid into nilam',
  `bid_price` double NOT NULL,
  `proposal` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `disversed_status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` double(22,0) DEFAULT 0,
  `is_return` tinyint(4) NOT NULL DEFAULT 0,
  `is_pickup` tinyint(4) NOT NULL DEFAULT 0,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0,
  `payment_date` datetime DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_bid_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active in nilam , 0 = inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nilam_bids`
--

INSERT INTO `nilam_bids` (`id`, `nilam_id`, `nilam_user_id`, `user_id`, `bid_price`, `proposal`, `status`, `disversed_status`, `created_at`, `updated_at`, `delivery_charge`, `is_return`, `is_pickup`, `payment_status`, `payment_date`, `note`, `user_bid_status`) VALUES
(1, 12, 1006, 1015, 128, NULL, 1, 0, '2021-06-16 05:57:36', '2021-06-16 05:57:36', 0, 0, 0, 0, NULL, NULL, 1),
(2, 5, 1008, 1015, 370, NULL, 1, 0, '2021-06-16 05:59:19', '2021-06-16 10:29:01', 65, 0, 0, 1, '2021-06-16 00:00:00', 'Payment Taken by cash', 1),
(3, 3, 1014, 1015, 4633, NULL, 1, 1, '2021-06-16 05:59:47', '2021-09-14 06:14:26', 0, 0, 0, 0, NULL, NULL, 1),
(4, 15, 1012, 1008, 1932, NULL, 1, 0, '2021-07-19 22:39:26', '2021-07-19 22:39:26', 0, 0, 0, 0, NULL, NULL, 1),
(5, 17, 1012, 1015, 123, NULL, 1, 0, '2021-07-20 13:23:31', '2021-07-20 13:23:31', 0, 0, 0, 0, NULL, NULL, 1),
(6, 18, 1008, 1015, 29, NULL, 1, 0, '2021-07-20 13:28:52', '2021-07-20 13:28:52', 0, 0, 0, 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('01190950-bd1a-4f31-b684-ef52ecdd6d4a', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1006, '{\"details\":{\"post_url\":\"\\/demand\\/89\\/2rg7ze\",\"apps_url\":\"\\/demand\\/89\\/78svhn\",\"type\":\"demand\",\"demand_id\":89,\"notification_message\":\"Congrats! \\\"I need an excavetor for g ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 \\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\u09ac\\u09bf\\u09a1 \\u0995\\u09a8\\u09ab\\u09be\\u09b0\\u09cd\\u09ae \\u09b9\\u09df\\u09c7\\u099b\\u09c7\",\"bidder_id\":1010,\"bidder_name\":\"sayeed\",\"bidder_avatar\":\"http:\\/\\/192.168.0.177\\/demand-back\\/public\\/images\\/avatar\\/2021-06-22-1624345393.jpeg\",\"bidder_phone\":\"01824143370\"},\"demander\":{\"id\":1006,\"name\":\"Sukas lukium\",\"avatar\":\"2021-02-08-1612787190.jpeg\",\"mobile_no\":\"01923923922\",\"email\":\"nimba@mail.com\",\"area_id\":3,\"sub_area_id\":0,\"average_saling_rating\":4.25,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":1,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2023-01-16\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2020-02-29T12:26:07.000000Z\",\"updated_at\":\"2021-03-31T10:43:53.000000Z\",\"current_point\":0}}', NULL, '2022-03-16 10:13:43', '2022-03-16 10:13:43'),
('03c4e11d-31a2-4c4f-aaa9-ea13f73a08b1', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1029, '{\"details\":{\"post_url\":\"\\/demand\\/133\\/ifvkhn\",\"apps_url\":\"\\/demand\\/133\\/ras52v\",\"type\":\"demand\",\"demand_id\":\"133\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"I need an excavator for 2 ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 Mohammed Tauhid \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1030,\"bidder_name\":\"Mohammed Tauhid\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2022-08-24-1661321030.jpeg\",\"bidder_phone\":\"01766558045\"},\"demander\":{\"id\":1029,\"name\":\"Tushar R Islam\",\"avatar\":\"2022-08-24-1661319417.jpeg\",\"mobile_no\":\"01312447767\",\"email\":null,\"area_id\":\"3\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"5.00\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"1\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"1\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2022-09-23\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2022-08-24T05:33:00.000000Z\",\"updated_at\":\"2022-08-24T09:44:17.000000Z\",\"current_point\":\"20\"}}', '2022-08-25 19:35:02', '2022-08-24 16:21:10', '2022-08-25 19:35:02'),
('065caa7b-b6ed-45ed-92ab-30c5094b8886', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1029, '{\"details\":{\"post_url\":\"\\/demand\\/108\\/3bafrd\",\"apps_url\":\"\\/demand\\/108\\/hj524i\",\"type\":\"demand\",\"demand_id\":\"108\",\"notification_message\":\"Congrats! \\\"need some big fish, like ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 \\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\u09ac\\u09bf\\u09a1 \\u0995\\u09a8\\u09ab\\u09be\\u09b0\\u09cd\\u09ae \\u09b9\\u09df\\u09c7\\u099b\\u09c7\",\"bidder_id\":1015,\"bidder_name\":\"Arif\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2021-08-11-1628667864.jpeg\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1029,\"name\":\"Tushar R Islam\",\"avatar\":\"2022-08-24-1661319417.jpeg\",\"mobile_no\":\"01312447767\",\"email\":null,\"area_id\":\"3\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"5.00\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"1\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"1\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2022-09-23\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2022-08-24T05:33:00.000000Z\",\"updated_at\":\"2022-08-24T09:44:17.000000Z\",\"current_point\":\"20\"}}', '2022-09-11 11:03:48', '2022-09-05 00:18:47', '2022-09-11 11:03:48'),
('0ceedf8e-52c1-41fe-b83f-d1de680521be', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1031, '{\"details\":{\"post_url\":\"\\/demand\\/135\\/38tm97\",\"apps_url\":\"\\/demand\\/135\\/xocs7r\",\"type\":\"demand\",\"demand_id\":\"135\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"\\u0986\\u09ae\\u09be\\u09b0 \\u098f\\u0995\\u099f\\u09bf \\u09b8\\u09bf\\u09b2\\u09bf\\u09a8\\u09cd\\u09a1\\u09be\\u09b0 \\u09b2\\u09be\\u0997\\u09ac\\u09c7\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 Tushar R Islam \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1029,\"bidder_name\":\"Tushar R Islam\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2022-08-24-1661319417.jpeg\",\"bidder_phone\":\"01312447767\"},\"demander\":{\"id\":1031,\"name\":\"Ashiqur Rahman\",\"avatar\":\"\",\"mobile_no\":\"01676916082\",\"email\":null,\"area_id\":\"3\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"3.00\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"1\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"0\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2022-09-23\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2022-08-24T09:15:36.000000Z\",\"updated_at\":\"2022-08-24T09:31:07.000000Z\",\"current_point\":\"20\"}}', '2022-08-24 15:35:20', '2022-08-24 15:35:09', '2022-08-24 15:35:20'),
('0fcda01e-bbef-4385-b1df-d6af86207a97', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1029, '{\"details\":{\"post_url\":\"\\/demand\\/134\\/of8w2p\",\"apps_url\":\"\\/demand\\/134\\/jdzo6p\",\"type\":\"demand\",\"demand_id\":\"134\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"\\u0986\\u09ae\\u09be\\u09b0 \\u098f\\u0995\\u099f\\u09be \\u0995\\u09cd\\u09af\\u09be\\u09b2\\u0995\\u09c1\\u09b2\\u09c7\\u099f\\u09b0 \\u09b2\\u09be\\u0997 ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 Mohammed Tauhid \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1030,\"bidder_name\":\"Mohammed Tauhid\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2022-08-24-1661321030.jpeg\",\"bidder_phone\":\"01766558045\"},\"demander\":{\"id\":1029,\"name\":\"Tushar R Islam\",\"avatar\":\"2022-08-24-1661319417.jpeg\",\"mobile_no\":\"01312447767\",\"email\":null,\"area_id\":\"3\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"0.00\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"0\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"1\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2022-09-23\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2022-08-24T05:33:00.000000Z\",\"updated_at\":\"2022-08-24T05:36:57.000000Z\",\"current_point\":\"20\"}}', '2022-08-24 15:20:48', '2022-08-24 15:19:26', '2022-08-24 15:20:48'),
('28077dd2-c97d-4e2d-9f69-21a1438d8949', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1010, '{\"details\":{\"post_url\":\"\\/demand\\/89\\/suvp78\",\"apps_url\":\"\\/demand\\/89\\/v8wfx4\",\"type\":\"demand\",\"demand_id\":\"89\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"I need an excavetor for g ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 arifuzzaman \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1008,\"bidder_name\":\"arifuzzaman\",\"bidder_avatar\":\"http:\\/\\/192.168.0.177\\/demand-back\\/public\\/images\\/avatar\\/2021-12-06-1638772212.jpeg\",\"bidder_phone\":\"01824220935\"},\"demander\":{\"id\":1010,\"name\":\"sayeed\",\"avatar\":\"2021-06-22-1624345393.jpeg\",\"mobile_no\":\"01824143370\",\"email\":\"sayeed300056@gmail.com\",\"area_id\":3,\"sub_area_id\":0,\"average_saling_rating\":3.67,\"average_buying_rating\":3,\"seller_badge\":1,\"buyer_badge\":1,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2022-09-28\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-10T11:02:42.000000Z\",\"updated_at\":\"2022-02-03T12:21:59.000000Z\",\"current_point\":997}}', '2022-03-01 09:52:07', '2022-03-01 05:41:31', '2022-03-01 09:52:07'),
('2de20a48-138a-4dec-9516-60913f6ca834', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"\\/demand\\/93\\/xyzre5\",\"apps_url\":\"\\/demand\\/93\\/g6uc1m\",\"type\":\"demand\",\"demand_id\":\"93\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"i need this nature\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 sayeed \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1010,\"bidder_name\":\"sayeed\",\"bidder_avatar\":\"http:\\/\\/192.168.0.177\\/demand-back\\/public\\/images\\/avatar\\/2021-06-22-1624345393.jpeg\",\"bidder_phone\":\"01824143370\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"2021-12-06-1638772212.jpeg\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":3,\"sub_area_id\":0,\"average_saling_rating\":3.5,\"average_buying_rating\":3.5,\"seller_badge\":1,\"buyer_badge\":1,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2022-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2022-02-22T09:16:52.000000Z\",\"current_point\":540}}', '2022-09-06 14:51:42', '2022-03-20 08:12:33', '2022-09-06 14:51:42'),
('416d9b6b-b711-4d70-ab76-1bcfddffb8ff', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1031, '{\"details\":{\"post_url\":\"\\/demand\\/134\\/gc80fs\",\"apps_url\":\"\\/demand\\/134\\/1tp0by\",\"type\":\"demand\",\"demand_id\":\"134\",\"notification_message\":\"Congrats! \\\"\\u0986\\u09ae\\u09be\\u09b0 \\u098f\\u0995\\u099f\\u09be \\u0995\\u09cd\\u09af\\u09be\\u09b2\\u0995\\u09c1\\u09b2\\u09c7\\u099f\\u09b0 \\u09b2\\u09be\\u0997 ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 \\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\u09ac\\u09bf\\u09a1 \\u0995\\u09a8\\u09ab\\u09be\\u09b0\\u09cd\\u09ae \\u09b9\\u09df\\u09c7\\u099b\\u09c7\",\"bidder_id\":1029,\"bidder_name\":\"Tushar R Islam\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2022-08-24-1661319417.jpeg\",\"bidder_phone\":\"01312447767\"},\"demander\":{\"id\":1031,\"name\":\"Ashiqur Rahman\",\"avatar\":\"\",\"mobile_no\":\"01676916082\",\"email\":null,\"area_id\":\"3\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"0.00\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"0\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"0\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2022-09-23\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2022-08-24T09:15:36.000000Z\",\"updated_at\":\"2022-08-24T09:15:36.000000Z\",\"current_point\":\"20\"}}', NULL, '2022-08-24 15:24:57', '2022-08-24 15:24:57'),
('45', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"\\/demand\\/97\\/h5lu8i\",\"apps_url\":\"\\/demand\\/97\\/1aof43\",\"type\":\"demand\",\"notification_message\":\"You Have Bid On Your Demand\",\"bidder_id\":1015,\"bidder_name\":\"Arif\",\"bidder_avatar\":\"http:\\/\\/192.168.0.13\\/demand-back\\/public\\/images\\/avatar\\/2021-08-11-1628667864.jpeg\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":8,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2021-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2021-06-20T11:10:28.000000Z\",\"current_point\":21887}}', '2022-02-22 11:34:49', '2021-08-18 08:08:42', '2022-02-22 11:34:49'),
('5', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"\\/demand\\/101\\/9f0dxb\",\"apps_url\":\"\\/demand\\/101\\/p1c9ji\",\"type\":\"demand\",\"notification_message\":\"You Have Bid On Your Demand\",\"bidder_id\":1005,\"bidder_name\":\"Shakhawat HOssain\",\"bidder_avatar\":\"http:\\/\\/192.168.0.13\\/demand-back\\/public\\/images\\/avatar\\/default\\/avatar.svg\",\"bidder_phone\":\"01834394216\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":8,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2021-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2021-06-20T11:10:28.000000Z\",\"current_point\":21887}}', '2022-02-22 11:34:28', '2021-08-18 08:29:04', '2022-02-22 11:34:28'),
('59862843-67b9-4e55-b13a-c78a2aa3d1a2', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1015, '{\"details\":{\"post_url\":\"\\/demand\\/124\\/60v3uo\",\"apps_url\":\"\\/demand\\/124\\/cbyuo2\",\"type\":\"demand\",\"demand_id\":\"124\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"ftyu ghjghhg ghjdfgjh fhj ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 arifuzzaman \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1008,\"bidder_name\":\"arifuzzaman\",\"bidder_avatar\":\"http:\\/\\/192.168.0.177\\/demand-back\\/public\\/images\\/avatar\\/2021-12-06-1638772212.jpeg\",\"bidder_phone\":\"01824220935\"},\"demander\":{\"id\":1015,\"name\":\"Arif\",\"avatar\":\"2021-08-11-1628667864.jpeg\",\"mobile_no\":\"01949281513\",\"email\":\"arifuzzaman.rb@gmail.com\",\"area_id\":11,\"sub_area_id\":0,\"average_saling_rating\":4.25,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2024-03-24\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-01-20T11:50:39.000000Z\",\"updated_at\":\"2021-12-02T12:44:19.000000Z\",\"current_point\":7193}}', NULL, '2022-03-20 12:55:32', '2022-03-20 12:55:32'),
('5a57e02b-e950-4593-b330-a57a61ddd3bf', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1015, '{\"details\":{\"post_url\":\"\\/demand\\/103\\/ecx9sf\",\"apps_url\":\"\\/demand\\/103\\/3grmw7\",\"type\":\"demand\",\"demand_id\":\"103\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"Mosur daal sell hobe, ruk ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 sayeed \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1010,\"bidder_name\":\"sayeed\",\"bidder_avatar\":\"http:\\/\\/192.168.0.177\\/demand-back\\/public\\/images\\/avatar\\/2021-06-22-1624345393.jpeg\",\"bidder_phone\":\"01824143370\"},\"demander\":{\"id\":1015,\"name\":\"Arif\",\"avatar\":\"2021-08-11-1628667864.jpeg\",\"mobile_no\":\"01949281513\",\"email\":\"arifuzzaman.rb@gmail.com\",\"area_id\":11,\"sub_area_id\":0,\"average_saling_rating\":4.25,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2024-03-24\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-01-20T11:50:39.000000Z\",\"updated_at\":\"2021-12-02T12:44:19.000000Z\",\"current_point\":7193}}', NULL, '2022-03-20 08:24:20', '2022-03-20 08:24:20'),
('5c9c6cc2-031f-4918-8b02-43fc978df6e9', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1029, '{\"details\":{\"post_url\":\"\\/demand\\/136\\/6orz7l\",\"apps_url\":\"\\/demand\\/136\\/23y8kx\",\"type\":\"demand\",\"demand_id\":\"136\",\"notification_message\":\"Congrats! \\\"\\u0986\\u09ae\\u09be\\u09b0 \\u098f\\u0995\\u099f\\u09be \\u09ac\\u09dc \\u09b2\\u0995 \\u09b2\\u09be\\u0997\\u09ac\\u09c7\\u0964\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 \\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\u09ac\\u09bf\\u09a1 \\u0995\\u09a8\\u09ab\\u09be\\u09b0\\u09cd\\u09ae \\u09b9\\u09df\\u09c7\\u099b\\u09c7\",\"bidder_id\":1030,\"bidder_name\":\"Mohammed Tauhid\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2022-08-24-1661321030.jpeg\",\"bidder_phone\":\"01766558045\"},\"demander\":{\"id\":1029,\"name\":\"Tushar R Islam\",\"avatar\":\"2022-08-24-1661319417.jpeg\",\"mobile_no\":\"01312447767\",\"email\":null,\"area_id\":\"3\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"0.00\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"0\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"1\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2022-09-23\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2022-08-24T05:33:00.000000Z\",\"updated_at\":\"2022-08-24T05:36:57.000000Z\",\"current_point\":\"20\"}}', NULL, '2022-08-24 15:38:30', '2022-08-24 15:38:30'),
('69', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1015, '{\"details\":{\"post_url\":\"\\/demand\\/108\\/ru4bp7\",\"apps_url\":\"\\/demand\\/108\\/qby90o\",\"type\":\"demand\",\"notification_message\":\"You Have Bid On Your Demand\",\"bidder_id\":1008,\"bidder_name\":\"arifuzzaman\",\"bidder_avatar\":\"http:\\/\\/192.168.0.13\\/demand-back\\/public\\/images\\/avatar\\/default\\/avatar.svg\",\"bidder_phone\":\"01824220935\"},\"demander\":{\"id\":1015,\"name\":\"Arif\",\"avatar\":\"2021-08-11-1628667864.jpeg\",\"mobile_no\":\"01949281513\",\"email\":\"arifuzzaman.rb@gmail.com\",\"area_id\":11,\"sub_area_id\":0,\"average_saling_rating\":4.33,\"average_buying_rating\":0,\"seller_badge\":0,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2023-09-24\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-01-20T11:50:39.000000Z\",\"updated_at\":\"2021-08-11T07:44:24.000000Z\",\"current_point\":7193}}', '2021-08-18 08:04:10', '2021-08-18 08:03:36', '2021-08-18 08:04:10'),
('7eaaa567-093a-4e9c-989e-2c5d3bb256b4', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1030, '{\"details\":{\"post_url\":\"\\/demand\\/136\\/254o1f\",\"apps_url\":\"\\/demand\\/136\\/tab5sh\",\"type\":\"demand\",\"demand_id\":\"136\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"\\u0986\\u09ae\\u09be\\u09b0 \\u098f\\u0995\\u099f\\u09be \\u09ac\\u09dc \\u09b2\\u0995 \\u09b2\\u09be\\u0997\\u09ac\\u09c7\\u0964\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 Tushar R Islam \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1029,\"bidder_name\":\"Tushar R Islam\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2022-08-24-1661319417.jpeg\",\"bidder_phone\":\"01312447767\"},\"demander\":{\"id\":1030,\"name\":\"Mohammed Tauhid\",\"avatar\":\"2022-08-24-1661321030.jpeg\",\"mobile_no\":\"01766558045\",\"email\":\"mfislambba@gmail.com\",\"area_id\":\"3\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"0.00\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"0\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"1\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2022-09-23\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2022-08-24T05:59:57.000000Z\",\"updated_at\":\"2022-08-24T06:03:50.000000Z\",\"current_point\":\"20\"}}', '2022-08-24 15:43:12', '2022-08-24 15:36:38', '2022-08-24 15:43:12'),
('82ca779e-9e2d-4987-bca5-5926042f389d', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1029, '{\"details\":{\"post_url\":\"\\/demand\\/134\\/29cjnz\",\"apps_url\":\"\\/demand\\/134\\/ztxh3w\",\"type\":\"demand\",\"demand_id\":\"134\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"\\u0986\\u09ae\\u09be\\u09b0 \\u098f\\u0995\\u099f\\u09be \\u0995\\u09cd\\u09af\\u09be\\u09b2\\u0995\\u09c1\\u09b2\\u09c7\\u099f\\u09b0 \\u09b2\\u09be\\u0997 ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 Ashiqur Rahman \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1031,\"bidder_name\":\"Ashiqur Rahman\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/default\\/avatar.svg\",\"bidder_phone\":\"01676916082\"},\"demander\":{\"id\":1029,\"name\":\"Tushar R Islam\",\"avatar\":\"2022-08-24-1661319417.jpeg\",\"mobile_no\":\"01312447767\",\"email\":null,\"area_id\":\"3\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"0.00\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"0\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"1\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2022-09-23\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2022-08-24T05:33:00.000000Z\",\"updated_at\":\"2022-08-24T05:36:57.000000Z\",\"current_point\":\"20\"}}', NULL, '2022-08-24 15:17:48', '2022-08-24 15:17:48'),
('849', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"/demand\\/95\\/b0rp8c\",\"apps_url\":\"\\/demand\\/95\\/lomhes\",\"type\":\"demand\",\"notification_message\":\"You have bid in your demand\",\"bidder_id\":1015,\"bidder_name\":\"Younus Molla\",\"bidder_avatar\":\"\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":8,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2021-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2021-06-20T11:10:28.000000Z\",\"current_point\":21887}}', NULL, '2021-07-19 17:15:23', '2021-08-18 06:27:40'),
('8df532d3-b355-47db-996c-fd7a7305b107', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1024, '{\"details\":{\"post_url\":\"\\/demand\\/144\\/4eql3r\",\"apps_url\":\"\\/demand\\/144\\/y60rkz\",\"type\":\"demand\",\"demand_id\":\"144\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"3.5 mb image test upload ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 arifuzzaman \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1008,\"bidder_name\":\"arifuzzaman\",\"bidder_avatar\":\"http:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2021-12-06-1638772212.jpeg\",\"bidder_phone\":\"01824220935\"},\"demander\":{\"id\":1024,\"name\":\"Zoomba\",\"avatar\":\"2022-08-23-1661236876.jpeg\",\"mobile_no\":\"01568099321\",\"email\":\"nigur@zoomba.com\",\"area_id\":\"11\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"0.00\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"0\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"1\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2024-08-28\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2022-08-21T02:58:56.000000Z\",\"updated_at\":\"2022-09-08T04:14:14.000000Z\",\"current_point\":\"20\"}}', NULL, '2022-09-10 18:17:11', '2022-09-10 18:17:11'),
('980', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"/demand\\/107\\/83ly92\",\"apps_url\":\"/demand\\/107\\/xnrabg\",\"type\":\"demand\",\"notification_message\":\"You have bid in your demand\",\"bidder_id\":1015,\"bidder_name\":\"Younus Molla\",\"bidder_avatar\":\"\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":8,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2021-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2021-06-20T11:10:28.000000Z\",\"current_point\":21887}}', NULL, '2021-07-19 17:33:30', '2021-08-16 05:57:39'),
('981', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"/demand\\/102\\/kt0gzi\",\"apps_url\":\"/demand\\/102\\/tinhs0\",\"type\":\"demand\",\"notification_message\":\"You have bid in your demand\",\"bidder_id\":1015,\"bidder_name\":\"Younus Molla\",\"bidder_avatar\":\"\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":8,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2021-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2021-06-20T11:10:28.000000Z\",\"current_point\":21887}}', NULL, '2021-07-19 17:29:18', '2021-08-16 05:58:08'),
('982', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"\\/demand\\/107\\/y0rsec\",\"apps_url\":\"\\/demand\\/107\\/wfop8n\",\"type\":\"demand\",\"notification_message\":\"You have bid in your demand\",\"bidder_id\":1012,\"bidder_name\":\"tushar\",\"bidder_avatar\":\"http:\\/\\/localhost\\/demand-back\\/public\\/images\\/avatar\\/default\\/avatar.svg\",\"bidder_phone\":\"01717688134\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":8,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2021-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2021-06-20T11:10:28.000000Z\",\"current_point\":21887}}', NULL, '2021-07-19 20:07:04', '2021-07-20 12:12:19'),
('983', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"\\/nilam\\/18\\/0lqr2y\",\"apps_url\":\"\\/nilam\\/18\\/rifya2\",\"type\":\"nilam\",\"notification_message\":\"You Have Bid On Your Nilam\",\"bidder_id\":1015,\"bidder_name\":\"Younus Molla\",\"bidder_avatar\":\"http:\\/\\/localhost\\/demand-back\\/public\\/images\\/avatar\\/default\\/avatar.svg\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":8,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2021-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2021-06-20T11:10:28.000000Z\",\"current_point\":21887}}', '2021-08-16 05:52:12', '2021-07-20 13:28:52', '2021-08-16 05:52:12'),
('984', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1012, '{\"details\":{\"post_url\":\"\\/nilam\\/17\\/zoe0ny\",\"apps_url\":\"\\/nilam\\/17\\/8xybvd\",\"type\":\"nilam\",\"notification_message\":\"You Have Bid On Your Nilam\",\"bidder_id\":1015,\"bidder_name\":\"Younus Molla\",\"bidder_avatar\":\"http:\\/\\/localhost\\/demand-back\\/public\\/images\\/avatar\\/default\\/avatar.svg\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1012,\"name\":\"tushar\",\"avatar\":\"\",\"mobile_no\":\"01717688134\",\"email\":null,\"area_id\":3,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":3,\"seller_badge\":0,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":0,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2022-05-21\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-11T08:53:34.000000Z\",\"updated_at\":\"2021-03-16T05:55:45.000000Z\",\"current_point\":0}}', NULL, '2021-07-20 13:23:31', '2021-07-20 13:23:31'),
('985', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"/demand\\/103\\/8d2ezj\",\"apps_url\":\"/demand\\/103\\/c3k5jp\",\"type\":\"demand\",\"notification_message\":\"You have bid in your demand\",\"bidder_id\":1015,\"bidder_name\":\"Younus Molla\",\"bidder_avatar\":\"\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":8,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2021-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2021-06-20T11:10:28.000000Z\",\"current_point\":21887}}', NULL, '2021-07-19 17:30:54', '2021-08-16 05:57:51'),
('986', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"/demand\\/101\\/zkq0jv\",\"apps_url\":\"/demand\\/101\\/dih29z\",\"type\":\"demand\",\"notification_message\":\"You have bid in your demand\",\"bidder_id\":1015,\"bidder_name\":\"Younus Molla\",\"bidder_avatar\":\"\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":8,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2021-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2021-06-20T11:10:28.000000Z\",\"current_point\":21887}}', NULL, '2021-07-19 17:52:04', '2021-07-20 12:07:00'),
('987', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"/demand\\/100\\/qwtr2n\",\"apps_url\":\"/demand\\/100\\/est89f\",\"type\":\"demand\",\"notification_message\":\"You have bid in your demand\",\"bidder_id\":1015,\"bidder_name\":\"Younus Molla\",\"bidder_avatar\":\"\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":8,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2021-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2021-06-20T11:10:28.000000Z\",\"current_point\":21887}}', NULL, '2021-07-19 17:43:48', '2021-07-20 13:15:42'),
('988', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1015, '{\"details\":{\"post_url\":\"\\/demand\\/108\\/i8qwcn\",\"apps_url\":\"\\/demand\\/108\\/4otwyh\",\"type\":\"demand\",\"notification_message\":\"You Have Bid On Your Demand\",\"bidder_id\":1005,\"bidder_name\":\"Arifuzzaman\",\"bidder_avatar\":\"http:\\/\\/192.168.0.13\\/demand-back\\/public\\/images\\/avatar\\/default\\/avatar.svg\",\"bidder_phone\":\"01834394216\"},\"demander\":{\"id\":1015,\"name\":\"Arif\",\"avatar\":\"2021-08-11-1628667864.jpeg\",\"mobile_no\":\"01949281513\",\"email\":\"arifuzzaman.rb@gmail.com\",\"area_id\":11,\"sub_area_id\":0,\"average_saling_rating\":4.33,\"average_buying_rating\":0,\"seller_badge\":0,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2023-09-24\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-01-20T11:50:39.000000Z\",\"updated_at\":\"2021-08-11T07:44:24.000000Z\",\"current_point\":7193}}', '2021-08-18 06:48:13', '2021-08-18 06:47:58', '2021-08-18 06:48:13'),
('989', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"\\/demand\\/103\\/8ntgyw\",\"apps_url\":\"\\/demand\\/103\\/5ywihf\",\"type\":\"demand\",\"notification_message\":\"You Have Bid On Your Demand\",\"bidder_id\":1005,\"bidder_name\":\"Arifuzzaman\",\"bidder_avatar\":\"http:\\/\\/192.168.0.13\\/demand-back\\/public\\/images\\/avatar\\/default\\/avatar.svg\",\"bidder_phone\":\"01834394216\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":8,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2021-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2021-06-20T11:10:28.000000Z\",\"current_point\":21887}}', '2021-08-18 07:00:41', '2021-08-18 06:48:37', '2021-08-18 07:00:41'),
('990', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"\\/demand\\/105\\/wmz25b\",\"apps_url\":\"\\/demand\\/105\\/z1lox3\",\"type\":\"demand\",\"notification_message\":\"You have bid in your demand\",\"bidder_id\":1012,\"bidder_name\":\"tushar\",\"bidder_avatar\":\"\",\"bidder_phone\":\"01717688134\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":8,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2021-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2021-06-20T11:10:28.000000Z\",\"current_point\":21887}}', NULL, '2021-07-19 20:01:11', '2021-07-20 11:59:40'),
('991', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1012, '{\"details\":{\"post_url\":\"\\/nilam\\/15\\/6akzlo\",\"apps_url\":\"\\/nilam\\/15\\/xfrq2v\",\"type\":\"nilam\",\"notification_message\":\"You Have Bid On Your Nilam\",\"bidder_id\":1008,\"bidder_name\":\"arifuzzaman\",\"bidder_avatar\":\"http:\\/\\/localhost\\/demand-back\\/public\\/images\\/avatar\\/default\\/avatar.svg\",\"bidder_phone\":\"01824220935\"},\"demander\":{\"id\":1012,\"name\":\"tushar\",\"avatar\":\"\",\"mobile_no\":\"01717688134\",\"email\":null,\"area_id\":3,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":3,\"seller_badge\":0,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":0,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2022-05-21\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-11T08:53:34.000000Z\",\"updated_at\":\"2021-03-16T05:55:45.000000Z\",\"current_point\":0}}', NULL, '2021-07-19 22:39:26', '2021-07-19 22:39:26'),
('992', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"\\/demand\\/100\\/zfic8j\",\"apps_url\":\"\\/demand\\/100\\/gv8zop\",\"type\":\"demand\",\"notification_message\":\"You Have Bid On Your Demand\",\"bidder_id\":1005,\"bidder_name\":\"Arifuzzaman\",\"bidder_avatar\":\"http:\\/\\/192.168.0.177\\/demand-back\\/public\\/images\\/avatar\\/default\\/avatar.svg\",\"bidder_phone\":\"01834394216\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":8,\"sub_area_id\":0,\"average_saling_rating\":0,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2021-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2021-06-20T11:10:28.000000Z\",\"current_point\":21887}}', '2022-02-22 11:46:18', '2021-08-18 06:50:17', '2022-02-22 11:46:18'),
('9f73f84c-9622-48b4-9483-e7a28bcb271f', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1015, '{\"details\":{\"post_url\":\"\\/demand\\/108\\/9anxtz\",\"apps_url\":\"\\/demand\\/108\\/wj2hbr\",\"type\":\"demand\",\"demand_id\":\"108\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"need some big fish, like ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 Tushar R Islam \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1029,\"bidder_name\":\"Tushar R Islam\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2022-08-24-1661319417.jpeg\",\"bidder_phone\":\"01312447767\"},\"demander\":{\"id\":1015,\"name\":\"Arif\",\"avatar\":\"2021-08-11-1628667864.jpeg\",\"mobile_no\":\"01949281513\",\"email\":\"arifuzzaman.rb@gmail.com\",\"area_id\":\"11\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"4.40\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"1\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"1\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2024-03-24\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2021-01-20T05:50:39.000000Z\",\"updated_at\":\"2022-08-22T10:45:44.000000Z\",\"current_point\":\"7193\"}}', '2022-09-05 00:17:46', '2022-08-24 15:08:27', '2022-09-05 00:17:46'),
('bd55d9fc-676f-4724-a289-b5f881312a58', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"\\/demand\\/106\\/23r9fs\",\"apps_url\":\"\\/demand\\/106\\/mhfni6\",\"type\":\"demand\",\"demand_id\":\"106\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"2nd this posted by arifuz ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 Arif \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1015,\"bidder_name\":\"Arif\",\"bidder_avatar\":\"http:\\/\\/192.168.0.177\\/demand-back\\/public\\/images\\/avatar\\/2021-08-11-1628667864.jpeg\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"2021-12-06-1638772212.jpeg\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":3,\"sub_area_id\":0,\"average_saling_rating\":3.5,\"average_buying_rating\":3.5,\"seller_badge\":1,\"buyer_badge\":1,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2022-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2022-02-22T09:16:52.000000Z\",\"current_point\":540}}', NULL, '2022-03-16 06:05:20', '2022-03-16 06:05:20'),
('ccccbca3-3a88-4276-b736-a74690836a64', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1030, '{\"details\":{\"post_url\":\"\\/demand\\/133\\/l7q8nz\",\"apps_url\":\"\\/demand\\/133\\/yc36d5\",\"type\":\"demand\",\"demand_id\":\"133\",\"notification_message\":\"Congrats! \\\"I need an excavator for 2 ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 \\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\u09ac\\u09bf\\u09a1 \\u0995\\u09a8\\u09ab\\u09be\\u09b0\\u09cd\\u09ae \\u09b9\\u09df\\u09c7\\u099b\\u09c7\",\"bidder_id\":1029,\"bidder_name\":\"Tushar R Islam\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2022-08-24-1661319417.jpeg\",\"bidder_phone\":\"01312447767\"},\"demander\":{\"id\":1030,\"name\":\"Mohammed Tauhid\",\"avatar\":\"2022-08-24-1661321030.jpeg\",\"mobile_no\":\"01766558045\",\"email\":\"mfislambba@gmail.com\",\"area_id\":\"3\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"0.00\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"0\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"1\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2022-09-23\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2022-08-24T05:59:57.000000Z\",\"updated_at\":\"2022-08-24T06:03:50.000000Z\",\"current_point\":\"20\"}}', NULL, '2022-08-24 16:22:56', '2022-08-24 16:22:56'),
('d830159c-3cb1-4257-8db6-2c7bfb25b0ce', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1015, '{\"details\":{\"post_url\":\"\\/demand\\/97\\/8j4hvq\",\"apps_url\":\"\\/demand\\/97\\/4uc2bd\",\"type\":\"demand\",\"demand_id\":\"97\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"dxfhhfg dfhggdhdfg fghfgh ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 arifuzzaman \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1008,\"bidder_name\":\"arifuzzaman\",\"bidder_avatar\":\"http:\\/\\/192.168.0.177\\/demand-back\\/public\\/images\\/avatar\\/2021-12-06-1638772212.jpeg\",\"bidder_phone\":\"01824220935\"},\"demander\":{\"id\":1015,\"name\":\"Arif\",\"avatar\":\"2021-08-11-1628667864.jpeg\",\"mobile_no\":\"01949281513\",\"email\":\"arifuzzaman.rb@gmail.com\",\"area_id\":11,\"sub_area_id\":0,\"average_saling_rating\":4.25,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2024-03-24\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-01-20T11:50:39.000000Z\",\"updated_at\":\"2021-12-02T12:44:19.000000Z\",\"current_point\":7193}}', NULL, '2022-03-16 09:43:27', '2022-03-16 09:43:27'),
('d9e48b47-42fd-4641-92f5-73ef6225f559', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1015, '{\"details\":{\"post_url\":\"\\/demand\\/31\\/1w7j03\",\"apps_url\":\"\\/demand\\/31\\/ru8olw\",\"type\":\"demand\",\"demand_id\":31,\"notification_message\":\"Congrats! \\\"I need 2 d headphone lore ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 \\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\u09ac\\u09bf\\u09a1 \\u0995\\u09a8\\u09ab\\u09be\\u09b0\\u09cd\\u09ae \\u09b9\\u09df\\u09c7\\u099b\\u09c7\",\"bidder_id\":1005,\"bidder_name\":\"Shakhawat HOssain\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/default\\/avatar.svg\",\"bidder_phone\":\"01834394216\"},\"demander\":{\"id\":1015,\"name\":\"Arif\",\"avatar\":\"2021-08-11-1628667864.jpeg\",\"mobile_no\":\"01949281513\",\"email\":\"arifuzzaman.rb@gmail.com\",\"area_id\":11,\"sub_area_id\":0,\"average_saling_rating\":4.25,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2024-03-24\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-01-20T05:50:39.000000Z\",\"updated_at\":\"2021-12-02T06:44:19.000000Z\",\"current_point\":7193}}', '2022-09-06 14:50:35', '2022-08-22 16:45:29', '2022-09-06 14:50:35'),
('dd37d41b-22cd-4c13-8637-9ff3240b7208', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1031, '{\"details\":{\"post_url\":\"\\/demand\\/135\\/zfdi39\",\"apps_url\":\"\\/demand\\/135\\/nd0h6u\",\"type\":\"demand\",\"demand_id\":\"135\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"\\u0986\\u09ae\\u09be\\u09b0 \\u098f\\u0995\\u099f\\u09bf \\u09b8\\u09bf\\u09b2\\u09bf\\u09a8\\u09cd\\u09a1\\u09be\\u09b0 \\u09b2\\u09be\\u0997\\u09ac\\u09c7\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 Mohammed Tauhid \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1030,\"bidder_name\":\"Mohammed Tauhid\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2022-08-24-1661321030.jpeg\",\"bidder_phone\":\"01766558045\"},\"demander\":{\"id\":1031,\"name\":\"Ashiqur Rahman\",\"avatar\":\"\",\"mobile_no\":\"01676916082\",\"email\":null,\"area_id\":\"3\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"3.00\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"1\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"0\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2022-09-23\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2022-08-24T09:15:36.000000Z\",\"updated_at\":\"2022-08-24T09:31:07.000000Z\",\"current_point\":\"20\"}}', '2022-08-24 15:36:31', '2022-08-24 15:36:08', '2022-08-24 15:36:31'),
('ddb7101d-5416-47b2-8649-78a03e6ab299', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"\\/demand\\/104\\/a29p03\",\"apps_url\":\"\\/demand\\/104\\/o160ug\",\"type\":\"demand\",\"demand_id\":\"104\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"Narikel er daav1008\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 Arif \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1015,\"bidder_name\":\"Arif\",\"bidder_avatar\":\"http:\\/\\/192.168.0.177\\/demand-back\\/public\\/images\\/avatar\\/2021-08-11-1628667864.jpeg\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"2021-12-06-1638772212.jpeg\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":3,\"sub_area_id\":0,\"average_saling_rating\":3.5,\"average_buying_rating\":3.5,\"seller_badge\":1,\"buyer_badge\":1,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2022-11-14\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-04T08:16:17.000000Z\",\"updated_at\":\"2022-02-22T09:16:52.000000Z\",\"current_point\":540}}', NULL, '2022-03-16 07:17:07', '2022-03-16 07:17:07'),
('e3023f9d-8bd1-4574-a3a3-878a2549ac74', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1015, '{\"details\":{\"post_url\":\"\\/demand\\/103\\/6fl9nu\",\"apps_url\":\"\\/demand\\/103\\/h6w2ju\",\"type\":\"demand\",\"demand_id\":\"103\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"Mosur daal sell hobe, ruk ...\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 arifuzzaman \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1008,\"bidder_name\":\"arifuzzaman\",\"bidder_avatar\":\"http:\\/\\/192.168.0.177\\/demand-back\\/public\\/images\\/avatar\\/2021-12-06-1638772212.jpeg\",\"bidder_phone\":\"01824220935\"},\"demander\":{\"id\":1015,\"name\":\"Arif\",\"avatar\":\"2021-08-11-1628667864.jpeg\",\"mobile_no\":\"01949281513\",\"email\":\"arifuzzaman.rb@gmail.com\",\"area_id\":11,\"sub_area_id\":0,\"average_saling_rating\":4.25,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2024-03-24\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-01-20T11:50:39.000000Z\",\"updated_at\":\"2021-12-02T12:44:19.000000Z\",\"current_point\":7193}}', NULL, '2022-03-16 09:26:10', '2022-03-16 09:26:10'),
('e5f3a973-93fa-4c5b-9949-7e7fa2a948a1', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1015, '{\"details\":{\"post_url\":\"\\/demand\\/101\\/81iyhr\",\"apps_url\":\"\\/demand\\/101\\/hym5sv\",\"type\":\"demand\",\"demand_id\":\"101\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"Le lo boro anaros1008\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 arifuzzaman \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1008,\"bidder_name\":\"arifuzzaman\",\"bidder_avatar\":\"http:\\/\\/192.168.0.177\\/demand-back\\/public\\/images\\/avatar\\/2021-12-06-1638772212.jpeg\",\"bidder_phone\":\"01824220935\"},\"demander\":{\"id\":1015,\"name\":\"Arif\",\"avatar\":\"2021-08-11-1628667864.jpeg\",\"mobile_no\":\"01949281513\",\"email\":\"arifuzzaman.rb@gmail.com\",\"area_id\":11,\"sub_area_id\":0,\"average_saling_rating\":4.25,\"average_buying_rating\":0,\"seller_badge\":1,\"buyer_badge\":0,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2024-03-24\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-01-20T11:50:39.000000Z\",\"updated_at\":\"2021-12-02T12:44:19.000000Z\",\"current_point\":7193}}', '2022-09-21 15:32:28', '2022-03-01 06:09:08', '2022-09-21 15:32:28');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('ea84a8c6-00b8-4e03-83c9-fcc18f26ee49', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1024, '{\"details\":{\"post_url\":\"\\/demand\\/131\\/934yhv\",\"apps_url\":\"\\/demand\\/131\\/s0nihq\",\"type\":\"demand\",\"demand_id\":\"131\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"50 ti shirt lagbe\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 Arif \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1015,\"bidder_name\":\"Arif\",\"bidder_avatar\":\"http:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2022-09-06-1662454160.jpeg\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1024,\"name\":\"Zoomba\",\"avatar\":\"2022-08-23-1661236876.jpeg\",\"mobile_no\":\"01568099321\",\"email\":\"nigur@zoomba.com\",\"area_id\":\"11\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"0.00\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"0\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"1\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2024-08-28\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2022-08-21T02:58:56.000000Z\",\"updated_at\":\"2022-09-08T04:14:14.000000Z\",\"current_point\":\"20\"}}', NULL, '2022-09-08 15:32:38', '2022-09-08 15:32:38'),
('ed44cf3c-e8d0-4f97-adf9-7136bad0c288', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1008, '{\"details\":{\"post_url\":\"\\/demand\\/101\\/e1n5uq\",\"apps_url\":\"\\/demand\\/101\\/mtzfhl\",\"type\":\"demand\",\"demand_id\":\"101\",\"notification_message\":\"Congrats! \\\"Le lo boro anaros1008\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 \\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\u09ac\\u09bf\\u09a1 \\u0995\\u09a8\\u09ab\\u09be\\u09b0\\u09cd\\u09ae \\u09b9\\u09df\\u09c7\\u099b\\u09c7\",\"bidder_id\":1015,\"bidder_name\":\"Arif\",\"bidder_avatar\":\"http:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2022-09-06-1662454160.jpeg\",\"bidder_phone\":\"01949281513\"},\"demander\":{\"id\":1008,\"name\":\"arifuzzaman\",\"avatar\":\"2021-12-06-1638772212.jpeg\",\"mobile_no\":\"01824220935\",\"email\":\"arif@zaman.com\",\"area_id\":\"3\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"3.50\",\"average_buying_rating\":\"3.50\",\"seller_badge\":\"1\",\"buyer_badge\":\"1\",\"is_seller\":\"1\",\"is_seller_before\":\"1\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2022-11-14\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2021-03-04T02:16:17.000000Z\",\"updated_at\":\"2022-02-22T03:16:52.000000Z\",\"current_point\":\"540\"}}', NULL, '2022-09-21 15:34:30', '2022-09-21 15:34:30'),
('f75e15bd-afa6-4940-8d7a-326d66de5ad6', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1010, '{\"details\":{\"post_url\":\"\\/demand\\/93\\/gdfcxe\",\"apps_url\":\"\\/demand\\/93\\/ni78o5\",\"type\":\"demand\",\"demand_id\":93,\"notification_message\":\"Congrats! \\\"i need this nature\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 \\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\u09ac\\u09bf\\u09a1 \\u0995\\u09a8\\u09ab\\u09be\\u09b0\\u09cd\\u09ae \\u09b9\\u09df\\u09c7\\u099b\\u09c7\",\"bidder_id\":1008,\"bidder_name\":\"arifuzzaman\",\"bidder_avatar\":\"http:\\/\\/192.168.0.177\\/demand-back\\/public\\/images\\/avatar\\/2021-12-06-1638772212.jpeg\",\"bidder_phone\":\"01824220935\"},\"demander\":{\"id\":1010,\"name\":\"sayeed\",\"avatar\":\"2021-06-22-1624345393.jpeg\",\"mobile_no\":\"01824143370\",\"email\":\"sayeed300056@gmail.com\",\"area_id\":3,\"sub_area_id\":0,\"average_saling_rating\":3.67,\"average_buying_rating\":3,\"seller_badge\":1,\"buyer_badge\":1,\"is_seller\":1,\"is_seller_before\":1,\"post_permission\":1,\"bid_permission\":1,\"subscription_expired_at\":\"2022-09-28\",\"email_verified_at\":null,\"status\":1,\"created_at\":\"2021-03-10T11:02:42.000000Z\",\"updated_at\":\"2022-02-03T12:21:59.000000Z\",\"current_point\":997}}', '2022-08-31 14:18:14', '2022-03-20 13:07:08', '2022-08-31 14:18:14'),
('f7d3508f-9c70-4e15-8256-7717b715f562', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1010, '{\"details\":{\"post_url\":\"\\/demand\\/143\\/5ezpux\",\"apps_url\":\"\\/demand\\/143\\/jcv7e9\",\"type\":\"demand\",\"demand_id\":\"143\",\"notification_message\":\"\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\\"Ghuuh hhh\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 Tushar R Islam \\u09ac\\u09bf\\u09a1 \\u0995\\u09b0\\u09c7\\u099b\\u09c7\\u09a8\",\"bidder_id\":1029,\"bidder_name\":\"Tushar R Islam\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/2022-08-24-1661319417.jpeg\",\"bidder_phone\":\"01312447767\"},\"demander\":{\"id\":1010,\"name\":\"sayeed\",\"avatar\":\"2021-06-22-1624345393.jpeg\",\"mobile_no\":\"01824143370\",\"email\":\"sayeed300056@gmail.com\",\"area_id\":\"3\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"3.75\",\"average_buying_rating\":\"3.00\",\"seller_badge\":\"1\",\"buyer_badge\":\"1\",\"is_seller\":\"1\",\"is_seller_before\":\"1\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2022-09-28\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2021-03-10T05:02:42.000000Z\",\"updated_at\":\"2022-03-20T07:07:18.000000Z\",\"current_point\":\"997\"}}', NULL, '2022-08-25 16:05:59', '2022-08-25 16:05:59'),
('ffb8fddc-a3c7-4b23-bd5e-cb9ffc1f5b47', 'App\\Notifications\\BidOnDemandNotification', 'App\\Models\\User', 1030, '{\"details\":{\"post_url\":\"\\/demand\\/135\\/ju7l6o\",\"apps_url\":\"\\/demand\\/135\\/jyvckt\",\"type\":\"demand\",\"demand_id\":\"135\",\"notification_message\":\"Congrats! \\\"\\u0986\\u09ae\\u09be\\u09b0 \\u098f\\u0995\\u099f\\u09bf \\u09b8\\u09bf\\u09b2\\u09bf\\u09a8\\u09cd\\u09a1\\u09be\\u09b0 \\u09b2\\u09be\\u0997\\u09ac\\u09c7\\\" \\u09aa\\u09cb\\u09b7\\u09cd\\u099f\\u09c7 \\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\u09ac\\u09bf\\u09a1 \\u0995\\u09a8\\u09ab\\u09be\\u09b0\\u09cd\\u09ae \\u09b9\\u09df\\u09c7\\u099b\\u09c7\",\"bidder_id\":1031,\"bidder_name\":\"Ashiqur Rahman\",\"bidder_avatar\":\"https:\\/\\/bidoapi.bangladeshclubgeneva.ch\\/public\\/images\\/avatar\\/default\\/avatar.svg\",\"bidder_phone\":\"01676916082\"},\"demander\":{\"id\":1030,\"name\":\"Mohammed Tauhid\",\"avatar\":\"2022-08-24-1661321030.jpeg\",\"mobile_no\":\"01766558045\",\"email\":\"mfislambba@gmail.com\",\"area_id\":\"3\",\"sub_area_id\":\"0\",\"average_saling_rating\":\"0.00\",\"average_buying_rating\":\"0.00\",\"seller_badge\":\"0\",\"buyer_badge\":\"0\",\"is_seller\":\"1\",\"is_seller_before\":\"1\",\"post_permission\":\"1\",\"bid_permission\":\"1\",\"subscription_expired_at\":\"2022-09-23\",\"email_verified_at\":null,\"status\":\"1\",\"created_at\":\"2022-08-24T05:59:57.000000Z\",\"updated_at\":\"2022-08-24T06:03:50.000000Z\",\"current_point\":\"20\"}}', '2022-08-24 15:40:50', '2022-08-24 15:37:24', '2022-08-24 15:40:50');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0074a8fb34ed8c1e7fdbd3eff12cd14654553460501837b6a3359d0909b3eed8e61df682d6d0e15e', 1015, 1, 'AuthToken', '[]', 1, '2021-01-21 04:43:27', '2021-01-21 04:43:27', '2022-01-21 10:43:27'),
('015249f57c8532eb6b9437dd9dbaf62e28d69b0cdfb480f596c483f2d2bd63cb05e3e5cf1214bcd8', 1008, 2, 'AuthToken', '[]', 0, '2022-02-23 07:12:02', '2022-02-23 07:12:02', '2023-02-23 13:12:02'),
('0277b4c7eca5aa187e9b3acab376f93ec06d6de3aab23dfd5805c8190167fbaa43ec2d7f11eee032', 1012, 1, 'AuthToken', '[]', 0, '2021-01-18 08:53:34', '2021-01-18 08:53:34', '2022-01-18 14:53:34'),
('03b92780df569d89ace9b78eda21bfe50250c113a4fad3c11d1d12ac0089ce263a041f76cbd48e6a', 1005, 1, 'AuthToken', '[]', 1, '2021-01-12 04:31:14', '2021-01-12 04:31:14', '2022-01-12 10:31:14'),
('03dfcb5dc69b7b2ff137a7a423fb247f9249e43efb14a40390219ee1632433d8dba215f61d32648e', 1015, 2, 'AuthToken', '[]', 0, '2021-11-28 04:39:11', '2021-11-28 04:39:11', '2022-11-28 10:39:11'),
('04686308393a14d92a961e0f2e4a929b32cd1327f63509704d0473e34aa6b01ef78ab9cfc8d273fd', 1018, 2, 'AuthToken', '[]', 1, '2022-02-14 11:10:38', '2022-02-14 11:10:38', '2023-02-14 17:10:38'),
('04b68f0db1da9390a403aab089e553feba310609c92db6f3b5836c5ab98854820efd99fbc40100e4', 1010, 2, 'AuthToken', '[]', 0, '2022-03-21 05:22:12', '2022-03-21 05:22:12', '2023-03-21 11:22:12'),
('065dd7b307461e750ad197911fa78567c8e7fc12f620f16bcf4550ddf94c8f38bab390489afc2dbd', 1014, 2, 'AuthToken', '[]', 0, '2021-11-01 10:08:49', '2021-11-01 10:08:49', '2022-11-01 16:08:49'),
('075612145c8e5ae74f3a0d8c6e073849744e0550c96d3d5fa871a8632865e1ed5937ac70a5906f64', 1015, 2, 'AuthToken', '[]', 0, '2022-09-21 13:41:49', '2022-09-21 13:41:49', '2023-09-21 13:41:49'),
('07d13f9aea14f2a3eec1afb6479078c1e5df007af7494732c06cfa931b298f056180c3e21310baee', 1005, 1, 'AuthToken', '[]', 1, '2020-12-29 12:16:03', '2020-12-29 12:16:03', '2021-12-29 18:16:03'),
('08e97c2daa62c61940f0f46649044233c23c4bcb23b9671a8606faf026d1f1cfef9c8bae865c385a', 1015, 2, 'AuthToken', '[]', 0, '2022-09-04 23:28:21', '2022-09-04 23:28:21', '2023-09-04 23:28:21'),
('093f1ba403d971de53e76f910f9f6fa787748643efad62ad5febbc8c3616a16bd815095e48491174', 1002, 1, 'AuthToken', '[]', 0, '2021-01-11 07:13:04', '2021-01-11 07:13:04', '2022-01-11 13:13:04'),
('0c93b7967c201d5a3a1bda3432665f7062c6bbea59563aad4ada2750b530e821271c3e960d8d2d34', 1008, 2, 'AuthToken', '[]', 0, '2022-02-01 05:27:12', '2022-02-01 05:27:12', '2023-02-01 11:27:12'),
('0d81dde1e238e7ccf3d8bde8a5a5ffb13eefe2adea13edc3afaf9f93ce0db4ac8defb0a41ac16eb9', 1010, 1, 'AuthToken', '[]', 0, '2021-01-13 04:31:26', '2021-01-13 04:31:26', '2022-01-13 10:31:26'),
('0dca18370782cd8eb084020e627eb7a60c1ba3a143f68b02f756495457985d35b50ae63b213b87f4', 1008, 2, 'AuthToken', '[]', 0, '2021-11-02 05:44:14', '2021-11-02 05:44:14', '2022-11-02 11:44:14'),
('0f0c6c992a7982fb64cc2a3d9914d2aa7872668e48d5a096858b251040cae831000faa3479c4e57c', 1008, 2, 'AuthToken', '[]', 1, '2022-02-19 05:57:01', '2022-02-19 05:57:01', '2023-02-19 11:57:01'),
('11c391851cbffa8f6494500bed6f573abdb2c42448461f9911757a0cac651e46fe53ce29f18bc8f3', 1010, 2, 'AuthToken', '[]', 0, '2022-08-25 10:25:03', '2022-08-25 10:25:03', '2023-08-25 10:25:03'),
('1310abfc0c95b5aa88ddafa817672b2c36750529c0e94593a1e2e0502796f7862e3f880c5eee14e3', 1003, 2, 'AuthToken', '[]', 0, '2021-07-07 21:36:00', '2021-07-07 21:36:00', '2022-07-08 03:36:00'),
('19ba22926c494500d11000e73ac4b42b082678fac55fd319bb61d7cad9344bee6d567fd9d710ce51', 1015, 2, 'AuthToken', '[]', 0, '2021-12-06 11:10:42', '2021-12-06 11:10:42', '2022-12-06 17:10:42'),
('1aca09d69125d3cde167997a99107bf476aa0a97e985873db14048187ddc97b035f5d5e6d9da7c79', 1010, 2, 'AuthToken', '[]', 0, '2022-02-02 13:06:37', '2022-02-02 13:06:37', '2023-02-02 19:06:37'),
('1b3f079b447544bc96e9d38ea791b3f69b28bccf379db9408aca71d871b13cd617300cff2db69ee9', 1015, 2, 'AuthToken', '[]', 0, '2022-01-30 07:24:13', '2022-01-30 07:24:13', '2023-01-30 13:24:13'),
('1bcdc93473d90cc9861977638ffe6419332190a11b1d6d8ee10680a5cae0e052569ffc51b59732cd', 1010, 2, 'AuthToken', '[]', 0, '2022-08-25 15:40:47', '2022-08-25 15:40:47', '2023-08-25 15:40:47'),
('1cd5e0e0e603d84cc6056905b8373cb1c1aceb27732d5b9f99cb181d3e007549976d680521969f52', 1002, 1, 'AuthToken', '[]', 1, '2021-01-19 10:33:56', '2021-01-19 10:33:56', '2022-01-19 16:33:56'),
('1db8bcd67e5992c3a334411d555e20c2fd63932dcfdd2579299476e866942be68d48dcaf4ab6fa8d', 1012, 2, 'AuthToken', '[]', 0, '2021-07-19 20:00:28', '2021-07-19 20:00:28', '2022-07-20 02:00:28'),
('1f2cd1c593efe7c7e2d541f1fad2c411c67b97beef38afbe827f29c43418891246f887bdfe295411', 1008, 2, 'AuthToken', '[]', 0, '2021-12-06 10:37:47', '2021-12-06 10:37:47', '2022-12-06 16:37:47'),
('1f6f6857037681a5e93957350b50f749923d7dcda2ce6ed9a8898f44ab1dc7bf119a579e0b064b03', 1008, 2, 'AuthToken', '[]', 0, '2021-04-26 09:39:54', '2021-04-26 09:39:54', '2022-04-26 15:39:54'),
('1fc5f67fa9a27fbb8c685b6c3d497a4d5badd5e1cbeee8d1849f66dafb902e8d9b199cfebc6edc87', 1015, 2, 'AuthToken', '[]', 0, '2022-09-08 15:49:24', '2022-09-08 15:49:24', '2023-09-08 15:49:24'),
('20dc7a1e014f928527c7e53d962ccc044571b891690033238f4e5459e10b5741945cf57162c1911f', 1010, 1, 'AuthToken', '[]', 0, '2021-01-28 10:42:17', '2021-01-28 10:42:17', '2022-01-28 16:42:17'),
('20dcc2d0baba09969d555572836e0c23ff99d6b0ddce24b18d049a72ec7bb6ea0724ac034d83c8c6', 1010, 2, 'AuthToken', '[]', 0, '2022-02-03 12:55:40', '2022-02-03 12:55:40', '2023-02-03 18:55:40'),
('20e62c4391d16b4b3d231274bf8373581614a836552053084f539b1d627af3e4094b7c8bf1167c8e', 1002, 1, 'AuthToken', '[]', 1, '2021-01-18 04:50:43', '2021-01-18 04:50:43', '2022-01-18 10:50:43'),
('228ef50648c85aa52ebda60563f5ae761dc454dee01c03dd34c885dfe900e5f438e42303af50410f', 1010, 2, 'AuthToken', '[]', 0, '2022-03-16 06:18:44', '2022-03-16 06:18:44', '2023-03-16 12:18:44'),
('22af7aa879091e1780c7cc8dc0c455ce08e897c866069b563fd28e22fb0d3c863ee848f1deaa04f4', 1010, 2, 'AuthToken', '[]', 0, '2021-05-31 07:00:03', '2021-05-31 07:00:03', '2022-05-31 13:00:03'),
('2753417e065c02da63e96f0e9edb7c76c72a6508e6d66e5bc2765fd60c2c77adfa29b03d4d51cb2e', 1008, 1, 'AuthToken', '[]', 1, '2021-01-04 08:16:18', '2021-01-04 08:16:18', '2022-01-04 14:16:18'),
('28166ec003c36f4f683730ac2772bbdefde8cc5048ab794e1b573b36dd2f28a402f0d122f49c27fc', 1002, 1, 'AuthToken', '[]', 0, '2021-01-13 07:05:11', '2021-01-13 07:05:11', '2022-01-13 13:05:11'),
('2ae37891cd65460c6d36ae014238d3e5f261790c789aeceaa6d1532321a2c0bd0ca561a4ce12d153', 1008, 2, 'AuthToken', '[]', 0, '2022-01-31 07:16:12', '2022-01-31 07:16:12', '2023-01-31 13:16:12'),
('2c2831d415f298f6fbcb2b2106d955351ae8a1bd0a09644eadf063b680c23dc17611e4ea9cc949b5', 1008, 2, 'AuthToken', '[]', 0, '2022-03-20 12:52:36', '2022-03-20 12:52:36', '2023-03-20 18:52:36'),
('2ce6bd9469e13f2af7058bd790ea8946f07bbe29fd864fa627c55c9425236962f249d8a766fee363', 1008, 2, 'AuthToken', '[]', 0, '2022-09-06 13:38:20', '2022-09-06 13:38:20', '2023-09-06 13:38:20'),
('2ed65fba1c761afa6a1c65857b5a1b9b2183a0641b82558b5a76b8e3f3b52ef5a00835fed1b1a599', 1006, 1, 'AuthToken', '[]', 1, '2021-01-19 10:13:37', '2021-01-19 10:13:37', '2022-01-19 16:13:37'),
('313c3f8c31886f195e2ed201815d01a19ecbe998eb0281bd2afcc69bc323b9bf72f984401f6237ae', 1010, 2, 'AuthToken', '[]', 0, '2021-10-28 05:08:49', '2021-10-28 05:08:49', '2022-10-28 11:08:49'),
('33dd4c1d1af433aba5b6c3bad9e780d0ca1320c2c0acc0482be3dae207c4407e78a63811bbd4292c', 1015, 2, 'AuthToken', '[]', 0, '2022-08-24 16:26:06', '2022-08-24 16:26:06', '2023-08-24 16:26:06'),
('352f9e0bf53142aae0a52801f485694ccda8c57e043b953a1c25e914706b963d7b9edc7205c7763f', 1009, 1, 'AuthToken', '[]', 1, '2021-01-13 04:59:35', '2021-01-13 04:59:35', '2022-01-13 10:59:35'),
('35e9fbdcb9f12b067463587f3239119afdd4873f196c1cd47880ec4559680f92768d0de6b67a9ac8', 1015, 2, 'AuthToken', '[]', 0, '2021-05-25 05:11:07', '2021-05-25 05:11:07', '2022-05-25 11:11:07'),
('3894405c31ad9c281a6d85924dc19f0ae0b0b4c047a80c14a3c4d2ac036acbe405377a408076a4f1', 1015, 2, 'AuthToken', '[]', 0, '2022-01-30 07:23:05', '2022-01-30 07:23:05', '2023-01-30 13:23:05'),
('3c7dee5b7c314cf520d0a53dc11ce60d15243aa82064f3c3cdd0766832da7c04e8415f3c810e1fe5', 1010, 2, 'AuthToken', '[]', 0, '2022-03-22 06:11:07', '2022-03-22 06:11:07', '2023-03-22 12:11:07'),
('41ecb27d90610126cabd630ca1d56d990dfbf4935e5eac351e7e7f13020eef2c56e9a0e2184b3889', 1008, 2, 'AuthToken', '[]', 0, '2022-02-02 13:12:18', '2022-02-02 13:12:18', '2023-02-02 19:12:18'),
('41f8212d6efe763dd66d55ca635fe97125972ed4dabfca370f290b8b1064990db9e1a7ea2fc3479d', 1010, 1, 'AuthToken', '[]', 0, '2021-01-11 05:12:53', '2021-01-11 05:12:53', '2022-01-11 11:12:53'),
('43c7ef5a121e6071ef1e45d4c5dad55d914de52fe0a24d4a8f9068909edfa5bb5ad5ce81ae097ef3', 1010, 2, 'AuthToken', '[]', 0, '2022-03-14 07:41:15', '2022-03-14 07:41:15', '2023-03-14 13:41:15'),
('441c5f0e8a5a104d8b19ba92dc32fe717873718ff3f859b76a973ff9a0b967e043b2a12aa2ab5b2a', 1010, 2, 'AuthToken', '[]', 0, '2021-10-25 07:19:58', '2021-10-25 07:19:58', '2022-10-25 13:19:58'),
('4684a5c31b182a5e63cb5db7c213167ce4af91952f821ac538031163173ae878a5c6d7daea5e287c', 1029, 2, 'AuthToken', '[]', 0, '2022-08-24 11:33:00', '2022-08-24 11:33:00', '2023-08-24 11:33:00'),
('46cf5e4a793d32a997116e82b99d29be4d311d8c72ae663d45ddda0b35f339e6265f6441de5c8a62', 1008, 2, 'AuthToken', '[]', 0, '2022-01-31 07:19:06', '2022-01-31 07:19:06', '2023-01-31 13:19:06'),
('4730ef9a84baab9cf8bf99cdb0763a7747a56a5aeb421247949bb7fad24556a4ab92ab4654eaae24', 1030, 2, 'AuthToken', '[]', 0, '2022-08-24 15:15:31', '2022-08-24 15:15:31', '2023-08-24 15:15:31'),
('49f4279ca103c15c30adbbb2a9bc938b050e1a1a585ffaeb51793ad59395018d3ae224ae5406801b', 1005, 1, 'AuthToken', '[]', 0, '2021-03-03 09:52:14', '2021-03-03 09:52:14', '2022-03-03 15:52:14'),
('4a15aefb7953b33651cc6be3d593ce1c9915f519507c4d7d7ed0ad00e314004278c4c8f39f8bddf7', 1008, 2, 'AuthToken', '[]', 0, '2022-01-31 07:04:14', '2022-01-31 07:04:14', '2023-01-31 13:04:14'),
('4a8b9c404272ec1cacb5e6bc667a85b8b82d37a29f706a4a7a5c2e1042c07e82035ef1cc16c2abc0', 1015, 2, 'AuthToken', '[]', 1, '2022-09-08 13:04:17', '2022-09-08 13:04:17', '2023-09-08 13:04:17'),
('4c4b85b61a95a137760d673078ea0fa92e27b95e8c94c2f229e0c2a6cbdfbc4fb61eea314fcf910d', 1010, 2, 'AuthToken', '[]', 0, '2021-06-23 08:10:42', '2021-06-23 08:10:42', '2022-06-23 14:10:42'),
('4cba8994e4f5229cd6bdaebe4d1beb6fe2e6abe2a22d871cfb6d5eb3e580038d58235b7ba787d9c8', 1002, 1, 'AuthToken', '[]', 1, '2020-12-27 07:31:26', '2020-12-27 07:31:26', '2021-12-27 13:31:26'),
('4de40998d4ffa895993c7669ec5a8ae79e9ad94c76c698285337a73651f66660711b30d9b75e8e07', 1010, 2, 'AuthToken', '[]', 0, '2022-03-21 10:36:16', '2022-03-21 10:36:16', '2023-03-21 16:36:16'),
('4ebe62bdcbceee0aa3bcd2ef75aa485605163a30bbb09293868ef661b85932c0f176551930a4a030', 1008, 2, 'AuthToken', '[]', 0, '2021-07-17 06:46:22', '2021-07-17 06:46:22', '2022-07-17 12:46:22'),
('518b93b923c66148dfce521931ba721608c304727dc8c2288deb42fbcf80618997e852d1996c4e93', 1002, 1, 'AuthToken', '[]', 0, '2021-01-13 06:17:36', '2021-01-13 06:17:36', '2022-01-13 12:17:36'),
('53db313bdcaa669c1e80ff55798f7a758831d1e4655711df2d7e9c50fb74f5cab40dfc6fddd1c726', 1010, 2, 'AuthToken', '[]', 0, '2022-03-16 05:46:39', '2022-03-16 05:46:39', '2023-03-16 11:46:39'),
('5444d4073205f2ea12e1301c4881b07f342c68d6c6aa3038808342927c6df36b58d51ec369559a91', 1010, 1, 'AuthToken', '[]', 0, '2021-01-19 05:35:26', '2021-01-19 05:35:26', '2022-01-19 11:35:26'),
('549fec6d86e0ac54ee503f859381b44b26f342fa42ac4825d777c124ab717f051c57118986caee34', 1010, 2, 'AuthToken', '[]', 0, '2021-07-20 08:13:02', '2021-07-20 08:13:02', '2022-07-20 14:13:02'),
('57048051be69779e3763b06679071a4dfa49d317e1b6d9e10aba450b707148ce3b1daa84e21e73af', 1010, 2, 'AuthToken', '[]', 0, '2022-03-22 12:39:48', '2022-03-22 12:39:48', '2023-03-22 18:39:48'),
('5883ea0d65e5c3e32d144ed1a8d304dd974c7974f64e7d58da4355530b13d38eae8ba11a99d9bb0c', 1031, 2, 'AuthToken', '[]', 0, '2022-08-24 15:23:35', '2022-08-24 15:23:35', '2023-08-24 15:23:35'),
('589b7c10334b7f3db8344a593dae697b3e2f6b69a47a26010d22888b99ebccb7e77bbf447ac82def', 1029, 2, 'AuthToken', '[]', 0, '2022-09-21 10:21:03', '2022-09-21 10:21:03', '2023-09-21 10:21:03'),
('5a0887e6cd3d050e160475eb5a8db3d640430f5c1658df823893980f4e7036d68c022c76311b6bbe', 1015, 2, 'AuthToken', '[]', 0, '2021-07-15 22:35:54', '2021-07-15 22:35:54', '2022-07-16 04:35:54'),
('5c3dffe11f4ac8dd820a5d38dcb7ed27418ec28e8eef89faaed1658eea12b3588f25ca41e0695794', 1015, 2, 'AuthToken', '[]', 0, '2022-01-31 06:53:17', '2022-01-31 06:53:17', '2023-01-31 12:53:17'),
('5ec3d221e19e3b0da6d5b24289453a928aafb20bea10bfee1ae3f8b9c5e23b89819211e098924e4e', 1015, 2, 'AuthToken', '[]', 0, '2022-08-22 16:39:33', '2022-08-22 16:39:33', '2023-08-22 16:39:33'),
('5f85b39ab40f60d8ce19d895abb07f0fb938f01fea8e282a39cf240ca58d818b4755c960dfc87f2d', 1002, 1, 'AuthToken', '[]', 0, '2021-02-08 05:49:31', '2021-02-08 05:49:31', '2022-02-08 11:49:31'),
('6229a59009f70021a03e7f02b1242114e4c4bc4fc4d95bae64b4d2bdabc44b4a5ff3439abab199d6', 1024, 2, 'AuthToken', '[]', 0, '2022-08-28 09:51:23', '2022-08-28 09:51:23', '2023-08-28 09:51:23'),
('623739a90e3e5f1f445ca16c4d2abdd45319b07065376ce73a334435d35866d7de4f5ba3d8efd61e', 1009, 1, 'AuthToken', '[]', 1, '2021-01-04 11:19:55', '2021-01-04 11:19:55', '2022-01-04 17:19:55'),
('646935d9dcc985d220e4636b1b7db36816ed46b832f0a4bffa9db695e13fe092f61b2d74e3276804', 1010, 2, 'AuthToken', '[]', 0, '2022-03-20 07:28:57', '2022-03-20 07:28:57', '2023-03-20 13:28:57'),
('681b7d11f70a32800655093e6b2d329a148a2563d6cf1c64ff7bba8d16951653dce6148ab652cd16', 1010, 2, 'AuthToken', '[]', 1, '2022-02-03 05:33:13', '2022-02-03 05:33:13', '2023-02-03 11:33:13'),
('6b5edec57b34d99e8da2573c1f8ad24e9e84d8bbc07a032a14ff40092518781e57aec5f96507ce4c', 1010, 2, 'AuthToken', '[]', 0, '2022-02-01 05:54:36', '2022-02-01 05:54:36', '2023-02-01 11:54:36'),
('6e7e6c9eca546859eac88f0d55e9a6c29a1c3d23990d2b7e58a9eeb207cbf8d3511bd19fc1ce6836', 1015, 2, 'AuthToken', '[]', 0, '2021-10-10 11:46:32', '2021-10-10 11:46:32', '2022-10-10 17:46:32'),
('6edc65699dc5182e4093045691c8238c1ae7d915c3f37208f624816d1e611037a44c3ada0eb2dc69', 1008, 2, 'AuthToken', '[]', 0, '2021-07-19 07:11:28', '2021-07-19 07:11:28', '2022-07-19 13:11:28'),
('70a0ccbee24f4e4b1c10b326135ba99521b473ae0021bf38b17396354d8749a2e7b035166a6eae1d', 1008, 2, 'AuthToken', '[]', 0, '2022-03-13 09:37:51', '2022-03-13 09:37:51', '2023-03-13 15:37:51'),
('7183ef311eb922b0a749f3b7abc9a2d6559b07ea4540cf3af00b92e937bc7e4abae8362d6c436fd0', 1024, 2, 'AuthToken', '[]', 0, '2022-08-22 17:09:29', '2022-08-22 17:09:29', '2023-08-22 17:09:29'),
('724e033ebc7efad99b5c96966658c833c12b7369e882c8547d5dc1481918a29fcd44e31b6f9a0d49', 1008, 2, 'AuthToken', '[]', 0, '2022-09-10 18:11:47', '2022-09-10 18:11:47', '2023-09-10 18:11:47'),
('746980c010680159dbfe8f35356e9eed304e26459ac851942b95d3bbe738204d919601876a741663', 1010, 2, 'AuthToken', '[]', 0, '2021-05-31 07:17:06', '2021-05-31 07:17:06', '2022-05-31 13:17:06'),
('76ba2deba52c26550541e5a0929dc515e6b257986eebda3be67bb06f60aab78a7fc9b71e249c2a76', 1010, 2, 'AuthToken', '[]', 0, '2022-02-15 07:25:37', '2022-02-15 07:25:37', '2023-02-15 13:25:37'),
('77343a59cdc93ba4068a256278050dfa8e990ed8514ac99c100457758a411e3f146402ef642f315d', 1029, 2, 'AuthToken', '[]', 0, '2022-08-24 16:13:06', '2022-08-24 16:13:06', '2023-08-24 16:13:06'),
('774e2b90910f5b387542c009008f1858e8310dc6d7b1c716ef841ffb3b43c082297981fe8764dd59', 1015, 2, 'AuthToken', '[]', 0, '2022-01-31 07:17:27', '2022-01-31 07:17:27', '2023-01-31 13:17:27'),
('77627193a3635221eccb2f01bf0d54d5cffcae407945f72d8b5a43bbc96f9dd13d88cba9f3779fbe', 1015, 2, 'AuthToken', '[]', 0, '2021-06-02 12:53:25', '2021-06-02 12:53:25', '2022-06-02 18:53:25'),
('77e25be1f8f4dcf91ce3a47a6bc88bdb37c12af886800fb265c3c27e854cb93f19102e877fa3bbc7', 1006, 1, 'AuthToken', '[]', 1, '2021-02-16 12:32:43', '2021-02-16 12:32:43', '2022-02-16 18:32:43'),
('7979b08d34ff8846549f625846c784df9e30a4783741345dd83dd5e2a3ec7274506a8070073646a2', 1005, 2, 'AuthToken', '[]', 0, '2022-08-25 21:11:07', '2022-08-25 21:11:07', '2023-08-25 21:11:07'),
('7c2d22f32da2ba49d55f46da248bc1672f910064a5b5f205b0cdc884e8acda2615ee062cfecbbf31', 1011, 1, 'AuthToken', '[]', 1, '2021-02-14 09:14:43', '2021-02-14 09:14:43', '2022-02-14 15:14:43'),
('7d3e19e3626bced4da9bc6c7abf64e7a75760b01eb9d7591ab4c8b056306fada7254a36f5c63443b', 1018, 2, 'AuthToken', '[]', 0, '2022-08-10 07:53:16', '2022-08-10 07:53:16', '2023-08-10 13:53:16'),
('7eb163d8450b46cc8836fd0578bd3df1fccd35b54f0d827cd5b0e15504465ee8e2d194d766fdbe07', 1014, 2, 'AuthToken', '[]', 0, '2021-06-21 07:28:02', '2021-06-21 07:28:02', '2022-06-21 13:28:02'),
('7f8860affc39868f0123ab334a1149e23507ecb793e7c48e37f80f653b36e64a7426648d5c817247', 1010, 2, 'AuthToken', '[]', 0, '2021-09-15 07:06:47', '2021-09-15 07:06:47', '2022-09-15 13:06:47'),
('8198451ed6f3043271e53bce1ff380fce172706a7ae6a6ee5d18bdce22b3ebeeea9e5a055687183e', 1014, 1, 'AuthToken', '[]', 0, '2021-01-31 11:26:24', '2021-01-31 11:26:24', '2022-01-31 17:26:24'),
('835df7d2865070bed1d14b074d567f08ae10da5824bc823d3d0a1a72f242d9b506664867b24cd6e8', 1007, 1, 'AuthToken', '[]', 1, '2020-12-29 12:31:34', '2020-12-29 12:31:34', '2021-12-29 18:31:34'),
('83891ff01364f7a1cc42b4dfa6b035e2f85fd5cad6eb95e2c0a216bdd94414fbcc316c5a950f2269', 1012, 1, 'AuthToken', '[]', 0, '2021-03-07 11:07:54', '2021-03-07 11:07:54', '2022-03-07 17:07:54'),
('84cc1a72264d78b075a49451d92c55d3e7b1d6894ff12ef3faa9e45c97e77e576f06315d41185dfe', 1015, 2, 'AuthToken', '[]', 0, '2022-03-13 05:35:06', '2022-03-13 05:35:06', '2023-03-13 11:35:06'),
('853abeb7476be5d835a60dbced9ba08f74e5807724c139e6c5bfbd322b084197172953e2fa550567', 1015, 2, 'AuthToken', '[]', 0, '2021-12-02 08:07:48', '2021-12-02 08:07:48', '2022-12-02 14:07:48'),
('88a1036ebc9ce70ec63e0b928879d66c82d81c3aa559afa0cc03e06b74c2eb09c0c7a5e76cff4a37', 1014, 1, 'AuthToken', '[]', 0, '2021-01-21 04:47:41', '2021-01-21 04:47:41', '2022-01-21 10:47:41'),
('89c01a8bd2dc9fd6dd5181b5c5e7b6d3eec877273f37368491d7afd43fc1fa2bc88929aae3ebe14a', 1015, 2, 'AuthToken', '[]', 0, '2021-08-11 07:43:54', '2021-08-11 07:43:54', '2022-08-11 13:43:54'),
('8ac9bf996d10806e233572f5e24e66669cfa87db090b1c9c956e5d74606d3f650bd154a5d6512789', 1015, 2, 'AuthToken', '[]', 0, '2021-10-10 11:16:16', '2021-10-10 11:16:16', '2022-10-10 17:16:16'),
('8d4cf3a5edf4f2b1ba72a54176c7f593437d8c81324433320455b85693adbefa9bf47d5b220d21d5', 1010, 1, 'AuthToken', '[]', 0, '2021-01-21 06:57:33', '2021-01-21 06:57:33', '2022-01-21 12:57:33'),
('8f3d3489c84442cc512e4d674c02cc28d90f79f297dfd4e4c54972f3fa3d667768fe86e3c104e8fb', 1006, 1, 'AuthToken', '[]', 1, '2020-12-29 12:26:07', '2020-12-29 12:26:07', '2021-12-29 18:26:07'),
('8fc672cbeacc6bdb3b2d09e9e67e584a48c8d013abf8ff7830ce7954e9dc5aa70cf49f5db7391a18', 1010, 2, 'AuthToken', '[]', 0, '2022-08-24 16:03:49', '2022-08-24 16:03:49', '2023-08-24 16:03:49'),
('922a3f69070f60c1db06a25282bb5235868dcc50e330faf4250cbc1e03effffa9f62993096bd2fc0', 1013, 1, 'AuthToken', '[]', 1, '2021-01-19 04:55:52', '2021-01-19 04:55:52', '2022-01-19 10:55:52'),
('92365d6960edaf76db35c76d4b432093d75f1e1cc365c08131adfaf6e2be931441f73c97d1791c9c', 1009, 1, 'AuthToken', '[]', 0, '2021-02-04 05:26:02', '2021-02-04 05:26:02', '2022-02-04 11:26:02'),
('92a8c1df6af0b79312a492eb119cf1ac3b11d5bd3cc353715a796df8a78b61a0e492727d8a61f5dc', 1008, 2, 'AuthToken', '[]', 0, '2022-01-31 07:11:11', '2022-01-31 07:11:11', '2023-01-31 13:11:11'),
('963ff4ddb92b22f7e2b0da8d6a68516e4d052adc9813bf5c1579196138060309f70b12b0ff6796a1', 1015, 2, 'AuthToken', '[]', 0, '2021-06-14 09:18:46', '2021-06-14 09:18:46', '2022-06-14 15:18:46'),
('9745647111ed8e0c5a105c398a124c487ea9e7485bf97052401ab096ab08fb2d7d4ef13abbe0109b', 1009, 1, 'AuthToken', '[]', 1, '2021-01-21 06:26:29', '2021-01-21 06:26:29', '2022-01-21 12:26:29'),
('9a7a07cfc74cb8c31eb08fb1db3acb1b13b0c5a5d48e32b08941f97f8ec61694d12e1e2fe0184c84', 1008, 2, 'AuthToken', '[]', 0, '2022-09-08 15:51:04', '2022-09-08 15:51:04', '2023-09-08 15:51:04'),
('9ace3dd55483725cb4b88f35916ab2e679f302af21f33f73ce6185fa69cd7ecfccccbd752f358f7c', 1002, 1, 'AuthToken', '[]', 1, '2021-01-14 10:02:18', '2021-01-14 10:02:18', '2022-01-14 16:02:18'),
('9c1be9e41facb3b95545802ba47a9ab563bae574c43ed3a96631e432bab3f2c88666e137e01fb30a', 1015, 2, 'AuthToken', '[]', 0, '2022-02-01 05:45:36', '2022-02-01 05:45:36', '2023-02-01 11:45:36'),
('9cb67a55f7f9dc2d63581a96b755358aafbe69d404d916f42187cfa43276fd7a030998a6d1b41883', 1015, 2, 'AuthToken', '[]', 0, '2021-08-16 06:59:55', '2021-08-16 06:59:55', '2022-08-16 12:59:55'),
('9cda1f23e8a72d6b0ce3cec3cfccdb74d8e58818d3bc9af59588664754e908e03687ac5218d2ee2d', 1010, 1, 'AuthToken', '[]', 0, '2021-01-14 05:23:12', '2021-01-14 05:23:12', '2022-01-14 11:23:12'),
('a21daa97b943c056894e03bdbc908d1cc72beb3e09707cfdf9b42cd5f6527d5f58ab0e56a51d73a2', 1008, 2, 'AuthToken', '[]', 1, '2021-04-27 06:10:56', '2021-04-27 06:10:56', '2022-04-27 12:10:56'),
('a2ca253547faebd5a7eb55640116a3ec810ddefccfcb10b1603986c806cc9468c6ce7cba8ad1a1ee', 1005, 1, 'AuthToken', '[]', 1, '2021-01-07 05:06:51', '2021-01-07 05:06:51', '2022-01-07 11:06:51'),
('a343fab57814dff8a17953f782ecda65735bcdf82afcfbefe5606facc83e964359c6b6e242f4d273', 1015, 2, 'AuthToken', '[]', 0, '2021-07-04 12:47:59', '2021-07-04 12:47:59', '2022-07-04 18:47:59'),
('a376069378570b4160d9c230bb64d53fb8f8be7c1a3a40e9751f1ab58c7a73b13a426f93eebf7ab5', 1008, 2, 'AuthToken', '[]', 0, '2021-08-16 05:32:32', '2021-08-16 05:32:32', '2022-08-16 11:32:32'),
('a3ff75cb6cf32f287d0e15b359437ff208c28392e293062d6b06a44bdbabcef2bf2fffeb72e0ca21', 1015, 1, 'AuthToken', '[]', 0, '2021-03-29 08:46:45', '2021-03-29 08:46:45', '2022-03-29 14:46:45'),
('a4199b3f7d4685dc23203376b040db39fea5bcd9ed2876d6bc22a77e85a5e17ba75a9be215e42dc4', 1017, 2, 'AuthToken', '[]', 0, '2021-06-17 13:31:05', '2021-06-17 13:31:05', '2022-06-17 19:31:05'),
('a56ab3a392551ae11bb3d6264ed90989c1c69e0b5dcdd65fae9e75c590a73d5dbab750dc7fbe10bd', 1002, 1, 'AuthToken', '[]', 1, '2021-01-12 11:39:44', '2021-01-12 11:39:44', '2022-01-12 17:39:44'),
('a693be353c407c24e6af368dd03f6df85fa91b92dd2bfdef8d253094a4b8b3a327dbfe1c4a25aa21', 1006, 1, 'AuthToken', '[]', 1, '2021-02-08 08:59:41', '2021-02-08 08:59:41', '2022-02-08 14:59:41'),
('ad542bdf9fc87141017d70ef815ff29bd88601ac17237376cc15e8eec41184c1f12b9606310e9fe4', 1024, 2, 'AuthToken', '[]', 0, '2022-08-23 12:34:07', '2022-08-23 12:34:07', '2023-08-23 12:34:07'),
('adf2f16ea6ed5a016cf73e790055ef958f613213ae4adecc2e3f6fa76af9c9113f942e85878cd75c', 1005, 1, 'AuthToken', '[]', 1, '2021-01-20 12:42:41', '2021-01-20 12:42:41', '2022-01-20 18:42:41'),
('b0d0e4e2346eb37ffe1aadb8c090e9383acfe6bac0f939707a3168ab0070d3a170912b144f868ad4', 1010, 2, 'AuthToken', '[]', 0, '2022-03-14 05:15:15', '2022-03-14 05:15:15', '2023-03-14 11:15:15'),
('b102018339acb87558a2c41da6494e8352fee45290cb555fb1db6c30547060a02f1312964ab1f572', 1015, 2, 'AuthToken', '[]', 0, '2021-07-05 08:31:05', '2021-07-05 08:31:05', '2022-07-05 14:31:05'),
('b13dd881eddc871a45d1550eee21445a344efcb0c6bd010836eab62a1e0675a557db2ac555d35d5d', 1008, 2, 'AuthToken', '[]', 0, '2021-07-05 11:02:14', '2021-07-05 11:02:14', '2022-07-05 17:02:14'),
('b361b8164ea73890197022d70aab4ba2bf62dcab4cef62647f35ea8d1b69df9e45a0617bd0c25287', 1015, 2, 'AuthToken', '[]', 0, '2022-09-06 14:37:25', '2022-09-06 14:37:25', '2023-09-06 14:37:25'),
('b4cec52343d781bd8230e06f78f231ed112ddbd8df462b175de8d4a69315dbc8a51d8822ad2c56e1', 1009, 1, 'AuthToken', '[]', 1, '2021-01-26 05:44:00', '2021-01-26 05:44:00', '2022-01-26 11:44:00'),
('b5b65391c14545120380f85c97b69ac8001320e89ff32e89dcf77fd770f0028d1b420b2403194025', 1015, 2, 'AuthToken', '[]', 0, '2022-01-30 07:17:08', '2022-01-30 07:17:08', '2023-01-30 13:17:08'),
('b68531e03a88e920e837860c09229d428270526ce6dc750748db05f682ddc295c67e8c08ccdda657', 1016, 2, 'AuthToken', '[]', 0, '2021-05-31 11:47:34', '2021-05-31 11:47:34', '2022-05-31 17:47:34'),
('b694f1fffda113d39ffcb2a48436f340acd4281846ca717c7a845ce4bedbc0f18716bd6968300556', 1018, 2, 'AuthToken', '[]', 0, '2022-02-15 07:47:24', '2022-02-15 07:47:24', '2023-02-15 13:47:24'),
('b722f7a8a33c4dcee4f571a521116354c0cd0ea832b564db82449bfc16172cc602d6084a81bf4b6e', 1010, 1, 'AuthToken', '[]', 0, '2021-02-04 07:54:00', '2021-02-04 07:54:00', '2022-02-04 13:54:00'),
('b8939e5e870bb9b542980b497379cb90f2da2e598b6c49f44735eba0bfacd47395bbe7863aaaed0a', 1031, 2, 'AuthToken', '[]', 0, '2022-08-24 15:15:36', '2022-08-24 15:15:36', '2023-08-24 15:15:36'),
('bb5345ce465e43cc430bb655b2d1848b4389b81064873ac434c70fc79f3c868302e02d69ec428eb1', 1015, 1, 'AuthToken', '[]', 1, '2021-01-20 11:50:39', '2021-01-20 11:50:39', '2022-01-20 17:50:39'),
('bb9c8a546f81d540954a116afb7a266687d7be86903fd0e012583a0ae1e4854e20516e705db0bde5', 1009, 1, 'AuthToken', '[]', 1, '2021-01-24 10:32:13', '2021-01-24 10:32:13', '2022-01-24 16:32:13'),
('bbe978e958cb67c0a95cf2300afe88b1498ace12c9aaec4ca7fb7fe17d51b486fd3d93105574f86b', 1010, 2, 'AuthToken', '[]', 0, '2022-08-28 10:01:32', '2022-08-28 10:01:32', '2023-08-28 10:01:32'),
('bc7c143eedaf26e793d7fbfdf8bc0da997c1972247f772505bc18930bc50b713ce08f7de2da446fd', 1015, 2, 'AuthToken', '[]', 0, '2021-06-29 09:59:48', '2021-06-29 09:59:48', '2022-06-29 15:59:48'),
('bdf1a16757fa1eac6f56271dba0c86d43af7fd4714f935db47c543043062026cea84a85c68c85785', 1030, 2, 'AuthToken', '[]', 0, '2022-08-24 11:59:57', '2022-08-24 11:59:57', '2023-08-24 11:59:57'),
('c1b4dd33780408ed853150280af22deba0a78e3b989cdf6c31c462f9d7d35d4e28c43a27bcdde7e2', 1008, 2, 'AuthToken', '[]', 0, '2022-07-24 06:54:19', '2022-07-24 06:54:19', '2023-07-24 12:54:19'),
('c2f8b45ca59c33ef8942573cb80791ba667d2c18903b435a9ca648f3d66f8ee447fd24d1364f7749', 1010, 2, 'AuthToken', '[]', 0, '2022-02-01 05:40:46', '2022-02-01 05:40:46', '2023-02-01 11:40:46'),
('c3acac0fb738d6c92c05fe7adfbddfbcf740f95c12c26663c43c4976df31765b1fca78966e7a0645', 1010, 2, 'AuthToken', '[]', 0, '2022-03-16 06:14:47', '2022-03-16 06:14:47', '2023-03-16 12:14:47'),
('c4592cbf555c4cb32a3ea578a9a013d20fe158db0a8f2e6e32765fcf2633e44a78b72d7fc6417ab0', 1008, 1, 'AuthToken', '[]', 1, '2021-03-25 12:11:59', '2021-03-25 12:11:59', '2022-03-25 18:11:59'),
('c567463111cbb48471b41237cbd6c084c5cefd00d84702a1e25c956c4ec0def16047b5eb60012a84', 1005, 2, 'AuthToken', '[]', 0, '2021-08-18 06:47:21', '2021-08-18 06:47:21', '2022-08-18 12:47:21'),
('c679ae11d3dd9b3cb5a98baf2ccf54fcd8fece815a3d25b4977f6228c485a69034e62f7cb5c0ad41', 1008, 1, 'AuthToken', '[]', 0, '2021-03-31 06:13:20', '2021-03-31 06:13:20', '2022-03-31 12:13:20'),
('c98d00182e372892df7132567afa17c5600c8401d08c7c801f4b96243b58f4cd4122fee31885a954', 1014, 1, 'AuthToken', '[]', 0, '2021-01-20 05:26:30', '2021-01-20 05:26:30', '2022-01-20 11:26:30'),
('cbb1e340c2680bc57ca7c52837a63cf0efd7de0c130e47055089947f57e3bd0280026c7553e605d4', 1002, 1, 'AuthToken', '[]', 1, '2021-01-12 07:44:07', '2021-01-12 07:44:07', '2022-01-12 13:44:07'),
('ccbf08d715c9fab9303898d412dee51fa45139f54536c917fe9095ff737c1408c08ed394f2fd960f', 1010, 2, 'AuthToken', '[]', 0, '2021-06-21 07:26:19', '2021-06-21 07:26:19', '2022-06-21 13:26:19'),
('cd359f7caad3c4845da6a6a2e85437eda443b026b162f28ca2cacb20eafc7523793678a34376e676', 1002, 1, 'AuthToken', '[]', 0, '2021-02-07 07:14:34', '2021-02-07 07:14:34', '2022-02-07 13:14:34'),
('d03d62c44b28a2fab795189c614e47741a524687f89abb6ddf063499a81bfb762d9731ee41d8204a', 1005, 2, 'AuthToken', '[]', 0, '2022-08-22 16:40:21', '2022-08-22 16:40:21', '2023-08-22 16:40:21'),
('d1ea83fab304864a370998f8c5f379125fcf1b9af7dec3262f559b04df27eb9445b7d82729d4342d', 1005, 1, 'AuthToken', '[]', 1, '2021-02-04 05:49:28', '2021-02-04 05:49:28', '2022-02-04 11:49:28'),
('d8049b71edd07759ccc8be5fc11e4f44a8fef3698bfb7006f8ac49e58cbb88084b33d5d38dd23e41', 1005, 1, 'AuthToken', '[]', 1, '2021-03-03 09:33:58', '2021-03-03 09:33:58', '2022-03-03 15:33:58'),
('d93eba411e292616b9539b2c724a5c4f7a0768a3b41217540bbf7cf55f7136a7721d68ae833fdd55', 1015, 2, 'AuthToken', '[]', 0, '2022-08-24 16:26:48', '2022-08-24 16:26:48', '2023-08-24 16:26:48'),
('d9ccbda26e322b819427ca2d46db64cd3b086d2f3b559a68a9791cfc15bf6fb9dcbf1d0fdda17d8f', 1007, 2, 'AuthToken', '[]', 0, '2021-07-18 01:43:02', '2021-07-18 01:43:02', '2022-07-18 07:43:02'),
('daeaafc7c445572ca4ae56009c7675b40aaa8e27d44eb5f27a87637f95da41aed0b01818ba71e92b', 1010, 2, 'AuthToken', '[]', 0, '2022-09-22 14:09:10', '2022-09-22 14:09:10', '2023-09-22 14:09:10'),
('dd521f9109e0606c58f80f3cc26db9e071f0228eb74f7a4aae9a92d0187e2b6c56e58a22792e08e0', 1002, 1, 'AuthToken', '[]', 1, '2021-01-20 12:41:29', '2021-01-20 12:41:29', '2022-01-20 18:41:29'),
('dd882630a7b2a507dab4fcb2ac3bc9dd648702dd7e0f4f6ad59c6512c8eb00e6ae12741272e9fdcd', 1012, 2, 'AuthToken', '[]', 0, '2021-07-19 07:12:46', '2021-07-19 07:12:46', '2022-07-19 13:12:46'),
('ddf9708eb7842e2ec1750350de62cae20d82895b3bc44c6993356ca1c4260f62aa3132834b157bca', 1010, 2, 'AuthToken', '[]', 1, '2022-08-24 12:53:08', '2022-08-24 12:53:08', '2023-08-24 12:53:08'),
('e1518a57e8ce50fd3358010ef8b20c915b5e7422214804ebb2e57185c27d9d2da0285321ef063962', 1002, 1, 'AuthToken', '[]', 1, '2021-01-06 04:40:23', '2021-01-06 04:40:23', '2022-01-06 10:40:23'),
('e3be7b792c5170c34d0311fe1b66bac773413f71f0e074f9b211cb3f2b46ba9739aadba2772b99b2', 1002, 1, 'AuthToken', '[]', 0, '2021-01-05 09:35:23', '2021-01-05 09:35:23', '2022-01-05 15:35:23'),
('e4340b67c292f5fae644cdc83b146add35b025262387469259e55f4b4bf318dcd5bf407e833b7f07', 1002, 1, 'AuthToken', '[]', 1, '2021-01-14 11:13:16', '2021-01-14 11:13:16', '2022-01-14 17:13:16'),
('e4c389e416531a6b0c7003b2bd0382c38f37194e66d8a7d626b653b69adb8b29f680e9ba84dab98b', 1010, 1, 'AuthToken', '[]', 0, '2021-01-12 09:17:20', '2021-01-12 09:17:20', '2022-01-12 15:17:20'),
('e543c78ed052bcb43251e39668fb41f4bf5130ca8129f791d16bbbb0bae61d53ad6107e2dcd4cc7f', 1008, 2, 'AuthToken', '[]', 1, '2021-12-06 06:29:35', '2021-12-06 06:29:35', '2022-12-06 12:29:35'),
('eb4fa0f0f298e9d8b1ff68e008494372512af9170f457f6f44478ed983a43d3b20668258c07adb66', 1011, 1, 'AuthToken', '[]', 1, '2021-01-12 05:15:42', '2021-01-12 05:15:42', '2022-01-12 11:15:42'),
('eb86cc2762402fc1bc1c43ef0c969961af109e58e05e12ad2fe1568f09d31941a14b6a6e8a1fee02', 1028, 2, 'AuthToken', '[]', 1, '2022-08-22 16:35:19', '2022-08-22 16:35:19', '2023-08-22 16:35:19'),
('ecf042ba01495bd5dc498e48136383833747bb90474cd0ed05172e6e083092096b3f0c4f3ded3758', 1029, 2, 'AuthToken', '[]', 0, '2022-08-25 14:10:54', '2022-08-25 14:10:54', '2023-08-25 14:10:54'),
('f06c8b01cba2d18fbc86fc5ac01279f8161f80ddad47f8fbbad250a92f3eaf030564eb3eda09bd5a', 1024, 2, 'AuthToken', '[]', 0, '2022-08-21 08:58:56', '2022-08-21 08:58:56', '2023-08-21 14:58:56'),
('f2955860dcedbed617ab7a2836507bb26ba7dcffff9592ea1e07a54d72e91227486fed95aac9838a', 1005, 1, 'AuthToken', '[]', 1, '2021-02-04 05:46:13', '2021-02-04 05:46:13', '2022-02-04 11:46:13'),
('f30b57bdd25c65c2cfc739ca6d5345cf083e3e61af03cd18d60f5b5038001f678fbf8df37362cf0f', 1002, 1, 'AuthToken', '[]', 0, '2021-02-03 08:31:41', '2021-02-03 08:31:41', '2022-02-03 14:31:41'),
('f4453ee6e314a49d76fa9ca29306c3173da415356be30b6ad906f73dea6e5e57f8d6d6fe6e94da3f', 1002, 1, 'AuthToken', '[]', 1, '2021-01-10 05:56:10', '2021-01-10 05:56:10', '2022-01-10 11:56:10'),
('f5251c294d09338e455dc7f10ff99577907d566da14447f1de62c0310dd7399d9587b8df1412fe36', 1002, 1, 'AuthToken', '[]', 0, '2021-01-21 04:41:07', '2021-01-21 04:41:07', '2022-01-21 10:41:07'),
('f7bbc186ae5989eec79e377fa9e165e6232fcd6700b32916791ce50d45cc9b0c5574f902a1390750', 1008, 2, 'AuthToken', '[]', 0, '2021-12-02 12:10:44', '2021-12-02 12:10:44', '2022-12-02 18:10:44'),
('f7e3e7990442c67dd6b524c3b976582a8711b84e7366d0ce583d3606b182544af872f1ef4c876dab', 1029, 2, 'AuthToken', '[]', 0, '2022-08-24 16:22:11', '2022-08-24 16:22:11', '2023-08-24 16:22:11'),
('f952a9b823b066d4f02f6223d1bc4b1ef74fe6308499a36cc9be92d14c3d71ea44ffcb8a4b4cdb67', 1010, 1, 'AuthToken', '[]', 0, '2021-01-26 09:59:23', '2021-01-26 09:59:23', '2022-01-26 15:59:23'),
('fa15ce9af59bfb0970d47c80afc26f76d853feacdbb1430a75aa1445346120573098c259da658133', 1003, 1, 'AuthToken', '[]', 0, '2020-12-29 12:05:36', '2020-12-29 12:05:36', '2021-12-29 18:05:36'),
('fa71578ca4ac536f3f2cbf0fca9cf101bbc0b288a8fab3f772e9a56b22be89fb3a765f0686abb101', 1010, 1, 'AuthToken', '[]', 0, '2021-01-10 11:02:42', '2021-01-10 11:02:42', '2022-01-10 17:02:42'),
('fbc27bf5360023b3640641fbec3592bdf572e61c763485fb05dba48155bd16d4035e8ec7c786844f', 1010, 2, 'AuthToken', '[]', 1, '2022-02-14 12:42:49', '2022-02-14 12:42:49', '2023-02-14 18:42:49'),
('fcfb2be301fa6f389b8b7f5efde70f168eb7b151301af5ac64b645688cf6bd89c7edaff0e2b14276', 1006, 2, 'AuthToken', '[]', 0, '2021-07-20 08:11:49', '2021-07-20 08:11:49', '2022-07-20 14:11:49'),
('ff7c7ac5490d751bbda631921cc141979adb57757b7d239e6cac44e1da974733cef8188708bda109', 1006, 1, 'AuthToken', '[]', 0, '2021-02-25 11:28:09', '2021-02-25 11:28:09', '2022-02-25 17:28:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DemandFront', 'dBTVHKJ14e35u7CoLzXqFr1VhZOX9VnPMxdsmbIX', NULL, 'http://localhost', 1, 0, 0, '2020-12-10 00:31:58', '2020-12-10 00:31:58'),
(2, NULL, 'বিডো Personal Access Client', 'LlAe3qxJOXURW0QdhD4OL81nU8fPth3YIWHDrQR3', NULL, 'http://localhost', 1, 0, 0, '2021-04-26 05:13:47', '2021-04-26 05:13:47'),
(3, NULL, 'বিডো Password Grant Client', '9wVEmgIYhYnhcduyyKnXqSYxSIpE1ptzClVeADsE', 'users', 'http://localhost', 0, 1, 0, '2021-04-26 05:13:47', '2021-04-26 05:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-12-10 00:31:58', '2020-12-10 00:31:58'),
(2, 2, '2021-04-26 05:13:47', '2021-04-26 05:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `o_t_p_s`
--

CREATE TABLE `o_t_p_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = login , 2 = register',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `time_type` tinyint(4) DEFAULT 1 COMMENT '1 = monthly , 2 = daily , 3 = yearly',
  `total_month` int(11) NOT NULL,
  `amount_per_month` double NOT NULL,
  `total_amount` double NOT NULL,
  `discount_for_month` double DEFAULT 0,
  `coupon_discount` double DEFAULT 0,
  `total_discount` double DEFAULT 0,
  `coupon_id` bigint(20) UNSIGNED DEFAULT 0,
  `subscription_plan_id` bigint(20) UNSIGNED DEFAULT 0,
  `final_amount` double NOT NULL,
  `ssl_store_amount` double DEFAULT 0,
  `payment_mode` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = online , 2 = offline',
  `admin_id` bigint(20) UNSIGNED DEFAULT 1 COMMENT 'admin who confirmed the payment if offline',
  `sessionkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'session key for payment verification',
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offline_payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'bkash,bank,cash etc',
  `card_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'online payment card type',
  `card_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'online payment card no , for bakash it will be reference',
  `bank_transection_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'online payment card no , for bakash it will be reference',
  `validation_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'payment validation id',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'date of payment ',
  `transection_date_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'time and date of transection',
  `transection_done_date_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'time and date of transection done',
  `extend_from_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'date extend started from',
  `extend_to_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'date extend end  to',
  `transection_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'valid in valid or something like that',
  `payment_status` tinyint(4) DEFAULT 0 COMMENT '0 = not paid , 1 = payment done',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `time_type`, `total_month`, `amount_per_month`, `total_amount`, `discount_for_month`, `coupon_discount`, `total_discount`, `coupon_id`, `subscription_plan_id`, `final_amount`, `ssl_store_amount`, `payment_mode`, `admin_id`, `sessionkey`, `coupon_code`, `offline_payment_method`, `card_type`, `card_no`, `bank_transection_id`, `validation_id`, `date`, `transection_date_time`, `transection_done_date_time`, `extend_from_date`, `extend_to_date`, `transection_status`, `payment_status`, `created_at`, `updated_at`) VALUES
(10000, 1006, 1, 2, 20, 40, 0, 0, 0, 0, 0, 40, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-16', '2021-02-16 13:23:20', NULL, NULL, NULL, NULL, 0, '2021-02-16 07:23:20', '2021-02-16 07:23:20'),
(10001, 1006, 1, 2, 20, 40, 0, 0, 0, 0, 0, 40, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-17', '2021-02-16 14:15:02', NULL, NULL, NULL, NULL, 0, '2021-02-16 08:15:02', '2021-02-16 08:15:02'),
(10002, 1006, 1, 2, 20, 40, 0, 0, 0, 0, 0, 40, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-16', '2021-02-16 14:52:08', NULL, NULL, NULL, NULL, 0, '2021-02-16 08:52:08', '2021-02-16 08:52:08'),
(10003, 1007, 1, 4, 20, 80, 0, 0, 0, 0, 0, 80, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-13', '2021-02-16 14:54:51', NULL, NULL, NULL, NULL, 0, '2021-02-16 08:54:51', '2021-02-16 08:54:51'),
(10004, 1006, 1, 3, 20, 60, 0, 0, 0, 0, 0, 60, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-16', '2021-02-16 14:58:02', NULL, NULL, NULL, NULL, 0, '2021-02-16 08:58:02', '2021-02-16 08:58:02'),
(10005, 1005, 1, 3, 20, 60, 0, 0, 0, 0, 0, 60, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-12', '2021-02-16 15:15:05', NULL, NULL, NULL, NULL, 0, '2021-02-16 09:15:05', '2021-02-16 09:15:05'),
(10006, 1006, 1, 3, 20, 60, 0, 0, 0, 0, 0, 60, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-16', '2021-02-16 15:18:50', NULL, NULL, NULL, NULL, 0, '2021-02-16 09:18:50', '2021-02-16 09:18:50'),
(10007, 1003, 1, 3, 20, 60, 0, 0, 0, 0, 0, 60, 0, 1, 1, NULL, NULL, NULL, 'NAGAD-Nagad', NULL, '21021615264410F8N2SNsrVYiB2', '2102161526449lnZjIkfxxgxXAb', '2021-02-16', '2021-02-16 15:21:17', '2021-02-16 15:26:05', '2021-02-16', '2021-05-16', 'VALID', 1, '2021-02-16 09:21:17', '2021-02-16 10:04:30'),
(10008, 1006, 1, 3, 20, 60, 0, 0, 0, 0, 0, 60, 0, 1, 1, NULL, NULL, NULL, 'NAGAD-Nagad', NULL, '2102161620531nkESjCFR5AhAOh', '2102161620531Fc8Duj3ibdcoJz', '2021-02-16', '2021-02-16 16:16:05', '2021-02-16 16:20:45', '2021-05-16', '2021-08-16', 'VALID', 1, '2021-02-16 10:16:05', '2021-02-16 10:16:22'),
(10009, 1006, 1, 5, 20, 100, 0, 0, 0, 0, 0, 100, 0, 1, 1, NULL, NULL, NULL, 'DBBLMOBILEB-Dbbl Mobile Banking', NULL, '210216162343OjgR6OOsIxsY9Bc', '210216162343F1hRbQU4jFntiVk', '2021-03-16', '2021-02-16 16:18:54', '2021-02-16 16:23:34', '2021-08-16', '2022-01-16', 'VALID', 1, '2021-02-16 10:18:54', '2021-02-16 10:19:12'),
(10010, 1006, 1, 3, 24, 72, 3, 0, 2.16, 0, 0, 69.84, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-16', '2021-02-16 18:12:23', NULL, NULL, NULL, NULL, 0, '2021-02-16 12:12:23', '2021-02-16 12:12:23'),
(10011, 1006, 1, 4, 24, 96, 3, 0, 2.88, 0, 0, 93.12, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-16', '2021-02-16 18:26:04', NULL, NULL, NULL, NULL, 0, '2021-02-16 12:26:04', '2021-02-16 12:26:04'),
(10012, 1006, 1, 4, 24, 96, 3, 0, 2.88, 0, 0, 93.12, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-18', '2021-02-18 16:20:16', NULL, NULL, NULL, NULL, 0, '2021-02-18 10:20:16', '2021-02-18 10:20:16'),
(10013, 1006, 1, 6, 24, 144, 3, 0, 4.32, 0, 0, 139.68, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-15', '2021-02-18 16:20:58', NULL, NULL, NULL, NULL, 0, '2021-02-18 10:20:58', '2021-02-18 10:20:58'),
(10014, 1006, 1, 3, 24, 72, 3, 0, 5.04, 0, 0, 66.96, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-18', '2021-02-18 16:25:05', NULL, NULL, NULL, NULL, 0, '2021-02-18 10:25:05', '2021-02-18 10:25:05'),
(10015, 1006, 1, 5, 24, 120, 3, 0, 8.4, 0, 0, 111.6, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-18', '2021-02-18 16:25:51', NULL, NULL, NULL, NULL, 0, '2021-02-18 10:25:51', '2021-02-18 10:25:51'),
(10017, 1006, 1, 8, 21.5, 172, 8, 49, 57, 3, 0, 164, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-28', '2021-02-28 14:47:59', NULL, NULL, NULL, NULL, 0, '2021-02-28 08:47:59', '2021-02-28 08:47:59'),
(10018, 1008, 1, 3, 18.66, 56, 4, 49, 53, 3, 1, 52, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-28', '2021-02-28 14:51:15', NULL, NULL, NULL, NULL, 1, '2021-02-28 08:51:15', '2021-02-28 08:51:15'),
(10019, 1006, 1, 6, 21.33, 128, 5, 8, 13.61, 1, 0, 123, 0, 1, 1, NULL, 'DKFH100', NULL, NULL, NULL, NULL, NULL, '2021-02-28', '2021-02-28 15:31:35', NULL, NULL, NULL, NULL, 0, '2021-02-28 09:31:35', '2021-02-28 09:31:35'),
(10020, 1006, 1, 6, 21.33, 128, 5, 8.61, 13.61, 1, 2, 114.39, 0, 1, 1, NULL, 'DKFH100', NULL, 'ABBANKIB-AB Bank', NULL, '2102281604501Ov0uWBmXVypA9U', '210228160450DxYliffgacLkmCw', '2021-02-28', '2021-02-28 15:58:13', '2021-02-28 16:04:39', '2022-01-16', '2022-07-16', 'VALID', 1, '2021-02-28 09:58:13', '2021-02-28 09:59:58'),
(10021, 1008, 1, 3, 18.67, 56, 4, 3.64, 7.64, 1, 1, 48.36, 0, 1, 1, NULL, 'DKFH100', NULL, NULL, NULL, NULL, NULL, '2021-02-24', '2021-02-28 16:32:22', NULL, NULL, NULL, NULL, 1, '2021-02-28 10:32:22', '2021-02-28 10:32:22'),
(10022, 1006, 1, 6, 21.33, 128, 5, 8.61, 13.61, 1, 2, 114.39, 0, 1, 1, NULL, 'DKFH100', NULL, 'DBBLMOBILEB-Dbbl Mobile Banking', NULL, '2102281700141dRsRj6mfUPGDtb', '210228170014eq57r0GOcSy45oC', '2021-02-28', '2021-02-28 16:55:01', '2021-02-28 17:00:04', '2022-07-16', '2023-01-16', 'VALID', 1, '2021-02-28 10:55:01', '2021-02-28 10:55:22'),
(10023, 1006, 1, 3, 18.67, 56, 4, 0, 4, NULL, 1, 52, 0, 0, NULL, NULL, NULL, 'bank', NULL, NULL, NULL, NULL, '2021-03-10', '2021-02-28 17:18:01', NULL, NULL, NULL, 'VALID', 1, '2021-02-28 11:18:01', '2021-03-10 12:16:34'),
(10024, 1008, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-28', '2021-02-28 17:19:53', NULL, NULL, NULL, NULL, 0, '2021-02-28 11:19:53', '2021-02-28 11:19:53'),
(10025, 1007, 1, 3, 20, 60, 0, 0, 4, 0, 1, 56, 0, 0, NULL, NULL, NULL, 'cash', NULL, NULL, NULL, NULL, '2021-03-10', '2021-03-10 18:39:29', NULL, '2021-06-09', '2021-06-09', 'VALID', 1, '2021-03-09 13:09:53', '2021-03-10 12:39:29'),
(10026, 1007, 1, 3, 20, 60, 0, 0, 4, 0, 1, 56, 0, 2, 1, NULL, NULL, 'cash', NULL, NULL, NULL, NULL, '2021-03-09', NULL, NULL, '2021-09-09', '2021-09-09', NULL, 0, '2021-03-09 13:10:48', '2021-03-09 13:10:48'),
(10027, 1005, 1, 3, 20, 60, 0, 0, 4, 0, 1, 56, 0, 2, 1, NULL, NULL, 'cash', NULL, NULL, NULL, NULL, '2021-03-11', NULL, NULL, '2021-04-30', '2021-04-30', NULL, 0, '2021-03-11 04:40:21', '2021-03-11 04:40:21'),
(10028, 1005, 1, 3, 20, 60, 0, 0, 4, 0, 1, 56, 0, 2, 1, NULL, NULL, 'bank', NULL, NULL, NULL, NULL, '2021-03-11', NULL, NULL, '2020-02-09', '2021-06-11', NULL, 0, '2021-03-11 06:37:20', '2021-03-11 06:37:20'),
(10029, 1005, 1, 3, 20, 60, 0, 0, 4, 0, 1, 56, 0, 0, NULL, NULL, NULL, 'bank', NULL, NULL, NULL, NULL, '2021-03-11', '2021-03-11 15:50:40', NULL, '2021-06-11', '2021-09-11', 'VALID', 1, '2021-03-11 06:45:45', '2021-03-11 09:50:40'),
(10030, 1005, 1, 3, 20, 60, 0, 0, 4, 0, 1, 56, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-16', '2021-03-16 12:04:42', NULL, '2021-09-11', '2021-12-11', NULL, 1, '2021-03-11 06:58:05', '2021-03-16 06:04:42'),
(10031, 1009, 1, 6, 21.33, 128, 0, 0, 5, 0, 2, 123, 0, 0, NULL, NULL, NULL, 'cash', NULL, NULL, NULL, NULL, '2021-03-16', '2021-03-16 11:50:23', NULL, '2021-02-28', '2021-09-16', 'VALID', 1, '2021-03-16 05:49:47', '2021-03-16 05:50:23'),
(10032, 1010, 1, 3, 20, 60, 0, 0, 4, 0, 1, 56, 0, 0, NULL, NULL, NULL, 'bank', NULL, NULL, NULL, NULL, '2021-03-16', '2021-03-16 12:04:21', NULL, '2021-06-28', '2021-09-28', 'VALID', 1, '2021-03-16 05:50:47', '2021-03-16 06:04:21'),
(10033, 1012, 1, 3, 20, 60, 0, 0, 4, 0, 1, 56, 0, 0, NULL, NULL, NULL, 'cash', NULL, NULL, NULL, NULL, '2021-03-16', '2021-03-16 12:04:05', NULL, '2022-02-21', '2022-05-21', 'VALID', 1, '2021-03-16 05:55:45', '2021-03-16 06:04:05'),
(10034, 1013, 1, 3, 20, 60, 0, 0, 4, 0, 1, 56, 0, 2, 1, NULL, NULL, 'bkash', NULL, NULL, NULL, NULL, '2021-03-16', '2021-03-16 12:05:13', '2021-03-16 12:05:13', '2021-02-21', '2021-06-16', 'VALID', 1, '2021-03-16 06:05:13', '2021-03-16 06:05:13'),
(10035, 1014, 1, 3, 20, 60, 0, 0, 4, 0, 1, 56, 0, 2, 1, NULL, NULL, 'bkash', NULL, NULL, NULL, NULL, '2021-03-16', '2021-03-16 12:05:54', '2021-03-16 12:05:54', '2021-02-21', '2021-06-16', 'VALID', 1, '2021-03-16 06:05:54', '2021-03-16 06:05:54'),
(10036, 1008, 1, 2, 24, 48, NULL, 0, 0, NULL, 1, 48, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-31', '2021-03-31 17:44:22', NULL, NULL, NULL, NULL, 1, '2021-03-31 11:44:22', '2021-03-31 11:44:22'),
(10037, 1016, 1, 8, 21.5, 172, 8, 0, 8, NULL, 3, 164, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31', '2021-05-31 18:22:39', NULL, NULL, NULL, NULL, 0, '2021-05-31 12:22:39', '2021-05-31 12:22:39'),
(10038, 1016, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-02', '2021-06-02 15:00:16', NULL, NULL, NULL, NULL, 0, '2021-06-02 09:00:16', '2021-06-02 09:00:16'),
(10039, 1016, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-02', '2021-06-02 15:04:19', NULL, NULL, NULL, NULL, 0, '2021-06-02 09:04:19', '2021-06-02 09:04:19'),
(10040, 1016, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-02', '2021-06-02 15:11:09', NULL, NULL, NULL, NULL, 0, '2021-06-02 09:11:09', '2021-06-02 09:11:09'),
(10041, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09', '2021-06-09 14:39:25', NULL, NULL, NULL, NULL, 0, '2021-06-09 08:39:25', '2021-06-09 08:39:25'),
(10042, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-14', '2021-06-14 10:32:16', NULL, NULL, NULL, NULL, 0, '2021-06-14 04:32:16', '2021-06-14 04:32:16'),
(10043, 1017, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-17', '2021-06-17 19:33:09', NULL, NULL, NULL, NULL, 0, '2021-06-17 13:33:09', '2021-06-17 13:33:09'),
(10044, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-20', '2021-06-20 14:29:57', NULL, NULL, NULL, NULL, 0, '2021-06-20 08:29:57', '2021-06-20 08:29:57'),
(10045, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-20', '2021-06-20 14:32:09', NULL, NULL, NULL, NULL, 0, '2021-06-20 08:32:09', '2021-06-20 08:32:09'),
(10046, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-20', '2021-06-20 17:36:43', NULL, NULL, NULL, NULL, 0, '2021-06-20 11:36:43', '2021-06-20 11:36:43'),
(10047, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21', '2021-06-21 13:33:02', NULL, NULL, NULL, NULL, 0, '2021-06-21 07:33:02', '2021-06-21 07:33:02'),
(10048, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21', '2021-06-21 13:34:58', NULL, NULL, NULL, NULL, 0, '2021-06-21 07:34:58', '2021-06-21 07:34:58'),
(10049, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21', '2021-06-21 13:53:00', NULL, NULL, NULL, NULL, 0, '2021-06-21 07:53:00', '2021-06-21 07:53:00'),
(10050, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 10:45:35', NULL, NULL, NULL, NULL, 0, '2021-06-22 04:45:35', '2021-06-22 04:45:35'),
(10051, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 10:46:22', NULL, NULL, NULL, NULL, 0, '2021-06-22 04:46:22', '2021-06-22 04:46:22'),
(10052, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 10:47:29', NULL, NULL, NULL, NULL, 0, '2021-06-22 04:47:29', '2021-06-22 04:47:29'),
(10053, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 10:50:02', NULL, NULL, NULL, NULL, 0, '2021-06-22 04:50:02', '2021-06-22 04:50:02'),
(10054, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 10:50:37', NULL, NULL, NULL, NULL, 0, '2021-06-22 04:50:37', '2021-06-22 04:50:37'),
(10055, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 10:53:51', NULL, NULL, NULL, NULL, 0, '2021-06-22 04:53:51', '2021-06-22 04:53:51'),
(10056, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 10:55:02', NULL, NULL, NULL, NULL, 0, '2021-06-22 04:55:02', '2021-06-22 04:55:02'),
(10057, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 10:55:31', NULL, NULL, NULL, NULL, 0, '2021-06-22 04:55:31', '2021-06-22 04:55:31'),
(10058, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, 'ABBANKIB-AB Bank', NULL, '2106221056391kA3MBs3bftd88Y', '210622105640G7vWuxFOZBwV6Jy', '2021-06-22', '2021-06-22 10:56:16', '2021-06-22 10:56:20', '2021-06-24', '2021-09-24', 'VALID', 1, '2021-06-22 04:56:16', '2021-06-22 04:56:46'),
(10059, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 10:59:04', NULL, NULL, NULL, NULL, 0, '2021-06-22 04:59:04', '2021-06-22 04:59:04'),
(10060, 1015, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 11:00:13', NULL, NULL, NULL, NULL, 0, '2021-06-22 05:00:13', '2021-06-22 05:00:13'),
(10061, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, 'DBBLMOBILEB-Dbbl Mobile Banking', NULL, '210622110355033Xie6nudjoYy3', '2106221103551lyYNeVMEb0Ucp9', '2021-06-22', '2021-06-22 11:03:46', '2021-06-22 11:03:46', '2021-09-24', '2022-03-24', 'VALID', 1, '2021-06-22 05:03:46', '2021-06-22 05:04:02'),
(10062, 1015, 1, 8, 21.5, 172, 8, 0, 8, NULL, 3, 164, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 11:05:12', NULL, NULL, NULL, NULL, 0, '2021-06-22 05:05:12', '2021-06-22 05:05:12'),
(10063, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 11:20:46', NULL, NULL, NULL, NULL, 0, '2021-06-22 05:20:46', '2021-06-22 05:20:46'),
(10064, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 11:28:42', NULL, NULL, NULL, NULL, 0, '2021-06-22 05:28:42', '2021-06-22 05:28:42'),
(10065, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 11:30:07', NULL, NULL, NULL, NULL, 0, '2021-06-22 05:30:07', '2021-06-22 05:30:07'),
(10066, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 11:33:33', NULL, NULL, NULL, NULL, 0, '2021-06-22 05:33:33', '2021-06-22 05:33:33'),
(10067, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 11:34:44', NULL, NULL, NULL, NULL, 0, '2021-06-22 05:34:44', '2021-06-22 05:34:44'),
(10068, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 11:35:16', NULL, NULL, NULL, NULL, 0, '2021-06-22 05:35:16', '2021-06-22 05:35:16'),
(10069, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, 'DBBLMOBILEB-Dbbl Mobile Banking', NULL, '2106221135590pS4vtU5ChVmEIN', '2106221135591OXdVc4yi57aK2I', '2021-06-22', '2021-06-22 11:35:46', '2021-06-22 11:35:46', '2022-03-24', '2022-09-24', 'VALID', 1, '2021-06-22 05:35:46', '2021-06-22 05:36:05'),
(10070, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, 'DBBLMOBILEB-Dbbl Mobile Banking', NULL, '210622151720WGZkgSfFhK7aUe1', '2106221517201nYE2fT8dZvgLQ6', '2021-06-22', '2021-06-22 15:16:38', '2021-06-22 15:16:40', '2022-09-24', '2023-03-24', 'VALID', 1, '2021-06-22 09:16:38', '2021-06-22 09:17:25'),
(10071, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 15:19:14', NULL, NULL, NULL, NULL, 0, '2021-06-22 09:19:14', '2021-06-22 09:19:14'),
(10072, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, 'ABBANKIB-AB Bank', NULL, '2106221534461BtNpG40IdZ0qHL', '21062215344608ZQCagtjrMRPSL', '2021-06-22', '2021-06-22 15:34:28', '2021-06-22 15:34:33', '2023-03-24', '2023-09-24', 'VALID', 1, '2021-06-22 09:34:28', '2021-06-22 09:34:52'),
(10073, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 15:36:53', NULL, NULL, NULL, NULL, 0, '2021-06-22 09:36:53', '2021-06-22 09:36:53'),
(10074, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 15:41:38', NULL, NULL, NULL, NULL, 0, '2021-06-22 09:41:38', '2021-06-22 09:41:38'),
(10075, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 15:45:57', NULL, NULL, NULL, NULL, 0, '2021-06-22 09:45:57', '2021-06-22 09:45:57'),
(10076, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 15:49:13', NULL, NULL, NULL, NULL, 0, '2021-06-22 09:49:13', '2021-06-22 09:49:13'),
(10077, 1015, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, 'BKASH-BKash', NULL, '2111281105261aIoT5O2xqlLO4D', '2111281105260l7ZJmA3RwHt2mL', '2021-11-28', '2021-11-28 11:05:22', '2021-11-28 11:05:19', '2023-09-24', '2024-03-24', 'VALID', 1, '2021-11-28 05:05:22', '2021-11-28 05:05:38'),
(10078, 1024, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, 'ABBANKIB-AB Bank', NULL, '220821163553GijstyA0ge7ZZW3', '22082116355413F10KBCyjBaEQu', '2022-08-21', '2022-08-21 16:33:02', '2022-08-21 16:35:43', '2022-08-28', '2023-02-28', 'VALID', 1, '2022-08-21 10:33:02', '2022-08-21 10:33:43'),
(10079, 1024, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, 'BKASH-BKash', NULL, '2208221204291DrgNJE3pf4dWMR', '2208221204291FdrOYdapBgjgVx', '2022-08-22', '2022-08-22 12:01:38', '2022-08-22 12:04:20', '2023-02-28', '2023-05-28', 'VALID', 1, '2022-08-22 06:01:38', '2022-08-22 06:02:19'),
(10080, 1024, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22', '2022-08-22 12:12:26', NULL, NULL, NULL, NULL, 0, '2022-08-22 06:12:26', '2022-08-22 06:12:26'),
(10081, 1024, 1, 3, 20, 60, 4, 5.04, 9.04, 2, 1, 50.96, 0, 1, 1, NULL, 'BKKRT', NULL, 'DBBLMOBILEB-Dbbl Mobile Banking', NULL, '220822123838L8HHhGVUjpWEuTQ', '2208221238386coD9qnuwprYB7u', '2022-08-22', '2022-08-22 12:36:11', '2022-08-22 12:38:27', '2023-05-28', '2023-08-28', 'VALID', 1, '2022-08-22 06:36:11', '2022-08-22 06:36:28'),
(10082, 1024, 1, 3, 20, 60, 4, 49, 53, 3, 1, 7, 0, 1, 1, NULL, 'PLJS34', NULL, 'NAGAD-Nagad', NULL, '220822124952LmVjuERzOxwnHdT', '220822124952MUZO2fIFkK5xgG9', '2022-08-22', '2022-08-22 12:47:27', '2022-08-22 12:49:43', '2023-08-28', '2023-11-28', 'VALID', 1, '2022-08-22 06:47:27', '2022-08-22 06:47:42'),
(10083, 1024, 1, 3, 20, 60, 4, 17, 21, 3, 1, 39, 0, 1, 1, NULL, 'PLJS34', NULL, 'ABBANKIB-AB Bank', NULL, '220822125133nQikCCbvZ3kUPiP', '220822125133yRBk1inzOj0a0Xd', '2022-08-22', '2022-08-22 12:49:10', '2022-08-22 12:51:26', '2023-11-28', '2024-02-28', 'VALID', 1, '2022-08-22 06:49:10', '2022-08-22 06:49:23'),
(10084, 1024, 1, 3, 20, 60, 4, 1.68, 5.68, 4, 1, 54.32, 0, 1, 1, NULL, 'BAKRI', NULL, 'NAGAD-Nagad', NULL, '2208221254271xkBN9iTGIfbNtq', '220822125427S4MJQlNyKeOGekw', '2022-08-22', '2022-08-22 12:52:05', '2022-08-22 12:54:19', '2024-02-28', '2024-05-28', 'VALID', 1, '2022-08-22 06:52:05', '2022-08-22 06:52:17'),
(10085, 1029, 1, 8, 21.5, 172, 8, 0, 8, NULL, 3, 164, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-25', '2022-08-25 19:25:23', NULL, NULL, NULL, NULL, 0, '2022-08-25 19:25:23', '2022-08-25 19:25:23'),
(10086, 1005, 1, 6, 21.33, 128, 5, 0, 5, NULL, 2, 123, 0, 1, 1, NULL, NULL, NULL, 'NAGAD-Nagad', NULL, '2208252114091Nd55oPr3cHJTya', '2208252114090Z5Fhv770VYSdcV', '2022-08-25', '2022-08-25 21:11:37', '2022-08-25 21:13:56', '2022-12-11', '2023-06-11', 'VALID', 1, '2022-08-25 21:11:37', '2022-08-25 21:11:57'),
(10087, 1024, 1, 3, 20, 60, 4, 0, 4, NULL, 1, 56, 0, 1, 1, NULL, NULL, NULL, 'ABBANKIB-AB Bank', NULL, '2209081016300yIZru3ktOQgz1t', '220908101630dhWJpIEoRTHog3W', '2022-09-08', '2022-09-08 10:13:55', '2022-09-08 10:16:20', '2024-05-28', '2024-08-28', 'VALID', 1, '2022-09-08 10:13:55', '2022-09-08 10:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `monthly_charge` double NOT NULL,
  `discount_for_month` int(11) DEFAULT NULL,
  `discount_type` tinyint(4) DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `max_discount_amount` double DEFAULT NULL,
  `discount_status` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_settings`
--

INSERT INTO `payment_settings` (`id`, `monthly_charge`, `discount_for_month`, `discount_type`, `discount_amount`, `max_discount_amount`, `discount_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 24, 3, 1, 7, 35, 1, 1, '2021-02-11 09:17:57', '2021-02-11 09:28:43');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(25, 1, 2, '2021-02-08 09:25:43', '2021-02-08 09:25:43'),
(26, 1, 3, '2021-02-08 09:25:43', '2021-02-08 09:25:43'),
(27, 1, 1, '2021-02-08 09:25:43', '2021-02-08 09:25:43'),
(28, 1, 5, '2021-02-08 09:25:43', '2021-02-08 09:25:43'),
(29, 1, 6, '2021-02-08 09:25:43', '2021-02-08 09:25:43'),
(30, 1, 4, '2021-02-08 09:25:43', '2021-02-08 09:25:43'),
(33, 1, 7, '2021-02-08 09:25:43', '2021-02-08 09:25:43'),
(34, 1, 10, '2021-02-08 09:25:43', '2021-02-08 09:25:43'),
(35, 1, 11, '2021-02-11 06:42:38', '2021-02-11 06:42:39'),
(36, 1, 12, '2021-02-17 06:33:32', '2021-02-17 06:33:33'),
(37, 1, 13, '2021-02-18 11:19:27', '2021-02-18 11:19:28'),
(38, 1, 14, '2021-02-18 11:19:37', '2021-02-18 11:19:38'),
(39, 1, 15, '2021-02-23 05:00:57', '2021-02-23 05:00:58'),
(40, 1, 16, '2021-02-25 11:36:06', '2021-02-25 11:36:08'),
(41, 1, 17, '2021-03-02 05:26:18', '2021-03-02 05:26:19'),
(42, 1, 18, '2021-03-28 11:02:14', '2021-03-28 11:02:15'),
(43, 1, 19, '2021-04-10 05:13:35', '2021-04-10 05:13:36'),
(44, 1, 20, '2021-05-27 08:09:54', '2021-05-27 08:09:55'),
(45, 1, 21, '2021-05-27 08:10:05', '2021-05-27 08:10:06'),
(46, 1, 22, '2021-05-27 08:10:14', '2021-05-27 08:10:16'),
(47, 1, 23, '2021-06-15 12:06:14', '2021-06-15 12:06:15'),
(48, 1, 24, '2021-06-15 12:06:25', '2021-06-15 12:06:26'),
(49, 1, 25, '2021-06-15 12:06:36', '2021-06-15 12:06:38'),
(50, 1, 26, '2021-06-20 06:49:16', '2021-06-20 06:49:17'),
(51, 1, 27, '2021-09-13 05:52:36', '2021-09-13 05:52:37');

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `time_type` tinyint(4) DEFAULT 1 COMMENT '1 = monthly , 2 = daily , 3 = yearly',
  `total_points` double NOT NULL,
  `total_amount` double NOT NULL,
  `total_discount` double DEFAULT 0,
  `ssl_store_amount` double DEFAULT 0,
  `payment_mode` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = online , 2 = offline',
  `admin_id` bigint(20) UNSIGNED DEFAULT 1 COMMENT 'admin who confirmed the payment if offline',
  `sessionkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'session key for payment verification',
  `offline_payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'bkash,bank,cash etc',
  `card_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'online payment card type',
  `card_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'online payment card no , for bakash it will be reference',
  `bank_transection_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'online payment card no , for bakash it will be reference',
  `validation_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'payment validation id',
  `date` date DEFAULT NULL COMMENT 'date of payment ',
  `transection_date_time` datetime DEFAULT NULL COMMENT 'time and date of transection',
  `transection_done_date_time` datetime DEFAULT NULL COMMENT 'time and date of transection done',
  `transection_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'valid in valid or something like that',
  `payment_status` tinyint(4) DEFAULT 0 COMMENT '0 = not paid , 1 = payment done',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `user_id`, `time_type`, `total_points`, `total_amount`, `total_discount`, `ssl_store_amount`, `payment_mode`, `admin_id`, `sessionkey`, `offline_payment_method`, `card_type`, `card_no`, `bank_transection_id`, `validation_id`, `date`, `transection_date_time`, `transection_done_date_time`, `transection_status`, `payment_status`, `created_at`, `updated_at`) VALUES
(10000, 1003, 1, 480, 480, 0, 0, 2, 1, NULL, 'cash', NULL, NULL, NULL, NULL, '2021-05-06', '2021-05-06 11:25:16', '2021-05-06 11:25:16', 'VALID', 1, '2021-05-06 05:25:16', '2021-05-06 05:25:16'),
(10001, 1010, 1, 10055, 10055, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31', '2021-05-31 17:15:27', NULL, NULL, 0, '2021-05-31 11:15:27', '2021-05-31 11:15:27'),
(10002, 1016, 1, 100, 100, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31', '2021-05-31 18:07:03', NULL, NULL, 0, '2021-05-31 12:07:03', '2021-05-31 12:07:03'),
(10003, 1016, 1, 160, 160, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31', '2021-05-31 18:10:35', NULL, NULL, 0, '2021-05-31 12:10:35', '2021-05-31 12:10:35'),
(10004, 1016, 1, 180, 180, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31', '2021-05-31 18:17:04', NULL, NULL, 0, '2021-05-31 12:17:04', '2021-05-31 12:17:04'),
(10005, 1016, 1, 100, 100, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31', '2021-05-31 18:20:28', NULL, NULL, 0, '2021-05-31 12:20:28', '2021-05-31 12:20:28'),
(10006, 1016, 1, 100, 100, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31', '2021-05-31 18:22:26', NULL, NULL, 0, '2021-05-31 12:22:26', '2021-05-31 12:22:26'),
(10007, 1016, 1, 100, 100, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-01', '2021-06-01 12:51:56', NULL, NULL, 0, '2021-06-01 06:51:56', '2021-06-01 06:51:56'),
(10008, 1016, 1, 100, 100, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-01', '2021-06-01 12:56:31', NULL, NULL, 0, '2021-06-01 06:56:31', '2021-06-01 06:56:31'),
(10009, 1016, 1, 105, 105, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-01', '2021-06-01 13:48:57', NULL, NULL, 0, '2021-06-01 07:48:57', '2021-06-01 07:48:57'),
(10010, 1015, 1, 100, 100, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08', '2021-06-08 16:58:58', NULL, NULL, 0, '2021-06-08 10:58:58', '2021-06-08 10:58:58'),
(10011, 1015, 1, 140, 140, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-20', '2021-06-20 11:17:40', NULL, NULL, 0, '2021-06-20 05:17:40', '2021-06-20 05:17:40'),
(10012, 1015, 1, 150, 150, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-20', '2021-06-20 14:23:26', NULL, NULL, 0, '2021-06-20 08:23:26', '2021-06-20 08:23:26'),
(10013, 1015, 1, 130, 130, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-20', '2021-06-20 14:24:15', NULL, NULL, 0, '2021-06-20 08:24:15', '2021-06-20 08:24:15'),
(10014, 1015, 1, 100, 100, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-20', '2021-06-20 14:27:27', NULL, NULL, 0, '2021-06-20 08:27:27', '2021-06-20 08:27:27'),
(10015, 1015, 1, 20, 20, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21', '2021-06-21 13:16:24', NULL, NULL, 0, '2021-06-21 07:16:24', '2021-06-21 07:16:24'),
(10016, 1014, 1, 14000, 14000, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21', '2021-06-21 13:28:59', NULL, NULL, 0, '2021-06-21 07:28:59', '2021-06-21 07:28:59'),
(10017, 1014, 1, 10000, 10000, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21', '2021-06-21 13:29:53', NULL, NULL, 0, '2021-06-21 07:29:53', '2021-06-21 07:29:53'),
(10018, 1015, 1, 100, 100, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22', '2021-06-22 11:39:53', NULL, NULL, 0, '2021-06-22 05:39:53', '2021-06-22 05:39:53'),
(10019, 1015, 1, 87, 87, 0, 0, 1, 1, NULL, NULL, 'ABBANKIB-AB Bank', NULL, '2106221148471azKqA83gMdYJoN', '2106221148471xRBmwKrfFL8Wa5', '2021-06-22', '2021-06-22 11:48:40', '2021-06-22 11:48:41', 'VALID', 1, '2021-06-22 05:48:40', '2021-06-22 05:48:54'),
(10020, 1015, 1, 33, 33, 0, 0, 1, 1, NULL, NULL, 'DBBLMOBILEB-Dbbl Mobile Banking', NULL, '210622114947mrF4JJpb93b7Qy2', '2106221149471cswZrucM5DwESu', '2021-06-22', '2021-06-22 11:49:40', '2021-06-22 11:49:40', 'VALID', 1, '2021-06-22 05:49:40', '2021-06-22 05:49:54'),
(10021, 1015, 1, 78, 78, 0, 0, 1, 1, NULL, NULL, 'ABBANKIB-AB Bank', NULL, '2106221508044sY7WboNtUmG3Kg', '210622150804Qy5TcmmWwz9KOF8', '2021-06-22', '2021-06-22 15:07:50', '2021-06-22 15:07:57', 'VALID', 1, '2021-06-22 09:07:50', '2021-06-22 09:08:09'),
(10022, 1015, 1, 35, 35, 0, 0, 1, 1, NULL, NULL, 'NAGAD-Nagad', NULL, '2106221551140tN8DrIpkWpWBGj', '210622155114yXABhVtDoib74RK', '2021-06-22', '2021-06-22 15:50:51', '2021-06-22 15:50:53', 'VALID', 1, '2021-06-22 09:50:51', '2021-06-22 09:51:19'),
(10023, 1015, 1, 80, 80, 0, 0, 1, 1, NULL, NULL, 'ABBANKIB-AB Bank', NULL, '2106231324121z8Gsuw3jqs6EBE', '210623132413mZkWfFTFqZSxZoJ', '2021-06-23', '2021-06-23 13:23:55', '2021-06-23 13:23:55', 'VALID', 1, '2021-06-23 07:23:55', '2021-06-23 07:24:20'),
(10024, 1005, 1, 1000, 1000, 0, 0, 1, 1, NULL, NULL, 'BKASH-BKash', NULL, '2108181252441Avn0lfpT9zWCqw', '21081812524503CLy6j60pfl8wY', '2021-08-18', '2021-08-18 12:52:36', '2021-08-18 12:52:35', 'VALID', 1, '2021-08-18 06:52:36', '2021-08-18 06:52:51'),
(10025, 1008, 1, 170, 170, 0, 0, 1, 1, NULL, NULL, 'NAGAD-Nagad', NULL, '2110191551330M6TokLFkSBOyNt', '2110191551330kc4ckmsURHDFLn', '2021-10-19', '2021-10-19 15:51:19', '2021-10-19 15:51:21', 'VALID', 1, '2021-10-19 09:51:19', '2021-10-19 09:51:38'),
(10026, 1008, 1, 230, 230, 0, 0, 1, 1, NULL, NULL, 'ABBANKIB-AB Bank', NULL, '2110191559001GwSwUs3QFzoegA', '21101915590111EFPF6KCTvJFgM', '2021-10-19', '2021-10-19 15:58:49', '2021-10-19 15:58:51', 'VALID', 1, '2021-10-19 09:58:49', '2021-10-19 09:59:07'),
(10027, 1010, 1, 1000, 1000, 0, 0, 1, 1, NULL, NULL, 'BKASH-BKash', NULL, '211025132520xXsC3Mi0VZuCVyW', '21102513252002HDBN4Mw037DVM', '2021-10-25', '2021-10-25 13:25:16', '2021-10-25 13:25:14', 'VALID', 1, '2021-10-25 07:25:16', '2021-10-25 07:25:31');

-- --------------------------------------------------------

--
-- Table structure for table `point_withdraw_requests`
--

CREATE TABLE `point_withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'user requested amount paid by admin',
  `request_amount` double NOT NULL,
  `card_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'card type',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'withdraw description',
  `request_date` datetime NOT NULL COMMENT 'user request datetime',
  `return_date` datetime DEFAULT NULL COMMENT 'requested amount paid datetime',
  `payment_method` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 for payment done according to request, 0 for pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `point_withdraw_requests`
--

INSERT INTO `point_withdraw_requests` (`id`, `user_id`, `admin_id`, `request_amount`, `card_type`, `note`, `request_date`, `return_date`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(1, 1008, 1, 140, NULL, '01945565667', '2021-05-31 17:25:46', '2021-06-17 00:00:00', 'bKash', 1, '2021-05-31 11:25:46', '2021-06-20 11:10:28'),
(2, 1015, 1, 50, NULL, '01949281513 nagad account', '2021-06-20 12:22:15', '2021-06-20 00:00:00', 'bank', 1, '2021-06-20 06:22:15', '2021-06-21 10:15:03'),
(3, 1015, 1, 870, NULL, '6194565613 bank account', '2021-06-20 15:50:32', '2021-06-18 00:00:00', 'cash', 1, '2021-06-20 09:50:32', '2021-06-20 11:26:03');

-- --------------------------------------------------------

--
-- Table structure for table `quantity_units`
--

CREATE TABLE `quantity_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `english_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quantity_units`
--

INSERT INTO `quantity_units` (`id`, `name`, `english_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'কেজী', 'KG', 1, '2020-12-28 07:08:44', '2020-12-28 07:21:04'),
(2, 'পিস্', 'Piece', 1, '2020-12-28 07:09:14', '2020-12-28 07:09:14'),
(3, 'জোড়া', 'Pair', 1, '2020-12-28 07:09:34', '2020-12-28 07:09:34'),
(4, 'গ্রাম', 'GM', 1, '2020-12-28 07:15:23', '2020-12-28 07:15:23'),
(5, 'লিটার', 'Litter', 1, '2020-12-28 07:15:46', '2020-12-28 07:15:46'),
(6, 'মিলি লিঃ', 'ML', 1, '2020-12-28 07:16:10', '2020-12-28 07:16:10'),
(7, 'মিটার', 'Miter', 1, '2020-12-28 07:16:31', '2020-12-28 07:16:31'),
(8, 'ফিট', 'Feet', 1, '2020-12-28 07:17:08', '2020-12-28 07:17:08'),
(9, 'ইঞ্চি', 'Inc', 1, '2020-12-28 07:17:32', '2020-12-28 07:17:32'),
(10, 'বক্স', 'Box', 1, '2020-12-28 07:18:30', '2020-12-28 07:18:30'),
(11, 'পাতা', 'pack', 1, '2020-12-28 07:18:52', '2020-12-28 07:18:52'),
(12, 'প্যাকেট', 'Packet', 1, '2020-12-28 07:19:10', '2020-12-28 07:19:10'),
(13, 'ইউনিট', 'Unit', 1, '2020-12-28 07:21:20', '2020-12-28 07:21:20'),
(14, 'টি', 'Pieces', 1, '2020-12-28 07:22:40', '2020-12-28 07:22:40'),
(15, 'গজ', 'gauze', 1, '2020-12-28 07:23:50', '2020-12-28 07:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seller_ratings`
--

CREATE TABLE `seller_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bid_id` bigint(20) UNSIGNED NOT NULL,
  `demand_id` bigint(20) UNSIGNED NOT NULL,
  `reviewer_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `ratings` double NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_ratings`
--

INSERT INTO `seller_ratings` (`id`, `bid_id`, `demand_id`, `reviewer_id`, `seller_id`, `ratings`, `review`, `created_at`, `updated_at`) VALUES
(1, 38, 54, 1009, 1002, 5, 'He is very Talented Seller', '2021-01-28 12:29:49', '2021-01-28 12:29:49'),
(2, 41, 61, 1002, 1009, 4, 'Good seller but not great', '2021-01-28 12:33:04', '2021-01-28 12:33:04'),
(3, 22, 53, 1009, 1015, 3, 'at average he is good but not great not recommanded', '2021-01-28 12:36:53', '2021-01-28 12:36:53'),
(4, 39, 80, 1014, 1010, 5, 'vai manush kaj ta dia dilam', '2021-01-31 11:32:24', '2021-01-31 11:32:24'),
(5, 19, 46, 1009, 1002, 5, 'oijkj', '2021-01-31 12:48:10', '2021-01-31 12:48:10'),
(6, 13, 43, 1009, 1002, 5, 'Heyyyy', '2021-02-01 08:40:08', '2021-02-01 08:40:08'),
(7, 3, 42, 1009, 1013, 5, 'Hey lorem ispum odlor', '2021-02-01 08:41:34', '2021-02-01 08:41:34'),
(8, 28, 59, 1002, 1014, 3, 'wrost seller i had ever workd', '2021-02-01 11:14:51', '2021-02-01 11:14:51'),
(9, 8, 58, 1002, 1006, 5, 'he is very professional', '2021-02-01 11:15:57', '2021-02-01 11:15:57'),
(10, 10, 3, 1002, 1006, 5, 'Honduras', '2021-02-01 11:39:15', '2021-02-01 11:39:15'),
(11, 47, 82, 1002, 1009, 5, 'good seller', '2021-02-01 12:12:57', '2021-02-01 12:12:57'),
(12, 36, 74, 1014, 1015, 5, 'kjkkjkkjkj', '2021-02-02 05:17:06', '2021-02-02 05:17:06'),
(13, 7, 51, 1010, 1006, 4, 'kjjkl', '2021-02-02 10:26:47', '2021-02-02 10:26:47'),
(14, 45, 38, 1002, 1009, 5, 'অনেক ভাল মানের একজন আর্টিকেল রাইটার। আমি তার কাজে সন্তুষ্ট। ভবিষ্যতে কাজ করালে তাকে দিয়েই করাব। ধন্যবাদ।', '2021-02-02 10:40:02', '2021-02-02 10:40:02'),
(15, 51, 85, 1009, 1002, 4, 'good seller but not great', '2021-02-03 08:33:51', '2021-02-03 08:33:51'),
(16, 25, 24, 1002, 1015, 5, 'younus molla is very good seller', '2021-02-03 08:36:24', '2021-02-03 08:36:24'),
(17, 57, 87, 1012, 1002, 4, 'valo', '2021-02-04 12:25:37', '2021-02-04 12:25:37'),
(18, 58, 1, 1002, 1009, 5, 'very excellent worker i am very happy', '2021-02-07 07:48:38', '2021-02-07 07:48:38'),
(19, 60, 11, 1002, 1010, 3, 'altu faltu seller', '2021-02-07 10:35:12', '2021-02-07 10:35:12'),
(20, 59, 88, 1009, 1002, 3, 'Aveerage seller', '2021-02-07 10:43:50', '2021-02-07 10:43:50'),
(21, 50, 32, 1010, 1002, 5, 'good', '2021-02-07 10:59:41', '2021-02-07 10:59:41'),
(22, 61, 4, 1002, 1009, 2, 'he is arifuddola', '2021-02-07 11:09:02', '2021-02-07 11:09:02'),
(23, 66, 90, 1008, 1006, 3, '4', '2021-03-31 10:43:53', '2021-03-31 10:43:53'),
(24, 129, 105, 1008, 1012, 3, 'well well, besh valo', '2021-12-02 12:40:08', '2021-12-02 12:40:08'),
(25, 127, 100, 1008, 1015, 4, 'good job by you', '2021-12-02 12:44:19', '2021-12-02 12:44:19'),
(26, 139, 110, 1010, 1008, 4, 'Fave, Singapore. 1159703 likes · 30 talking about this. We\'re SG\'s leading lifestyle app', '2022-02-02 10:22:39', '2022-02-02 10:22:39'),
(27, 140, 109, 1010, 1008, 3, 'Fave is one of Southeast Asia\'s leading fintech platform; providing a smart payment app for the', '2022-02-02 11:13:56', '2022-02-02 11:13:56'),
(28, 141, 98, 1008, 1010, 3, '3 feb 2022', '2022-02-03 12:21:59', '2022-02-03 12:21:59'),
(29, 158, 93, 1008, 1010, 4, NULL, '2022-03-20 13:07:18', '2022-03-20 13:07:18'),
(30, 33, 31, 1005, 1015, 5, 'recomanded', '2022-08-22 16:45:44', '2022-08-22 16:45:44'),
(31, 162, 134, 1029, 1031, 3, NULL, '2022-08-24 15:31:07', '2022-08-24 15:31:07'),
(32, 166, 136, 1030, 1029, 5, NULL, '2022-08-24 15:44:17', '2022-08-24 15:44:17'),
(33, 167, 133, 1029, 1030, 3, NULL, '2022-08-24 16:23:08', '2022-08-24 16:23:08');

-- --------------------------------------------------------

--
-- Table structure for table `sendsms`
--

CREATE TABLE `sendsms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `demand_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) DEFAULT 0 COMMENT '0 = not send , 1 = sended',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sendsms`
--

INSERT INTO `sendsms` (`id`, `demand_id`, `status`, `created_at`, `updated_at`) VALUES
(7, 65, 0, '2021-04-04 07:12:45', '2021-04-04 07:12:46'),
(8, 34, 0, '2021-04-04 07:12:56', '2021-04-04 07:12:57');

-- --------------------------------------------------------

--
-- Table structure for table `seos`
--

CREATE TABLE `seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sitemap_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seos`
--

INSERT INTO `seos` (`id`, `site_name`, `title`, `meta_image`, `sitemap_link`, `keyword`, `author`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Bido bido', 'Demand base site', 'meta.jpeg', 'sitemap.com', 'bido, buying, selling', 'Bido', 'bido is service site.', '2021-03-02 11:41:11', '2021-03-16 08:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `back_link_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_bid_sms` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active , 0 = inactive',
  `confirm_bid_sms` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active , 0 = inactive',
  `demand_sms_location_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 for location wise,0 to all',
  `demand_sms_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active , 0 = inactive',
  `service_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active , 0 = inactive, provider on either off',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active , 0 = inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms`
--

INSERT INTO `sms` (`id`, `provider_name`, `api_key`, `api_secret`, `new_bid_sms`, `confirm_bid_sms`, `demand_sms_location_status`, `demand_sms_status`, `service_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ADNSMS', 'KEY-towyvtx2texdjbr4t00zef8zgyol633x', 'A1!OZNKaEY@EXq@S', 0, 0, 0, 0, 0, 0, '2021-03-28 12:43:44', '2021-03-29 05:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` double NOT NULL,
  `per_month_amount` double NOT NULL,
  `discount_type` double DEFAULT NULL,
  `discount_value` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `final_amount` double NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_online_payment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `total_amount`, `per_month_amount`, `discount_type`, `discount_value`, `discount_amount`, `final_amount`, `quantity`, `payment_date`, `payment_method`, `is_online_payment`, `paid_by`, `created_at`, `updated_at`) VALUES
(1, 1010, 304, 76, 1, 7, 21.28, 282.72, '4', '2021-02-14', '0', '0', NULL, '2021-02-14 06:54:09', '2021-02-14 06:54:09'),
(2, 1008, 152, 76, 1, 7, 0, 152, '2', '2021-02-14', '0', '0', 1, '2021-02-14 07:06:27', '2021-02-14 07:06:27');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_month` int(11) NOT NULL,
  `total_amount` double NOT NULL,
  `discount` double DEFAULT 0,
  `final_amount` double DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active , 0 = inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `plan_name`, `total_month`, `total_amount`, `discount`, `final_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Maximal', 3, 60, 4, 56, 1, '2021-02-25 11:38:29', '2021-03-01 08:21:35'),
(2, 'Ulka', 6, 128, 5, 123, 1, '2021-02-25 11:39:24', '2021-02-25 11:39:24'),
(3, 'Niharika', 8, 172, 8, 164, 1, '2021-02-25 11:42:27', '2021-02-25 11:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presidence` int(11) DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT 0,
  `sub_area_id` bigint(20) UNSIGNED DEFAULT 0,
  `average_saling_rating` double(8,2) NOT NULL DEFAULT 0.00,
  `average_buying_rating` double(8,2) NOT NULL DEFAULT 0.00,
  `seller_badge` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = no batch , 1 = silver , 2 = blue , 3 = pink',
  `buyer_badge` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = no batch , 1 = silver , 2 = blue , 3 = pink',
  `is_seller` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = no , 1 = yes',
  `is_seller_before` tinyint(1) NOT NULL DEFAULT 0,
  `post_permission` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = no , 1 = yes',
  `bid_permission` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = no , 1 = yes',
  `subscription_expired_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = inactive , 1 = active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `current_point` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `avatar`, `mobile_no`, `email`, `area_id`, `sub_area_id`, `average_saling_rating`, `average_buying_rating`, `seller_badge`, `buyer_badge`, `is_seller`, `is_seller_before`, `post_permission`, `bid_permission`, `subscription_expired_at`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `current_point`) VALUES
(1002, 'shakhawat hossain', '', '01834394213', 'shakhawat@limmexbd.com', 3, 0, 4.43, 3.50, 2, 1, 0, 1, 1, 0, '2022-03-07', NULL, NULL, 1, NULL, '2020-12-10 01:09:51', '2022-03-15 11:51:11', 0),
(1003, 'shakhwat hosasin', '', '01834356798', 'nikka@gmail.com', 11, 0, 0.00, 0.00, 1, 2, 1, 1, 1, 1, '2022-07-15', NULL, NULL, 1, NULL, '2020-02-29 12:05:35', '2021-07-07 21:59:28', 480),
(1005, 'Shakhawat HOssain', '', '01834394216', NULL, 5, 0, 0.00, 0.00, 3, 2, 1, 1, 0, 0, '2023-06-11', NULL, NULL, 1, NULL, '2020-12-29 12:16:03', '2022-08-25 21:11:57', 1424),
(1006, 'Sukas lukium', '2021-02-08-1612787190.jpeg', '01923923922', 'nimba@mail.com', 3, 0, 4.25, 0.00, 1, 1, 1, 1, 1, 1, '2023-01-16', NULL, NULL, 1, NULL, '2020-02-29 12:26:07', '2021-03-31 10:43:53', 0),
(1007, 'Sayeed  khokon', '', '01876543212', NULL, 9, 0, 0.00, 0.00, 2, 1, 1, 1, 1, 1, '2022-09-09', NULL, NULL, 1, NULL, '2020-02-29 12:31:34', '2021-03-11 07:02:06', 0),
(1008, 'arifuzzaman', '2021-12-06-1638772212.jpeg', '01824220935', 'arif@zaman.com', 3, 0, 3.50, 3.50, 1, 1, 1, 1, 1, 1, '2022-11-14', NULL, NULL, 1, NULL, '2021-03-04 08:16:17', '2022-02-22 09:16:52', 540),
(1009, 'Arifuzzaman', '', '01834394219', NULL, 8, 0, 4.20, 4.20, 2, 1, 1, 1, 1, 0, '2022-09-16', NULL, NULL, 1, NULL, '2021-01-04 11:19:55', '2021-12-05 10:03:55', 0),
(1010, 'sayeed', '2021-06-22-1624345393.jpeg', '01824143370', 'sayeed300056@gmail.com', 3, 0, 3.75, 3.00, 1, 1, 1, 1, 1, 1, '2022-09-28', NULL, NULL, 1, NULL, '2021-03-10 11:02:42', '2022-03-20 13:07:18', 997),
(1011, 'Arif zaman', '2021-02-14-1613302983.jpeg', '01824220934', 'zaman@mail.co', 4, 0, 0.00, 0.00, 0, 0, 0, 0, 1, 1, '', NULL, NULL, 1, NULL, '2021-03-12 05:15:42', '2021-02-14 11:50:37', 0),
(1012, 'tushar', '', '01717688134', NULL, 3, 0, 3.00, 3.00, 1, 0, 1, 0, 1, 1, '2022-05-21', NULL, NULL, 1, NULL, '2021-03-11 08:53:34', '2021-12-02 12:40:08', 0),
(1013, 'Taskia Nishat', '', '01861100033', NULL, 3, 0, 5.00, 0.00, 0, 0, 1, 0, 1, 1, '2022-06-16', NULL, NULL, 1, NULL, '2021-01-19 04:55:52', '2021-03-16 06:05:13', 0),
(1014, 'amran hossen', '', '01832340543', NULL, 11, 0, 3.00, 4.50, 0, 1, 1, 0, 1, 1, '2022-06-16', NULL, NULL, 1, NULL, '2021-03-10 05:26:29', '2021-12-05 09:59:26', 0),
(1015, 'Arif', '2022-09-06-1662454160.jpeg', '01949281513', 'arifuzzaman.rb@gmail.com', 11, 0, 4.40, 0.00, 1, 0, 1, 1, 1, 1, '2024-03-24', NULL, NULL, 1, NULL, '2021-01-20 11:50:39', '2022-09-06 14:49:20', 7193),
(1016, 'jumba', '', '01824220939', NULL, 3, 0, 0.00, 0.00, 0, 0, 1, 1, 1, 1, '2022-06-07', NULL, NULL, 1, NULL, '2021-05-31 11:47:34', '2021-05-31 11:47:34', 0),
(1017, 'Nispalan', '', '01824220936', 'nisam@gmail.com', 13, 0, 0.00, 0.00, 0, 0, 1, 1, 1, 1, '2022-06-24', NULL, NULL, 1, NULL, '2021-06-17 13:31:04', '2021-06-17 13:32:41', 6000),
(1018, 'zoo', '2022-02-15-1644927562.jpeg', '01568099322', NULL, 9, 0, 0.00, 0.00, 0, 0, 1, 1, 1, 1, '2022-02-21', NULL, NULL, 1, NULL, '2022-02-14 11:10:38', '2022-02-15 12:19:22', 20),
(1024, 'Zoomba', '2022-08-23-1661236876.jpeg', '01568099321', 'nigur@zoomba.com', 11, 0, 0.00, 0.00, 0, 0, 1, 1, 1, 1, '2024-08-28', NULL, NULL, 1, NULL, '2022-08-21 08:58:56', '2022-09-08 10:14:14', 20),
(1028, 'Mohon', '', '01736714895', NULL, 3, 0, 0.00, 0.00, 0, 0, 1, 0, 1, 1, '2022-08-29', NULL, NULL, 1, NULL, '2022-08-22 16:35:19', '2022-08-22 16:35:19', 20),
(1029, 'Tushar R Islam', '2022-08-24-1661319417.jpeg', '01312447767', NULL, 3, 0, 5.00, 0.00, 1, 0, 1, 1, 1, 1, '2022-09-23', NULL, NULL, 1, NULL, '2022-08-24 11:33:00', '2022-08-24 15:44:17', 20),
(1030, 'Mohammed Tauhid', '2022-08-24-1661321030.jpeg', '01766558045', 'mfislambba@gmail.com', 3, 0, 3.00, 0.00, 1, 0, 1, 1, 1, 1, '2022-09-23', NULL, NULL, 1, NULL, '2022-08-24 11:59:57', '2022-08-24 16:23:08', 20),
(1031, 'Ashiqur Rahman', '', '01676916082', NULL, 3, 0, 3.00, 0.00, 1, 0, 1, 0, 1, 1, '2022-09-23', NULL, NULL, 1, NULL, '2022-08-24 15:15:36', '2022-08-24 15:31:07', 20);

-- --------------------------------------------------------

--
-- Table structure for table `user_categories`
--

CREATE TABLE `user_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_categories`
--

INSERT INTO `user_categories` (`id`, `user_id`, `category_id`) VALUES
(1, 1002, 1),
(2, 1002, 2),
(3, 1002, 3),
(4, 1005, 11),
(5, 1005, 5),
(6, 1006, 11),
(7, 1007, 11),
(8, 1008, 5),
(9, 1008, 9),
(10, 1008, 10),
(11, 1009, 10),
(12, 1009, 9),
(13, 1009, 13),
(14, 1010, 13),
(15, 1011, 9),
(16, 1013, 10),
(17, 1013, 8),
(18, 1013, 12),
(19, 1014, 8),
(20, 1015, 13),
(21, 1015, 11),
(22, 1015, 9),
(23, 1006, 10),
(24, 1016, 5),
(25, 1016, 9),
(26, 1017, 13),
(27, 1017, 5),
(28, 1017, 14),
(29, 1010, 5),
(30, 1010, 9),
(31, 1010, 10),
(32, 1010, 12),
(33, 1003, 8),
(34, 1003, 9),
(35, 1003, 11),
(36, 1003, 10),
(37, 1018, 13),
(38, 1024, 12),
(39, 1024, 5),
(40, 1024, 10),
(41, 1029, 12),
(42, 1030, 5),
(43, 1030, 10),
(44, 1030, 9),
(45, 1030, 12);

-- --------------------------------------------------------

--
-- Table structure for table `user_coupons`
--

CREATE TABLE `user_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT 0,
  `is_applied` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_coupons`
--

INSERT INTO `user_coupons` (`id`, `user_id`, `coupon_code`, `valid_date`, `is_used`, `is_applied`, `created_at`, `updated_at`) VALUES
(1, 1013, 'DKFH100', '2021-04-03', 0, 0, '2021-02-23 06:19:21', '2021-02-23 06:19:22'),
(2, 1010, 'PLJS34', '2021-03-17', 0, 0, '2021-02-24 11:37:56', '2021-02-24 11:37:56'),
(3, 1007, 'DKFH100', '2021-04-03', 0, 0, '2021-02-24 11:40:03', '2021-02-24 11:40:03'),
(4, 1006, 'PLJS34', '2021-03-17', 0, 0, '2021-02-24 12:01:58', '2021-02-25 14:05:43'),
(5, 1015, 'PLJS34', '2021-01-17', 0, 0, '2021-02-24 12:01:58', '2021-02-24 12:01:58'),
(6, 1006, 'PLJS34', '2021-03-17', 0, 0, '2021-02-24 12:01:58', '2021-02-24 12:01:58'),
(7, 1006, 'DKFH100', '2021-04-03', 0, 0, '2021-02-25 07:57:24', '2021-03-01 12:12:54'),
(8, 1015, 'PLJS34', '2021-03-17', 0, 0, '2021-02-25 08:00:36', '2021-02-25 08:00:36'),
(9, 1007, 'BKKRT', '2021-03-10', 0, 0, '2021-02-25 08:39:36', '2021-02-25 08:39:36'),
(10, 1008, 'BKKRT', '2021-03-10', 0, 0, '2021-03-07 06:05:26', '2021-03-07 06:05:26'),
(11, 1008, 'PLJS34', '2021-04-17', 0, 1, '2021-03-07 06:08:10', '2021-04-01 07:50:29'),
(12, 1005, 'DKFH100', '2021-04-03', 0, 0, '2021-03-07 07:02:35', '2021-03-07 07:02:35'),
(13, 1024, 'BKKRT', '2022-12-19', 1, 1, '2022-08-22 06:33:48', '2022-08-22 06:36:28'),
(15, 1024, 'PLJS34', '2022-11-17', 1, 1, '2022-08-22 06:48:13', '2022-08-22 06:49:23'),
(16, 1024, 'BAKRI', '2022-11-24', 1, 1, '2022-08-22 06:51:49', '2022-08-22 06:52:17');

-- --------------------------------------------------------

--
-- Table structure for table `user_information`
--

CREATE TABLE `user_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT 'biaography about person or company',
  `total_post` int(11) DEFAULT 0 COMMENT 'total number of demand posted by user',
  `total_bid` int(11) DEFAULT 0 COMMENT 'total amount bid user psot',
  `total_completed_work` int(11) DEFAULT 0 COMMENT 'total bid confirmed or completed work',
  `total_worker_hired` int(11) DEFAULT 0,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `total_amount_sales` double DEFAULT 0 COMMENT 'total completed work amount',
  `total_amount_buying` double DEFAULT 0 COMMENT 'total demand value',
  `total_qty_buyed` int(11) DEFAULT 0,
  `total_qty_sold` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_information`
--

INSERT INTO `user_information` (`id`, `user_id`, `address`, `bio`, `total_post`, `total_bid`, `total_completed_work`, `total_worker_hired`, `cover_image`, `total_amount_sales`, `total_amount_buying`, `total_qty_buyed`, `total_qty_sold`, `status`, `created_at`, `updated_at`) VALUES
(1, 1002, NULL, '0', 57, 19, 7, 8, '', 0, 0, 0, 0, 0, NULL, '2022-03-15 11:51:11'),
(2, 1003, 'feni, lokkar dokan', 'very very funny khan', 0, 4, 0, 0, '', 0, 0, 0, 0, 0, '2020-12-29 12:05:35', '2021-07-07 22:17:17'),
(4, 1005, NULL, NULL, 6, 4, 0, 0, '', 0, 0, 0, 0, 0, '2020-12-29 12:16:03', '2022-08-23 17:25:54'),
(5, 1006, 'kalabaghan, kalatoli', 'Position: Technical Manager\nInterested and eligible candidates are \nrequested to share your resumes to', 0, 10, 4, 0, '', 0, 0, 0, 0, 0, '2020-12-29 12:26:07', '2021-03-31 10:43:53'),
(6, 1007, NULL, NULL, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '2020-12-29 12:31:34', '2020-12-29 12:31:34'),
(7, 1008, 'Tolarbag, Mirpur.', 'A service provider on online.', 9, 10, 2, 2, '', 0, 0, 0, 0, 0, '2021-01-04 08:16:17', '2022-09-10 18:17:11'),
(8, 1009, NULL, NULL, 19, 12, 5, 6, '', 0, 0, 0, 0, 0, '2021-01-04 11:19:55', '2021-12-05 10:03:55'),
(9, 1010, 'Shsjsjshd euisisj ejejsj73737 sjdj', 'Vcyu hjhxhhdj shdjdjjdsj ehejshjsjbhdhdbhd dhdhdb dhej', 25, 12, 4, 2, '', 0, 0, 0, 0, 0, '2021-01-10 11:02:42', '2022-08-25 14:27:11'),
(10, 1011, 'আমি চেষ্টা করেছি বাংলা ভাষায় দীর্ঘ শব্দ রাখতে, তবে তা দীর্ঘতম – এমন দাবি আমি করছি না।', 'আমি কোনো ভাষাবিজ্ঞানী নই। তাই ভাষাগত, শব্দব্যঞ্জনগত শুদ্ধতা, তাল-লয় -এসব বিষয়ে আমার জ্ঞান খুবই প্রাথমিক। তাই এই লেখায় এসব ভাষাবিজ্ঞানগত তাত্ত্বিক উপাদান খুঁজতে যাওয়া অর্থহীন হবে।', 1, 0, 0, 0, '', 0, 0, 0, 0, 0, '2021-01-12 05:15:42', '2021-02-14 13:00:36'),
(11, 1012, NULL, NULL, 1, 4, 1, 1, '', 0, 0, 0, 0, 0, '2021-01-18 08:53:34', '2021-12-02 12:40:08'),
(12, 1013, NULL, NULL, 1, 3, 1, 0, '', 0, 0, 0, 0, 0, '2021-01-19 04:55:52', '2021-02-01 08:41:34'),
(13, 1014, NULL, NULL, 19, 7, 1, 2, '', 0, 0, 0, 0, 0, '2021-01-20 05:26:29', '2021-12-05 09:59:26'),
(14, 1015, 'Feni, Barishal', 'Hero never made, they born.', 13, 61, 5, 0, '', 0, 0, 0, 0, 0, '2021-01-20 11:50:39', '2022-09-08 15:32:38'),
(15, 1016, NULL, NULL, 1, 1, 0, 0, '', 0, 0, 0, 0, 0, '2021-05-31 11:47:34', '2021-06-02 12:05:41'),
(16, 1017, 'Maymansing rasta ghate', 'temon valana', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '2021-06-17 13:31:04', '2021-06-17 13:32:41'),
(17, 1018, NULL, NULL, 0, 1, 0, 0, '', 0, 0, 0, 0, 0, '2022-02-14 11:10:38', '2022-02-15 07:48:22'),
(23, 1024, 'Towhid Tower-4, 17/4, Tolarbagh, Mirpur-1, Dhaka-1216', 'system kari', 5, 0, 0, 0, '', 0, 0, 0, 0, 0, '2022-08-21 08:58:56', '2022-08-28 09:55:08'),
(27, 1028, NULL, NULL, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '2022-08-22 16:35:19', '2022-08-22 16:35:19'),
(28, 1029, NULL, NULL, 2, 4, 1, 0, '', 0, 0, 0, 0, 0, '2022-08-24 11:33:00', '2022-08-25 16:05:59'),
(29, 1030, 'Tolarbag, Mirpur-1, Dhaka 1216', 'Simple the Best', 1, 3, 1, 0, '', 0, 0, 0, 0, 0, '2022-08-24 11:59:57', '2022-08-24 16:23:08'),
(30, 1031, NULL, NULL, 1, 1, 1, 0, '', 0, 0, 0, 0, 0, '2022-08-24 15:15:36', '2022-08-24 15:31:07');

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nilam_id` bigint(20) UNSIGNED NOT NULL,
  `nilam_bid_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double DEFAULT 0,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'payment related comment',
  `requested_at` datetime DEFAULT NULL COMMENT 'date time',
  `payment_at` datetime DEFAULT NULL COMMENT 'date time',
  `status` tinyint(4) DEFAULT 0 COMMENT '0 = not paid , 1 = paid , 2 = rejected',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_phone_unique` (`phone`);

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `album_images`
--
ALTER TABLE `album_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bid_settings`
--
ALTER TABLE `bid_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_tag`
--
ALTER TABLE `blog_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buyer_ratings`
--
ALTER TABLE `buyer_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_quantity_units`
--
ALTER TABLE `category_quantity_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `demands`
--
ALTER TABLE `demands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `f_a_q_s`
--
ALTER TABLE `f_a_q_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilams`
--
ALTER TABLE `nilams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilam_bids`
--
ALTER TABLE `nilam_bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `o_t_p_s`
--
ALTER TABLE `o_t_p_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `point_withdraw_requests`
--
ALTER TABLE `point_withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quantity_units`
--
ALTER TABLE `quantity_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_ratings`
--
ALTER TABLE `seller_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sendsms`
--
ALTER TABLE `sendsms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_mobile_no_unique` (`mobile_no`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_categories`
--
ALTER TABLE `user_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_coupons`
--
ALTER TABLE `user_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_information`
--
ALTER TABLE `user_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `album_images`
--
ALTER TABLE `album_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `bid_settings`
--
ALTER TABLE `bid_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_tag`
--
ALTER TABLE `blog_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buyer_ratings`
--
ALTER TABLE `buyer_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `careers`
--
ALTER TABLE `careers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `category_quantity_units`
--
ALTER TABLE `category_quantity_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `demands`
--
ALTER TABLE `demands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_a_q_s`
--
ALTER TABLE `f_a_q_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `nilams`
--
ALTER TABLE `nilams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `nilam_bids`
--
ALTER TABLE `nilam_bids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `o_t_p_s`
--
ALTER TABLE `o_t_p_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10088;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10028;

--
-- AUTO_INCREMENT for table `point_withdraw_requests`
--
ALTER TABLE `point_withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quantity_units`
--
ALTER TABLE `quantity_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seller_ratings`
--
ALTER TABLE `seller_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sendsms`
--
ALTER TABLE `sendsms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1032;

--
-- AUTO_INCREMENT for table `user_categories`
--
ALTER TABLE `user_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user_coupons`
--
ALTER TABLE `user_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_information`
--
ALTER TABLE `user_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
