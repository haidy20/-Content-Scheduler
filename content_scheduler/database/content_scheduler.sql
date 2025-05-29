-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 29, 2025 at 06:40 PM
-- Server version: 8.0.35
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `content_scheduler`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
CREATE TABLE IF NOT EXISTS `activity_logs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entity_id` bigint UNSIGNED NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `changed_by` bigint UNSIGNED NOT NULL,
  `changes` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `entity_id`, `action`, `changed_by`, `changes`, `created_at`, `updated_at`) VALUES
(51, 54, 'created', 1, '{\"id\": 54, \"title\": \"About life\", \"status\": \"scheduled\", \"content\": \"This is the contentThis is the contentThis is the content\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:15:20.000000Z\", \"updated_at\": \"2025-05-29T16:15:20.000000Z\", \"scheduled_time\": \"2025-05-26 10:00:00\"}', '2025-05-29 13:15:20', '2025-05-29 13:15:20'),
(52, 54, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/mKIbIoIrdRabFsY1QSE4zmfa6eG0wf4ZCHXMmTQj.jpg\", \"old\": null}}', '2025-05-29 13:15:20', '2025-05-29 13:15:20'),
(53, 55, 'created', 1, '{\"id\": 55, \"title\": \"About life\", \"status\": \"scheduled\", \"content\": \"This is the contentThis is the contentThis is the content\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:15:27.000000Z\", \"updated_at\": \"2025-05-29T16:15:27.000000Z\", \"scheduled_time\": \"2025-05-26 10:00:00\"}', '2025-05-29 13:15:27', '2025-05-29 13:15:27'),
(54, 55, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/AvSSX95BzvVl1DWqCQ0NXrcRnbbjByozpkuDPQ3Q.jpg\", \"old\": null}}', '2025-05-29 13:15:27', '2025-05-29 13:15:27'),
(55, 56, 'created', 1, '{\"id\": 56, \"title\": \"About life\", \"status\": \"scheduled\", \"content\": \"This is the contentThis is the contentThis is the content\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:15:30.000000Z\", \"updated_at\": \"2025-05-29T16:15:30.000000Z\", \"scheduled_time\": \"2025-05-26 10:00:00\"}', '2025-05-29 13:15:30', '2025-05-29 13:15:30'),
(56, 56, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/6N3t1SPvuIFcl3qp6ZHMoTryXCYMJCygXkC0y28H.jpg\", \"old\": null}}', '2025-05-29 13:15:30', '2025-05-29 13:15:30'),
(57, 56, 'deleted', 1, NULL, '2025-05-29 13:18:39', '2025-05-29 13:18:39'),
(58, 54, 'deleted', 1, NULL, '2025-05-29 13:18:40', '2025-05-29 13:18:40'),
(59, 55, 'deleted', 1, NULL, '2025-05-29 13:18:42', '2025-05-29 13:18:42'),
(60, 57, 'created', 1, '{\"id\": 57, \"title\": \"About life\", \"status\": \"scheduled\", \"content\": \"This is the contentThis is the contentThis is the content\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:22:27.000000Z\", \"updated_at\": \"2025-05-29T16:22:27.000000Z\", \"scheduled_time\": \"2025-05-26 10:00:00\"}', '2025-05-29 13:22:27', '2025-05-29 13:22:27'),
(61, 57, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/asGQMWNtiBUHp5argCex8lK7AdvUSPPBPC6cCprl.jpg\", \"old\": null}}', '2025-05-29 13:22:27', '2025-05-29 13:22:27'),
(62, 58, 'created', 1, '{\"id\": 58, \"title\": \"About life\", \"status\": \"scheduled\", \"content\": \"This is the contentThis is the contentThis is the content\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:22:28.000000Z\", \"updated_at\": \"2025-05-29T16:22:28.000000Z\", \"scheduled_time\": \"2025-05-26 10:00:00\"}', '2025-05-29 13:22:28', '2025-05-29 13:22:28'),
(63, 58, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/ECdRzZG4s6JeNNQlb7gIUC8Wt8Rswjw94QWFwu0T.jpg\", \"old\": null}}', '2025-05-29 13:22:28', '2025-05-29 13:22:28'),
(64, 59, 'created', 1, '{\"id\": 59, \"title\": \"About life\", \"status\": \"scheduled\", \"content\": \"This is the contentThis is the contentThis is the content\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:22:30.000000Z\", \"updated_at\": \"2025-05-29T16:22:30.000000Z\", \"scheduled_time\": \"2025-05-26 10:00:00\"}', '2025-05-29 13:22:30', '2025-05-29 13:22:30'),
(65, 59, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/eyn0Vc3ZaJsyLXxXyMYvVUqXlnLazK7lJ4Pm1DbH.jpg\", \"old\": null}}', '2025-05-29 13:22:30', '2025-05-29 13:22:30'),
(66, 47, 'deleted', 1, NULL, '2025-05-29 13:23:27', '2025-05-29 13:23:27'),
(67, 59, 'deleted', 1, NULL, '2025-05-29 13:23:33', '2025-05-29 13:23:33'),
(68, 58, 'deleted', 1, NULL, '2025-05-29 13:23:34', '2025-05-29 13:23:34'),
(69, 60, 'created', 1, '{\"id\": 60, \"title\": \"About life\", \"status\": \"scheduled\", \"content\": \"This is the contentThis is the contentThis is the content\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:23:38.000000Z\", \"updated_at\": \"2025-05-29T16:23:38.000000Z\", \"scheduled_time\": \"2025-05-26 10:00:00\"}', '2025-05-29 13:23:38', '2025-05-29 13:23:38'),
(70, 60, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/29RRTt61L6cVR8UNJFERextGNEB4ZmNn2nWiw6AR.jpg\", \"old\": null}}', '2025-05-29 13:23:38', '2025-05-29 13:23:38'),
(71, 61, 'created', 1, '{\"id\": 61, \"title\": \"About life\", \"status\": \"draft\", \"content\": \"This is the contentThis is the contentThis is the content\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:31:40.000000Z\", \"updated_at\": \"2025-05-29T16:31:40.000000Z\", \"scheduled_time\": \"2025-05-26 10:00:00\"}', '2025-05-29 13:31:40', '2025-05-29 13:31:40'),
(72, 61, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/l0LVBJcyHzMHgAJQFUanVj37EPoCx7cyxm3Dmg0I.jpg\", \"old\": null}}', '2025-05-29 13:31:40', '2025-05-29 13:31:40'),
(73, 62, 'created', 1, '{\"id\": 62, \"title\": \"About life\", \"status\": \"draft\", \"content\": \"This is the contentThis is the contentThis is the content\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:31:51.000000Z\", \"updated_at\": \"2025-05-29T16:31:51.000000Z\", \"scheduled_time\": \"2025-05-26 10:00:00\"}', '2025-05-29 13:31:51', '2025-05-29 13:31:51'),
(74, 62, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/YErkLbitDk2dwidDwP60HujCHee9RDihz9oduhDP.jpg\", \"old\": null}}', '2025-05-29 13:31:51', '2025-05-29 13:31:51'),
(75, 63, 'created', 1, '{\"id\": 63, \"title\": \"About life\", \"status\": \"draft\", \"content\": \"This is the contentThis is the contentThis is the content\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:33:35.000000Z\", \"updated_at\": \"2025-05-29T16:33:35.000000Z\", \"scheduled_time\": \"2025-05-26 10:00:00\"}', '2025-05-29 13:33:35', '2025-05-29 13:33:35'),
(76, 63, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/xsodlaePoPjTcT9OTDLtUcNksEaIfx2qf81bUJDL.jpg\", \"old\": null}}', '2025-05-29 13:33:35', '2025-05-29 13:33:35'),
(77, 64, 'created', 1, '{\"id\": 64, \"title\": \"About life\", \"status\": \"draft\", \"content\": \"This is the contentThis is the contentThis is the content\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:33:37.000000Z\", \"updated_at\": \"2025-05-29T16:33:37.000000Z\", \"scheduled_time\": \"2025-05-26 10:00:00\"}', '2025-05-29 13:33:37', '2025-05-29 13:33:37'),
(78, 64, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/XJ2z2TSekmwBlib3CxWLBxd7qzdzkE4UN5VNGg9G.jpg\", \"old\": null}}', '2025-05-29 13:33:37', '2025-05-29 13:33:37'),
(79, 64, 'deleted', 1, NULL, '2025-05-29 13:33:49', '2025-05-29 13:33:49'),
(80, 63, 'deleted', 1, NULL, '2025-05-29 13:33:50', '2025-05-29 13:33:50'),
(81, 62, 'deleted', 1, NULL, '2025-05-29 13:33:51', '2025-05-29 13:33:51'),
(82, 61, 'deleted', 1, NULL, '2025-05-29 13:33:53', '2025-05-29 13:33:53'),
(83, 60, 'deleted', 1, NULL, '2025-05-29 13:33:55', '2025-05-29 13:33:55'),
(84, 65, 'created', 1, '{\"id\": 65, \"title\": \"About life\", \"status\": \"draft\", \"content\": \"This is the contentThis is the contentThis is the content\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:43:24.000000Z\", \"updated_at\": \"2025-05-29T16:43:24.000000Z\"}', '2025-05-29 13:43:24', '2025-05-29 13:43:24'),
(85, 65, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/eMLbxCwAEXEkFfnjNBAD1ueLXoBNmJoPdqxsaJpv.jpg\", \"old\": null}}', '2025-05-29 13:43:24', '2025-05-29 13:43:24'),
(86, 66, 'created', 1, '{\"id\": 66, \"title\": \"About life\", \"status\": \"scheduled\", \"content\": \"This is the contentThis is the contentThis is the content\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:43:40.000000Z\", \"updated_at\": \"2025-05-29T16:43:40.000000Z\", \"scheduled_time\": \"2025-05-30 10:00:00\"}', '2025-05-29 13:43:40', '2025-05-29 13:43:40'),
(87, 66, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/g9xPoR1FUxhMalS6iwFJHBCBILmkClcGKyD8PtLS.jpg\", \"old\": null}}', '2025-05-29 13:43:40', '2025-05-29 13:43:40'),
(88, 65, 'deleted', 1, NULL, '2025-05-29 13:43:58', '2025-05-29 13:43:58'),
(89, 43, 'deleted', 1, NULL, '2025-05-29 13:44:01', '2025-05-29 13:44:01'),
(90, 67, 'created', 1, '{\"id\": 67, \"title\": \"ببببببببببب\", \"status\": \"published\", \"content\": \"نننننننننننننننننن\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:50:12.000000Z\", \"updated_at\": \"2025-05-29T16:50:12.000000Z\"}', '2025-05-29 13:50:12', '2025-05-29 13:50:12'),
(91, 67, 'deleted', 1, NULL, '2025-05-29 13:50:23', '2025-05-29 13:50:23'),
(92, 68, 'created', 1, '{\"id\": 68, \"title\": \"yyyyyyy\", \"status\": \"draft\", \"content\": \"ggggggggggggggggggggggg\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:51:08.000000Z\", \"updated_at\": \"2025-05-29T16:51:08.000000Z\"}', '2025-05-29 13:51:08', '2025-05-29 13:51:08'),
(93, 68, 'deleted', 1, NULL, '2025-05-29 13:51:14', '2025-05-29 13:51:14'),
(94, 69, 'created', 1, '{\"id\": 69, \"title\": \"ff\", \"status\": \"published\", \"content\": \"ffffffffffffffffff\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:51:32.000000Z\", \"updated_at\": \"2025-05-29T16:51:32.000000Z\"}', '2025-05-29 13:51:32', '2025-05-29 13:51:32'),
(95, 70, 'created', 1, '{\"id\": 70, \"title\": \"as\", \"status\": \"published\", \"content\": \"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF\", \"user_id\": 1, \"created_at\": \"2025-05-29T16:52:13.000000Z\", \"updated_at\": \"2025-05-29T16:52:13.000000Z\"}', '2025-05-29 13:52:13', '2025-05-29 13:52:13'),
(96, 71, 'created', 1, '{\"id\": 71, \"title\": \"اااا\", \"status\": \"draft\", \"content\": \"hellloooooooooooooooooo\", \"user_id\": 1, \"created_at\": \"2025-05-29T17:09:18.000000Z\", \"updated_at\": \"2025-05-29T17:09:18.000000Z\"}', '2025-05-29 14:09:18', '2025-05-29 14:09:18'),
(97, 71, 'deleted', 1, NULL, '2025-05-29 14:09:22', '2025-05-29 14:09:22'),
(98, 70, 'deleted', 1, NULL, '2025-05-29 14:09:24', '2025-05-29 14:09:24'),
(99, 72, 'created', 1, '{\"id\": 72, \"title\": \"hell\", \"status\": \"draft\", \"content\": \"hellloooooooooooooooooo\", \"user_id\": 1, \"created_at\": \"2025-05-29T17:09:47.000000Z\", \"updated_at\": \"2025-05-29T17:09:47.000000Z\"}', '2025-05-29 14:09:47', '2025-05-29 14:09:47'),
(100, 72, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/3CQECZ7TlOKQBkof3EzHAOO6sTDST8tb1S06o7Au.png\", \"old\": null}}', '2025-05-29 14:09:47', '2025-05-29 14:09:47'),
(101, 73, 'created', 1, '{\"id\": 73, \"title\": \"vvv\", \"status\": \"published\", \"content\": \"nnnnccccvhvjfcgtckkkkkkkh\", \"user_id\": 1, \"created_at\": \"2025-05-29T17:20:33.000000Z\", \"updated_at\": \"2025-05-29T17:20:33.000000Z\"}', '2025-05-29 14:20:33', '2025-05-29 14:20:33'),
(102, 73, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/YiWS5p0Uj25dKgaRjUJuvbPjQhQfcuTmBeRg6Jsh.png\", \"old\": null}}', '2025-05-29 14:20:33', '2025-05-29 14:20:33'),
(103, 73, 'deleted', 1, NULL, '2025-05-29 14:20:37', '2025-05-29 14:20:37'),
(104, 72, 'deleted', 1, NULL, '2025-05-29 14:20:38', '2025-05-29 14:20:38'),
(105, 69, 'deleted', 1, NULL, '2025-05-29 14:20:55', '2025-05-29 14:20:55'),
(106, 74, 'created', 1, '{\"id\": 74, \"title\": \"gg\", \"status\": \"draft\", \"content\": \"bbbbbbbbbbccccccccccbmmbn\", \"user_id\": 1, \"created_at\": \"2025-05-29T17:35:14.000000Z\", \"updated_at\": \"2025-05-29T17:35:14.000000Z\"}', '2025-05-29 14:35:14', '2025-05-29 14:35:14'),
(107, 74, 'deleted', 1, NULL, '2025-05-29 14:35:17', '2025-05-29 14:35:17'),
(108, 75, 'created', 1, '{\"id\": 75, \"title\": \"hgf\", \"status\": \"published\", \"content\": \"bbbbbbbbbbccccccccccbmmbn\", \"user_id\": 1, \"created_at\": \"2025-05-29T17:35:35.000000Z\", \"updated_at\": \"2025-05-29T17:35:35.000000Z\"}', '2025-05-29 14:35:35', '2025-05-29 14:35:35'),
(109, 75, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/rgGysHr3gTaHZK8hD47uB77SI4rJBOiTlEyltzvW.png\", \"old\": null}}', '2025-05-29 14:35:35', '2025-05-29 14:35:35'),
(110, 75, 'deleted', 1, NULL, '2025-05-29 14:35:41', '2025-05-29 14:35:41'),
(111, 76, 'created', 1, '{\"id\": 76, \"title\": \"Upload\", \"status\": \"published\", \"content\": \"UploadUploadUploadUploadUploadUpload\", \"user_id\": 1, \"created_at\": \"2025-05-29T17:39:59.000000Z\", \"updated_at\": \"2025-05-29T17:39:59.000000Z\"}', '2025-05-29 14:39:59', '2025-05-29 14:39:59'),
(112, 76, 'deleted', 1, NULL, '2025-05-29 14:40:03', '2025-05-29 14:40:03'),
(113, 77, 'created', 1, '{\"id\": 77, \"title\": \"Upload\", \"status\": \"published\", \"content\": \"UploadUploadUploadUploadUpload\\r\\nUploadUploadUpload\", \"user_id\": 1, \"created_at\": \"2025-05-29T17:40:17.000000Z\", \"updated_at\": \"2025-05-29T17:40:17.000000Z\"}', '2025-05-29 14:40:17', '2025-05-29 14:40:17'),
(114, 77, 'deleted', 1, NULL, '2025-05-29 14:40:20', '2025-05-29 14:40:20'),
(115, 78, 'created', 1, '{\"id\": 78, \"title\": \"Upload\", \"status\": \"published\", \"content\": \"UploadUploadUploadUploadUploadUpload\", \"user_id\": 1, \"created_at\": \"2025-05-29T17:47:10.000000Z\", \"updated_at\": \"2025-05-29T17:47:10.000000Z\"}', '2025-05-29 14:47:10', '2025-05-29 14:47:10'),
(116, 78, 'deleted', 1, NULL, '2025-05-29 14:47:14', '2025-05-29 14:47:14'),
(117, 66, 'updated', 1, '{\"status\": {\"new\": \"published\", \"old\": \"scheduled\"}}', '2025-05-29 15:22:00', '2025-05-29 15:22:00'),
(118, 79, 'created', 1, '{\"id\": 79, \"title\": \"vvvv\", \"status\": \"draft\", \"content\": \"vvvv\", \"user_id\": 1, \"created_at\": \"2025-05-29T18:22:23.000000Z\", \"updated_at\": \"2025-05-29T18:22:23.000000Z\"}', '2025-05-29 15:22:23', '2025-05-29 15:22:23'),
(119, 79, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/1IilydnPgCUXV5nbLPDmIqyi2E0Fqtw1muR7dtqW.png\", \"old\": null}}', '2025-05-29 15:22:23', '2025-05-29 15:22:23'),
(120, 79, 'deleted', 1, NULL, '2025-05-29 15:25:25', '2025-05-29 15:25:25'),
(121, 66, 'deleted', 1, NULL, '2025-05-29 15:25:27', '2025-05-29 15:25:27'),
(122, 53, 'updated', 1, '{\"status\": {\"new\": \"scheduled\", \"old\": \"draft\"}}', '2025-05-29 15:25:35', '2025-05-29 15:25:35'),
(123, 53, 'updated', 1, '{\"status\": {\"new\": \"published\", \"old\": \"scheduled\"}}', '2025-05-29 15:25:42', '2025-05-29 15:25:42'),
(124, 80, 'created', 1, '{\"id\": 80, \"title\": \"ffff\", \"status\": \"draft\", \"content\": \"Ffff\", \"user_id\": 1, \"created_at\": \"2025-05-29T18:26:09.000000Z\", \"updated_at\": \"2025-05-29T18:26:09.000000Z\"}', '2025-05-29 15:26:09', '2025-05-29 15:26:09'),
(125, 80, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/viOZywtky9n7s0R3DduX981o7B8CUzZThagUnjE9.png\", \"old\": null}}', '2025-05-29 15:26:09', '2025-05-29 15:26:09'),
(126, 27, 'deleted', 1, NULL, '2025-05-29 15:26:54', '2025-05-29 15:26:54'),
(127, 80, 'deleted', 1, NULL, '2025-05-29 15:34:22', '2025-05-29 15:34:22'),
(128, 57, 'deleted', 1, NULL, '2025-05-29 15:34:25', '2025-05-29 15:34:25'),
(129, 53, 'deleted', 1, NULL, '2025-05-29 15:34:26', '2025-05-29 15:34:26'),
(130, 26, 'deleted', 1, NULL, '2025-05-29 15:34:27', '2025-05-29 15:34:27'),
(131, 81, 'created', 1, '{\"id\": 81, \"title\": \"About Life\", \"status\": \"draft\", \"content\": \"life is so good to have\", \"user_id\": 1, \"created_at\": \"2025-05-29T18:35:03.000000Z\", \"updated_at\": \"2025-05-29T18:35:03.000000Z\"}', '2025-05-29 15:35:03', '2025-05-29 15:35:03'),
(132, 81, 'updated', 1, '{\"image_url\": {\"new\": \"Posts/cUoBgOMoufqMFL4dF6k3L7l3ej83XRIvaNbIoUB7.png\", \"old\": null}}', '2025-05-29 15:35:03', '2025-05-29 15:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_05_26_203202_create_platforms_table', 2),
(6, '2025_05_26_203727_create_posts_table', 3),
(7, '2025_05_26_204415_create_post_platforms_table', 4),
(9, '2025_05_28_215822_create_activity_logs_table', 5),
(10, '2025_05_28_222933_create_activity_logs_table', 6),
(11, '2025_05_29_000252_add_is_active_to_platforms_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 1, 'apiToken', 'e81e62a94c653e9417eabe4f69cd8fedf49071e6ec084c371f5d1a7052a0fbdc', '[\"*\"]', '2025-05-28 19:26:11', NULL, '2025-05-27 00:47:14', '2025-05-28 19:26:11'),
(4, 'App\\Models\\User', 1, 'apiToken', 'e4f227be343327a40142d1b45e5736eec81d9cb74a5efbffbbc73387db36e1b7', '[\"*\"]', '2025-05-28 21:05:59', NULL, '2025-05-27 19:55:41', '2025-05-28 21:05:59'),
(5, 'App\\Models\\User', 1, 'apiToken', '7d7be782586586e0931f0c839d7c8825020aca7170266e0d9507da884ec3479f', '[\"*\"]', '2025-05-28 00:47:17', NULL, '2025-05-28 00:47:06', '2025-05-28 00:47:17'),
(6, 'App\\Models\\User', 1, 'apiToken', 'd2730265daac625eee1eacc8dd879b96e51697525222b55a59880e7cc5b9c2a9', '[\"*\"]', '2025-05-28 06:54:25', NULL, '2025-05-28 06:17:12', '2025-05-28 06:54:25'),
(7, 'App\\Models\\User', 1, 'apiToken', '44a7f7e7def0fdac6673a651ca4229b366763fcbc2f8e34c2b74657ec776d9fb', '[\"*\"]', NULL, NULL, '2025-05-28 06:54:11', '2025-05-28 06:54:11'),
(8, 'App\\Models\\User', 1, 'apiToken', 'fa0646b26a25745f1463cc957666299f3f3f0b64fffbc6399e7d450a4308ff3a', '[\"*\"]', NULL, NULL, '2025-05-28 10:34:36', '2025-05-28 10:34:36'),
(9, 'App\\Models\\User', 1, 'apiToken', '340f16477e1a52a6f90487217b03672f99a599b8f7c0d983d4ddbcabe8780f77', '[\"*\"]', '2025-05-28 11:16:01', NULL, '2025-05-28 11:11:36', '2025-05-28 11:16:01'),
(10, 'App\\Models\\User', 1, 'apiToken', '66192fe0895880b2ed51b4132388b78a47522aa7502d80f37a92862b953ba49b', '[\"*\"]', NULL, NULL, '2025-05-28 11:30:11', '2025-05-28 11:30:11'),
(11, 'App\\Models\\User', 1, 'apiToken', '4229f277f1fb91a4451d11935ba9a78ffb70ad067efca62813ab660028da855e', '[\"*\"]', NULL, NULL, '2025-05-28 11:33:32', '2025-05-28 11:33:32'),
(12, 'App\\Models\\User', 1, 'apiToken', 'a862ccda2cd3d663cc9f2237d24c7a1aec6de3b510069298370bb2b3a70f015f', '[\"*\"]', NULL, NULL, '2025-05-28 11:47:49', '2025-05-28 11:47:49'),
(13, 'App\\Models\\User', 1, 'apiToken', '0ac7e4c18b089d3473da7c133c10d0469609b2420fed39e91ff12dadbb1471f6', '[\"*\"]', NULL, NULL, '2025-05-28 11:50:25', '2025-05-28 11:50:25'),
(14, 'App\\Models\\User', 1, 'apiToken', '55964b0e33a025993cc13f3402d186005d4554647f3654fe55472882607a0bab', '[\"*\"]', '2025-05-29 13:43:41', NULL, '2025-05-28 14:17:29', '2025-05-29 13:43:41'),
(15, 'App\\Models\\User', 1, 'apiToken', '4b7b76854fcf52174611a964b52b22ffe2f42774ddc68c35cc8d710dc98c82cc', '[\"*\"]', '2025-05-28 14:20:57', NULL, '2025-05-28 14:20:56', '2025-05-28 14:20:57'),
(16, 'App\\Models\\User', 1, 'apiToken', '10ec092141dcb4b9ddb76e7295da76f5ad1313c7ea0a6f92b07ad5cbb4683324', '[\"*\"]', '2025-05-28 14:22:38', NULL, '2025-05-28 14:22:37', '2025-05-28 14:22:38'),
(17, 'App\\Models\\User', 1, 'apiToken', '85f29cb0eae4fdae399f655dcf882ec4930c736af5a599b5becc78e782edb87c', '[\"*\"]', '2025-05-28 14:31:35', NULL, '2025-05-28 14:31:34', '2025-05-28 14:31:35'),
(18, 'App\\Models\\User', 1, 'apiToken', 'e0cee375e4299eb8595ec63bc6b35fccdad3f48740a7229a19c542b6df3096af', '[\"*\"]', '2025-05-28 15:13:31', NULL, '2025-05-28 14:32:27', '2025-05-28 15:13:31'),
(19, 'App\\Models\\User', 1, 'apiToken', '3606f48101d8ba2c1a036b47937e92969f3caadc02f30326d53e34f057bb63af', '[\"*\"]', '2025-05-28 15:19:36', NULL, '2025-05-28 15:19:35', '2025-05-28 15:19:36'),
(20, 'App\\Models\\User', 1, 'apiToken', '85e1f380e7e496c52d66c7eb803aaefe482b835f76d5baf3feb3e4ce30655549', '[\"*\"]', '2025-05-29 15:27:26', NULL, '2025-05-28 15:19:55', '2025-05-29 15:27:26'),
(21, 'App\\Models\\User', 1, 'apiToken', 'ef3a331adf76e16bc029fbe35f48ab291e89c4817c26930b5bd81641530c9445', '[\"*\"]', '2025-05-29 15:08:00', NULL, '2025-05-28 16:08:55', '2025-05-29 15:08:00'),
(22, 'App\\Models\\User', 1, 'apiToken', 'ba213928fd0a96783cefd4b92d8551d9f38ca57f3988b71cc7cffc1c90b23615', '[\"*\"]', '2025-05-29 15:28:26', NULL, '2025-05-29 15:28:24', '2025-05-29 15:28:26'),
(23, 'App\\Models\\User', 1, 'apiToken', 'de709834574bc3f16cf7b44895a94fc420144cbaf8abcb7b32241e7af31f9535', '[\"*\"]', '2025-05-29 15:35:04', NULL, '2025-05-29 15:34:18', '2025-05-29 15:35:04');

-- --------------------------------------------------------

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
CREATE TABLE IF NOT EXISTS `platforms` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `platforms`
--

INSERT INTO `platforms` (`id`, `name`, `type`, `is_active`, `created_at`, `updated_at`) VALUES
(5, 'Instagram', 'instagram', 1, '2025-05-27 01:16:20', '2025-05-29 14:53:13'),
(9, 'Linkedin', 'linkedin', 1, '2025-05-28 18:09:45', '2025-05-28 21:04:17'),
(11, 'twitter', 'twitter', 1, '2025-05-29 14:54:14', '2025-05-29 14:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled_time` datetime DEFAULT NULL,
  `status` enum('draft','scheduled','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `image_url`, `scheduled_time`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(81, 'About Life', 'life is so good to have', 'Posts/cUoBgOMoufqMFL4dF6k3L7l3ej83XRIvaNbIoUB7.png', NULL, 'draft', 1, '2025-05-29 15:35:03', '2025-05-29 15:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `post_platforms`
--

DROP TABLE IF EXISTS `post_platforms`;
CREATE TABLE IF NOT EXISTS `post_platforms` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint UNSIGNED NOT NULL,
  `platform_id` bigint UNSIGNED NOT NULL,
  `platform_status` enum('pending','published','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_platforms_post_id_foreign` (`post_id`),
  KEY `post_platforms_platform_id_foreign` (`platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_platforms`
--

INSERT INTO `post_platforms` (`id`, `post_id`, `platform_id`, `platform_status`, `created_at`, `updated_at`) VALUES
(136, 81, 5, 'pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Haityyyy', 'haidyelhamady@example.com', NULL, '$2y$12$dbcUDirLoBlN2B4/SG83suWIkkXSUTHw5E/PTKsITwYZW1q6Hd7Lq', NULL, '2025-05-27 00:30:01', '2025-05-27 00:43:40');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_platforms`
--
ALTER TABLE `post_platforms`
  ADD CONSTRAINT `post_platforms_platform_id_foreign` FOREIGN KEY (`platform_id`) REFERENCES `platforms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_platforms_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
