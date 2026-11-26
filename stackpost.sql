-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 14, 2025 at 03:35 PM
-- Server version: 8.0.35
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stackpost`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_network` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reconnect_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `login_type` int DEFAULT NULL,
  `can_post` int DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tmp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `proxy` int DEFAULT NULL,
  `run` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `module_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_main` int DEFAULT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `install_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relative_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `id_secure`, `source`, `product_id`, `module_name`, `purchase_code`, `is_main`, `version`, `install_path`, `relative_path`, `status`, `changed`, `created`) VALUES
(1, 'RpQPjhitBmJx', 1, 34283881, NULL, 'test', 1, '9.0.1', './', '', 1, 1755185365, 1755185365);

-- --------------------------------------------------------

--
-- Table structure for table `affiliate`
--

CREATE TABLE `affiliate` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `affiliate_uid` int NOT NULL,
  `payment_id` int DEFAULT NULL,
  `amount` double NOT NULL,
  `commission_rate` double NOT NULL,
  `commission` double NOT NULL,
  `status` int NOT NULL,
  `created` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_info`
--

CREATE TABLE `affiliate_info` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliate_uid` int DEFAULT NULL,
  `clicks` int NOT NULL DEFAULT '0',
  `conversions` int NOT NULL DEFAULT '0',
  `total_withdrawal` double NOT NULL DEFAULT '0',
  `total_approved` double DEFAULT NULL,
  `total_balance` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_withdrawal`
--

CREATE TABLE `affiliate_withdrawal` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliate_uid` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `bank` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ai_categories`
--

CREATE TABLE `ai_categories` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ai_posts`
--

CREATE TABLE `ai_posts` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accounts` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prompts` longtext COLLATE utf8mb4_unicode_ci,
  `time_post` int DEFAULT NULL,
  `end_date` int DEFAULT NULL,
  `next_try` int DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `result` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ai_prompts`
--

CREATE TABLE `ai_prompts` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `prompt` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ai_templates`
--

CREATE TABLE `ai_templates` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cate_id` int DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cate_id` int DEFAULT '0',
  `slug` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `thumbnail` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_1` text COLLATE utf8mb4_unicode_ci,
  `custom_2` text COLLATE utf8mb4_unicode_ci,
  `custom_3` text COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_categories`
--

CREATE TABLE `article_categories` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_map_tags`
--

