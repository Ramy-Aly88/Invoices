-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 13, 2024 at 07:24 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `invoice_Date`, `Due_date`, `product`, `section_id`, `Amount_collection`, `Amount_Commission`, `Discount`, `Value_VAT`, `Rate_VAT`, `Total`, `Status`, `Value_Status`, `note`, `Payment_Date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(40, 'esg-9531', '2024-09-07', '2024-09-18', 'ببلا', 2, 36000.00, 2700.00, 0.00, 378.00, '14%', 3078.00, 'غير مدفوعة', 2, 'ssfs', NULL, NULL, '2024-09-07 14:46:47', '2024-09-07 14:46:47'),
(27, 'AZ-999', '2024-09-05', '2024-09-18', 'بلايلايلا', 3, 98271.00, 9900.00, 810.00, 1272.60, '14%', 10362.60, 'غير مدفوعة', 2, NULL, NULL, NULL, '2024-09-05 03:10:54', '2024-09-05 03:10:54'),
(16, 'wrwe-898', '2024-08-28', '2024-08-31', 'فىبفىقفى', 4, 313133.00, 24424.00, 2323.00, 1105.05, '5%', 23206.05, 'مدفوعة جزئيا', 3, NULL, '2024-09-05', NULL, '2024-08-28 16:54:40', '2024-09-05 12:03:26'),
(42, 'sads-9', '2024-09-13', '2024-09-27', 'بلايلايلا', 3, 656568.00, 8973.00, 0.00, 448.65, '5%', 9421.65, 'غير مدفوعة', 2, NULL, NULL, NULL, '2024-09-13 16:05:51', '2024-09-13 16:05:51'),
(15, 'ww-5954', '2024-08-28', '2024-08-31', 'ثصبصب', 2, 64616.00, 23311.00, 231.00, 1154.00, '5%', 24234.00, 'مدفوعة', 1, NULL, '2024-09-05', NULL, '2024-08-28 16:53:48', '2024-09-05 12:03:41'),
(41, 'sfs-603', '2024-09-07', '2024-09-11', 'فىبفىقفى', 4, 450000.00, 9000.00, 0.00, 1260.00, '14%', 10260.00, 'غير مدفوعة', 2, 'frwr', NULL, NULL, '2024-09-07 15:00:20', '2024-09-07 15:00:20');

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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices_details`
--

INSERT INTO `invoices_details` (`id`, `id_Invoice`, `invoice_number`, `product`, `Section`, `Status`, `Value_Status`, `Payment_Date`, `note`, `user`, `created_at`, `updated_at`) VALUES
(41, 16, 'wrwe-898', 'فىبفىقفى', '4', 'مدفوعة جزئيا', 3, '2024-09-05', NULL, 'Ramy', '2024-09-05 12:03:26', '2024-09-05 12:03:26'),
(42, 15, 'ww-5954', 'ثصبصب', '2', 'مدفوعة', 1, '2024-09-05', NULL, 'Ramy', '2024-09-05 12:03:41', '2024-09-05 12:03:41'),
(55, 41, 'sfs-603', 'فىبفىقفى', '4', 'غير مدفوعة', 2, NULL, 'frwr', 'Ramy', '2024-09-07 15:00:20', '2024-09-07 15:00:20'),
(56, 42, 'sads-9', 'بلايلايلا', '3', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-09-13 16:05:51', '2024-09-13 16:05:51'),
(54, 40, 'esg-9531', 'ببلا', '2', 'غير مدفوعة', 2, NULL, 'ssfs', 'Ramy', '2024-09-07 14:46:47', '2024-09-07 14:46:47'),
(39, 27, 'AZ-999', 'بلايلايلا', '3', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-09-05 03:10:54', '2024-09-05 03:10:54'),
(28, 16, 'wrwe-898', 'فىبفىقفى', '4', 'مدفوعة', 1, '2024-08-30', NULL, 'Ramy', '2024-08-28 16:54:56', '2024-08-28 16:54:56'),
(25, 15, 'ww-5954', 'ثصبصب', '2', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-08-28 16:53:48', '2024-08-28 16:53:48'),
(26, 15, 'ww-5954', 'ثصبصب', '2', 'مدفوعة جزئيا', 3, '2024-08-29', NULL, 'Ramy', '2024-08-28 16:54:05', '2024-08-28 16:54:05'),
(27, 16, 'wrwe-898', 'فىبفىقفى', '4', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-08-28 16:54:40', '2024-08-28 16:54:40');

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
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_attachments`
--

INSERT INTO `invoice_attachments` (`id`, `file_name`, `invoice_number`, `Created_by`, `invoice_id`, `created_at`, `updated_at`) VALUES
(41, 'Screenshot 2024-08-26 204507.png', 'sads-9', 'Ramy', 42, '2024-09-13 16:05:51', '2024-09-13 16:05:51'),
(39, 'Screenshot 2024-08-26 204507.png', 'esg-9531', 'Ramy', 40, '2024-09-07 14:46:47', '2024-09-07 14:46:47'),
(26, 'Screenshot 2024-07-29 202923.png', 'AZ-999', 'Ramy', 27, '2024-09-05 03:10:54', '2024-09-05 03:10:54'),
(40, 'Screenshot 2024-07-29 203246.png', 'sfs-603', 'Ramy', 41, '2024-09-07 15:00:20', '2024-09-07 15:00:20'),
(15, 'Screenshot 2024-07-29 203317.png', 'wrwe-898', 'Ramy', 16, '2024-08-28 16:54:40', '2024-08-28 16:54:40'),
(14, 'Screenshot 2024-07-29 203039.png', 'ww-5954', 'Ramy', 15, '2024-08-28 16:53:48', '2024-08-28 16:53:48');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(9, '2024_04_26_172531_create_permission_tables', 1),
(10, '2024_08_30_121525_create_notifications_table', 2);

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
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('83eed5ca-4e97-481b-9c32-76e92a345481', 'App\\Notifications\\Add_invoice_new', 'App\\User', 1, '{\"id\":42,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"Ramy\"}', NULL, '2024-09-13 16:05:53', '2024-09-13 16:05:53'),
('a096090c-efa0-4357-be8e-c294d3b208cb', 'App\\Notifications\\Add_invoice_new', 'App\\User', 2, '{\"id\":42,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"Ramy\"}', NULL, '2024-09-13 16:05:53', '2024-09-13 16:05:53');

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
(1, 'Ramy', 'Aly@mans.com', NULL, '$2y$10$hikE4w4dSfvranfdpxr1TuAcnPn4yhWHbKrP013tLz4UfU2UaVhyS', '[\"Owner\"]', 'مفعل', 'MhjaOFnDm0IY0l0iKQ0rj7aPbmX6hpKiBB3YmShV2LT4e8fWpRebDSK1IgMQ', '2024-07-12 15:05:45', '2024-07-12 15:05:45'),
(2, 'AZARMO', 'AZARMO@mans.com', NULL, '$2y$10$wdb/ALPF65C6n1vTlc7tF.27yIPDVyc67Q2mMCkC3IbTDlQAlM.hS', '[\"USER\"]', 'مفعل', 'w0Wk21YcKJ1Gq9gJccfrSQBxcq59n5AzeA6fSrBv72SPoqH1pTWUlJfXcF0O', '2024-07-12 15:13:47', '2024-07-12 15:13:47');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
