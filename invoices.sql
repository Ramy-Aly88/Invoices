-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 11, 2024 at 06:16 PM
-- Server version: 8.3.0
-- PHP Version: 7.4.33

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
  `Amount_collection` decimal(8,2) DEFAULT NULL,
  `Amount_Commission` decimal(8,2) NOT NULL,
  `Discount` decimal(8,2) NOT NULL,
  `Value_VAT` decimal(8,2) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `invoice_Date`, `Due_date`, `product`, `section_id`, `Amount_collection`, `Amount_Commission`, `Discount`, `Value_VAT`, `Rate_VAT`, `Total`, `Status`, `Value_Status`, `note`, `Payment_Date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, '456161', '2024-08-09', '2024-08-23', 'ثصبصب', 2, 32323.00, 3225.00, 0.00, 451.50, '14%', 3676.50, 'غير مدفوعة', 2, NULL, NULL, NULL, '2024-08-09 13:30:20', '2024-08-09 13:30:20'),
(5, '61515', '2024-08-09', '2024-08-24', 'ببلا', 2, 333424.00, 24311.00, 0.00, 3403.54, '14%', 27714.54, 'مدفوعة جزئيا', 3, NULL, '2024-08-14', NULL, '2024-08-09 13:30:47', '2024-08-09 13:31:06'),
(6, '23113', '2024-08-09', '2024-08-25', 'لايبلاي', 3, 112412.00, 2413.00, 0.00, 337.82, '14%', 2750.82, 'مدفوعة', 1, NULL, '2024-08-23', NULL, '2024-08-09 13:31:33', '2024-08-09 13:31:45'),
(7, '24131', '2024-08-09', '2024-08-26', 'لايبلاي', 3, 13141.00, 2424.00, 0.00, 339.36, '14%', 2763.36, 'غير مدفوعة', 2, NULL, NULL, NULL, '2024-08-09 13:32:18', '2024-08-09 13:32:18'),
(8, '3542', '2024-08-09', '2024-08-27', 'يبلايلايالا', 4, 242442.00, 2424.00, 0.00, 339.36, '14%', 2763.36, 'مدفوعة جزئيا', 3, NULL, '2024-08-16', NULL, '2024-08-09 13:34:29', '2024-08-09 13:34:52'),
(9, '2444', '2024-08-09', '2024-08-28', 'فىبفىقفى', 4, 24242.00, 2424.00, 0.00, 339.36, '14%', 2763.36, 'مدفوعة', 1, NULL, '2024-08-15', NULL, '2024-08-09 13:36:17', '2024-08-09 13:36:30'),
(10, '46465', '2024-08-09', '2024-08-29', 'فىبفىقفى', 4, 35353.00, 3535.00, 0.00, 494.90, '14%', 4029.90, 'غير مدفوعة', 2, NULL, NULL, NULL, '2024-08-09 13:36:58', '2024-08-09 13:36:58'),
(11, '575', '2024-08-09', '2024-08-30', 'فىبفىقفى', 4, 46466.00, 455.00, 0.00, 63.70, '14%', 518.70, 'مدفوعة جزئيا', 3, NULL, '2024-08-16', NULL, '2024-08-09 13:37:24', '2024-08-09 13:37:37'),
(12, '4646', '2024-08-09', '2024-08-31', 'فىبفىقفى', 4, 464646.00, 4646.00, 0.00, 650.44, '14%', 5296.44, 'مدفوعة', 1, NULL, '2024-08-17', NULL, '2024-08-09 13:37:58', '2024-08-09 13:38:11');

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices_details`
--

