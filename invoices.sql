-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 27, 2024 at 09:11 AM
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `invoice_Date`, `Due_date`, `product`, `section_id`, `Amount_collection`, `Amount_Commission`, `Discount`, `Value_VAT`, `Rate_VAT`, `Total`, `Status`, `Value_Status`, `note`, `Payment_Date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'sdgd-63', '2024-10-03', '2024-10-17', 'ddh', 1, 44001.00, 9000.00, 0.00, 1260.00, '14%', 10260.00, 'غير مدفوعة', 2, NULL, NULL, NULL, '2024-10-03 09:29:42', '2024-10-03 09:29:42'),
(2, 'sds-963', '2024-10-03', '2024-10-08', 'dfsfd', 2, 36379.00, 6300.00, 0.00, 882.00, '14%', 7182.00, 'مدفوعة جزئيا', 3, NULL, '2024-10-06', NULL, '2024-10-03 09:30:23', '2024-10-03 14:14:13'),
(3, 'ergd-981', '2024-10-03', '2024-10-26', 'sxcxc', 3, 981720.00, 9900.00, 0.00, 495.00, '5%', 10395.00, 'مدفوعة', 1, NULL, '2024-10-17', NULL, '2024-10-03 09:31:13', '2024-10-03 14:14:27');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices_details`
--

