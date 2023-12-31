-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 07, 2024 at 03:59 PM
-- Server version: 8.0.21
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoices`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_Date` date DEFAULT NULL,
  `Due_date` date DEFAULT NULL,
  `product` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_id` bigint UNSIGNED NOT NULL,
  `Amount_collection` int DEFAULT NULL,
  `Amount_Commission` int NOT NULL,
  `Discount` int NOT NULL,
  `Value_VAT` int NOT NULL,
  `Rate_VAT` varchar(999) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Total` decimal(8,2) NOT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value_Status` int NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Payment_Date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_section_id_foreign` (`section_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `invoice_Date`, `Due_date`, `product`, `section_id`, `Amount_collection`, `Amount_Commission`, `Discount`, `Value_VAT`, `Rate_VAT`, `Total`, `Status`, `Value_Status`, `note`, `Payment_Date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(27, 'RRR-9817263', '2023-12-23', '2023-12-26', 'zdfsef', 5, 981726354, 98172, 981, 13607, '14%', '110797.74', 'مدفوعة', 1, 'khu', '2023-12-26', NULL, '2023-12-23 16:04:52', '2024-01-06 16:30:38'),
(28, 'RTz-963', '2023-12-23', '2023-12-31', 'xdd', 2, 9817263, 6300, 720, 781, '14%', '6361.20', 'مدفوعة جزئيا', 3, 'xv', '2023-12-24', NULL, '2023-12-23 16:19:35', '2024-01-03 18:13:57'),
(29, 'RTA-6372', '2023-12-23', '2023-12-31', 'Visa', 4, 63725445, 6300, 720, 279, '5%', '5859.00', 'غير مدفوعة', 2, 'sd', NULL, NULL, '2023-12-23 16:20:36', '2024-01-06 19:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `invoices_details`
--

DROP TABLE IF EXISTS `invoices_details`;
CREATE TABLE IF NOT EXISTS `invoices_details` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_Invoice` bigint UNSIGNED NOT NULL,
  `invoice_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Section` varchar(999) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value_Status` int NOT NULL,
  `Payment_Date` date DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_details_id_invoice_foreign` (`id_Invoice`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices_details`
--

INSERT INTO `invoices_details` (`id`, `id_Invoice`, `invoice_number`, `product`, `Section`, `Status`, `Value_Status`, `Payment_Date`, `note`, `user`, `created_at`, `updated_at`) VALUES
(29, 27, 'RRR-9817263', 'zdfsef', '5', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2023-12-23 16:04:52', '2023-12-23 16:04:52'),
(57, 49, 'dxbxd', 'Visa', '4', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-01-06 19:53:06', '2024-01-06 19:53:06'),
(56, 48, 'tfhfth', 'zdfsef', '5', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-01-06 19:51:44', '2024-01-06 19:51:44'),
(30, 27, 'RRR-9817263', 'zdfsef', '5', 'مدفوعة جزئيا', 3, '2023-12-24', NULL, 'Ramy', '2023-12-23 16:06:19', '2023-12-23 16:06:19'),
(31, 27, 'RRR-9817263', 'zdfsef', '5', 'مدفوعة', 1, '2023-12-26', NULL, 'Ramy', '2023-12-23 16:07:16', '2023-12-23 16:07:16'),
(32, 28, 'RTz-963', 'xdd', '2', 'غير مدفوعة', 2, NULL, 'xv', 'Ramy', '2023-12-23 16:19:35', '2023-12-23 16:19:35'),
(33, 28, 'RTz-963', 'xdd', '2', 'مدفوعة جزئيا', 3, '2023-12-24', 'xv', 'Ramy', '2023-12-23 16:19:49', '2023-12-23 16:19:49'),
(34, 29, 'RTA-6372', 'Visa', '4', 'غير مدفوعة', 2, NULL, 'sd sd', 'Ramy', '2023-12-23 16:20:36', '2023-12-23 16:20:36'),
(50, 42, 'RWQ', 'zdfsef', '5', 'غير مدفوعة', 2, NULL, 'gyky', 'Ramy', '2024-01-06 17:32:55', '2024-01-06 17:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_attachments`
--

DROP TABLE IF EXISTS `invoice_attachments`;
CREATE TABLE IF NOT EXISTS `invoice_attachments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `file_name` varchar(999) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Created_by` varchar(999) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_attachments_invoice_id_foreign` (`invoice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_attachments`
--

INSERT INTO `invoice_attachments` (`id`, `file_name`, `invoice_number`, `Created_by`, `invoice_id`, `created_at`, `updated_at`) VALUES
(37, '9.jpg', 'RRR-9817263', 'Ramy', 27, '2023-12-23 16:08:14', '2023-12-23 16:08:14'),
(36, 'Ramy photo.bmp', 'RRR-9817263', 'Ramy', 27, '2023-12-23 16:08:07', '2023-12-23 16:08:07'),
(35, 'Image3.JPG', 'RRR-9817263', 'Ramy', 27, '2023-12-23 16:07:58', '2023-12-23 16:07:58'),
(38, 'auth2-4-2021.png', 'RTz-963', 'Ramy', 28, '2023-12-23 16:19:35', '2023-12-23 16:19:35'),
(39, 'laravel version check.png', 'RTA-6372', 'Ramy', 29, '2023-12-23 16:20:36', '2023-12-23 16:20:36'),
(59, 'Gad Menu.pdf', 'tfhfth', 'Ramy', 48, '2024-01-06 19:51:44', '2024-01-06 19:51:44'),
(53, 'Gad Menu.pdf', 'RWQ', 'Ramy', 42, '2024-01-06 17:32:55', '2024-01-06 17:32:55'),
(60, '03072008643.jpg', 'dxbxd', 'Ramy', 49, '2024-01-06 19:53:06', '2024-01-06 19:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2023_08_19_171415_create_sections_table', 1),
(5, '2023_08_20_200903_create_invoices_table', 1),
(6, '2023_08_25_195445_create_products_table', 1),
(7, '2023_09_21_182926_create_invoices_details_table', 1),
(8, '2023_09_21_190517_create_invoice_attachments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Product_name` varchar(999) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `section_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_section_id_foreign` (`section_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `Product_name`, `description`, `section_id`, `created_at`, `updated_at`) VALUES
(2, 'Visa', NULL, 4, '2023-11-06 16:44:55', '2023-11-06 16:44:55'),
(3, 'zdv', NULL, 3, '2023-11-10 15:28:04', '2023-11-10 15:28:04'),
(4, 'zdv', NULL, 2, '2023-11-10 15:28:15', '2023-11-10 15:28:15'),
(5, 'xdd', NULL, 2, '2023-11-10 15:28:23', '2023-11-10 15:28:23'),
(6, 'zdvzd', NULL, 5, '2023-11-10 15:28:30', '2023-11-10 15:28:30'),
(7, 'zdfsef', NULL, 5, '2023-11-10 15:28:35', '2023-11-10 15:28:35');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `section_name` varchar(999) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Created_by` varchar(999) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section_name`, `description`, `Created_by`, `created_at`, `updated_at`) VALUES
(5, 'البنك الاهلى', 'sser', 'Ramy', '2023-11-06 16:42:51', '2023-11-06 16:42:51'),
(2, 'بنك مصر', 'بنك مصر', 'Aly', '2023-09-24 14:55:03', '2023-09-24 14:55:03'),
(3, 'بنك القاهرة', 'بنك القاهرة', 'Aly', '2023-09-24 14:55:11', '2023-09-24 14:55:11'),
(4, 'بنك دبى', 'بنك دبى', 'Aly', '2023-09-24 14:55:21', '2023-09-24 14:55:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `roles_name`, `Status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ramy', 'Aly@mans.com', NULL, '$2y$10$CmNiMrZoHJ9V4AR1AQ9MFuA/iQezfjMC9VafY89vze5VcZZX2sbcy', NULL, '', 'ClqoRFcOx5RtrX3QYBhD2zxVh9dEvHijuX51kXGzKgW4v65aZIoVa0EPyUc1', NULL, NULL),
(4, 'Aly', 'Ramy@mans.com', NULL, '$2y$10$t.hITP22H8IY70eSzItYN.V47Mn7.e/8bHL/y/KDxz7mbXOtF9dHS', NULL, NULL, 'lUodsr5Bw6uBw5sXFvDxUY1EyonkKFqYFqjIrrSoarmV0DS0fsBgxf9yXNRF', '2023-09-24 13:58:56', '2023-09-24 13:58:56');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