INSERT INTO `invoices_details` (`id`, `id_Invoice`, `invoice_number`, `product`, `Section`, `Status`, `Value_Status`, `Payment_Date`, `note`, `user`, `created_at`, `updated_at`) VALUES
(6, 4, '456161', 'ثصبصب', '2', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-08-09 13:30:20', '2024-08-09 13:30:20'),
(7, 5, '61515', 'ببلا', '2', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-08-09 13:30:47', '2024-08-09 13:30:47'),
(8, 5, '61515', 'ببلا', '2', 'مدفوعة جزئيا', 3, '2024-08-14', NULL, 'Ramy', '2024-08-09 13:31:06', '2024-08-09 13:31:06'),
(9, 6, '23113', 'لايبلاي', '3', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-08-09 13:31:33', '2024-08-09 13:31:33'),
(10, 6, '23113', 'لايبلاي', '3', 'مدفوعة', 1, '2024-08-23', NULL, 'Ramy', '2024-08-09 13:31:45', '2024-08-09 13:31:45'),
(11, 7, '24131', 'لايبلاي', '3', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-08-09 13:32:18', '2024-08-09 13:32:18'),
(12, 8, '3542', 'يبلايلايالا', '4', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-08-09 13:34:29', '2024-08-09 13:34:29'),
(13, 8, '3542', 'يبلايلايالا', '4', 'مدفوعة جزئيا', 3, '2024-08-16', NULL, 'Ramy', '2024-08-09 13:34:52', '2024-08-09 13:34:52'),
(14, 9, '2444', 'فىبفىقفى', '4', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-08-09 13:36:17', '2024-08-09 13:36:17'),
(15, 9, '2444', 'فىبفىقفى', '4', 'مدفوعة', 1, '2024-08-15', NULL, 'Ramy', '2024-08-09 13:36:30', '2024-08-09 13:36:30'),
(16, 10, '46465', 'فىبفىقفى', '4', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-08-09 13:36:58', '2024-08-09 13:36:58'),
(17, 11, '575', 'فىبفىقفى', '4', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-08-09 13:37:24', '2024-08-09 13:37:24'),
(18, 11, '575', 'فىبفىقفى', '4', 'مدفوعة جزئيا', 3, '2024-08-16', NULL, 'Ramy', '2024-08-09 13:37:37', '2024-08-09 13:37:37'),
(19, 12, '4646', 'فىبفىقفى', '4', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-08-09 13:37:58', '2024-08-09 13:37:58'),
(20, 12, '4646', 'فىبفىقفى', '4', 'مدفوعة', 1, '2024-08-17', NULL, 'Ramy', '2024-08-09 13:38:11', '2024-08-09 13:38:11');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_attachments`
--

INSERT INTO `invoice_attachments` (`id`, `file_name`, `invoice_number`, `Created_by`, `invoice_id`, `created_at`, `updated_at`) VALUES
(3, 'Screenshot 2024-07-29 202829.png', '456161', 'Ramy', 4, '2024-08-09 13:30:20', '2024-08-09 13:30:20'),
(4, 'Screenshot 2024-07-29 202923.png', '61515', 'Ramy', 5, '2024-08-09 13:30:47', '2024-08-09 13:30:47'),
(5, 'Screenshot 2024-07-29 203039.png', '23113', 'Ramy', 6, '2024-08-09 13:31:33', '2024-08-09 13:31:33'),
(6, 'Screenshot 2024-07-29 202829.png', '24131', 'Ramy', 7, '2024-08-09 13:32:18', '2024-08-09 13:32:18'),
(7, 'Screenshot 2024-07-29 203246.png', '3542', 'Ramy', 8, '2024-08-09 13:34:29', '2024-08-09 13:34:29'),
(8, 'Screenshot 2024-07-29 203246.png', '2444', 'Ramy', 9, '2024-08-09 13:36:17', '2024-08-09 13:36:17'),
(9, 'Screenshot 2024-07-29 203039.png', '46465', 'Ramy', 10, '2024-08-09 13:36:58', '2024-08-09 13:36:58'),
(10, 'Screenshot 2024-07-29 202829.png', '575', 'Ramy', 11, '2024-08-09 13:37:24', '2024-08-09 13:37:24'),
(11, 'Screenshot 2024-07-29 202923.png', '4646', 'Ramy', 12, '2024-08-09 13:37:58', '2024-08-09 13:37:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(8, '2023_09_21_190517_create_invoice_attachments_table', 1),
(9, '2024_04_26_172531_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'الفواتير', 'web', '2024-07-12 14:56:39', '2024-07-12 14:56:39'),
(2, 'مجمع الفواتير', 'web', '2024-07-12 14:56:39', '2024-07-12 14:56:39'),
(3, 'الفواتير المدفوعة', 'web', '2024-07-12 14:56:39', '2024-07-12 14:56:39'),
(4, 'الفواتير المدفوعة جزئيا', 'web', '2024-07-12 14:56:39', '2024-07-12 14:56:39'),
(5, 'الفواتير الغير مدفوعة', 'web', '2024-07-12 14:56:39', '2024-07-12 14:56:39'),
(6, 'ارشيف الفواتير', 'web', '2024-07-12 14:56:39', '2024-07-12 14:56:39'),
(7, 'التقارير', 'web', '2024-07-12 14:56:39', '2024-07-12 14:56:39'),
(8, 'تقرير الفواتير', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(9, 'تقرير الأقسام والمنتجات', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(10, 'المستخدمين', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(11, 'قائمة المستخدمين', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(12, 'صلاحيات المستخدمين', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(13, 'الأقسام والمنتجات', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(14, 'المنتجات', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(15, 'الاقسام', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(16, 'اضافة فاتورة', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(17, 'حذف الفاتورة', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(18, 'تصدير EXCEL', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(19, 'تغير حالة الدفع', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(20, 'تعديل الفاتورة', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(21, 'ارشفة الفاتورة', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(22, 'طباعةالفاتورة', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(23, 'اضافة مرفق', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(24, 'حذف المرفق', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(25, 'اضافة مستخدم', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(26, 'تعديل مستخدم', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(27, 'حذف مستخدم', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(28, 'عرض صلاحية', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(29, 'اضافة صلاحية', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(30, 'تعديل صلاحية', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(31, 'حذف صلاحية', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(32, 'اضافة منتج', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(33, 'تعديل منتج', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(34, 'حذف منتج', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(35, 'اضافة قسم', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(36, 'تعديل قسم', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(37, 'حذف قسم', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40'),
(38, 'الاشعارات', 'web', '2024-07-12 14:56:40', '2024-07-12 14:56:40');

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `Product_name`, `description`, `section_id`, `created_at`, `updated_at`) VALUES
(4, 'ثصبصب', 'ءبيبلا', 2, '2024-08-09 13:28:44', '2024-08-09 13:28:44'),
(5, 'ببلا', 'بلالا', 2, '2024-08-09 13:28:54', '2024-08-09 13:28:54'),
(6, 'لايبلاي', 'يقلايلا', 3, '2024-08-09 13:29:02', '2024-08-09 13:29:02'),
(7, 'بلايلايلا', 'يلايلا', 3, '2024-08-09 13:29:10', '2024-08-09 13:29:10'),
(8, 'يبلايلايالا', 'يالايا', 4, '2024-08-09 13:29:20', '2024-08-09 13:29:20'),
(9, 'فىبفىقفى', 'فاىبفاى', 4, '2024-08-09 13:29:28', '2024-08-09 13:29:28');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Owner', 'web', '2024-07-12 15:05:45', '2024-07-12 15:05:45'),
(2, 'USER', 'web', '2024-07-12 15:13:10', '2024-07-12 15:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(32, 2),
(33, 1),
(34, 1),
(35, 1),
(35, 2),
(36, 1),
(37, 1),
(38, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section_name`, `description`, `Created_by`, `created_at`, `updated_at`) VALUES
(2, 'بسيسير', 'صبثب', 'Ramy', '2024-08-09 13:28:15', '2024-08-09 13:28:15'),
(3, 'بلاب', 'سقلقل', 'Ramy', '2024-08-09 13:28:21', '2024-08-09 13:28:21'),
(4, 'سقلس', 'سرق', 'Ramy', '2024-08-09 13:28:29', '2024-08-09 13:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `roles_name`, `Status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ramy', 'Aly@mans.com', NULL, '$2y$10$hikE4w4dSfvranfdpxr1TuAcnPn4yhWHbKrP013tLz4UfU2UaVhyS', '[\"Owner\"]', 'مفعل', 'lkpGVT5rAcFmNqk6iuykXTwFlAS22tMU8dkbKqZQhkLeUZGB8n11eALszYvn', '2024-07-12 15:05:45', '2024-07-12 15:05:45'),
(2, 'AZARMO', 'AZARMO@mans.com', NULL, '$2y$10$wdb/ALPF65C6n1vTlc7tF.27yIPDVyc67Q2mMCkC3IbTDlQAlM.hS', '[\"USER\"]', 'مفعل', 'w0Wk21YcKJ1Gq9gJccfrSQBxcq59n5AzeA6fSrBv72SPoqH1pTWUlJfXcF0O', '2024-07-12 15:13:47', '2024-07-12 15:13:47');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
