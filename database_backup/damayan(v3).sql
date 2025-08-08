-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2025 at 02:07 AM
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
(8, 10, 'Mellie Joy G Arevalo', 'Spouse', 39, '1986-06-04', NULL, NULL),
(9, 10, 'Chim Chim Gotis', 'Daughter', 20, '2005-07-24', NULL, NULL),
(10, 11, 'Marjorie Gotis', 'Spouse', 48, '1977-06-04', NULL, NULL),
(11, 11, 'Ayessa Marie Gotis', 'Daughter', 25, '2000-04-14', NULL, NULL),
(12, 11, 'Alexander Akon Gotis', 'Son', 22, '2003-01-12', NULL, NULL),
(13, 12, 'Conchita R. Gotis', 'Spouse', 50, '1975-09-18', NULL, NULL),
(14, 12, 'Abegail R. Gotis', 'Daughter', 30, '1995-08-28', NULL, NULL),
(15, 12, 'Charlen R. Gotis', 'Daughter', 25, '2000-04-18', NULL, NULL),
(16, 14, 'Aileen J. Gotis', 'Spouse', 49, '1976-06-04', NULL, NULL),
(17, 14, 'Ar-lyn J. Gotis', 'Daughter', 30, '1995-07-24', NULL, NULL),
(18, 16, 'Medina A. Gisalan', 'Daughter', 30, '1995-02-04', NULL, NULL),
(19, 16, 'Meldave A. Gisalan', 'Daughter', 30, '1995-07-30', NULL, NULL),
(20, 16, 'Jimboy A. Gisalan', 'Son', 30, '1995-09-04', NULL, NULL),
(21, 17, 'Rowena Ambalong Cid', 'Spouse', 45, '1980-06-04', NULL, NULL),
(22, 17, 'Rizza Ambalong Cid', 'Daughter', 25, '2000-06-04', NULL, NULL),
(23, 17, 'Rendel Ambalong Cid', 'Son', 24, '2001-06-04', NULL, NULL),
(24, 18, 'Melanie Guna Armenta', 'Daughter', 30, '1995-06-04', NULL, NULL),
(25, 18, 'Merlisa R. Guna', 'Daughter', 25, '2000-06-04', NULL, NULL),
(26, 18, 'Andrea G. Armenta', 'Daughter', 29, '1996-06-04', NULL, NULL),
(27, 19, 'Maribel Guna', 'Spouse', 45, '1980-06-04', NULL, NULL),
(28, 19, 'Archie Guna', 'Son', 25, '2000-06-04', NULL, NULL),
(29, 19, 'Alisha Guna', 'Daughter', 22, '2003-06-04', NULL, NULL),
(30, 20, 'Rogelio G. Miranda Jr.', 'Son', 22, '2003-12-24', NULL, NULL),
(31, 20, 'Mark ryan G. Miranda', 'Son', 23, '2002-07-14', NULL, NULL),
(32, 22, 'Enrique B. Revilla', 'Son', 22, '2003-01-03', NULL, NULL),
(33, 22, 'Erica B. Revilla', 'Daughter', 23, '2002-06-09', NULL, NULL),
(34, 22, 'Leslie B. Revilla', 'Daughter', 24, '2001-05-04', NULL, NULL),
(35, 23, 'Cristine Jane R. Guna', 'Spouse', 45, '1980-04-14', NULL, NULL),
(36, 23, 'Jaira R. Guna', 'Daughter', 22, '2003-05-01', NULL, NULL),
(37, 23, 'Jath R. Guna', 'Son', 25, '2000-06-14', NULL, NULL),
(38, 24, 'Nadia Balansay Bermillo', 'Sibling', 45, '1980-09-05', NULL, NULL),
(39, 25, 'Zeny Gotis Balansay', 'Daughter', 30, '1995-06-24', NULL, NULL),
(40, 25, 'Christine Joy Gotis Balansay', 'Daughter', 22, '2003-07-08', NULL, NULL),
(41, 26, 'Erma Gotis Geraldino', 'Spouse', 45, '1980-06-04', NULL, NULL),
(42, 26, 'Livirjoy Gotis Geraldino', 'Daughter', 22, '2003-06-04', NULL, NULL),
(43, 26, 'Jiecer Gotis Geraldino', 'Son', 23, '2002-06-18', NULL, NULL),
(44, 28, 'Leony D. Gotis', 'Spouse', 44, '1981-11-14', NULL, NULL),
(45, 28, 'Jay D. Gotis', 'Son', 22, '2003-07-24', NULL, NULL),
(46, 30, 'Jovelyn Tolete David', 'Spouse', 44, '1981-01-06', NULL, NULL),
(47, 30, 'Mary Grace T. David', 'Daughter', 22, '2003-08-28', NULL, NULL),
(48, 30, 'Ashley Nicole T. David', 'Daughter', 25, '2000-05-25', NULL, NULL),
(49, 31, 'Leonista Endaya Estidona', 'Spouse', 45, '1980-06-14', NULL, NULL),
(50, 31, 'Mark B. Zacarias', 'Son', 22, '2003-01-07', NULL, NULL),
(51, 31, 'Kenjie E. Zacarias', 'Son', 23, '2002-04-14', NULL, NULL),
(52, 32, 'Leonista Endaya Estidona', 'Spouse', 45, '1980-06-14', NULL, NULL),
(53, 32, 'Mark B. Zacarias', 'Son', 22, '2003-01-07', NULL, NULL),
(54, 32, 'Kenjie E. Zacarias', 'Son', 23, '2002-04-14', NULL, NULL),
(55, 33, 'Lailanie B. Zacarias', 'Daughter', 25, '2000-07-06', NULL, NULL),
(56, 33, 'Joanafe B. Zacarias', 'Daughter', 22, '2003-06-09', NULL, NULL),
(57, 33, 'Ambher Zacarias', 'Daughter', 23, '2002-06-07', NULL, NULL),
(58, 35, 'Enan G. Canale', 'Spouse', 45, '1980-05-09', NULL, NULL),
(59, 35, 'Mary-Ann Canale', 'Daughter', 22, '2003-02-19', NULL, NULL),
(60, 37, 'Janeth B. Gernale', 'Spouse', 45, '1980-09-30', NULL, NULL),
(61, 37, 'Erica B. Gernale', 'Daughter', 22, '2003-10-05', NULL, NULL),
(62, 38, 'Pura Bejerano Vargas', 'Spouse', 45, '1980-05-05', NULL, NULL),
(63, 38, 'Allan Bejerano Vargas', 'Daughter', 22, '2003-10-24', NULL, NULL),
(64, 39, 'Generose Gotis Geraldino', 'Spouse', 45, '1980-04-05', NULL, NULL),
(65, 39, 'Julie Gotis Geraldino', 'Daughter', 22, '2003-12-04', NULL, NULL),
(66, 41, 'Meycailla Gestiada', 'Spouse', 45, '1980-06-30', NULL, NULL),
(67, 41, 'Cairen G. Golde', 'Daughter', 22, '2003-09-15', NULL, NULL),
(68, 41, 'Relan G. Golde', 'Son', 23, '2002-01-05', NULL, NULL),
(69, 42, 'Princess Venus Golde Almodiel', 'Spouse', 45, '1980-05-31', NULL, NULL),
(70, 45, 'Jowey Patiño Malisa', 'Spouse', 45, '1980-06-24', NULL, NULL),
(71, 45, 'John Louie Patiño Malisa', 'Son', 22, '2003-07-14', NULL, NULL),
(72, 45, 'Kenneth Patiño Malisa', 'Son', 23, '2002-06-09', NULL, NULL),
(73, 46, 'EJ Andaya Gotis', 'Son', 23, '2002-05-14', NULL, NULL),
(74, 46, 'Elyn Andaya Gotis', 'Daughter', 22, '2003-10-04', NULL, NULL),
(75, 47, 'Joel L. Perolino', 'Spouse', 45, '1980-06-18', NULL, NULL),
(76, 47, 'Janice A. Perolino', 'Daughter', 22, '2003-07-17', NULL, NULL),
(77, 48, 'Maricris Being', 'Spouse', 45, '1980-09-09', NULL, NULL),
(78, 48, 'Mark John Being', 'Son', 22, '2003-12-04', NULL, NULL),
(79, 48, 'Jams Axel Being', 'Son', 23, '2002-07-16', NULL, NULL),
(80, 49, 'Ronie Benig Gestiada', 'Spouse', 45, '1980-06-04', NULL, NULL),
(81, 49, 'Rose Benig Gestiada', 'Daughter', 22, '2003-01-04', NULL, NULL),
(82, 53, 'Lyra Hibe Gipa Bermillo', 'Spouse', 45, '1980-06-04', NULL, NULL),
(83, 55, 'Vidalyn Benig', 'Sibling', 35, '1990-06-11', NULL, NULL),
(84, 60, 'John Jovy L. Gotis', 'Son', 22, '2003-06-05', NULL, NULL),
(85, 64, 'Herminia Gotis', 'Spouse', 45, '1980-06-04', NULL, NULL),
(86, 65, 'Vicitacion G. Gisalan', 'Spouse', 45, '1980-06-04', NULL, NULL),
(87, 66, 'Elsie Paz', 'Spouse', 30, '1995-06-04', '2025-07-20 08:16:37', '2025-07-20 08:16:37'),
(88, 66, 'Prince Gian Gotis', 'Son', 21, '2004-03-03', '2025-07-20 08:16:37', '2025-07-20 08:16:37'),
(89, 66, 'Empres Gotis', 'Daughter', 22, '2003-05-21', '2025-07-20 08:16:37', '2025-07-20 08:16:37'),
(90, 67, 'Rodel Villiamor', 'Spouse', 51, '1973-09-22', '2025-07-20 08:17:42', '2025-07-20 08:17:42'),
(91, 67, 'Adrian Gotis', 'Son', 29, '1996-04-02', '2025-07-20 08:17:42', '2025-07-20 08:17:42'),
(92, 67, 'Adnon Gotis', 'Son', 27, '1999-05-05', '2025-07-20 08:17:42', '2025-07-20 08:17:42'),
(93, 67, 'Andrian Gotis', 'Son', 25, '2001-01-25', '2025-07-20 08:17:42', '2025-07-20 08:17:42'),
(94, 68, 'Mary Joy A. Estolonio', 'Spouse', 37, '1988-07-30', '2025-07-20 08:18:24', '2025-07-20 08:18:24'),
(95, 68, 'Jilian E. Birata', 'Daughter', 18, '2007-12-02', '2025-07-20 08:18:24', '2025-07-20 08:18:24'),
(96, 68, 'Crisanta E. Birata', 'Daughter', 17, '2008-05-01', '2025-07-20 08:18:24', '2025-07-20 08:18:24'),
(97, 68, 'Romel E. Birata', 'Son', 15, '2010-03-17', '2025-07-20 08:18:24', '2025-07-20 08:18:24'),
(98, 69, 'Aillen G. Gliponeo', 'Spouse', 37, '1988-11-25', '2025-07-20 08:19:13', '2025-07-20 08:19:13'),
(99, 69, 'Alexandra Masdo', 'Daughter', 18, '2007-05-05', '2025-07-20 08:19:13', '2025-07-20 08:19:13'),
(100, 69, 'Aldren Masdo', 'Son', 15, '2010-07-19', '2025-07-20 08:19:13', '2025-07-20 08:19:13'),
(101, 69, 'Alegrian Masdo', 'Son', 10, '2015-05-30', '2025-07-20 08:19:13', '2025-07-20 08:19:13'),
(102, 70, 'Denalyn V. Gimoro', 'Sibling', 21, '2003-10-01', '2025-07-20 08:19:44', '2025-07-20 08:19:44'),
(103, 71, 'Melva C. Delariarte', 'Daughter', 46, '1979-06-30', '2025-07-20 08:20:27', '2025-07-20 08:20:27'),
(104, 71, 'Joenard C. Delariarte', 'Son', 45, '1980-01-25', '2025-07-20 08:20:27', '2025-07-20 08:20:27'),
(105, 71, 'Jeric C. Delariarte', 'Son', 40, '1985-02-20', '2025-07-20 08:20:27', '2025-07-20 08:20:27'),
(106, 72, 'Joel R. Delariarte', 'Spouse', 65, '1960-11-29', '2025-07-20 08:21:09', '2025-07-20 08:21:09'),
(107, 73, 'Analyn B. Delos Reyes', 'Spouse', 41, '1984-05-02', '2025-07-20 08:22:12', '2025-07-20 08:22:12'),
(108, 73, 'Clarince D. Estolonio', 'Son', 20, '2005-10-20', '2025-07-20 08:22:12', '2025-07-20 08:22:12'),
(109, 73, 'Clarisse D. Estolonio', 'Daughter', 18, '2007-12-30', '2025-07-20 08:22:12', '2025-07-20 08:22:12'),
(110, 73, 'Nash D. Estolonio', 'Son', 19, '2006-04-24', '2025-07-20 08:22:12', '2025-07-20 08:22:12'),
(111, 74, 'Jonalyn G. Masdo', 'Daughter', 20, '2005-08-09', '2025-07-20 08:22:43', '2025-07-20 08:22:43'),
(112, 74, 'Pauline G. Masdo', 'Daughter', 18, '2007-11-14', '2025-07-20 08:22:43', '2025-07-20 08:22:43'),
(113, 75, 'Marivic F. Morilla', 'Spouse', 35, '1990-11-10', '2025-07-20 08:23:29', '2025-07-20 08:23:29'),
(114, 75, 'Jhon Mark Jamolin', 'Son', 16, '2009-02-14', '2025-07-20 08:23:29', '2025-07-20 08:23:29'),
(115, 76, 'Virginia P. Gotis', 'Spouse', 50, '1975-11-21', '2025-07-20 08:24:24', '2025-07-20 08:24:24'),
(116, 76, 'Azaril P. Gotis', 'Son', 30, '1995-05-05', '2025-07-20 08:24:24', '2025-07-20 08:24:24'),
(117, 76, 'Adamson P. Gotis', 'Son', 22, '2003-07-30', '2025-07-20 08:24:24', '2025-07-20 08:24:24'),
(118, 76, 'Gypsy P. Gotis', 'Son', 25, '2000-09-05', '2025-07-20 08:24:24', '2025-07-20 08:24:24'),
(119, 76, 'Roldan P. Gotis', 'Son', 20, '2005-08-29', '2025-07-20 08:24:24', '2025-07-20 08:24:24'),
(120, 76, 'Nathaniel P. Gotis', 'Son', 15, '2010-11-20', '2025-07-20 08:24:24', '2025-07-20 08:24:24'),
(121, 77, 'Delia Z. Gliban', 'Daughter', 36, '1989-12-12', '2025-07-20 08:25:02', '2025-07-20 08:25:02'),
(122, 77, 'Jan Albert E. Gliban', 'Son', 30, '1995-01-26', '2025-07-20 08:25:02', '2025-07-20 08:25:02'),
(123, 78, 'Irma G. Delariarte', 'Daughter', 25, '2000-06-03', '2025-07-20 08:25:40', '2025-07-20 08:25:40'),
(124, 78, 'Ernesto G. Delariarte', 'Son', 24, '2001-05-30', '2025-07-20 08:25:40', '2025-07-20 08:25:40'),
(125, 78, 'Erold G. Delariarte', 'Son', 20, '2005-07-20', '2025-07-20 08:25:40', '2025-07-20 08:25:40'),
(126, 79, 'Kenchin Tan', 'Sibling', 39, '1986-12-18', '2025-07-20 08:26:21', '2025-07-20 08:26:21'),
(127, 79, 'Ashlie Tan', 'Spouse', 38, '1987-04-25', '2025-07-20 08:26:21', '2025-07-20 08:26:21'),
(128, 79, 'Jakeun Tan', 'Son', 20, '2005-03-14', '2025-07-20 08:26:21', '2025-07-20 08:26:21'),
(129, 79, 'Missy Tan', 'Daughter', 18, '2007-07-29', '2025-07-20 08:26:21', '2025-07-20 08:26:21'),
(130, 80, 'CJ G. Gotis', 'Spouse', 45, '1975-04-30', '2025-07-20 08:26:54', '2025-07-20 08:26:54'),
(131, 80, 'Mereva G. Gotis', 'Daughter', 25, '2000-05-05', '2025-07-20 08:26:54', '2025-07-20 08:26:54'),
(132, 80, 'Ofra G. Gotis', 'Daughter', 22, '2003-07-20', '2025-07-20 08:26:54', '2025-07-20 08:26:54'),
(133, 81, 'Analyn Gliban', 'Spouse', 55, '1970-03-19', '2025-07-20 08:27:31', '2025-07-20 08:27:31'),
(134, 81, 'Ervin Gliban', 'Son', 30, '1995-05-30', '2025-07-20 08:27:31', '2025-07-20 08:27:31'),
(135, 81, 'Alyanna Gliban', 'Daughter', 28, '1997-06-03', '2025-07-20 08:27:31', '2025-07-20 08:27:31'),
(136, 82, 'Gerry Gliban', 'Son', 62, '1963-05-21', '2025-07-20 08:28:03', '2025-07-20 08:28:03'),
(137, 82, 'Precious Prinzessin Gliban', 'Daughter', 67, '1958-09-23', '2025-07-20 08:28:03', '2025-07-20 08:28:03'),
(138, 83, 'John Renald Hamor', 'Spouse', 55, '1970-04-01', '2025-07-20 08:28:43', '2025-07-20 08:28:43'),
(139, 83, 'Kryssa Mae Hamor', 'Daughter', 30, '1995-09-19', '2025-07-20 08:28:43', '2025-07-20 08:28:43'),
(140, 84, 'Joan B. Gliban', 'Spouse', 45, '1980-02-19', '2025-07-20 08:29:25', '2025-07-20 08:29:25'),
(141, 84, 'Trisha Mae Bautista', 'Daughter', 15, '2010-05-03', '2025-07-20 08:29:25', '2025-07-20 08:29:25'),
(142, 84, 'Trexie Mae B. Gliban', 'Daughter', 13, '2012-03-11', '2025-07-20 08:29:25', '2025-07-20 08:29:25'),
(143, 84, 'Trishtal Mae B. Gliban', 'Daughter', 13, '2012-03-11', '2025-07-20 08:29:25', '2025-07-20 08:29:25'),
(144, 85, 'Victiria G. Jamolin', 'Spouse', 60, '1965-06-01', '2025-07-20 08:29:58', '2025-07-20 08:29:58'),
(145, 85, 'Jegar G. Jamolin', 'Son', 30, '1995-05-18', '2025-07-20 08:29:58', '2025-07-20 08:29:58'),
(146, 86, 'Noime B. Estolonio', 'Spouse', 45, '1980-07-20', '2025-07-20 08:38:47', '2025-07-20 08:38:47'),
(147, 86, 'Angelo B. Estolonio', 'Son', 27, '1998-05-18', '2025-07-20 08:38:47', '2025-07-20 08:38:47'),
(148, 86, 'Ariane Mae B. Estolonio', 'Daughter', 22, '2003-05-18', '2025-07-20 08:38:47', '2025-07-20 08:38:47'),
(149, 87, 'Edloin G. Tancueco', 'Spouse', 45, '1980-07-18', '2025-07-20 08:39:19', '2025-07-20 08:39:19'),
(150, 87, 'Grant G. Tancueco', 'Son', 20, '2005-05-18', '2025-07-20 08:39:19', '2025-07-20 08:39:19'),
(151, 87, 'Lucas G. Tancueco', 'Son', 15, '2010-05-30', '2025-07-20 08:39:19', '2025-07-20 08:39:19'),
(152, 88, 'Eliza G. Gleban', 'Spouse', 45, '1980-04-18', '2025-07-20 08:39:59', '2025-07-20 08:39:59'),
(153, 88, 'Annaliza G. Gleban', 'Daughter', 25, '2000-12-18', '2025-07-20 08:39:59', '2025-07-20 08:39:59'),
(154, 88, 'Gunther G. Gleban', 'Son', 20, '2005-05-18', '2025-07-20 08:39:59', '2025-07-20 08:39:59'),
(155, 89, 'Joel R. Delariarte', 'Spouse', 65, '1960-05-01', '2025-07-20 08:40:49', '2025-07-20 08:40:49'),
(156, 90, 'Eva G. Baloloy', 'Spouse', 35, '1990-05-18', '2025-07-20 08:41:26', '2025-07-20 08:41:26'),
(157, 90, 'John Lloyd G. Baloloy', 'Son', 15, '2010-05-18', '2025-07-20 08:41:26', '2025-07-20 08:41:26'),
(158, 90, 'Alwin G. Baloloy', 'Son', 10, '2015-01-30', '2025-07-20 08:41:26', '2025-07-20 08:41:26'),
(159, 90, 'Shakkira G. Baloloy', 'Daughter', 9, '2016-02-18', '2025-07-20 08:41:26', '2025-07-20 08:41:26'),
(160, 91, 'Benita B. Gotis', 'Spouse', 67, '1958-05-30', '2025-07-20 08:42:11', '2025-07-20 08:42:11'),
(161, 91, 'Haydee B. Gotis', 'Daughter', 40, '1985-10-18', '2025-07-20 08:42:11', '2025-07-20 08:42:11'),
(162, 91, 'Noel B. Gotis', 'Son', 38, '1987-05-18', '2025-07-20 08:42:11', '2025-07-20 08:42:11'),
(163, 91, 'Jovelyn B. Gotis', 'Daughter', 35, '1990-05-04', '2025-07-20 08:42:11', '2025-07-20 08:42:11'),
(164, 92, 'Sharon B. Canale', 'Sibling', 40, '1985-05-18', '2025-07-20 08:42:44', '2025-07-20 08:42:44'),
(165, 92, 'Andrea B. Canale', 'Sibling', 35, '1990-06-08', '2025-07-20 08:42:44', '2025-07-20 08:42:44'),
(166, 92, 'Andro B. Canale', 'Son', 30, '1995-07-01', '2025-07-20 08:42:44', '2025-07-20 08:42:44'),
(167, 93, 'Rowena S. Elesterio', 'Spouse', 45, '1980-09-20', '2025-07-20 08:43:14', '2025-07-20 08:43:14'),
(168, 93, 'Dino E. Masdo', 'Son', 25, '2000-01-25', '2025-07-20 08:43:14', '2025-07-20 08:43:14'),
(169, 94, 'Jenny H. Hila', 'Spouse', 30, '1995-04-30', '2025-07-20 08:44:02', '2025-07-20 08:44:02'),
(170, 94, 'Jenniel H. Gotis', 'Daughter', 10, '2015-06-25', '2025-07-20 08:44:02', '2025-07-20 08:44:02'),
(171, 94, 'Zheilira Aikhaa H. Gotis', 'Daughter', 9, '2016-05-18', '2025-07-20 08:44:02', '2025-07-20 08:44:02'),
(172, 95, 'Eden A. Estolonio', 'Daughter', 40, '1985-07-19', '2025-07-20 08:44:35', '2025-07-20 08:44:35'),
(173, 95, 'Clenton A. Estolonio', 'Son', 39, '1986-11-03', '2025-07-20 08:44:35', '2025-07-20 08:44:35'),
(174, 95, 'Angel Vanness A. Estolonio', 'Daughter', 38, '1987-01-16', '2025-07-20 08:44:35', '2025-07-20 08:44:35'),
(175, 96, 'Nerissa A. Estolonio', 'Spouse', 70, '1955-10-18', '2025-07-20 08:45:39', '2025-07-20 08:45:39'),
(176, 97, 'Enan G. Canale', 'Spouse', 45, '1980-05-09', NULL, NULL),
(177, 97, 'Mary-Ann Canale', 'Daughter', 22, '2003-02-19', NULL, NULL),
(178, 98, 'Rolando C. Golpeo', 'Spouse', 55, '1970-07-10', NULL, NULL),
(179, 98, 'Cherry V. Gotis', 'Daughter', 35, '1990-07-01', NULL, NULL),
(180, 99, 'Louroes E. Agnote', 'Sibling', 48, '1977-06-11', NULL, NULL),
(181, 99, 'Christine E. Agnote', 'Daughter', 30, '1995-08-10', NULL, NULL),
(182, 99, 'Gloria H. Villanueva', 'Daughter', 29, '1996-07-10', NULL, NULL),
(183, 100, 'Milagros A. Bautista', 'Spouse', 60, '1965-06-18', NULL, NULL),
(184, 100, 'Rommel A. Bautista', 'Son', 35, '1990-07-14', NULL, NULL),
(185, 100, 'Rumalyn A. Bautista', 'Daughter', 33, '1992-08-10', NULL, NULL),
(186, 100, 'Rufa May A. Bautista', 'Daughter', 30, '1995-09-11', NULL, NULL),
(187, 101, 'Jinkee Alig', 'Daughter', 35, '1990-07-09', NULL, NULL),
(188, 101, 'Joshua Alig', 'Son', 34, '1991-07-17', NULL, NULL),
(189, 101, 'Kenn Alig', 'Son', 33, '1992-07-11', NULL, NULL),
(190, 101, 'Regie Alig', 'Son', 32, '1993-06-05', NULL, NULL),
(191, 102, 'Sarina G. Delariarte', 'Spouse', 40, '1985-07-10', NULL, NULL),
(192, 103, 'Shalymar Gimoro', 'Spouse', 45, '1980-07-10', NULL, NULL),
(193, 103, 'Mary Ann G. Balida', 'Daughter', 25, '2000-06-10', NULL, NULL),
(194, 103, 'Maricar G. Balida', 'Daughter', 22, '2003-07-10', NULL, NULL),
(195, 104, 'Jhon Renz A. Estolonio', 'Sibling', 35, '1990-02-10', NULL, NULL),
(196, 105, 'Unknown', 'Spouse', 40, '1985-11-03', NULL, NULL),
(197, 105, 'Arjean B. Juta', 'Sibling', 20, '2005-07-15', NULL, NULL),
(198, 106, 'Jetecia Gimoro', 'Spouse', 70, '1955-12-10', NULL, NULL),
(199, 106, 'Reymar Gimoro', 'Son', 45, '1980-01-10', NULL, NULL),
(200, 106, 'Joery Gimoro', 'Son', 40, '1985-07-10', NULL, NULL),
(201, 107, 'Jessica A. Gimoro', 'Spouse', 45, '1980-10-10', NULL, NULL),
(202, 107, 'Ara Joy A. Gimoro', 'Daughter', 25, '2000-05-10', NULL, NULL),
(203, 107, 'Arjhun A. Gimoro', 'Son', 24, '2001-08-10', NULL, NULL),
(204, 109, 'Arles G. Gotis', 'Son', 60, '1965-06-10', NULL, NULL),
(205, 109, 'Lysa G. Gotis', 'Daughter', 59, '1966-07-10', NULL, NULL),
(209, 110, 'Rodolfo E. Juta', 'Son', 35, '1990-07-10', NULL, NULL),
(210, 110, 'Mary Rose M. Juta', 'Sibling', 65, '1960-07-20', NULL, NULL),
(211, 110, 'Nico M. Juta', 'Sibling', 64, '1961-07-30', NULL, NULL),
(212, 110, 'Darrel M. Juta', 'Sibling', 62, '1963-07-01', NULL, NULL),
(213, 110, 'Bobby M. Juta', 'Sibling', 61, '1964-07-25', NULL, NULL),
(214, 111, 'Roberto P. Geraldino', 'Spouse', 55, '1970-08-10', NULL, NULL),
(215, 111, 'Roxy D. Portento', 'Daughter', 30, '1995-09-25', NULL, NULL),
(216, 111, 'Zam D. Geraldino', 'Daughter', 25, '2000-08-04', NULL, NULL),
(217, 112, 'Sanoy B. Gotis', 'Spouse', 35, '1990-07-20', NULL, NULL),
(218, 112, 'Cheska J. Gotis', 'Daughter', 8, '2017-05-03', NULL, NULL),
(219, 112, 'Yohan J. Gotis', 'Son', 7, '2018-07-10', NULL, NULL),
(220, 112, 'Jomarie J. Gotis', 'Son', 6, '2019-07-20', NULL, NULL),
(221, 113, 'Nimfa B. Gotis', 'Sibling', 60, '1965-01-11', NULL, NULL),
(222, 113, 'Domingo G. Gotis Jr.', 'Son', 35, '1990-06-15', NULL, NULL),
(223, 114, 'Shiela G. Plazo', 'Sibling', 35, '1990-09-10', NULL, NULL),
(224, 114, 'Princess Yesha G. Plazo', 'Sibling', 35, '1990-08-01', NULL, NULL),
(225, 115, 'Carl Prince Gotis', 'Spouse', 35, '1990-07-10', NULL, NULL);

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
('laravel_cache_jobelgolde12@gmail.com|127.0.0.1', 'i:1;', 1751535308),
('laravel_cache_jobelgolde12@gmail.com|127.0.0.1:timer', 'i:1751535308;', 1751535308),
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status2` enum('married','single','divorced','widowed') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `first_name`, `last_name`, `address`, `contact_number`, `date_of_birth`, `registration_date`, `purok`, `age`, `middle_name`, `status`, `occupation`, `created_at`, `updated_at`, `gender`, `deleted_at`, `status2`) VALUES
(10, 'Roberto', 'Arevalo', '', '09776326447', '1986-12-30', '2025-07-19', 'Purok 1', 39, 'Globasa', 'active', 'Fishermen', NULL, NULL, 'Male', NULL, 'married'),
(11, 'Alvin', 'Gotis', '', '09776326447', '1977-05-10', '2025-07-19', 'Purok 1', 48, 'Relova', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'married'),
(12, 'Ariel', 'Gotis', '', '09776326447', '1975-04-30', '2025-07-19', 'Purok 1', 50, 'Gimoro', 'active', 'Tricycle Driver', NULL, NULL, 'Male', NULL, 'married'),
(13, 'Jocelyn', 'Gimao', '', '', '1952-05-15', '2025-07-19', 'Purok 1', 73, 'Rama', 'active', '', NULL, NULL, 'Female', NULL, 'widowed'),
(14, 'Arnol', 'Gotis', '', '09776326447', '1976-08-14', '2025-07-19', 'Purok 1', 49, 'Gimoro', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'married'),
(15, 'Vicitacion', 'Gisalan', '', '', '1950-09-21', '2025-07-19', 'Purok 1', 75, 'Gotis', 'active', '', NULL, NULL, 'Male', NULL, 'widowed'),
(16, 'Michael', 'Gisalan', '', '09776326447', '1972-01-21', '2025-07-19', 'Purok 1', 53, 'Gotis', 'active', 'Housewife', NULL, NULL, 'Male', NULL, 'widowed'),
(17, 'Rene', 'Cid', '', '09776326447', '1980-11-24', '2025-07-20', 'Purok 1', 45, 'Gotis', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'married'),
(18, 'Lily', 'Guna', '', '09776326447', '1970-07-12', '2025-07-20', 'Purok 1', 55, 'Relova', 'active', 'Housewife', NULL, NULL, 'Female', NULL, 'widowed'),
(19, 'Marlon', 'Guna', '', '09776326447', '1980-09-01', '2025-07-20', 'Purok 1', 45, 'Relova', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'married'),
(20, 'Marilyn', 'Miranda', '', '09776326447', '1980-08-11', '2025-07-20', 'Purok 1', 45, 'Guna', 'active', 'Housewife', NULL, NULL, 'Female', NULL, 'widowed'),
(21, 'Ricky', 'Miranda', '', '', '1965-12-02', '2025-07-20', 'Purok 1', 60, 'Guna', 'active', '', NULL, NULL, 'Male', NULL, 'widowed'),
(22, 'Lorna', 'Revilla', '', '09776326447', '1980-08-21', '2025-07-20', 'Purok 1', 45, 'Bermillo', 'active', 'Housewife', NULL, NULL, 'Female', NULL, 'widowed'),
(23, 'Crispin', 'Guna', '', '09776326447', '1980-06-01', '2025-07-20', 'Purok 1', 45, 'Gotis', 'active', 'Fishermen', NULL, NULL, 'Male', NULL, 'married'),
(24, 'Susan', 'Bermillo', '', '09776326447', '1981-08-31', '2025-07-20', 'Purok 1', 44, 'Balansay', 'active', 'Housewife', NULL, NULL, 'Female', NULL, 'widowed'),
(25, 'Joed Joy', 'Balansay', '', '09776326447', '1975-04-21', '2025-07-20', 'Purok 1', 50, 'Rona', 'active', 'Housewife', NULL, NULL, 'Female', NULL, 'widowed'),
(26, 'Raul', 'Geraldino', '', '09776326447', '1980-01-12', '2025-07-20', 'Purok 1', 45, 'Peralta', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'married'),
(27, 'Edison', 'Gotis', '', '09776326447', '1980-07-01', '2025-07-20', 'Purok 1', 45, 'Bautista', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'single'),
(28, 'Rico', 'Gotis', '', '09776326447', '1980-11-25', '2025-07-20', 'Purok 1', 45, 'Bautista', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'married'),
(29, 'Hermenia', 'Gotis', '', '09776326447', '1980-01-19', '2025-07-20', 'Purok 1', 45, 'Bautista', 'active', 'Housewife', NULL, NULL, 'Female', NULL, 'single'),
(30, 'Benigno', 'David', '', '09776326447', '1980-08-12', '2025-07-20', 'Purok 1', 45, 'Gobres', 'active', 'Tricycle Driver', NULL, NULL, 'Male', NULL, 'married'),
(31, 'Mark', 'Zacarias', '', '09776326447', '1980-08-11', '2025-07-20', 'Purok 1', 45, 'Buizon', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'married'),
(32, 'Mark', 'Zacarias', '', '09776326447', '1980-08-11', '2025-07-20', 'Purok 1', 45, 'Buizon', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'widowed'),
(33, 'Fe', 'Zacarias', '', '09776326447', '1980-01-10', '2025-07-20', 'Purok 1', 45, 'Buizon', 'active', 'Housewife', NULL, NULL, 'Female', NULL, NULL),
(34, 'Jessica', 'Gutlay', '', '09776326447', '1980-09-11', '2025-07-20', 'Purok 1', 45, 'Tolete', 'active', 'Housewife', NULL, NULL, 'Female', NULL, 'married'),
(35, 'Erdy', 'Canale', '', '09776326447', '1980-05-01', '2025-07-20', 'Purok 1', 45, 'Barsaga', 'active', 'Farmer', NULL, '2025-07-20 06:43:09', 'Male', '2025-07-20 06:43:09', NULL),
(36, 'Mary Ann', 'Canale', '', '09776326447', '1980-10-21', '2025-07-20', 'Purok 1', 45, 'Gotis', 'active', 'Housewife', NULL, NULL, 'Female', NULL, NULL),
(37, 'Elleazar', 'Gernale', '', '09776326447', '1980-07-13', '2025-07-20', 'Purok 1', 45, '', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(38, 'Jose', 'Vargas', '', '09776326447', '1980-05-30', '2025-07-20', 'Purok 1', 45, 'Molina', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(39, 'Rico', 'Golde', '', '09776326447', '1980-07-15', '2025-07-20', 'Purok 1', 45, 'Gernan', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(40, 'Rey', 'Golde', '', '09776326447', '1980-01-18', '2025-07-20', 'Purok 1', 45, 'Gernan', 'active', 'Fishermen', NULL, NULL, 'Male', NULL, NULL),
(41, 'Renan', 'Golde', '', '09776326447', '1980-09-01', '2025-07-20', 'Purok 1', 45, 'Gernan', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(42, 'Danilo', 'Almodiel', '', '09776326447', '1980-09-01', '2025-07-20', 'Purok 1', 45, 'Barsaga', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(43, 'Dennis', 'Vasque', '', '09776326447', '1980-09-01', '2025-07-20', 'Purok 1', 45, 'Vilamor', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(44, 'Marites', 'Golde', '', '09776326447', '1980-09-01', '2025-07-20', 'Purok 1', 45, 'Gernan', 'active', 'Housewife', NULL, NULL, 'Female', NULL, NULL),
(45, 'Federico', 'Malisa', '', '09776326447', '1980-09-01', '2025-07-20', 'Purok 1', 45, 'Peñaflor', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(46, 'Jennnelyn', 'Andaya', '', '09776326447', '1980-08-11', '2025-07-20', 'Purok 1', 45, 'Importante', 'active', 'Housewife', NULL, NULL, 'Female', NULL, NULL),
(47, 'Jenny Mae', 'Andaya', '', '09776326447', '1980-08-11', '2025-07-20', 'Purok 1', 45, 'Importante', 'active', 'Housewife', NULL, NULL, 'Female', NULL, NULL),
(48, 'Vidalito', 'Benig', '', '09776326447', '1980-09-01', '2025-07-20', 'Purok 1', 45, 'Banzuela', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(49, 'Nelia', 'Gestiada', '', '09776326447', '1980-08-11', '2025-07-20', 'Purok 1', 45, 'Benig', 'active', 'Housewife', NULL, NULL, 'Female', NULL, NULL),
(50, 'Arnel', 'Bermilllo', '', '09776326447', '1980-09-04', '2025-07-20', 'Purok 1', 45, 'Balansay', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(51, 'Jerome', 'Lagajino', '', '09776326447', '1980-09-07', '2025-07-20', 'Purok 1', 45, '', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(52, 'Amelita', 'Lacandasa', '', '09776326447', '1980-09-09', '2025-07-20', 'Purok 1', 45, 'Estolonio', 'active', 'Housewife', NULL, NULL, 'Female', NULL, NULL),
(53, 'Levy', 'Bermillo', '', '09776326447', '1980-09-02', '2025-07-20', 'Purok 1', 45, 'Balansay', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(54, 'Estillo', 'Buatis', '', '09776326447', '1980-09-11', '2025-07-20', 'Purok 1', 45, '', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(55, 'Adelaida', 'Banzuela', '', '09776326447', '1980-09-18', '2025-07-20', 'Purok 1', 45, '', 'active', 'Farmer', NULL, NULL, 'Female', NULL, NULL),
(56, 'Erlinda', 'Cid', '', '09776326447', '1980-09-10', '2025-07-20', 'Purok 1', 45, 'Gotis', 'active', 'Housewife', NULL, NULL, 'Female', NULL, NULL),
(57, 'Leonard', 'Nova', '', '09776326447', '1980-09-15', '2025-07-20', 'Purok 1', 45, 'Escuata', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(58, 'Marvin', 'Gelua', '', '09776326447', '1980-09-17', '2025-07-20', 'Purok 1', 45, 'Bitancor', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(59, 'Aldrin', 'Gimao', '', '09776326447', '1980-09-19', '2025-07-20', 'Purok 1', 45, 'Breboneria', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(60, 'Edison', 'Gotis', '', '09776326447', '1980-09-10', '2025-07-20', 'Purok 1', 45, 'B.', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(61, 'Ronilo', 'Amorado', '', '09776326447', '1980-09-16', '2025-07-20', 'Purok 1', 45, 'C.', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(62, 'Ronilo', 'Amorado', '', '09776326447', '1980-09-16', '2025-07-20', 'Purok 1', 45, 'C.', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(63, 'Josephine', 'Golde', '', '09776326447', '1980-09-14', '2025-07-20', 'Purok 1', 45, 'G.', 'active', 'Housewife', NULL, NULL, 'Female', NULL, NULL),
(64, 'Zacarias', 'Eupeña', '', '09776326447', '1980-09-30', '2025-07-20', 'Purok 1', 45, 'C.', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(65, 'Gregorio', 'Gisalan', '', '09776326447', '1980-09-12', '2025-07-20', 'Purok 1', 45, 'G.', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(66, 'Melvin', 'Gotis', '', '09150046884', '1994-10-22', '2025-07-20', 'purok 2', 31, '', 'active', 'Tricycle Driver', '2025-07-20 08:16:37', '2025-07-20 08:16:37', 'Male', NULL, 'married'),
(67, 'Beverly', 'Gotis', '', '09150046884', '1974-08-05', '2025-07-20', 'purok 2', 50, 'V.', 'active', 'Housewife', '2025-07-20 08:17:42', '2025-07-20 08:17:42', 'Female', NULL, 'married'),
(68, 'Ronnel', 'Birata', '', '09150046884', '1987-03-03', '2025-07-20', 'purok 2', 38, 'D.', 'active', 'Welder', '2025-07-20 08:18:24', '2025-07-20 08:18:24', 'Male', NULL, 'married'),
(69, 'Alegriano', 'Masdo', '', '09150046884', '1986-12-30', '2025-07-20', 'purok 2', 39, '', 'active', 'Fishermen', '2025-07-20 08:19:13', '2025-07-20 08:19:13', 'Male', NULL, 'married'),
(70, 'Jeoffrey Cesar', 'Gimoro', '', '09150046884', '2000-04-30', '2025-07-20', 'purok 2', 25, 'A.', 'active', 'Tricycle Driver', '2025-07-20 08:19:43', '2025-07-20 08:19:43', 'Male', NULL, 'single'),
(71, 'Jesus', 'Delariarte', '', '09150046884', '1958-12-25', '2025-07-20', 'purok 2', 67, '', 'active', 'Fishermen', '2025-07-20 08:20:27', '2025-07-20 08:20:27', 'Male', NULL, ''),
(72, 'Melda', 'Delariarte', '', '09150046884', '1964-09-04', '2025-07-20', 'purok 2', 61, '', 'active', 'Sari-sari Store', '2025-07-20 08:21:09', '2025-07-20 08:21:09', 'Female', NULL, 'married'),
(73, 'Ernie', 'Estolonio', '', '09150046884', '1979-06-22', '2025-07-20', 'purok 2', 46, 'A.', 'active', 'Fishermen', '2025-07-20 08:22:12', '2025-07-20 08:22:12', 'Male', NULL, 'married'),
(74, 'Follentino', 'Masdo', '', '09150046884', '1984-07-14', '2025-07-20', 'purok 2', 41, 'G.', 'active', 'Tricycle Driver', '2025-07-20 08:22:43', '2025-07-20 08:22:43', 'Male', NULL, ''),
(75, 'Regan', 'Jamolin', '', '09150046884', '1989-09-26', '2025-07-20', 'purok 2', 36, 'G.', 'active', 'Fishermen', '2025-07-20 08:23:29', '2025-07-20 08:23:29', 'Male', NULL, 'married'),
(76, 'Adam', 'Gotis', '', '09150046884', '1971-03-03', '2025-07-20', 'purok 2', 54, 'A.', 'active', 'Farmer', '2025-07-20 08:24:23', '2025-07-20 08:24:23', 'Male', NULL, 'married'),
(77, 'Nestor', 'Gliban', '', '09150046884', '1959-07-07', '2025-07-20', 'purok 2', 66, 'M.', 'active', 'Farmer', '2025-07-20 08:25:02', '2025-07-20 08:25:02', 'Male', NULL, ''),
(78, 'Erwin', 'Delariarte', '', '09150046884', '1977-07-06', '2025-07-20', 'purok 2', 48, 'G.', 'active', 'Farmer', '2025-07-20 08:25:40', '2025-07-20 08:25:40', 'Male', NULL, 'single'),
(79, 'Rodel', 'Tan', '', '09150046884', '1987-10-21', '2025-07-20', 'purok 2', 38, '', 'active', 'Farmer', '2025-07-20 08:26:21', '2025-07-20 08:26:21', 'Male', NULL, 'married'),
(80, 'Omega', 'Gotis', '', '09150046884', '1978-07-30', '2025-07-20', 'purok 2', 47, 'G.', 'active', 'Sari-sari Store', '2025-07-20 08:26:53', '2025-07-20 08:26:53', 'Female', NULL, 'married'),
(81, 'Joven', 'Gliban', '', '09150046884', '1967-01-24', '2025-07-20', 'purok 2', 58, '', 'active', 'Farmer', '2025-07-20 08:27:31', '2025-07-20 08:27:31', 'Male', NULL, 'married'),
(82, 'Dominga', 'Gliban', '', '09150046884', '1937-12-08', '2025-07-20', 'purok 2', 88, 'G.', 'active', 'Housewife', '2025-07-20 08:28:03', '2025-07-20 08:28:03', 'Female', NULL, ''),
(83, 'Weryen', 'Hamor', '', '09150046884', '1973-11-09', '2025-07-20', 'purok 2', 52, 'G.', 'active', 'Housewife', '2025-07-20 08:28:43', '2025-07-20 08:28:43', 'Female', NULL, 'married'),
(84, 'Jimso', 'Gliban', '', '09150046884', '1976-08-09', '2025-07-20', 'purok 2', 49, 'G.', 'active', 'Farmer', '2025-07-20 08:29:24', '2025-07-20 08:29:24', 'Male', NULL, 'married'),
(85, 'Edgar', 'Jamolin', '', '09150046884', '1962-03-21', '2025-07-20', 'purok 2', 63, 'A.', 'active', 'Carpinter', '2025-07-20 08:29:58', '2025-07-20 08:29:58', 'Male', NULL, 'married'),
(86, 'Edgar', 'Estolonio', '', '09150046884', '1977-02-21', '2025-07-20', 'purok 2', 48, 'A.', 'active', 'Farmer', '2025-07-20 08:38:47', '2025-07-20 08:38:47', 'Male', NULL, 'married'),
(87, 'Shyra', 'Tancueco', '', '09150046884', '1984-10-15', '2025-07-20', 'purok 2', 41, 'G.', 'active', 'Sari-sari Store', '2025-07-20 08:39:19', '2025-07-20 08:39:19', 'Female', NULL, 'married'),
(88, 'Gilbert', 'Gleban', '', '09150046884', '1978-05-06', '2025-07-20', 'purok 2', 47, 'Z.', 'active', 'Fishermen', '2025-07-20 08:39:59', '2025-07-20 08:39:59', 'Male', NULL, 'married'),
(89, 'Melda', 'Delariarte', '', '09150046884', '1964-09-04', '2025-07-20', 'purok 2', 61, '', 'active', 'Housewife', '2025-07-20 08:40:49', '2025-07-20 08:40:49', 'Female', NULL, ''),
(90, 'Alonso', 'Baloloy', '', '09150046884', '1986-01-31', '2025-07-20', 'purok 2', 39, 'G.', 'active', 'Farmer', '2025-07-20 08:41:26', '2025-07-20 08:41:26', 'Male', NULL, 'married'),
(91, 'Gonzalo', 'Gotis', '', '09150046884', '1955-03-21', '2025-07-20', 'purok 2', 70, 'V.', 'active', '', '2025-07-20 08:42:11', '2025-07-20 08:42:11', 'Male', NULL, 'married'),
(92, 'Andy', 'Canale', '', '09150046884', '1983-01-05', '2025-07-20', 'purok 2', 42, 'B.', 'active', 'Housewife', '2025-07-20 08:42:44', '2025-07-20 08:42:44', 'Female', NULL, 'single'),
(93, 'Domingo', 'Masdo', '', '0915046884', '1979-02-14', '2025-07-20', 'purok 2', 46, 'G.', 'active', 'Farmer', '2025-07-20 08:43:14', '2025-07-20 08:43:14', 'Male', NULL, 'married'),
(94, 'Nathaniel', 'Gotis', '', '09150046884', '1997-06-19', '2025-07-20', 'purok 2', 28, 'P.', 'active', 'Farmer', '2025-07-20 08:44:02', '2025-07-20 08:44:02', 'Male', NULL, 'married'),
(95, 'Letty', 'Aguado', '', '09150046884', '1954-11-19', '2025-07-20', 'purok 2', 71, 'D.', 'active', '', '2025-07-20 08:44:35', '2025-07-20 08:44:35', 'Female', NULL, ''),
(96, 'Eddic', 'Estolonio', '', '09150046884', '1953-12-19', '2025-07-20', 'purok 2', 72, 'H.', 'active', '', '2025-07-20 08:45:39', '2025-07-20 08:45:39', 'Male', NULL, 'married'),
(97, 'Erdy', 'Canale', '', '09776326447', '1980-05-01', '2025-07-20', 'Purok 1', 45, 'Barsaga', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(98, 'Emelita', 'Gotis', '', '09125524485', '1971-07-21', '2025-07-20', 'Purok 3', 54, 'V.', 'active', '', NULL, NULL, 'Female', NULL, NULL),
(99, 'Jason', 'Villanueva', '', '09125524485', '1975-02-25', '2025-07-20', 'Purok 3', 50, 'H.', 'active', 'Farmer', NULL, NULL, 'Male', NULL, NULL),
(100, 'Romeo', 'Bautista', '', '09125524485', '1962-06-15', '2025-07-20', 'Purok 3', 63, 'G.', 'active', '', NULL, NULL, 'Male', NULL, NULL),
(101, 'Nelly', 'Alig', '', '09125524485', '1957-01-14', '2025-07-20', 'Purok 3', 68, 'S.', 'active', '', NULL, NULL, 'Female', NULL, 'widowed'),
(102, 'Ernan', 'Delariarte', '', '09125524485', '1980-09-30', '2025-07-20', 'Purok 3', 45, 'G.', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'married'),
(103, 'Alvin', 'Balida', '', '09125524485', '1977-01-08', '2025-07-20', 'Purok 3', 48, 'S.', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'married'),
(104, 'Grenggo', 'Estolonio', '', '09125524485', '1993-01-06', '2025-07-20', 'Purok 3', 31, 'A.', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'single'),
(105, 'Jennifer', 'Juta', '', '09125524485', '1987-11-22', '2025-07-20', 'Purok 3', 38, 'B.', 'active', 'Housewife', NULL, NULL, 'Female', NULL, 'married'),
(106, 'Pedro', 'Gimoro', '', '09125524485', '1953-11-07', '2025-07-20', 'Purok 3', 72, '', 'active', 'Fishermen', NULL, NULL, 'Male', NULL, 'married'),
(107, 'Argie', 'Gimoro', '', '09125524485', '1979-11-06', '2025-07-20', 'Purok 3', 46, '', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'married'),
(108, 'Levy', 'Goyal', '', '09125524485', '1962-05-12', '2025-07-20', 'Purok 3', 63, 'M.', 'active', '', NULL, NULL, 'Female', NULL, 'single'),
(109, 'Anusalion', 'Gotis', '', '09125524485', '1945-10-17', '2025-07-20', 'Purok 3', 80, 'G.', 'active', '', NULL, NULL, 'Female', NULL, 'widowed'),
(110, 'Rosa', 'Juta', '', '09125524485', '1962-08-08', '2025-07-20', 'Purok 3', 63, 'M.', 'active', '', NULL, NULL, 'Female', NULL, 'widowed'),
(111, 'Rizalina', 'Decena', '', '09125524485', '1972-06-19', '2025-07-20', 'Purok 3', 53, 'U.', 'active', 'House wife', NULL, NULL, 'Female', NULL, 'married'),
(112, 'Marjorie', 'Juta', '', '09125524485', '1997-11-07', '2025-07-20', 'Purok 3', 28, 'C.', 'active', 'Housewife', NULL, NULL, 'Female', NULL, 'married'),
(113, 'Domingo', 'Gotis', '', '09125524485', '1963-12-09', '2025-07-20', 'Purok 3', 62, 'G.', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'married'),
(114, 'Ramon', 'Plazo', '', '09125524485', '1988-04-16', '2025-07-20', 'Purok 3', 37, 'Z.', 'active', 'Farmer', NULL, NULL, 'Male', NULL, 'single'),
(115, 'Celeste', 'Gotis', '', '09125524485', '1993-04-27', '2025-07-20', 'Purok 3', 31, 'B.', 'active', 'Housewife', NULL, NULL, 'Female', NULL, 'married');

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
(16, '2025_06_21_232720_create_assistance_distribution_table', 13),
(17, '2025_06_26_000225_add_purok_in_users_table', 14),
(18, '2025_07_06_063448_create_sms_notification_saved_table', 15);

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
('s76Puqttq7XciX44Rui5Cj0gqWspEtpceDApnG7j', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNmNyTXhTNlRDcFVuS21BbWJoR0p2SkVKcjN3MHFUSmdIcVlxd0ZaMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWdpc3RlcmVkLW1lbWJlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1753023994);

-- --------------------------------------------------------

--
-- Table structure for table `sms_notification_saved`
--

CREATE TABLE `sms_notification_saved` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_notification_saved`
--