INSERT INTO `invoices_details` (`id`, `id_Invoice`, `invoice_number`, `product`, `Section`, `Status`, `Value_Status`, `Payment_Date`, `note`, `user`, `created_at`, `updated_at`) VALUES
(1, 1, 'sdgd-63', 'ddh', '1', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-10-03 09:29:42', '2024-10-03 09:29:42'),
(2, 2, 'sds-963', 'dfsfd', '2', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-10-03 09:30:23', '2024-10-03 09:30:23'),
(3, 3, 'ergd-981', 'sxcxc', '3', 'غير مدفوعة', 2, NULL, NULL, 'Ramy', '2024-10-03 09:31:13', '2024-10-03 09:31:13'),
(4, 2, 'sds-963', 'dfsfd', '2', 'مدفوعة جزئيا', 3, '2024-10-06', NULL, 'Ramy', '2024-10-03 14:14:14', '2024-10-03 14:14:14'),
(5, 3, 'ergd-981', 'sxcxc', '3', 'مدفوعة', 1, '2024-10-17', NULL, 'Ramy', '2024-10-03 14:14:27', '2024-10-03 14:14:27');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_attachments`
--

INSERT INTO `invoice_attachments` (`id`, `file_name`, `invoice_number`, `Created_by`, `invoice_id`, `created_at`, `updated_at`) VALUES
(1, 'Screenshot 2024-08-26 204507.png', 'sdgd-63', 'Ramy', 1, '2024-10-03 09:29:42', '2024-10-03 09:29:42'),
(4, 'Screenshot 2024-08-26 204507.png', 'sds-963', 'Ramy', 2, '2024-10-03 12:25:11', '2024-10-03 12:25:11'),
(3, 'Screenshot 2024-07-29 203039.png', 'ergd-981', 'Ramy', 3, '2024-10-03 09:31:13', '2024-10-03 09:31:13');

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
(10, '2024_08_30_121525_create_notifications_table', 1);

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
(2, 'App\\User', 3);

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
('1ee01bb7-c879-4593-a780-d5f3b25fb7b3', 'App\\Notifications\\Add_invoice_new', 'App\\User', 1, '{\"id\":1,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"Ramy\"}', '2024-10-03 13:44:11', '2024-10-03 09:29:44', '2024-10-03 13:44:11'),
('bf4c3f4c-5497-4342-b4c2-65906fa9c833', 'App\\Notifications\\Add_invoice_new', 'App\\User', 2, '{\"id\":1,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"Ramy\"}', NULL, '2024-10-03 09:29:44', '2024-10-03 09:29:44'),
('103bb3bb-5a30-4b89-9fa1-fb9d66d70b8a', 'App\\Notifications\\Add_invoice_new', 'App\\User', 1, '{\"id\":2,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"Ramy\"}', '2024-10-03 13:44:11', '2024-10-03 09:30:23', '2024-10-03 13:44:11'),
('c97d106c-66e5-4ea6-b717-17f391e22826', 'App\\Notifications\\Add_invoice_new', 'App\\User', 2, '{\"id\":2,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"Ramy\"}', NULL, '2024-10-03 09:30:23', '2024-10-03 09:30:23'),
('16cf4cd2-87d7-4e8a-81be-6009b2913194', 'App\\Notifications\\Add_invoice_new', 'App\\User', 1, '{\"id\":3,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"Ramy\"}', '2024-10-03 13:44:11', '2024-10-03 09:31:13', '2024-10-03 13:44:11'),
('fb7b7810-f4b1-4324-bd61-ae1f405f9620', 'App\\Notifications\\Add_invoice_new', 'App\\User', 2, '{\"id\":3,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"Ramy\"}', NULL, '2024-10-03 09:31:13', '2024-10-03 09:31:13'),
('940d786f-98c7-40ec-8168-dde4f6581633', 'App\\Notifications\\Add_invoice_new', 'App\\User', 1, '{\"id\":4,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"AZARMO\"}', '2024-10-11 15:41:54', '2024-10-11 15:41:33', '2024-10-11 15:41:54'),
('5573bede-fef1-4483-ae14-3cdedf5cab1a', 'App\\Notifications\\Add_invoice_new', 'App\\User', 2, '{\"id\":4,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"AZARMO\"}', NULL, '2024-10-11 15:41:33', '2024-10-11 15:41:33'),
('57c8f7ba-05f5-48b7-8293-4da341b14fb3', 'App\\Notifications\\Add_invoice_new', 'App\\User', 1, '{\"id\":5,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"AZARMO\"}', NULL, '2024-10-11 15:44:25', '2024-10-11 15:44:25'),
('1d86b348-0a74-4516-aa86-dcc82933646a', 'App\\Notifications\\Add_invoice_new', 'App\\User', 2, '{\"id\":5,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"AZARMO\"}', NULL, '2024-10-11 15:44:25', '2024-10-11 15:44:25'),
('7bb32d6b-b3c0-4b3c-bb91-f93c7ea53a6d', 'App\\Notifications\\Add_invoice_new', 'App\\User', 1, '{\"id\":6,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"\\u0631\\u0627\\u0645\\u0649 \\u0639\\u0644\\u0649\"}', NULL, '2024-10-18 13:36:03', '2024-10-18 13:36:03'),
('38419642-3cc2-47fb-93e7-8fe4efa2c0d2', 'App\\Notifications\\Add_invoice_new', 'App\\User', 2, '{\"id\":6,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"\\u0631\\u0627\\u0645\\u0649 \\u0639\\u0644\\u0649\"}', NULL, '2024-10-18 13:36:03', '2024-10-18 13:36:03'),
('a99edce0-1882-4635-a427-3ed1a405361a', 'App\\Notifications\\Add_invoice_new', 'App\\User', 3, '{\"id\":6,\"title\":\" \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"\\u0631\\u0627\\u0645\\u0649 \\u0639\\u0644\\u0649\"}', NULL, '2024-10-18 13:36:03', '2024-10-18 13:36:03');

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
(1, 'الفواتير', 'web', '2024-10-03 06:07:47', '2024-10-03 06:07:47'),
(2, 'مجمع الفواتير', 'web', '2024-10-03 06:07:47', '2024-10-03 06:07:47'),
(3, 'الفواتير المدفوعة', 'web', '2024-10-03 06:07:47', '2024-10-03 06:07:47'),
(4, 'الفواتير المدفوعة جزئيا', 'web', '2024-10-03 06:07:47', '2024-10-03 06:07:47'),
(5, 'الفواتير الغير مدفوعة', 'web', '2024-10-03 06:07:47', '2024-10-03 06:07:47'),
(6, 'ارشيف الفواتير', 'web', '2024-10-03 06:07:47', '2024-10-03 06:07:47'),
(7, 'التقارير', 'web', '2024-10-03 06:07:47', '2024-10-03 06:07:47'),
(8, 'تقرير الفواتير', 'web', '2024-10-03 06:07:47', '2024-10-03 06:07:47'),
(9, 'تقرير الأقسام والمنتجات', 'web', '2024-10-03 06:07:47', '2024-10-03 06:07:47'),
(10, 'المستخدمين', 'web', '2024-10-03 06:07:47', '2024-10-03 06:07:47'),
(11, 'قائمة المستخدمين', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(12, 'صلاحيات المستخدمين', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(13, 'الأقسام والمنتجات', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(14, 'المنتجات', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(15, 'الاقسام', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(16, 'اضافة فاتورة', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(17, 'حذف الفاتورة', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(18, 'تصدير EXCEL', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(19, 'تغير حالة الدفع', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(20, 'تعديل الفاتورة', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(21, 'ارشفة الفاتورة', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(22, 'طباعةالفاتورة', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(23, 'اضافة مرفق', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(24, 'حذف المرفق', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(25, 'اضافة مستخدم', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(26, 'تعديل مستخدم', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(27, 'حذف مستخدم', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(28, 'عرض صلاحية', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(29, 'اضافة صلاحية', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(30, 'تعديل صلاحية', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(31, 'حذف صلاحية', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(32, 'اضافة منتج', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(33, 'تعديل منتج', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(34, 'حذف منتج', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(35, 'اضافة قسم', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(36, 'تعديل قسم', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(37, 'حذف قسم', 'web', '2024-10-03 06:07:48', '2024-10-03 06:07:48'),
(38, 'الاشعارات', 'web', '2024-10-03 06:07:49', '2024-10-03 06:07:49');

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

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `Product_name`, `description`, `section_id`, `created_at`, `updated_at`) VALUES
(2, 'ddh', NULL, 1, '2024-10-03 09:21:16', '2024-10-03 09:21:16'),
(3, 'dfsfd', NULL, 2, '2024-10-03 09:21:26', '2024-10-03 09:21:26'),
(4, 'sxcxc', NULL, 3, '2024-10-03 09:21:35', '2024-10-03 09:21:35');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Owner', 'web', '2024-10-03 06:08:39', '2024-10-03 06:08:39'),
(2, 'User', 'web', '2024-10-03 06:27:48', '2024-10-03 06:27:48');

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
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
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
(33, 1),
(34, 1),
(35, 1),
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
  `section_name` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `Created_by` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section_name`, `description`, `Created_by`, `created_at`, `updated_at`) VALUES
(1, 'dgdrg', NULL, 'Ramy', '2024-10-03 09:17:08', '2024-10-03 09:20:44'),
(2, 'dfdrdh', NULL, 'Ramy', '2024-10-03 09:19:40', '2024-10-03 09:19:40'),
(3, 'xvxfg', NULL, 'Ramy', '2024-10-03 09:20:53', '2024-10-03 09:20:53');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `roles_name`, `Status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ramy', 'Aly@mans.com', NULL, '$2y$10$xxf1MxNiFOtDFF72lQ2QsugRrqRTIpI5xnxGkvSpRxpVwA5hoW3ne', '[\"Owner\"]', 'مفعل', 'rvIuExHlVmEchufddpRDEnMalUROyo6nEx87AM0KBH4WXY3YgM7JcxxjjheB', '2024-10-03 06:08:39', '2024-10-03 06:08:39'),
(2, 'AZARMO', 'AZARMO@mans.com', NULL, '$2y$10$l6vVdsbXARKMrCMRGrF84uUsjtVJ2MWDlySXuko817xJE14wxvjt6', '[\"User\"]', 'مفعل', 'Y5tCgIKGVtmicPC8nz33qvoKrF7BBXtSLunih2eknc5IndRKMQNC7MPvX1rt', '2024-10-03 06:28:42', '2024-10-03 06:28:42'),
(3, 'رامى على', 'Ramy@mans.com', NULL, '$2y$10$pqKdLQsJajzou52o1mqjrudQ/Xp84Tng.Fu2gPJIbolt7n.fWfRqe', '[\"User\"]', 'مفعل', 'UkunZDeocdGFqbcFFJM35cHeAx9CQC98daxwmpUtGaqr4yNSMlHlCqfliZA1', '2024-10-18 13:30:55', '2024-10-18 13:30:55');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
