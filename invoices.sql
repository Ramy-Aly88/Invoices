-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 01, 2024 at 06:57 PM
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
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `invoice_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_Date` date DEFAULT NULL,
  `Due_date` date DEFAULT NULL,
  `product` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_id` bigint UNSIGNED NOT NULL,
  `Amount_collection` decimal(8,2) DEFAULT NULL,
  `Amount_Commission` decimal(8,2) NOT NULL,
  `Discount` decimal(8,2) NOT NULL,
  `Value_VAT` decimal(8,2) NOT NULL,
  `Rate_VAT` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Total` decimal(8,2) NOT NULL,
  `Status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value_Status` int NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `Payment_Date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_section_id_foreign` (`section_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices_details`
--

DROP TABLE IF EXISTS `invoices_details`;
CREATE TABLE IF NOT EXISTS `invoices_details` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_Invoice` bigint UNSIGNED NOT NULL,
  `invoice_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Section` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value_Status` int NOT NULL,
  `Payment_Date` date DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `user` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_details_id_invoice_foreign` (`id_Invoice`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_attachments`
--

DROP TABLE IF EXISTS `invoice_attachments`;
CREATE TABLE IF NOT EXISTS `invoice_attachments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `file_name` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Created_by` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_attachments_invoice_id_foreign` (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2),
(2, 'App\\User', 3),
(4, 'App\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'الفواتير', 'web', '2024-05-17 17:11:39', '2024-05-17 17:11:39'),
(2, 'مجمع الفواتير', 'web', '2024-05-17 17:11:39', '2024-05-17 17:11:39'),
(3, 'الفواتير المدفوعة', 'web', '2024-05-17 17:11:39', '2024-05-17 17:11:39'),
(4, 'الفواتير المدفوعة جزئيا', 'web', '2024-05-17 17:11:39', '2024-05-17 17:11:39'),
(5, 'الفواتير الغير مدفوعة', 'web', '2024-05-17 17:11:39', '2024-05-17 17:11:39'),
(6, 'ارشيف الفواتير', 'web', '2024-05-17 17:11:39', '2024-05-17 17:11:39'),
(7, 'التقارير', 'web', '2024-05-17 17:11:39', '2024-05-17 17:11:39'),
(8, 'تقرير الفواتير', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(9, 'تقرير العملاء', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(10, 'المستخدمين', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(11, 'قائمة المستخدمين', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(12, 'صلاحيات المستخدمين', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(13, 'الأقسام والمنتجات', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(14, 'المنتجات', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(15, 'الاقسام', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(16, 'اضافة فاتورة', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(17, 'حذف الفاتورة', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(18, 'تصدير EXCEL', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(19, 'تغير حالة الدفع', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(20, 'تعديل الفاتورة', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(21, 'ارشفة الفاتورة', 'web', '2024-05-17 17:11:40', '2024-05-17 17:11:40'),
(22, 'طباعةالفاتورة', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(23, 'اضافة مرفق', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(24, 'حذف المرفق', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(25, 'اضافة مستخدم', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(26, 'تعديل مستخدم', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(27, 'حذف مستخدم', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(28, 'عرض صلاحية', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(29, 'اضافة صلاحية', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(30, 'تعديل صلاحية', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(31, 'حذف صلاحية', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(32, 'اضافة منتج', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(33, 'تعديل منتج', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(34, 'حذف منتج', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(35, 'اضافة قسم', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(36, 'تعديل قسم', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(37, 'حذف قسم', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41'),
(38, 'الاشعارات', 'web', '2024-05-17 17:11:41', '2024-05-17 17:11:41');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Product_name` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `section_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_section_id_foreign` (`section_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Owner', 'web', '2024-05-17 17:11:45', '2024-05-17 17:11:45'),
(2, 'USER', 'web', '2024-05-17 17:14:26', '2024-05-17 17:14:26'),
(4, 'لرامى', 'web', '2024-05-25 15:36:31', '2024-05-25 15:36:31');

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
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(6, 1),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(8, 1),
(8, 3),
(8, 4),
(9, 1),
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
(18, 2),
(19, 1),
(20, 1),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(28, 3),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `section_name` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `Created_by` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `roles_name`, `Status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ramy', 'Aly@mans.com', NULL, '$2y$10$jDXnHNY798SnTmKEtqt86.RgaTO9sC3uuHTPl06.7fyx0iq/kL9rG', '[\"Owner\"]', 'مفعل', 'jbHvzSCsIm4V0vZ6hc7mN7VHzgtZk0ZfH2ojym12t8SlQTkOTgZMV7Y7HRNL', '2024-05-17 17:11:45', '2024-05-17 17:11:45'),
(2, 'AZARMO', 'AZARMO@mans.com', NULL, '$2y$10$LviP0eBRqUtor.jrN0QQQeCz8MZg3faXU6t6e6ItdvBEu3L/omwiG', '[\"USER\"]', 'مفعل', 'bKYtzIQDqeNbXsw7MZJyF3QNqswuFrsIdpGZ1TnQFpRSAaLncfrOORggWqUn', '2024-05-17 17:14:54', '2024-05-24 15:51:59'),
(3, 'Heba', 'Heba@mans.com', NULL, '$2y$10$zoD02HMeTYZeVph.07uGNeT/I/APpSOjcp9TI84RHGX/vrjnBjKou', '[\"USER\"]', 'غير مفعل', NULL, '2024-05-24 15:52:43', '2024-05-31 17:27:04'),
(4, 'رامى', 'ra@gmail.com', NULL, '$2y$10$j.wHRzW/YNECZR.h1HjY1O1bT3Up7fXMvG5nW4hT46KJRWrBTTl1a', '[\"\\u0644\\u0631\\u0627\\u0645\\u0649\"]', 'غير مفعل', NULL, '2024-05-24 16:16:32', '2024-05-31 17:26:46');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