INSERT INTO `sms_notification_saved` (`id`, `message`, `type`, `created_at`, `updated_at`) VALUES
(1, 'We regret to inform you that asd asd has passed away. Last night will be held on 2025-07-06. Collection for burial assistance starts on 2025-07-10.\'', 'deathReport', '2025-07-06 00:53:20', '2025-07-06 00:53:20'),
(2, 'We regret to inform you that asd asd_modified has passed away. Last night will be held on 2025-07-17. Collection for burial assistance starts on 2025-07-09.\'', 'deathReport', '2025-07-06 01:17:01', '2025-07-06 01:17:01'),
(3, 'Hello [boggart], thank you for paying your contribution. This message confirms your payment for the upcoming schedule.', 'scheduleContribution', '2025-07-06 10:02:21', '2025-07-06 10:02:21'),
(4, 'Hello, our records show you still have an unpaid balance for the contribution (Damayan). Please settle it at your earliest convenience. Thank you.', 'reminders', '2025-07-06 10:02:36', '2025-07-06 10:02:36'),
(5, 'Total money disbursed so far is ₱300.00. Thank you for your continuous support.', 'fundUpdates', '2025-07-06 10:09:24', '2025-07-06 10:09:24');

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
  `deleted_at` timestamp NULL DEFAULT NULL,
  `purok` enum('1','2','3','4') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `purok`) VALUES
