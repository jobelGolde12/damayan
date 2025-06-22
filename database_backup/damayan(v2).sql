-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2025 at 01:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `damayan`
--

-- --------------------------------------------------------

--
-- Table structure for table `assistance_distribution`
--

CREATE TABLE `assistance_distribution` (
  `distribution_id` bigint(20) UNSIGNED NOT NULL,
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `distribution_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary`
--

CREATE TABLE `beneficiary` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `relation` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiary`
--

INSERT INTO `beneficiary` (`id`, `user_id`, `name`, `relation`, `age`, `birth_date`, `created_at`, `updated_at`) VALUES
(3, 1, 'Jobel', 'Father', 45, '2025-06-01', '2025-06-02 06:49:13', '2025-06-02 06:49:13'),
(6, 9, 'Jobel', 'Father', 45, '2025-06-01', '2025-06-05 02:42:58', '2025-06-05 02:42:58'),
(7, 9, 'Lenit', 'Sister', 2, '2025-06-04', '2025-06-05 02:42:58', '2025-06-05 02:42:58');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_jobelgolde12@gmail.com|127.0.0.1', 'i:1;', 1750028803),
('laravel_cache_jobelgolde12@gmail.com|127.0.0.1:timer', 'i:1750028803;', 1750028803),
('laravel_cache_jobelgolde45@gmail.com|127.0.0.1', 'i:1;', 1749884240),
('laravel_cache_jobelgolde45@gmail.com|127.0.0.1:timer', 'i:1749884240;', 1749884240);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contributions`
--

CREATE TABLE `contributions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `collector` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `purok` enum('purok1','purok2','purok3','purok4') DEFAULT NULL,
  `status` enum('paid','not_paid') DEFAULT 'not_paid',
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contributions`
--

INSERT INTO `contributions` (`id`, `member_id`, `collector`, `amount`, `payment_date`, `purok`, `status`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, 100.00, '2025-06-04 19:44:00', NULL, 'not_paid', 1, '2025-06-05 09:44:37', '2025-06-05 09:44:37'),
(2, 6, NULL, 100.00, '2025-06-04 19:46:00', NULL, 'not_paid', 1, '2025-06-05 09:46:19', '2025-06-05 09:46:19'),
(3, 7, 'dfg', 100.00, '2025-06-05 20:59:00', 'purok4', 'paid', 1, '2025-06-06 10:59:18', '2025-06-06 10:59:18'),
(4, 6, 'akla', 100.00, '2025-06-06 08:20:00', 'purok1', 'paid', 1, '2025-06-06 22:21:05', '2025-06-06 22:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `death_reports`
--

CREATE TABLE `death_reports` (
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `reported_by` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `deceased_name` varchar(100) NOT NULL,
  `date_of_death` date NOT NULL,
  `report_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `registration_date` date NOT NULL,
  `purok` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `occupation` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gender` enum('Male','Female','','') NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `first_name`, `last_name`, `address`, `contact_number`, `date_of_birth`, `registration_date`, `purok`, `age`, `middle_name`, `status`, `occupation`, `created_at`, `updated_at`, `gender`, `deleted_at`) VALUES
(1, 'asd', 'asd', 'asda', '434234', '2025-05-31', '2025-05-31', '4', 20250531, 'a', 'active', 'asd', '2025-06-01 02:50:37', '2025-06-05 07:09:01', 'Male', NULL),
(2, 'asd', 'asd', 'asda', '434234', '2025-05-31', '2025-05-31', '4', 20250531, 'a', 'active', 'asd', '2025-06-01 02:52:10', '2025-06-07 23:20:00', 'Male', NULL),
(3, 'asd', 'asd', 'asda', '434234', '2025-05-31', '2025-05-31', '4', 20250531, 'a', '', 'asd', '2025-06-01 02:52:15', '2025-06-01 02:52:15', 'Male', NULL),
(4, 'asd', 'asd', 'asda', '234234', '2025-05-31', '2025-05-31', '3', 20250531, 'a', '', 'asd', '2025-06-01 04:45:49', '2025-06-01 04:45:49', 'Male', NULL),
(6, 'Jobel', 'Golde', 'Bonga, Bulan, Sorsogon', '09347538924', '2004-05-07', '2025-06-01', '3', 21, 'v', '', 'None', '2025-06-02 00:26:25', '2025-06-02 00:26:25', 'Male', NULL),
(7, 'Maryjane', 'Golde', 'Bonga, Bulan, Sorsogon', '09524523433', '1991-03-02', '2025-06-01', '4', 45, 'V', '', 'Kagawad', '2025-06-02 06:08:57', '2025-06-02 06:08:57', 'Male', NULL),
(9, 'asd', 'asd_modified', 'asda', '09123124323', '2025-05-31', '2025-06-04', '4', 20250531, 'a', '', 'asd', '2025-06-05 02:42:58', '2025-06-05 02:42:58', 'Male', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_31_172902_create_members_table', 2),
(5, '2025_05_31_190536_create_members_table', 3),
(6, '2025_05_31_195352_create_beneficiary_table', 4),
(7, '2025_05_31_211307_create_beneficiary_table', 5),
(8, '2025_06_04_194905_create_contributions_table', 6),
(9, '2025_06_06_205059_create_officials_table', 7),
(10, '2025_06_07_002407_add_deleted_at_in_officials_table', 8),
(11, '2025_06_14_010642_add_softdelete_in_users_table', 9),
(12, '2025_06_14_070910_add_foreign_key_in_officialss_table', 10),
(13, '2025_06_14_072534_add_column_in_users_table', 11),
(14, '2025_06_14_080150_add_email_in_officials_table', 12),
(15, '2025_06_21_232407_create_death_reports_table', 13),
(16, '2025_06_21_232720_create_assistance_distribution_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `officials`
--

CREATE TABLE `officials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `term_start` date NOT NULL,
  `term_end` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `officials`
--

INSERT INTO `officials` (`id`, `user_id`, `name`, `email`, `position`, `term_start`, `term_end`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Maryjane v. Golde', NULL, 'secretary', '2025-06-06', '2027-06-06', 1, NULL, '2025-06-07 06:39:46', '2025-06-07 07:20:51'),
(2, NULL, 'Virgie G. Malinao', NULL, 'vise_president', '2025-06-06', '2027-06-06', 1, NULL, '2025-06-07 06:42:51', '2025-06-07 06:42:51'),
(4, NULL, 'dummy official', NULL, 'secretary', '2025-06-07', '2025-06-07', 1, '2025-06-07 21:53:01', '2025-06-07 21:52:48', '2025-06-07 21:53:01'),
(5, NULL, 'java', 'java@gmail.com', 'secretary', '2025-06-14', '2027-06-14', 1, NULL, '2025-06-14 00:05:15', '2025-06-14 00:05:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('a9B8X74EQdTv4qCgGQgSchFlGgrCcZaGup4Bn58X', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoianBVOE1zSjRtNjE3NWJMR0Z4U2sxQ3lLZ3ZGOEtaYVJ0SFNaTnpUUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo1O30=', 1750547422);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Rina Geronimo', 'jobelgolde43@gmail.com', '2025-04-17 10:52:51', '$2y$12$u.SWz91uteDfsudVhf/c1OTZ0X.L8jjvex90QTP39vxVCax7A9mvu', 'admin', NULL, NULL, '2025-06-13 02:41:01', NULL),
(4, 'q', 'q@gmail.com', NULL, '$2y$12$i2KxbTLDBqH8kRsEw/YCD.nNkqwllXgaAvA9ubdB7fSxhTq2YOgAy', 'admin', NULL, '2025-06-13 17:13:08', '2025-06-13 17:13:42', NULL),
(5, 'Jobelle', 'iamjobelle@gmail.com', NULL, '$2y$12$xlii9WcPc081pBhDVsHxPOdIJTpDSlD4ScZ2seouXwOBvBVOdr/Tq', 'collector', NULL, '2025-06-15 04:29:28', '2025-06-21 14:56:46', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assistance_distribution`
--
ALTER TABLE `assistance_distribution`
  ADD PRIMARY KEY (`distribution_id`),
  ADD KEY `assistance_distribution_report_id_foreign` (`report_id`);

--
-- Indexes for table `beneficiary`
--
ALTER TABLE `beneficiary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beneficiary_user_id_foreign` (`user_id`);

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
-- Indexes for table `contributions`
--
ALTER TABLE `contributions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contributions_member_id_foreign` (`member_id`),
  ADD KEY `contributions_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `death_reports`
--
ALTER TABLE `death_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `death_reports_reported_by_foreign` (`reported_by`),
  ADD KEY `death_reports_member_id_foreign` (`member_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `officials`
--
ALTER TABLE `officials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `officials_email_unique` (`email`),
  ADD KEY `officials_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assistance_distribution`
--
ALTER TABLE `assistance_distribution`
  MODIFY `distribution_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beneficiary`
--
ALTER TABLE `beneficiary`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contributions`
--
ALTER TABLE `contributions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `death_reports`
--
ALTER TABLE `death_reports`
  MODIFY `report_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `officials`
--
ALTER TABLE `officials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assistance_distribution`
--
ALTER TABLE `assistance_distribution`
  ADD CONSTRAINT `assistance_distribution_report_id_foreign` FOREIGN KEY (`report_id`) REFERENCES `death_reports` (`report_id`) ON DELETE CASCADE;

--
-- Constraints for table `beneficiary`
--
ALTER TABLE `beneficiary`
  ADD CONSTRAINT `beneficiary_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contributions`
--
ALTER TABLE `contributions`
  ADD CONSTRAINT `contributions_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contributions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `death_reports`
--
ALTER TABLE `death_reports`
  ADD CONSTRAINT `death_reports_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `death_reports_reported_by_foreign` FOREIGN KEY (`reported_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `officials`
--
ALTER TABLE `officials`
  ADD CONSTRAINT `officials_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