CREATE TABLE `article_map_tags` (
  `id` int UNSIGNED NOT NULL,
  `article_id` int DEFAULT NULL,
  `tag_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_tags`
--

CREATE TABLE `article_tags` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('module_assets', 'a:2:{s:3:\"css\";a:0:{}s:2:\"js\";a:3:{i:0;s:84:\"http://stackpost.local:10038/modules/AppAIContents/resources/assets/js/aicontent.js\";i:1;s:75:\"http://stackpost.local:10038/modules/AppFiles/resources/assets/js/files.js\";i:2;s:85:\"http://stackpost.local:10038/modules/AppPublishing/resources/assets/js/publishing.js\";}}', 1755272088);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `captions`
--

CREATE TABLE `captions` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int NOT NULL DEFAULT '1',
  `discount` double DEFAULT NULL,
  `start_date` int DEFAULT NULL,
  `end_date` int DEFAULT NULL,
  `plans` text COLLATE utf8mb4_unicode_ci,
  `usage_limit` int DEFAULT NULL,
  `usage_count` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_usages`
--

CREATE TABLE `credit_usages` (
  `id` bigint UNSIGNED NOT NULL,
  `team_id` int DEFAULT NULL,
  `feature` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` int DEFAULT NULL,
  `credits_used` int NOT NULL DEFAULT '0',
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_folder` int NOT NULL DEFAULT '0',
  `pid` int NOT NULL DEFAULT '0',
  `team_id` int DEFAULT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci,
  `file` mediumtext COLLATE utf8mb4_unicode_ci,
  `type` mediumtext COLLATE utf8mb4_unicode_ci,
  `extension` mediumtext COLLATE utf8mb4_unicode_ci,
  `detect` text COLLATE utf8mb4_unicode_ci,
  `size` double DEFAULT NULL,
  `is_image` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `note` mediumtext COLLATE utf8mb4_unicode_ci,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accounts` longtext COLLATE utf8mb4_unicode_ci,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED DEFAULT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int UNSIGNED NOT NULL,
  `id_secure` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` int DEFAULT NULL,
  `auto_translate` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language_items`
--

CREATE TABLE `language_items` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `custom` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_07_17_000001_create_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `module_statuses`
--

CREATE TABLE `module_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_statuses`
--

INSERT INTO `module_statuses` (`id`, `module`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 'AdminAICategories', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(2, 'AdminAIConfiguration', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(3, 'AdminAIReport', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(4, 'AdminAITemplates', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(5, 'AdminAPIIntegration', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(6, 'AdminAddons', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(7, 'AdminAffiliate', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(8, 'AdminAffiliateCommissions', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(9, 'AdminAffiliateSettings', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(10, 'AdminAffiliateWithdrawal', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(11, 'AdminBackendAppearance', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(12, 'AdminBlogCategories', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(13, 'AdminBlogTags', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(14, 'AdminBlogs', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(15, 'AdminBroadcast', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(16, 'AdminCaptcha', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(17, 'AdminCoupons', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(18, 'AdminCreditRates', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(19, 'AdminCredits', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(20, 'AdminCrons', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(21, 'AdminDashboard', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(22, 'AdminEmbedCode', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(23, 'AdminFaqs', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(24, 'AdminFrontendThemes', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(25, 'AdminLanguages', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(26, 'AdminMailSender', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(27, 'AdminMailServer', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(28, 'AdminMailTemplates', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(29, 'AdminMailThemes', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(30, 'AdminManualPayments', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(31, 'AdminMarketplace', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(32, 'AdminNotifications', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(33, 'AdminPaymentConfigurations', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(34, 'AdminPaymentHistory', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(35, 'AdminPaymentManualConfig', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(36, 'AdminPaymentReport', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(37, 'AdminPaymentSubscriptions', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(38, 'AdminPlans', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(39, 'AdminPrivacyPolicy', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(40, 'AdminProxies', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(41, 'AdminSettings', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(42, 'AdminSocialPages', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(43, 'AdminSupport', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(44, 'AdminSupportCategories', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(45, 'AdminSupportLabels', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(46, 'AdminSupportTypes', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(47, 'AdminSystemInformation', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(48, 'AdminTermsOfUse', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(49, 'AdminThemes', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(50, 'AdminURLShorteners', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(51, 'AdminUserReport', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(52, 'AdminUsers', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(53, 'AppAIContents', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(54, 'AppAIPrompts', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(55, 'AppAIPublishing', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(56, 'AppAffiliate', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(57, 'AppAppearance', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(58, 'AppBulkPost', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(59, 'AppCaptions', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(60, 'AppChannelFacebookPages', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(61, 'AppChannelFacebookProfiles', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(62, 'AppChannelInstagramProfiles', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(63, 'AppChannelInstagramUnofficial', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(64, 'AppChannelLinkedinPages', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(65, 'AppChannelLinkedinProfiles', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(66, 'AppChannelTiktokProfiles', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(67, 'AppChannelXProfiles', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(68, 'AppChannelXUnofficial', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(69, 'AppChannels', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(70, 'AppDashboard', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(71, 'AppFiles', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(72, 'AppGroups', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(73, 'AppMediaSearch', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(74, 'AppNotifications', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(75, 'AppProfile', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(76, 'AppProxies', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(77, 'AppPublishing', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(78, 'AppPublishingCampaigns', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(79, 'AppPublishingDraft', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(80, 'AppPublishingLabels', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(81, 'AppRssSchedules', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(82, 'AppSupport', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(83, 'AppTeamJoined', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(84, 'AppTeams', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(85, 'AppURLShorteners', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(86, 'AppWatermark', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(87, 'Auth', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(88, 'Guest', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(89, 'Payment', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(90, 'PaymentPaypal', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(91, 'PaymentPaypalRecurring', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(92, 'PaymentStripe', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30'),
(93, 'PaymentStripeRecurring', 1, '2025-08-14 12:29:30', '2025-08-14 12:29:30');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `source` enum('auto','manual') COLLATE utf8mb4_unicode_ci NOT NULL,
  `mid` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'news',
  `message` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_manual`
--

CREATE TABLE `notification_manual` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'news',
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `value`) VALUES
(1, 'mail_protocol', 'mail'),
(2, 'smtp_server', ''),
(3, 'smtp_port', '587'),
(4, 'smtp_username', ''),
(5, 'smtp_password', ''),
(6, 'smtp_encryption', 'tls'),
(7, 'mail_sender_email', 'example@gmail.com'),
(8, 'mail_sender_name', 'Admin'),
(9, 'broadcast_driver', '0'),
(10, 'cron_key', 'cTlQ6anUjw'),
(11, 'facebook_page_status', '0'),
(12, 'facebook_profile_status', '0'),
(13, 'instagram_status', '0'),
(14, 'linkedin_page_status', '0'),
(15, 'linkedin_profile_status', '0'),
(16, 'tiktok_status', '0'),
(17, 'x_status', '0'),
(18, 'paypal_status', '0'),
(19, 'paypal_recurring_status', '0'),
(20, 'stripe_status', '0'),
(21, 'stripe_recurring_status', '0'),
(22, 'frontend_theme', 'nova'),
(23, 'format_date', 'd/m/Y'),
(24, 'format_datetime', 'd/m/Y H:i'),
(25, 'auth_landing_page_status', '1'),
(26, 'website_title', 'stackpost'),
(27, 'website_keyword', 'Social media management, social media scheduler, automation tool, social media strategy, content management, social media publisher'),
(28, 'website_description', 'Unlock your brand\'s full potential with Stackposts, the essential social media management tool for growth.'),
(29, 'website_favicon', 'http://stackpost.local:10038/public/img/favicon.png'),
(30, 'embed_code_status', '0'),
(31, 'website_logo_brand_dark', 'http://stackpost.local:10038/public/img/logo-brand-dark.png'),
(32, 'auth_signup_page_status', '1'),
(33, 'social_page_facebook', ''),
(34, 'social_page_instagram', ''),
(35, 'social_page_tiktok', ''),
(36, 'social_page_youtube', ''),
(37, 'social_page_x', ''),
(38, 'social_page_pinterest', ''),
(39, 'captcha_type', 'disable'),
(40, 'auth_google_login_status', '0'),
(41, 'auth_facebook_login_status', '0'),
(42, 'auth_x_login_status', '0'),
(43, 'file_addobe_express_status', ''),
(44, 'file_onedrive_status', ''),
(45, 'file_google_drive_status', ''),
(46, 'file_dropbox_status', ''),
(47, 'backend_sidebar_type', '1'),
(48, 'website_logo_dark', 'http://stackpost.local:10038/public/img/logo-dark.png'),
(49, 'backend_sidebar_icon_color', '1'),
(50, 'ai_language', 'en-US'),
(51, 'ai_tone_of_voice', 'Friendly'),
(52, 'ai_creativity', '0'),
(53, 'ai_max_input_lenght', '0'),
(54, 'facebook_app_id', ''),
(55, 'facebook_app_secret', ''),
(56, 'facebook_graph_version', 'v22.0'),
(57, 'facebook_page_permissions', 'pages_read_engagement,pages_manage_posts,pages_show_list,business_management'),
(58, 'facebook_profile_permissions', 'public_profile,publish_video');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_getways`
--

CREATE TABLE `payment_getways` (
  `id` int UNSIGNED NOT NULL,
  `id_sercure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `from` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `by` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_manual`
--

CREATE TABLE `payment_manual` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_info` text COLLATE utf8mb4_unicode_ci,
  `amount` double DEFAULT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_subscriptions`
--

CREATE TABLE `payment_subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `service` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_id` text COLLATE utf8mb4_unicode_ci,
  `customer_id` text COLLATE utf8mb4_unicode_ci,
  `amount` double DEFAULT NULL,
  `currency` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `type` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `trial_day` int DEFAULT NULL,
  `free_plan` int DEFAULT NULL,
  `featured` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `permissions` mediumtext COLLATE utf8mb4_unicode_ci,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `id_secure`, `name`, `desc`, `type`, `price`, `trial_day`, `free_plan`, `featured`, `position`, `permissions`, `data`, `status`, `changed`, `created`) VALUES
(1, 'AS9jDzZOkx', 'Started', 'Perfect for getting started easily', 1, 99, 7, 1, 0, 1, '[{\"key\":\"credits\",\"label\":\"Credits\",\"value\":\"100000\"},{\"key\":\"ai_word_credits\",\"label\":\"Ai Word Credits\",\"value\":\"1000\"},{\"key\":\"ai_media_credits\",\"label\":\"Ai Media Credits\",\"value\":null},{\"key\":\"ai_character_included\",\"label\":\"Ai Character Included\",\"value\":null},{\"key\":\"ai_minutes_included\",\"label\":\"Ai Minutes Included\",\"value\":null},{\"key\":\"appchannels\",\"label\":\"Channels\",\"value\":\"1\"},{\"key\":\"max_channels\",\"label\":\"Max channels\",\"value\":\"-1\"},{\"key\":\"channel_calculate_by\",\"label\":\"Channel Calculate By\",\"value\":\"1\"},{\"key\":\"appchannels.appchannelfacebookpages\",\"label\":\"Facebook pages\",\"value\":\"1\"},{\"key\":\"appchannels.appchannelfacebookprofiles\",\"label\":\"Facebook profiles\",\"value\":\"1\"},{\"key\":\"appchannels.appchannelinstagramprofiles\",\"label\":\"Instagram profiles\",\"value\":\"1\"},{\"key\":\"appchannels.appchannelinstagramunofficial\",\"label\":\"Instagram Unofficial\",\"value\":\"1\"},{\"key\":\"appchannels.appchannellinkedinpages\",\"label\":\"Linkedin pages\",\"value\":\"1\"},{\"key\":\"appchannels.appchannellinkedinprofiles\",\"label\":\"Linkedin profiles\",\"value\":\"1\"},{\"key\":\"appchannels.appchanneltiktokprofiles\",\"label\":\"Tiktok profiles\",\"value\":\"1\"},{\"key\":\"appchannels.appchannelxprofiles\",\"label\":\"X profiles\",\"value\":\"1\"},{\"key\":\"appchannels.appchannelxunofficial\",\"label\":\"X profiles (Unofficial)\",\"value\":\"1\"},{\"key\":\"apppublishing\",\"label\":\"Publishing\",\"value\":\"1\"},{\"key\":\"apppublishing.max_post\",\"label\":\"Maximum Posts per Month\",\"value\":\"100\"},{\"key\":\"apppublishingcampaigns\",\"label\":\"Campaign Publishing\",\"value\":\"1\"},{\"key\":\"apppublishinglabels\",\"label\":\"Label Publishing\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannelfacebookpages\",\"label\":\"Facebook pages\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannelfacebookprofiles\",\"label\":\"Facebook profiles\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannelinstagramprofiles\",\"label\":\"Instagram profiles\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannelinstagramunofficial\",\"label\":\"Instagram Unofficial\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannellinkedinpages\",\"label\":\"Linkedin pages\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannellinkedinprofiles\",\"label\":\"Linkedin profiles\",\"value\":\"1\"},{\"key\":\"apppublishing.appchanneltiktokprofiles\",\"label\":\"Tiktok profiles\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannelxprofiles\",\"label\":\"X profiles\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannelxunofficial\",\"label\":\"X profiles (Unofficial)\",\"value\":\"1\"},{\"key\":\"appfiles\",\"label\":\"Files\",\"value\":\"1\"},{\"key\":\"appfiles.google_drive\",\"label\":\"Google Drive\",\"value\":\"1\"},{\"key\":\"appfiles.dropbox\",\"label\":\"Dropbox\",\"value\":\"1\"},{\"key\":\"appfiles.onedrive\",\"label\":\"OneDrive\",\"value\":\"1\"},{\"key\":\"appfiles.image_editor\",\"label\":\"Max. file size (MB)\",\"value\":\"1\"},{\"key\":\"appfiles.max_storage\",\"label\":\"Appfiles.max Storage\",\"value\":\"1000\"},{\"key\":\"appfiles.max_size\",\"label\":\"Appfiles.max Size\",\"value\":\"100\"},{\"key\":\"appaicontents\",\"label\":\"AI Contents\",\"value\":\"1\"},{\"key\":\"appaipublishing\",\"label\":\"AI Publishing\",\"value\":\"1\"},{\"key\":\"appbulkpost\",\"label\":\"Bulk Posts\",\"value\":\"1\"},{\"key\":\"appcaptions\",\"label\":\"Captions\",\"value\":\"1\"},{\"key\":\"appgroups\",\"label\":\"Groups\",\"value\":\"1\"},{\"key\":\"appmediasearch\",\"label\":\"Search Media Online\",\"value\":\"1\"},{\"key\":\"appproxies\",\"label\":\"Proxies\",\"value\":\"1\"},{\"key\":\"apprssschedules\",\"label\":\"RSS Schedules\",\"value\":\"1\"},{\"key\":\"appsupport\",\"label\":\"Support\",\"value\":\"1\"},{\"key\":\"appteams\",\"label\":\"Teams\",\"value\":\"1\"},{\"key\":\"appurlshorteners\",\"label\":\"URL Shorteners\",\"value\":\"1\"},{\"key\":\"appwatermark\",\"label\":\"Watermark\",\"value\":\"1\"}]', NULL, 1, 1755185365, 1755185365);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `campaign` int DEFAULT NULL,
  `labels` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `social_network` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `function` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_type` int DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic',
  `query_id` int DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `time_post` int DEFAULT NULL,
  `delay` int DEFAULT NULL,
  `repost_frequency` int DEFAULT NULL,
  `repost_until` int DEFAULT NULL,
  `result` longtext COLLATE utf8mb4_unicode_ci,
  `tmp` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_data_1` text COLLATE utf8mb4_unicode_ci,
  `custom_data_2` text COLLATE utf8mb4_unicode_ci,
  `custom_data_3` text COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_campaigns`
--

CREATE TABLE `post_campaigns` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_labels`
--

CREATE TABLE `post_labels` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_stats`
--

CREATE TABLE `post_stats` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_id` bigint DEFAULT NULL,
  `team_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  `social_network` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign` bigint DEFAULT NULL,
  `method` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `query_id` int DEFAULT NULL,
  `labels` json DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_social_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proxies`
--

CREATE TABLE `proxies` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` int NOT NULL DEFAULT '0',
  `is_system` int DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proxy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit` double DEFAULT NULL,
  `is_free` int DEFAULT NULL,
  `active` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rss_schedules`
--

CREATE TABLE `rss_schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `accounts` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `start_date` int DEFAULT NULL,
  `end_date` int DEFAULT NULL,
  `time_post` int DEFAULT NULL,
  `next_try` int DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `stats` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `created` int DEFAULT NULL,
  `changed` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rss_schedules_history`
--

CREATE TABLE `rss_schedules_history` (
  `id` bigint UNSIGNED NOT NULL,
  `schedule_id` bigint NOT NULL,
  `account_id` bigint DEFAULT NULL,
  `post_link` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dJvFhvycnRrCSqIF5xxNCc9yFWZMnnRnr2h3i4kr', 1, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiZmtKcjViYkR3SG5BZUhwRGtvMnAwRGlmM3ZMNmtXMUVXY2lGOFV0MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly9tYXJrZWF0aXZlLmxvY2FsOjEwMDM4L2FkbWluL2FwaS1pbnRlZ3JhdGlvbi9mYWNlYm9vayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNToiY3VycmVudF90ZWFtX2lkIjtpOjE7czoxOToiY3VycmVudF90ZWFtX3NlY3VyZSI7czoxMDoiN2Y0STBmOEZ6ZiI7czoxNzoiY3VycmVudF90ZWFtX25hbWUiO047czo4OiJsb2dpbl9hcyI7czo1OiJhZG1pbiI7czoxMDoidXNlcl90b2tlbiI7czoxMDoiSXB2NWcxZnZzaiI7fQ==', 1755185688);

-- --------------------------------------------------------

--
-- Table structure for table `support_categories`
--

CREATE TABLE `support_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_comments`
--

CREATE TABLE `support_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_labels`
--

CREATE TABLE `support_labels` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_map_labels`
--

CREATE TABLE `support_map_labels` (
  `id` bigint UNSIGNED NOT NULL,
  `ticket_id` int DEFAULT NULL,
  `label_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_read` int DEFAULT NULL,
  `admin_read` int DEFAULT NULL,
  `cate_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `open_by` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `pin` int DEFAULT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_types`
--

CREATE TABLE `support_types` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner` int DEFAULT NULL,
  `permissions` longtext COLLATE utf8mb4_unicode_ci,
  `data` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `id_secure`, `name`, `owner`, `permissions`, `data`) VALUES
(1, '7f4I0f8Fzf', NULL, 1, '[{\"key\":\"credits\",\"label\":\"Credits\",\"value\":\"100000\"},{\"key\":\"ai_word_credits\",\"label\":\"Ai Word Credits\",\"value\":\"1000\"},{\"key\":\"ai_media_credits\",\"label\":\"Ai Media Credits\",\"value\":null},{\"key\":\"ai_character_included\",\"label\":\"Ai Character Included\",\"value\":null},{\"key\":\"ai_minutes_included\",\"label\":\"Ai Minutes Included\",\"value\":null},{\"key\":\"appchannels\",\"label\":\"Channels\",\"value\":\"1\"},{\"key\":\"max_channels\",\"label\":\"Max channels\",\"value\":\"-1\"},{\"key\":\"channel_calculate_by\",\"label\":\"Channel Calculate By\",\"value\":\"1\"},{\"key\":\"appchannels.appchannelfacebookpages\",\"label\":\"Facebook pages\",\"value\":\"1\"},{\"key\":\"appchannels.appchannelfacebookprofiles\",\"label\":\"Facebook profiles\",\"value\":\"1\"},{\"key\":\"appchannels.appchannelinstagramprofiles\",\"label\":\"Instagram profiles\",\"value\":\"1\"},{\"key\":\"appchannels.appchannelinstagramunofficial\",\"label\":\"Instagram Unofficial\",\"value\":\"1\"},{\"key\":\"appchannels.appchannellinkedinpages\",\"label\":\"Linkedin pages\",\"value\":\"1\"},{\"key\":\"appchannels.appchannellinkedinprofiles\",\"label\":\"Linkedin profiles\",\"value\":\"1\"},{\"key\":\"appchannels.appchanneltiktokprofiles\",\"label\":\"Tiktok profiles\",\"value\":\"1\"},{\"key\":\"appchannels.appchannelxprofiles\",\"label\":\"X profiles\",\"value\":\"1\"},{\"key\":\"appchannels.appchannelxunofficial\",\"label\":\"X profiles (Unofficial)\",\"value\":\"1\"},{\"key\":\"apppublishing\",\"label\":\"Publishing\",\"value\":\"1\"},{\"key\":\"apppublishing.max_post\",\"label\":\"Maximum Posts per Month\",\"value\":\"100\"},{\"key\":\"apppublishingcampaigns\",\"label\":\"Campaign Publishing\",\"value\":\"1\"},{\"key\":\"apppublishinglabels\",\"label\":\"Label Publishing\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannelfacebookpages\",\"label\":\"Facebook pages\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannelfacebookprofiles\",\"label\":\"Facebook profiles\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannelinstagramprofiles\",\"label\":\"Instagram profiles\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannelinstagramunofficial\",\"label\":\"Instagram Unofficial\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannellinkedinpages\",\"label\":\"Linkedin pages\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannellinkedinprofiles\",\"label\":\"Linkedin profiles\",\"value\":\"1\"},{\"key\":\"apppublishing.appchanneltiktokprofiles\",\"label\":\"Tiktok profiles\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannelxprofiles\",\"label\":\"X profiles\",\"value\":\"1\"},{\"key\":\"apppublishing.appchannelxunofficial\",\"label\":\"X profiles (Unofficial)\",\"value\":\"1\"},{\"key\":\"appfiles\",\"label\":\"Files\",\"value\":\"1\"},{\"key\":\"appfiles.google_drive\",\"label\":\"Google Drive\",\"value\":\"1\"},{\"key\":\"appfiles.dropbox\",\"label\":\"Dropbox\",\"value\":\"1\"},{\"key\":\"appfiles.onedrive\",\"label\":\"OneDrive\",\"value\":\"1\"},{\"key\":\"appfiles.image_editor\",\"label\":\"Max. file size (MB)\",\"value\":\"1\"},{\"key\":\"appfiles.max_storage\",\"label\":\"Appfiles.max Storage\",\"value\":\"1000\"},{\"key\":\"appfiles.max_size\",\"label\":\"Appfiles.max Size\",\"value\":\"100\"},{\"key\":\"appaicontents\",\"label\":\"AI Contents\",\"value\":\"1\"},{\"key\":\"appaipublishing\",\"label\":\"AI Publishing\",\"value\":\"1\"},{\"key\":\"appbulkpost\",\"label\":\"Bulk Posts\",\"value\":\"1\"},{\"key\":\"appcaptions\",\"label\":\"Captions\",\"value\":\"1\"},{\"key\":\"appgroups\",\"label\":\"Groups\",\"value\":\"1\"},{\"key\":\"appmediasearch\",\"label\":\"Search Media Online\",\"value\":\"1\"},{\"key\":\"appproxies\",\"label\":\"Proxies\",\"value\":\"1\"},{\"key\":\"apprssschedules\",\"label\":\"RSS Schedules\",\"value\":\"1\"},{\"key\":\"appsupport\",\"label\":\"Support\",\"value\":\"1\"},{\"key\":\"appteams\",\"label\":\"Teams\",\"value\":\"1\"},{\"key\":\"appurlshorteners\",\"label\":\"URL Shorteners\",\"value\":\"1\"},{\"key\":\"appwatermark\",\"label\":\"Watermark\",\"value\":\"1\"}]', '{\"quota_reset_at\":1755129600,\"next_quota_reset_at\":1757721600}');

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `permissions` longtext COLLATE utf8mb4_unicode_ci,
  `invite_token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `id_secure` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int DEFAULT NULL,
  `pid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `expiration_date` bigint DEFAULT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `secret_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_secure`, `role`, `pid`, `login_type`, `fullname`, `username`, `email`, `password`, `avatar`, `plan_id`, `expiration_date`, `timezone`, `language`, `data`, `secret_key`, `last_login`, `status`, `remember_token`, `changed`, `created`) VALUES
(1, 'U0J5AbuGld', 2, NULL, NULL, 'Abdullah Almhmd', 'admin', 'admin@admin.com', '$2y$12$wMTZrIOuB.cn0Y1tEmxHz.xXiHvPCrH6T65Yk5PsbP3Q1MWI1mB5S', 'https://ui-avatars.com/api/?name=Abdullah+Almhmd&background=675dff&color=fff&font-size=0.5&rounded=false&format=png', 1, -1, 'Africa/Abidjan', NULL, '{\"sidebar-small\":0}', 'ylGqrDzeZ67Fm8M', 1755185398, 2, 'KZGChvphJDHytCdFrDyi9MwgxuwK6J0lTQ7XCCDfER8T0R6iBAphgDdEVTXv', 1755185365, 1755185365);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addons_purchase_code_index` (`purchase_code`),
  ADD KEY `addons_product_id_index` (`product_id`);

--
-- Indexes for table `affiliate`
--
ALTER TABLE `affiliate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_info`
--
ALTER TABLE `affiliate_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_withdrawal`
--
ALTER TABLE `affiliate_withdrawal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ai_categories`
--
ALTER TABLE `ai_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ai_posts`
--
ALTER TABLE `ai_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ai_prompts`
--
ALTER TABLE `ai_prompts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ai_templates`
--
ALTER TABLE `ai_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_categories`
--
ALTER TABLE `article_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_map_tags`
--
ALTER TABLE `article_map_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_tags`
--
ALTER TABLE `article_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `captions`
--
ALTER TABLE `captions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_usages`
--
ALTER TABLE `credit_usages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `credit_usages_team_id_date_unique` (`team_id`,`date`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_items`
--
ALTER TABLE `language_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_statuses`
--
ALTER TABLE `module_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_statuses_module_unique` (`module`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_mid_index` (`mid`),
  ADD KEY `notifications_user_id_index` (`user_id`);

--
-- Indexes for table `notification_manual`
--
ALTER TABLE `notification_manual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_getways`
--
ALTER TABLE `payment_getways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_manual`
--
ALTER TABLE `payment_manual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_subscriptions`
--
ALTER TABLE `payment_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_campaigns`
--
ALTER TABLE `post_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_labels`
--
ALTER TABLE `post_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_stats`
--
ALTER TABLE `post_stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proxies`
--
ALTER TABLE `proxies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rss_schedules`
--
ALTER TABLE `rss_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rss_schedules_history`
--
ALTER TABLE `rss_schedules_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_categories`
--
ALTER TABLE `support_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_comments`
--
ALTER TABLE `support_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_labels`
--
ALTER TABLE `support_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_map_labels`
--
ALTER TABLE `support_map_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_types`
--
ALTER TABLE `support_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
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
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate`
--
ALTER TABLE `affiliate`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_info`
--
ALTER TABLE `affiliate_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_withdrawal`
--
ALTER TABLE `affiliate_withdrawal`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ai_categories`
--
ALTER TABLE `ai_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ai_posts`
--
ALTER TABLE `ai_posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ai_prompts`
--
ALTER TABLE `ai_prompts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ai_templates`
--
ALTER TABLE `ai_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article_categories`
--
ALTER TABLE `article_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article_map_tags`
--
ALTER TABLE `article_map_tags`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article_tags`
--
ALTER TABLE `article_tags`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `captions`
--
ALTER TABLE `captions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_usages`
--
ALTER TABLE `credit_usages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language_items`
--
ALTER TABLE `language_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `module_statuses`
--
ALTER TABLE `module_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_manual`
--
ALTER TABLE `notification_manual`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `payment_getways`
--
ALTER TABLE `payment_getways`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_manual`
--
ALTER TABLE `payment_manual`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_subscriptions`
--
ALTER TABLE `payment_subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_campaigns`
--
ALTER TABLE `post_campaigns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_labels`
--
ALTER TABLE `post_labels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_stats`
--
ALTER TABLE `post_stats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proxies`
--
ALTER TABLE `proxies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rss_schedules`
--
ALTER TABLE `rss_schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rss_schedules_history`
--
ALTER TABLE `rss_schedules_history`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_categories`
--
ALTER TABLE `support_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_comments`
--
ALTER TABLE `support_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_labels`
--
ALTER TABLE `support_labels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_map_labels`
--
ALTER TABLE `support_map_labels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_types`
--
ALTER TABLE `support_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