(1, 'Rina Geronimo', 'jobelgolde43@gmail.com', '2025-04-17 10:52:51', '$2y$12$u.SWz91uteDfsudVhf/c1OTZ0X.L8jjvex90QTP39vxVCax7A9mvu', 'admin', NULL, NULL, '2025-07-02 11:16:54', NULL, '1'),
(4, 'q', 'q@gmail.com', NULL, '$2y$12$i2KxbTLDBqH8kRsEw/YCD.nNkqwllXgaAvA9ubdB7fSxhTq2YOgAy', 'admin', NULL, '2025-06-13 17:13:08', '2025-07-01 22:19:50', '2025-07-01 22:19:50', '1'),
(5, 'Jobelle', 'iamjobelle@gmail.com', NULL, '$2y$12$xlii9WcPc081pBhDVsHxPOdIJTpDSlD4ScZ2seouXwOBvBVOdr/Tq', 'collector', NULL, '2025-06-15 04:29:28', '2025-06-21 14:56:46', NULL, '1'),
(6, 'alder', 'clemente@gmail.com', NULL, '$2y$12$ZJCVd1sR7zPQNjRpw8LhO.HQFOXwyrDRDUzHAOsRKH3SB/bbAe/fq', 'collector', NULL, '2025-06-25 16:09:58', '2025-06-25 16:09:58', NULL, '2');

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
-- Indexes for table `sms_notification_saved`
--
ALTER TABLE `sms_notification_saved`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `contributions`
--
ALTER TABLE `contributions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `death_reports`
--
ALTER TABLE `death_reports`
  MODIFY `report_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `officials`
--
ALTER TABLE `officials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sms_notification_saved`
--
ALTER TABLE `sms_notification_saved`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
