/*
 Navicat Premium Data Transfer

 Source Server         : xampp8
 Source Server Type    : MySQL
 Source Server Version : 100427 (10.4.27-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : mbti_personal

 Target Server Type    : MySQL
 Target Server Version : 100427 (10.4.27-MariaDB)
 File Encoding         : 65001

 Date: 16/08/2023 15:00:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2021_09_19_091817_create_questions_table', 1);
INSERT INTO `migrations` VALUES (6, '2021_09_19_091924_create_reports_table', 1);
INSERT INTO `migrations` VALUES (7, '2023_05_30_051624_create_results_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for reports
-- ----------------------------
DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `userID` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `P` int NOT NULL,
  `I` int NOT NULL,
  `J` int NOT NULL,
  `T` int NOT NULL,
  `E` int NOT NULL,
  `N` int NOT NULL,
  `S` int NOT NULL,
  `F` int NOT NULL,
  `result` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userID`(`userID` ASC) USING BTREE,
  INDEX `result`(`result` ASC) USING BTREE,
  CONSTRAINT `result` FOREIGN KEY (`result`) REFERENCES `results` (`mbti`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reports
-- ----------------------------
INSERT INTO `reports` VALUES (1, 3, 'aeru', 'aeru@gmail.com', 75, 84, 25, 49, 16, 31, 69, 51, 'ISFP', '2023-06-18 22:53:30', '2023-07-06 11:58:42');
INSERT INTO `reports` VALUES (4, 3, 'aeru', 'aeru@gmail.com', 62, 33, 38, 40, 67, 63, 37, 60, 'ENFP', '2023-06-19 00:37:43', '2023-07-06 11:58:42');
INSERT INTO `reports` VALUES (5, 5, 'Sri', 'sri@gmail.com', 80, 20, 20, 20, 80, 20, 80, 80, 'ESFP', '2023-06-27 10:08:19', '2023-06-27 10:08:19');
INSERT INTO `reports` VALUES (6, 4, 'Silento', 'silento2020@gmail.com', 78, 84, 22, 80, 16, 20, 80, 20, 'ISTP', '2023-06-27 10:12:29', '2023-06-27 10:12:29');
INSERT INTO `reports` VALUES (7, 10, 'Garok', 'garok12@gmail.com', 87, 80, 13, 17, 20, 13, 87, 83, 'ISFP', '2023-06-27 10:26:41', '2023-07-31 13:54:40');
INSERT INTO `reports` VALUES (8, 12, 'Udin', 'udin@gmail.com', 40, 37, 60, 62, 63, 47, 53, 38, 'ESTJ', '2023-06-27 10:29:33', '2023-07-04 13:36:36');
INSERT INTO `reports` VALUES (9, 9, 'Aldo', 'aldo@gmail.com', 76, 71, 24, 69, 29, 24, 76, 31, 'ISTP', '2023-06-27 10:31:59', '2023-06-27 10:31:59');
INSERT INTO `reports` VALUES (10, 14, 'Winda Budijayatri', 'windajayatri123@gmail.com', 51, 47, 49, 40, 53, 60, 40, 60, 'ENFP', '2023-06-27 10:36:44', '2023-06-27 10:36:44');
INSERT INTO `reports` VALUES (11, 11, 'Lucky', 'novita.lucky2211@gmail.com', 67, 23, 33, 76, 77, 27, 73, 24, 'ESTP', '2023-06-27 10:37:38', '2023-06-27 10:37:38');
INSERT INTO `reports` VALUES (12, 16, 'Zelfy', 'zelfymen212@gmail.com', 7, 49, 93, 46, 51, 13, 87, 54, 'ESFJ', '2023-06-27 10:45:31', '2023-06-27 10:45:31');
INSERT INTO `reports` VALUES (13, 17, 'Vestia Rama Mahendra', 'ramastore0412@gmail.com', 58, 59, 42, 37, 41, 47, 53, 63, 'ISFP', '2023-06-27 10:57:15', '2023-06-27 10:57:15');
INSERT INTO `reports` VALUES (14, 18, 'Lulu Millati Anjani', 'lulumillati2016@gmail.com', 27, 62, 73, 71, 38, 73, 27, 29, 'INTJ', '2023-06-27 11:12:01', '2023-06-27 11:12:01');
INSERT INTO `reports` VALUES (15, 22, 'Devina Agustin', 'devinaagustin2@gmail.com', 71, 30, 29, 69, 70, 24, 76, 31, 'ESTP', '2023-07-04 13:34:12', '2023-07-04 13:34:12');
INSERT INTO `reports` VALUES (16, 21, 'Ismiraj', 'ismirajuh@upnvj.ac.id', 51, 67, 49, 36, 33, 62, 38, 64, 'INFP', '2023-07-04 13:37:55', '2023-07-04 13:37:55');
INSERT INTO `reports` VALUES (17, 23, 'Fara Diva Prameswari', 'faradivap30@gmail.com', 27, 17, 73, 87, 83, 80, 20, 13, 'ENTJ', '2023-07-04 13:54:50', '2023-07-04 13:54:50');
INSERT INTO `reports` VALUES (18, 24, 'Listya', 'listyaramdhani11@gmail.com', 71, 27, 29, 73, 73, 77, 23, 27, 'ENTP', '2023-07-04 14:10:40', '2023-07-04 14:10:40');
INSERT INTO `reports` VALUES (19, 25, 'Kun', 'djmaru1933@gmail.com', 49, 44, 51, 33, 56, 57, 43, 67, 'ENFJ', '2023-07-04 14:44:05', '2023-07-04 14:44:05');
INSERT INTO `reports` VALUES (20, 26, 'Daffa Zamiira Pradana', 'daffa@gmail.com', 40, 40, 60, 40, 60, 40, 60, 60, 'ESFP', '2023-07-06 15:05:06', '2023-07-06 15:05:06');
INSERT INTO `reports` VALUES (21, 27, 'Lukmanul Hakim', 'iam.lukmanhakim01@gmail.com', 40, 87, 60, 84, 13, 9, 91, 16, 'ISTJ', '2023-07-06 15:24:22', '2023-07-06 15:24:22');
INSERT INTO `reports` VALUES (22, 28, 'Asep', 'fauzanrazak526@gmail.com', 47, 56, 53, 53, 44, 60, 40, 47, 'INTJ', '2023-07-06 18:29:35', '2023-07-06 18:29:35');
INSERT INTO `reports` VALUES (23, 29, 'Muhammad Farhan Alibasyah', 'muhammadfarhanalibasyah4@gmail.com', 30, 27, 70, 76, 73, 20, 80, 24, 'ESTJ', '2023-07-06 19:40:29', '2023-07-06 19:40:29');
INSERT INTO `reports` VALUES (24, 31, 'Dwi Novitasari', 'dwiins89@gmail.com', 7, 7, 93, 98, 93, 13, 87, 2, 'ESTJ', '2023-07-06 21:07:52', '2023-07-06 21:07:52');
INSERT INTO `reports` VALUES (25, 30, 'Indri Oktafiani', 'indrioktafiani7@gmail.com', 84, 7, 16, 91, 93, 2, 98, 9, 'ESTP', '2023-07-06 22:10:53', '2023-07-06 22:10:53');
INSERT INTO `reports` VALUES (26, 32, 'Rahul Ken', 'rahulken@gmail.com', 65, 34, 35, 31, 66, 37, 63, 69, 'ESFP', '2023-07-09 09:12:32', '2023-07-09 17:49:28');
INSERT INTO `reports` VALUES (27, 33, 'Indra Lazuardi', 'jaga06@gmail.com', 65, 40, 35, 31, 60, 66, 34, 69, 'ENFP', '2023-07-09 09:36:58', '2023-07-09 17:48:24');
INSERT INTO `reports` VALUES (28, 34, 'Gaduh Dadi Wibowo', 'gd_wibowo12@gmail.com', 49, 73, 51, 49, 27, 60, 40, 51, 'INFJ', '2023-07-09 09:42:56', '2023-07-09 17:48:35');
INSERT INTO `reports` VALUES (29, 35, 'Cakra Zulkarnain', 'zul78@gmail.com', 55, 31, 45, 37, 69, 69, 31, 63, 'ENFP', '2023-07-09 12:20:32', '2023-07-09 17:49:06');
INSERT INTO `reports` VALUES (30, 36, 'Paulin Kuswandari', 'kuswandari@gmail.com', 73, 60, 27, 70, 40, 57, 43, 30, 'INTP', '2023-07-09 12:26:11', '2023-07-09 16:50:53');
INSERT INTO `reports` VALUES (31, 37, 'Pranawa Maryadi', 'p_maryadi11@gmail.com', 75, 65, 25, 49, 35, 69, 31, 51, 'INFP', '2023-07-09 12:34:18', '2023-07-09 17:48:46');
INSERT INTO `reports` VALUES (32, 38, 'Wahyu Asirwanda H', 'wahyu.asirwanda@gmail.com', 37, 31, 63, 20, 69, 74, 26, 80, 'ENFJ', '2023-07-09 12:48:26', '2023-07-09 16:50:41');
INSERT INTO `reports` VALUES (33, 39, 'Argono Wibisono', 'argono19@gmail.com', 65, 37, 35, 55, 63, 69, 31, 45, 'ENTP', '2023-07-09 12:54:16', '2023-07-09 12:54:16');
INSERT INTO `reports` VALUES (34, 41, 'Kamal Siregar', 'kamal.siregar@gmail.com', 26, 31, 74, 65, 69, 42, 58, 35, 'ESTJ', '2023-07-09 12:59:06', '2023-07-09 12:59:06');
INSERT INTO `reports` VALUES (35, 40, 'Laila Faridah', 'lai_farida@gmail.com', 31, 43, 69, 26, 57, 47, 53, 74, 'ESFJ', '2023-07-09 13:01:59', '2023-07-09 17:49:20');
INSERT INTO `reports` VALUES (36, 42, 'Lurhur Prabowo', 'lurhur_21@gmail.com', 34, 65, 66, 46, 35, 47, 53, 54, 'ISFJ', '2023-07-09 13:05:05', '2023-07-09 13:05:05');
INSERT INTO `reports` VALUES (37, 43, 'Ella Septi Nasyidah', 'ella.nasyidah@gmail.com', 29, 31, 71, 31, 69, 37, 63, 69, 'ESFJ', '2023-07-09 13:13:52', '2023-07-09 13:13:52');
INSERT INTO `reports` VALUES (38, 45, 'Manah Natsir', 'natsir66@gmail.com', 60, 23, 40, 68, 77, 27, 73, 32, 'ESTP', '2023-07-09 13:20:43', '2023-07-09 17:48:55');
INSERT INTO `reports` VALUES (39, 44, 'Jati Baktiadi Irawan', 'jati.irawan@gmail.com', 20, 40, 80, 65, 60, 66, 34, 35, 'ENTJ', '2023-07-09 13:33:39', '2023-07-09 13:33:39');
INSERT INTO `reports` VALUES (40, 46, 'A. Jaya Mansur', 'mansur.jaya@gmail.com', 63, 40, 37, 14, 60, 63, 37, 86, 'ENFP', '2023-07-09 13:39:51', '2023-07-09 13:39:51');
INSERT INTO `reports` VALUES (41, 47, 'Agus Maheswara', 'agus.maheswara@gmail.com', 58, 73, 42, 40, 27, 66, 34, 60, 'INFP', '2023-07-09 13:44:25', '2023-07-09 13:44:25');
INSERT INTO `reports` VALUES (42, 48, 'Daniswara Megantara', 'daniswara@gmail.com', 31, 68, 69, 58, 32, 35, 65, 42, 'ISTJ', '2023-07-09 13:50:43', '2023-07-09 17:49:44');
INSERT INTO `reports` VALUES (43, 50, 'Tri Leo', 'tri11@gmail.com', 78, 31, 22, 31, 69, 30, 70, 69, 'ESFP', '2023-07-09 13:54:42', '2023-07-09 17:49:58');
INSERT INTO `reports` VALUES (44, 49, 'Padmi Purwanti', 'purwanti@gmail.com', 34, 40, 66, 65, 60, 69, 31, 35, 'ENTJ', '2023-07-09 14:03:45', '2023-07-09 14:03:45');
INSERT INTO `reports` VALUES (45, 51, 'Ayu Permata', 'permata02@gmail.com', 58, 80, 42, 40, 20, 66, 34, 60, 'INFP', '2023-07-09 17:55:21', '2023-07-09 17:55:21');
INSERT INTO `reports` VALUES (46, 52, 'Kartika Icha', 'icha79@gmail.com', 23, 29, 77, 60, 71, 37, 63, 40, 'ESTJ', '2023-07-09 18:01:56', '2023-07-09 18:01:56');
INSERT INTO `reports` VALUES (47, 53, 'Asmuni Hakim', 'hakim37@gmail.com', 29, 70, 71, 65, 30, 42, 58, 35, 'ISTJ', '2023-07-09 18:06:41', '2023-07-09 18:06:41');
INSERT INTO `reports` VALUES (48, 54, 'Farah Agustina', 'farah12@gmail.com', 75, 40, 25, 55, 60, 42, 58, 45, 'ESTP', '2023-07-09 18:12:27', '2023-07-09 18:12:27');
INSERT INTO `reports` VALUES (49, 55, 'Kamila Yuni Z', 'kamil_yun12@gmail.com', 23, 75, 77, 36, 25, 74, 26, 64, 'INFJ', '2023-07-09 18:14:42', '2023-07-09 18:14:42');
INSERT INTO `reports` VALUES (50, 56, 'Ade Rahimah', 'rahimah.ade11@gmail.com', 58, 60, 42, 23, 40, 71, 29, 77, 'INFP', '2023-07-09 18:17:08', '2023-07-09 18:17:08');
INSERT INTO `reports` VALUES (51, 57, 'Daliono Wibowo', 'dali.wibowo@gmail.com', 85, 80, 15, 83, 20, 20, 80, 17, 'ISTP', '2023-07-09 18:18:18', '2023-07-09 18:18:18');
INSERT INTO `reports` VALUES (52, 58, 'Karta Tamba', 'tamba15@yahoo.com', 34, 93, 66, 80, 7, 32, 68, 20, 'ISTJ', '2023-07-09 18:41:47', '2023-07-09 18:41:47');
INSERT INTO `reports` VALUES (53, 60, 'Pranata Winarno', 'winarno@gmail.com', 65, 34, 35, 31, 66, 37, 63, 69, 'ESFP', '2023-07-09 19:13:39', '2023-07-09 19:13:39');
INSERT INTO `reports` VALUES (54, 61, 'Gina Rahmawati', 'rahma.gina@gmail.com', 20, 31, 80, 37, 69, 69, 31, 63, 'ENFJ', '2023-07-09 19:20:17', '2023-07-09 19:20:17');
INSERT INTO `reports` VALUES (55, 62, 'Kurnia Habibi', 'habibi60@gmail.com', 73, 60, 27, 70, 40, 57, 43, 30, 'INTP', '2023-07-09 19:32:21', '2023-07-09 19:32:21');
INSERT INTO `reports` VALUES (56, 64, 'Sabrina Wahyuni', 'sabrina14@gmail.com', 73, 31, 27, 51, 69, 74, 26, 49, 'ENFP', '2023-07-09 19:43:18', '2023-07-09 19:43:18');
INSERT INTO `reports` VALUES (57, 65, 'Ani Andriani', 'andriani@gmail.com', 34, 65, 66, 26, 35, 57, 43, 74, 'INFJ', '2023-07-09 19:49:05', '2023-07-09 19:49:05');
INSERT INTO `reports` VALUES (58, 66, 'Purwa Suwarno', 'suwarno10@gmail.com', 37, 80, 63, 43, 20, 69, 31, 57, 'INFJ', '2023-07-09 19:54:54', '2023-07-09 19:54:54');
INSERT INTO `reports` VALUES (59, 63, 'Lantar Widodo', 'lantar.widodo@yahoo.co.id', 37, 80, 63, 20, 20, 71, 29, 80, 'INFJ', '2023-07-09 20:19:40', '2023-07-09 20:19:40');
INSERT INTO `reports` VALUES (60, 67, 'Zaenab Purwanti', 'zaenab48@gmail.com', 68, 65, 32, 34, 35, 27, 73, 66, 'ISFP', '2023-07-09 20:39:13', '2023-07-09 20:39:13');
INSERT INTO `reports` VALUES (61, 68, 'Mumpuni Gunarto', 'gunarto42@gmail.com', 53, 40, 47, 78, 60, 71, 29, 22, 'ENTP', '2023-07-09 20:53:37', '2023-07-09 20:53:37');
INSERT INTO `reports` VALUES (62, 69, 'Omar Artawan P', 'omar77@gmail.com', 23, 68, 77, 37, 32, 45, 55, 63, 'ISFJ', '2023-07-09 21:02:00', '2023-07-09 21:02:00');
INSERT INTO `reports` VALUES (63, 59, 'Yusuf Oman A', 'yusuf21@gmail.com', 20, 93, 80, 26, 7, 22, 78, 74, 'ISFJ', '2023-07-09 21:13:30', '2023-07-09 21:13:30');
INSERT INTO `reports` VALUES (64, 70, 'Makuta Maulana', 'makuta.maulana@yahoo.co.id', 51, 78, 49, 26, 22, 30, 70, 74, 'ISFP', '2023-07-14 19:27:24', '2023-07-14 19:27:24');
INSERT INTO `reports` VALUES (65, 2, 'Udin', 'udin@user.com', 78, 37, 22, 60, 63, 69, 31, 40, 'ENTP', '2023-07-14 19:28:04', '2023-07-14 19:28:04');
INSERT INTO `reports` VALUES (66, 71, 'Edi Suwarno', 'edi16@yahoo.co.id', 29, 40, 71, 20, 60, 45, 55, 80, 'ESFJ', '2023-07-14 19:36:37', '2023-07-14 19:36:37');
INSERT INTO `reports` VALUES (67, 72, 'Devi Astuti', 'astuti.devi@gmail.com', 49, 70, 51, 20, 30, 32, 68, 80, 'ISFJ', '2023-07-14 19:38:46', '2023-07-14 19:38:46');
INSERT INTO `reports` VALUES (68, 73, 'Asmianto Setiawan', 'setiawan.anto@yahoo.co.id', 26, 23, 74, 37, 77, 35, 65, 63, 'ESFJ', '2023-07-14 19:48:16', '2023-07-14 19:48:16');
INSERT INTO `reports` VALUES (69, 75, 'Opung Wibisono', 'opung15@gmail.com', 78, 75, 22, 63, 25, 60, 40, 37, 'INTP', '2023-07-14 19:55:56', '2023-07-14 19:55:56');
INSERT INTO `reports` VALUES (70, 74, 'Satya Manullang', 'satya.manul@gmail.com', 34, 37, 66, 65, 63, 30, 70, 35, 'ESTJ', '2023-07-14 19:59:00', '2023-07-14 19:59:00');
INSERT INTO `reports` VALUES (71, 77, 'Titin Padmasari', 'tisari_17@gmail.com', 65, 34, 35, 60, 66, 80, 20, 40, 'ENTP', '2023-07-14 20:06:07', '2023-07-14 20:06:07');
INSERT INTO `reports` VALUES (72, 76, 'Sakura Fitriani', 'sakura19@gmail.com', 31, 88, 69, 68, 12, 25, 75, 32, 'ISTJ', '2023-07-14 20:17:11', '2023-07-15 12:13:24');
INSERT INTO `reports` VALUES (73, 78, 'Zaenab Andriani', 'an_zaenab22@gmail.com', 23, 68, 77, 34, 32, 37, 63, 66, 'ISFJ', '2023-07-14 20:21:01', '2023-07-14 20:21:01');
INSERT INTO `reports` VALUES (74, 6, 'Aihaju', 'hajuu1263@gmail.com', 75, 50, 25, 31, 50, 71, 29, 69, 'INFP', '2023-07-14 20:37:49', '2023-07-14 20:37:49');
INSERT INTO `reports` VALUES (75, 8, 'Gozhali', 'gozhali@yahoo.com', 70, 34, 30, 23, 66, 50, 50, 77, 'ESFP', '2023-07-14 20:43:48', '2023-07-14 20:43:48');
INSERT INTO `reports` VALUES (76, 79, 'Restu Yance Purwanti', 'purwanti.restu@pratama.ac.id', 26, 17, 74, 70, 83, 83, 17, 30, 'ENTJ', '2023-07-14 21:39:51', '2023-07-14 21:39:51');
INSERT INTO `reports` VALUES (77, 79, 'Restu Yance Purwanti', 'purwanti.restu@pratama.ac.id', 26, 17, 74, 70, 83, 83, 17, 30, 'ENTJ', '2023-07-14 21:41:13', '2023-07-14 21:41:13');
INSERT INTO `reports` VALUES (78, 80, 'Makuta Gunarto', 'gunarto.makuta@gmail.com', 26, 17, 74, 70, 83, 83, 17, 30, 'ENTJ', '2023-07-14 21:51:00', '2023-07-14 21:51:00');
INSERT INTO `reports` VALUES (79, 81, 'Viman Karman Saptono', 'karman43@gmail.com', 29, 80, 71, 73, 20, 7, 93, 27, 'ISTJ', '2023-07-14 22:05:26', '2023-07-14 22:05:26');
INSERT INTO `reports` VALUES (80, 82, 'Jaya Marpaung', 'jaya16@yahoo.co.id', 68, 40, 32, 68, 60, 17, 83, 32, 'ESTP', '2023-07-14 22:13:47', '2023-07-14 22:13:47');
INSERT INTO `reports` VALUES (81, 7, 'Juju', 'juju12634@gmail.com', 29, 60, 71, 58, 40, 74, 26, 42, 'INTJ', '2023-07-14 22:21:09', '2023-07-14 22:21:09');
INSERT INTO `reports` VALUES (82, 84, 'Danu Setiawan', 'danu14@gmail.com', 31, 34, 69, 34, 66, 71, 29, 66, 'ENFJ', '2023-07-14 22:25:31', '2023-07-14 22:25:31');
INSERT INTO `reports` VALUES (83, 85, 'Fathonah Lestari', 'lestari65@gmail.com', 63, 80, 37, 65, 20, 40, 60, 35, 'ISTP', '2023-07-14 22:31:01', '2023-07-14 22:31:01');
INSERT INTO `reports` VALUES (84, 83, 'Via Yuliarti', 'via92@gmail.com', 65, 78, 35, 68, 22, 91, 9, 32, 'INTP', '2023-07-14 22:31:23', '2023-07-14 22:31:23');
INSERT INTO `reports` VALUES (85, 86, 'Saiful Santoso', 'santoso@yahoo.co.id', 29, 78, 71, 83, 22, 91, 9, 17, 'INTJ', '2023-07-14 22:43:04', '2023-07-14 22:43:04');
INSERT INTO `reports` VALUES (86, 87, 'Silvia Siti S', 'silvi58@yahoo.co.id', 43, 80, 57, 80, 20, 89, 11, 20, 'INTJ', '2023-07-14 22:51:18', '2023-07-14 22:51:18');
INSERT INTO `reports` VALUES (87, 88, 'Galur Sutrisno', 'sutrisno.galur@gmail.com', 26, 65, 74, 37, 35, 25, 75, 63, 'ISFJ', '2023-07-14 22:55:50', '2023-07-14 22:55:50');
INSERT INTO `reports` VALUES (88, 89, 'Ibnu Warsa Winarno', 'warsa.ibnu75@gmail.com', 58, 73, 42, 46, 27, 35, 65, 54, 'ISFP', '2023-07-14 23:11:09', '2023-07-14 23:11:09');
INSERT INTO `reports` VALUES (89, 90, 'Yuni Yulianti', 'yuni.yulianti@yahoo.co.id', 75, 58, 25, 55, 42, 63, 37, 45, 'INTP', '2023-07-15 07:16:42', '2023-07-15 07:16:42');
INSERT INTO `reports` VALUES (90, 13, 'Fauziah', 'fauziahherdi16@gmail.com', 40, 58, 60, 70, 42, 74, 26, 30, 'INTJ', '2023-07-15 07:24:58', '2023-07-15 07:24:58');
INSERT INTO `reports` VALUES (91, 15, 'Arul Rachman', 'arulrachmanfaruqhy@gmail.com', 68, 29, 32, 84, 71, 57, 43, 16, 'ENTP', '2023-07-15 10:12:36', '2023-07-15 10:12:36');
INSERT INTO `reports` VALUES (92, 19, 'Ahmad Sanusi', 'ahmad.sanusi@mailinator.com', 26, 31, 74, 43, 69, 66, 34, 57, 'ENFJ', '2023-07-15 10:20:54', '2023-07-15 10:20:54');
INSERT INTO `reports` VALUES (93, 20, 'Salsa', 'salsa@gmail.com', 30, 60, 70, 60, 40, 25, 75, 40, 'ISTP', '2023-07-15 10:26:02', '2023-07-15 10:26:02');
INSERT INTO `reports` VALUES (94, 91, 'Liman Natsir', 'liman.natsir@gmail.com', 17, 70, 83, 37, 30, 74, 26, 63, 'INFJ', '2023-07-15 11:29:32', '2023-07-15 11:29:32');
INSERT INTO `reports` VALUES (95, 92, 'Farhunnisa Namaga', 'far.namaga@gmail.com', 63, 75, 37, 75, 25, 40, 60, 25, 'ISTP', '2023-07-15 11:32:53', '2023-07-15 11:32:53');
INSERT INTO `reports` VALUES (96, 93, 'Jamil Kurniawan', 'jamil.kurniawan@yahoo.co.id', 75, 60, 25, 26, 40, 27, 73, 74, 'ISFP', '2023-07-15 11:37:48', '2023-07-15 11:37:48');
INSERT INTO `reports` VALUES (97, 95, 'Asirwada Jaiman Suwarno', 'suwarno.asir@yahoo.co.id', 65, 26, 35, 40, 74, 80, 20, 60, 'ENFP', '2023-07-15 11:42:17', '2023-07-15 11:42:17');
INSERT INTO `reports` VALUES (98, 94, 'Raina Citra Hariyah', 'citra.hariyah@gmail.com', 34, 26, 66, 46, 74, 22, 78, 54, 'ESFJ', '2023-07-15 11:48:26', '2023-07-15 11:48:26');
INSERT INTO `reports` VALUES (99, 96, 'Anastasia Melani', 'melani.anastasia@gmail.com', 29, 40, 71, 68, 60, 32, 68, 32, 'ESTJ', '2023-07-15 11:48:33', '2023-07-15 11:48:33');
INSERT INTO `reports` VALUES (100, 97, 'Narji Maulana', 'maulana11@gmail.com', 23, 40, 77, 46, 60, 22, 78, 54, 'ESFJ', '2023-07-15 11:52:22', '2023-07-15 11:52:22');
INSERT INTO `reports` VALUES (101, 98, 'Yessi Dian Hassanah', 'yessi.dian12@yahoo.co.id', 26, 34, 74, 34, 66, 25, 75, 66, 'ESFJ', '2023-07-15 11:55:14', '2023-07-15 11:55:14');
INSERT INTO `reports` VALUES (102, 99, 'Rina Utami', 'utami.rina11@gmail.com', 70, 68, 30, 75, 32, 57, 43, 25, 'INTP', '2023-07-15 11:57:45', '2023-07-15 11:57:45');
INSERT INTO `reports` VALUES (103, 100, 'Niyaga Wahyudin', 'niyadin@yahoo.co.id', 68, 65, 32, 78, 35, 57, 43, 22, 'INTP', '2023-07-15 12:03:51', '2023-07-15 12:03:51');
INSERT INTO `reports` VALUES (104, 101, 'Nabila Puspasari', 'nasari@yahoo.co.id', 68, 40, 32, 68, 60, 40, 60, 32, 'ESTP', '2023-07-15 12:06:39', '2023-07-15 12:06:39');
INSERT INTO `reports` VALUES (105, 102, 'Uchita Sabri Pratiwi', 'spratiwi@gmail.com', 43, 43, 57, 43, 57, 66, 34, 57, 'ENFJ', '2023-07-15 12:09:55', '2023-07-15 12:09:55');
INSERT INTO `reports` VALUES (106, 3, 'aeru', 'aeru@gmail.com', 43, 60, 57, 63, 40, 69, 31, 37, 'INTJ', '2023-07-22 20:06:00', '2023-07-22 20:06:00');
INSERT INTO `reports` VALUES (107, 2, 'Udin', 'udin@user.com', 29, 60, 71, 63, 40, 30, 70, 37, 'ESFJ', '2023-07-22 20:10:45', '2023-07-22 20:10:45');
INSERT INTO `reports` VALUES (108, 2, 'Udin', 'udin@user.com', 68, 29, 32, 70, 71, 60, 40, 30, 'ENTP', '2023-07-30 13:02:50', '2023-07-30 13:02:50');
INSERT INTO `reports` VALUES (109, 3, 'aeru', 'aeru@gmail.com', 34, 23, 66, 73, 77, 40, 60, 27, 'ESTJ', '2023-07-31 11:10:28', '2023-07-31 11:10:28');
INSERT INTO `reports` VALUES (110, 10, 'Garok', 'garok12@gmail.com', 65, 23, 35, 73, 77, 74, 26, 27, 'ENTP', '2023-07-31 13:48:33', '2023-07-31 13:54:40');

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `mbti` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `penjelasan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profesi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokoh_terkenal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mbti`(`mbti` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of results
-- ----------------------------
INSERT INTO `results` VALUES (1, 'ENFJ', 'Pemimpin yang karismatik dan menginspirasi, mampu memukau pendengarnya. Kreatif, peduli apa kata orang lain, pandai bergaul, menyukai tantangan, dan butuh apresiasi.', 'Sales, Desainer, Manajer Risiko, Manajer Proyek', 'INFP atau ISFP', 'Abraham Lincoln, Johnny Depp, Oprah Winfrey, Barack Obama', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (2, 'ENFP', 'Semangat yang antusias, kreatif dan bebas bergaul, yang selalu dapat menemukan alasan untuk tersenyum. Ramah, imajinatif, pandai berkomunikasi, dan bisa membaca kebutuhan orang lain.', 'Editor, Copywriter, Manajer Risiko', 'INTJ atau INFJ', 'Bob Dylan, Will Smith, Robin Williams', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (3, 'ENTJ', 'Pemimpin yang pemberani, imajinatif, dan berambisi kuat. Selalu menemukan cara atau menciptakan cara melakukan sesuatu.', 'Auditor, Network administrator, Business Administrator, Financial Analyst, ,Manajer Risiko, Manajer Konstruksi, Manajer proyek', 'INTP atau ISTP', 'Aristoteles, Harrison Ford, Franklin D. Roosevelt', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (4, 'ENTP', 'Pemikir yang cerdas dan serius yang gatal terhadap tantangan intelektual. Sanggup memecahkan masalah yang menantang. Banyak bicara, fleksibel, dan kurang konsisten.', 'Marketing, Copywriter, System Analyst, Manajer Proyek', 'INFJ atau INTJ', 'Thomas Edison, Walt Disney, Alexander the Great', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (5, 'ESFJ', 'Orang yang sangat peduli, sosial dan populer, selalu ingin membantu. Hangat, banyak bicara, membutuhkan keseimbangan, santai, sederhana, teliti, dan rajin merawat apa yang dimiliki.', 'Manajer Proyek, Manajer Kantor', 'ISFP atau INFP', 'Bill Clinton, Sally Field', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (6, 'ESFP', 'Orang yang spontan, bersemangat dan antusias, hidup tidak akan membosankan saat berdekatan dengan mereka. Mudah berteman, ramah, menyenangkan, optimis, ceria, suka menjadi pusat perhatian, menghindari konflik, cepat, dan praktis.', 'Marketing, Sales Representative, Manajer Acara (Event Planner)', 'ISTJ atau ISFJ', 'Bill Clinton, Pablo Picasso, Woody Harrelson', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (7, 'ESTJ', 'Administrator istimewa, tidak ada duanya dalam mengelola sesuatu atau orang. Praktis, sistematis, disiplin, dan cenderung kaku.', 'Sales, Auditor, Akuntan, Business Development Manager, Supply Chain Manager, Human Resource Development', 'ISTP atau INTP', 'George W. Bush, Alec Baldwin', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (8, 'ESTP', 'Orang yang cerdas, bersemangat dan sangat tanggap, benar-benar menikmati hidup yang menantang. Spontan, aktif, enerjik, ceplas-ceplos, berkarisma, mudah beradaptasi.', 'Marketing, Sales, Manajer Proyek', 'ISFJ atau ISTJ', 'Madonna, Donald Trump, Lucille Ball', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (9, 'INFJ', 'Pendiam dan mistis, tetapi idealis yang sangat menginspirasi dan tak kenal lelah. Perhatian, tekun, idealis, visioner. Selalu ingin memahami pola pikir orang lain.', 'Manajer Proyek', 'ESFP atau ESTP', 'Plato, Nelson Mandela, George Harrison(The Beatles), Martin Luther King, Jr.', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (10, 'INFP', 'Orang yang puitis, baik hati dan altruisik, selalu ingin membantu aksi kebaikan. Perhatian dan peka, antusias dan setia, idealis dan perfeksionis, setia kepada prinsip yang digenggam.', 'Copywriter, Editor', 'ENFJ atau ESFJ', 'Audrey Hepburn, J. R. R. Tolkien, Putri Diana, William Shakespeare', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (11, 'INTJ', 'Pemikir yang imajinatif dan orisinil. Memiliki motivasi tinggi untuk menjalankan ide-idenya hingga mencapai tujuan. Visioner, mandiri, dan percaya diri, memiliki kemampuan menganalisa yang bagus, skeptis, kritis, logis, dan kadang keras kepala.', 'Marketing manager, Akuntan, Manajer Proyek, Business Analyst, System Analyst, Auditor, Programmer/IT Support', 'ENFP atau ENTP', 'John F. Kennedy', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (12, 'INTP', 'Menghargai intelektualitas dan pengetahuan, lebih suka bekerja sendiri, kritis, skeptis, mudah curiga dan pesimis, tidak suka memimpin, dan memiliki minat yang jelas.', 'Copywriter, Business Analyst, Programmer/IT Support', 'ENTJ atau ESTJ', 'Albert Einstein, Charles Darwin, Socrates, J.K. Rowling, C.G. Jung, Sir Isaac Newton', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (13, 'ISFJ', 'Pelindung yang sangat berdedikasi dan hangat, selalu siap membela orang yang dicintainya. penuh pertimbangan, serius, ramah, memiliki kemampuan mengorganisasi, detil, dan bisa diandalkan.', 'Desainer, Bagian Keuangan, Manajer Admnisitrasi', 'ESFP atau ESTP', 'Mother Teresa, Michael Caine, Louisa May Alcott', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (14, 'ISFP', 'Seniman yang fleksibel dan mengagumkan, selalu siap menjelajahi dan mengalami hal baru. Berpikiran praktis, menghindari konflik, cenderung tidak mau memimpin, santai.', 'Desainer, Akuntan, Administrator, Manajer Kantor', 'ESFJ atau ENFJ', 'Marilyn Monroe, Barbara Streisand, Paul McCartney, Wolfgang Amadeus Mozart', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (15, 'ISTJ', 'Individu yang praktis dan mengutamakan fakta, yang keandalannya tidak dapat diragukan. Serius, senang pada fakta, tekun, pendengar yang baik, memegang aturan.', 'Business Analyst, Akuntan, Programmer/IT Support, Financial Advisor, Supply Chain Manager, Karier di bidang administrasi', 'ESFP atau ESTP', 'George Washington, Ratu Elizabeth, Henry Ford', '2023-06-18 22:17:02', '2023-07-09 02:00:18');
INSERT INTO `results` VALUES (16, 'ISTP', 'Experimenter yang pemberani dan praktis, menguasai semua jenis alat. Tenang, cenderung kaku, logis, rasional, kritis, percaya diri, pemecah masalah yang baik.', 'Programmer/IT Support', 'ESTJ atau ENTJ', 'Tom Cruise, Clint Eastwood, Keith Richards', '2023-06-18 22:17:02', '2023-07-09 02:00:18');

-- ----------------------------
-- Table structure for statements
-- ----------------------------
DROP TABLE IF EXISTS `statements`;
CREATE TABLE `statements`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `pernyataan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of statements
-- ----------------------------
INSERT INTO `statements` VALUES (1, 'Sikap flesibilitas / spontanitas adalah sesuatu yang sangat merepotkan ketika dalam bekerja', 'P');
INSERT INTO `statements` VALUES (2, 'Anda merasa mudah untuk berkomunikasi dalam bentuk berbicara daripada tulisan', 'E');
INSERT INTO `statements` VALUES (3, 'Anda mencoba untuk membuat rencana terlebih dahulu ketika akan melakukan suatu pekerjaan', 'J');
INSERT INTO `statements` VALUES (4, 'Menjadi orang yang menilai segala sesuatu dengan gambaran khusus dan spesifik', 'F');
INSERT INTO `statements` VALUES (5, 'Anda menganggap diri anda adalah orang yang dapat menemukan ide dan mengembangkannya sekaligus saat didalam suatu diskusi', 'E');
INSERT INTO `statements` VALUES (6, 'Orang yang fokus bergerak dari gambaran umum baru ke detail ', 'N');
INSERT INTO `statements` VALUES (7, 'Anda mencoba untuk mengenal dan peduli akan lingkungan sekitar anda', 'E');
INSERT INTO `statements` VALUES (8, 'Mampu mengembangkan rencana dan tetap berpegang pada rencana itu beserta langkah-langkah praktisnya', 'S');
INSERT INTO `statements` VALUES (9, 'Anda lebih yakin bahwa meyakinkan orang dengan penjelasan yang menyentuh perasaan', 'F');
INSERT INTO `statements` VALUES (10, 'Anda adalah orang yang cenderung berfokus pada sedikit hobi namun mendalam', 'I');
INSERT INTO `statements` VALUES (11, 'Anda sering merasa tertutup dan mandiri dalam beberapa kondisi', 'I');
INSERT INTO `statements` VALUES (12, 'Jadwal dan target adalah situasi yang membuat anda menjadi lebih tertekan', 'P');
INSERT INTO `statements` VALUES (13, 'Biasanya Anda lebih mengandalkan pengalaman Anda daripada imaginasi Anda.', 'S');
INSERT INTO `statements` VALUES (14, 'Pekerjaan Anda cenderung berorientasi pada manusia dan hubungan diantaranya', 'F');
INSERT INTO `statements` VALUES (15, 'Anda merasa lebih cepat merasa kelelahan setelah menghabiskan waktu bersama sekelompok orang.', 'I');
INSERT INTO `statements` VALUES (16, 'Anda cenderung kurang terbuka terhadap aturan dan prosedur yang telah ditetapkan, dan lebih suka melakukan tindakan yang lebih dinamis dan bebas', 'N');
INSERT INTO `statements` VALUES (17, 'Dalam suatu diskusi, pengambilan keputusan harus berdasar kepada keputusan pribadi dan perasaan orang lain', 'F');
INSERT INTO `statements` VALUES (18, 'Anda adalah orang yang relatif bebas dan menyukai perubahan', 'N');
INSERT INTO `statements` VALUES (19, 'Mampu berpikir secara nyata dan realistis', 'J');
INSERT INTO `statements` VALUES (20, 'Anda merasa menjadi pribadi yang senang beraktifitas sendirian di rumah adalah sebagai pengalaman yang sangat menyenangkan', 'I');
INSERT INTO `statements` VALUES (21, 'Jika anda memiliki tim yang dipimpin, anda akan lebih terorganisir dan mengatur dengan tata tertib agar tujuan dapat tercapai', 'J');
INSERT INTO `statements` VALUES (22, 'Imajinasi yang menarik seringkali membuat anda lebih tertarik daripada fakta yang ada', 'N');
INSERT INTO `statements` VALUES (23, 'Anda mencoba untuk mengemukakan tujuan dan sasaran lebih dahulu dalam segala hal cenderung memiliki sifat yang terorganisir, berorientasi pada hasil, dan memiliki kejelasan dalam tindakan.', 'T');
INSERT INTO `statements` VALUES (24, 'Sebagai pekerja, anda adalah orang yang fokus pada target dan mengabaikan hal-hal baru cenderung memiliki sifat tegas dan kurang adaptif terhadap perubahan.', 'J');
INSERT INTO `statements` VALUES (25, 'Gaya kerja Anda lebih mementingkan kontinuitas dan stabilitas dalam suatu tugas', 'S');
INSERT INTO `statements` VALUES (26, 'Kepribadian yang fleksibel, dapat mengubah pendirian sesuai situasi.', 'P');
INSERT INTO `statements` VALUES (27, 'Memiliki kepribadian yang bertindak step by step dengan timeframe jelas cenderung terorganisir, terstruktur, dan terfokus dalam menjalankan tugas.', 'S');
INSERT INTO `statements` VALUES (28, 'Tidak lama bagi anda untuk melibatkan diri dalam segala hal, bahkan yang tidak berhubungan langsung dengan anda', 'E');
INSERT INTO `statements` VALUES (29, 'Anda biasanya lebih memilih tempat yang tenang dan pribadi sebagai lingkungan yang ideal untuk berkonsentrasi dalam melakukan tugas-tugasnya', 'I');
INSERT INTO `statements` VALUES (30, 'Anda biasanya sering mengumpulkan data, mengobservasi dengan seksama, dan menggunakan pemikiran kritis untuk memahami situasi sebelum mengambil keputusan', 'T');
INSERT INTO `statements` VALUES (31, 'Anda orang yang cenderung berhati-hati dalam bertindak dan tidak terburu-buru dalam mengambil langkah', 'I');
INSERT INTO `statements` VALUES (32, 'Anda cenderung yang menghargai seseorang karena sifat dan perilakunya', 'F');
INSERT INTO `statements` VALUES (33, 'Tetap membuka opsi Anda lebih penting daripada memiliki daftar yang harus dilakukan.', 'P');
INSERT INTO `statements` VALUES (34, 'Anda cenderung untuk menarik kesimpulan dengan sangat hati-hati terhadap setiap detail yang ada', 'S');
INSERT INTO `statements` VALUES (35, 'Anda mencoba untuk bisa memberikan ekspresi optimisme terhadap suatu pekerjaan', 'E');
INSERT INTO `statements` VALUES (36, 'Didalam diskusi, anda cenderung untuk memastikan pemahaman yang jelas dan mendalam tentang ide dan teori sebelum melangkah ke tahap praktik', 'S');
INSERT INTO `statements` VALUES (37, 'Anda adalah individu yang memiliki perasaan, bahwa terlalu kaku pada peraturan dan pekerjaan merupakan hal yang kejam', 'F');
INSERT INTO `statements` VALUES (38, 'Komunikator pribadi yang aktif dan mencari peluang untuk berinteraksi secara individu', 'I');
INSERT INTO `statements` VALUES (39, 'Dalam suatu diskusi, perasaan orang lain lebih diutamakan daripada kebenaran yang ada.', 'F');
INSERT INTO `statements` VALUES (40, 'Anda lebih senang berimprovisasi daripada menghabiskan waktu menyiapkan rencana terperinci.', 'P');
INSERT INTO `statements` VALUES (41, 'Anda cenderung berpegang teguh pada ide dan rencana sekarang karena menurut anda itu adalah hal yang penting didalam proyek', 'S');
INSERT INTO `statements` VALUES (42, 'Anda sering merasa tenggelam dalam pikiran sendiri, saat anda sedang bersantai', 'T');
INSERT INTO `statements` VALUES (43, 'Anda cenderung memperhatikan detail dan mengingatnya dengan baik', 'S');
INSERT INTO `statements` VALUES (44, 'Anda merasa tenang dalam situasi yang membuat tertekan dan dapat memunculkan potensi dalam diri anda.', 'P');
INSERT INTO `statements` VALUES (45, 'Berbicara langsung mengenai pekerjaan orang lain adalah hal yang merepotkan dan membuang waktu anda', 'I');
INSERT INTO `statements` VALUES (46, 'Anda menganggap diri Anda lebih konseptual daripada praktis', 'N');
INSERT INTO `statements` VALUES (47, 'Dalam pemikiran, anda membayangkan ide dan rencana yang belum tereksplorasi adalah hal yang merepotkan', 'J');
INSERT INTO `statements` VALUES (48, 'Emosi Anda lebih mengontrol Anda daripada Anda mengontrol emosi Anda.', 'T');
INSERT INTO `statements` VALUES (49, 'Anda merasa menjadi pribadi yang penuh semangat dan antusias ketika membantu orang lain keluar dari kesalahan dan mengarahkan mereka ke jalan yang benar', 'T');
INSERT INTO `statements` VALUES (50, 'Anda merasa khawatir bila anda tidak cepat tanggap untuk merespon terhadap situasi dan kondisi yang sedang berlangsung disekitar', 'P');
INSERT INTO `statements` VALUES (51, 'Dalam pemikiran, anda adalah orang yang menyukai tantangan untuk mendapatkan keterampilan baru', 'N');
INSERT INTO `statements` VALUES (52, 'Anda menganggap diri anda dapat membangun ide ketika sedang berbicara', 'E');
INSERT INTO `statements` VALUES (53, 'Anda sering memilih cara yang menurut anda unik dan belum ada orang lain yang melakukannya', 'N');
INSERT INTO `statements` VALUES (54, 'Anda sering merasa bahwa aturan dalam hidup adalah sesuatu yang wajar dan layak untuk ditaati', 'J');
INSERT INTO `statements` VALUES (55, 'Individu yang memiliki kepribadian yang kuat cenderung memprioritaskan tegaknya standar di atas segalanya', 'T');
INSERT INTO `statements` VALUES (56, 'Daftar perencanaan membuat anda berasa merepotkan', 'J');
INSERT INTO `statements` VALUES (57, 'Dalam kerjasama tim, anda lebih menuntut perlakuan yang adil dan sama pada semua orang', 'T');
INSERT INTO `statements` VALUES (58, 'Dalam pemikiran anda cenderung untuk berfokus pada keterkaitan sebab-akibat sebagai hal yang penting', 'T');
INSERT INTO `statements` VALUES (59, 'Kepribadian yang puas dan merasa berhasil ketika memiliki kemampuan yang baik untuk beradaptasi dengan setiap momentum yang terjadi', 'P');
INSERT INTO `statements` VALUES (60, 'Anda tidak membiarkan orang lain memengaruhi tindakan Anda.', 'E');
INSERT INTO `statements` VALUES (61, 'Anda berifkir bahwa sesuatu yang terencana dan memiliki deadline yang jelas ketika bekerja akan membantu anda untuk fokus', 'J');
INSERT INTO `statements` VALUES (62, 'Anda adalah orang yang cenderung memiliki banyak hiburan yang sifatnya umum seperti orang lain melakukannya', 'E');
INSERT INTO `statements` VALUES (63, 'Anda mencoba untuk mengemukakan kesepakatan terlebih dahulu diawal dalam segala hal agar memiliki rencana untuk mengambil tindakan selanjutnya', 'F');
INSERT INTO `statements` VALUES (64, 'Mampu memvisualisasikan visi untuk masa depan dan membicarakan konsep-konsep yang akan dilakukan dalam visi tersebut', 'N');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noHP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isAdmin` tinyint(1) NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Ini Budi', 'admin@admin.com', '0838xxxxx', '$2y$10$vlFlzN1y3cr8KFbfzg.nDOY5ypjClNBT9mRJw.zfeqpxQVnwXsmNW', 1, '2023-06-18 22:17:02', '0dgfeqiHdNzjUZlvL28zxatdHxGorByxctL7FArLjjfZHg0sLYWcdTGYwgTs', '2023-06-18 22:17:02', '2023-06-18 22:17:02');
INSERT INTO `users` VALUES (2, 'Udin', 'udin@user.com', '12345678', '$2y$10$vlFlzN1y3cr8KFbfzg.nDOY5ypjClNBT9mRJw.zfeqpxQVnwXsmNW', 0, '2023-06-18 22:40:08', 'upSpc9LP5u4lAiWv5r0N6LHy9WSmOEIhR3OXeF85kW7DqHfYLqOUl1tR8QtP', '2023-06-18 22:40:08', '2023-06-18 22:40:08');
INSERT INTO `users` VALUES (3, 'aeru', 'aeru@gmail.com', '087721280750', '$2y$10$qJ6KbdleoHXDL75MDSgQ6utrVuL/DYNHhlFSe3Yi8WbPAO14ipPLO', 0, '2023-06-18 22:41:50', 'Hx9j18zT6xcMWg8E3g5kIOAEcAjjHVueONaKoQEoDAY14XvoRh2SZHukV4D2', '2023-06-18 22:41:51', '2023-07-06 11:58:42');
INSERT INTO `users` VALUES (4, 'Silento', 'silento2020@gmail.com', '08321654987', '$2y$10$IIjView5fuphnn0SAXBaEO6XFDnAdhBFIYwzyAqEef8la43Wnf.7u', 0, '2023-06-27 10:04:24', 'ay5n02GT5PzHMZSM9szWVVXYIomThMQ5kSofAZuJL0fMK1rPySIYWadOseja', '2023-06-27 10:04:24', '2023-06-27 10:04:24');
INSERT INTO `users` VALUES (5, 'Sri', 'sri@gmail.com', '0895378264432', '$2y$10$y.SAXa.nWfbLggixIk7vAOlgCdSW58XIduuin44jJTHIDZb6WWdJ.', 0, '2023-06-27 10:04:42', 'ykD4FpfTyv', '2023-06-27 10:04:42', '2023-06-27 10:04:42');
INSERT INTO `users` VALUES (6, 'Aihaju', 'hajuu1263@gmail.com', '081293293807', '$2y$10$vlFlzN1y3cr8KFbfzg.nDOY5ypjClNBT9mRJw.zfeqpxQVnwXsmNW', 0, '2023-06-27 10:07:37', 'tzs3B3ifvt8Oaxg5KfKPzo7Kw17ptxqMSweah6bijJrqW1pQFgkiboCoSvuz', '2023-06-27 10:07:37', '2023-06-27 10:07:37');
INSERT INTO `users` VALUES (7, 'Juju', 'juju12634@gmail.com', '089123672829', '$2y$10$vlFlzN1y3cr8KFbfzg.nDOY5ypjClNBT9mRJw.zfeqpxQVnwXsmNW', 0, '2023-06-27 10:11:58', 'wB53sAO8pehr7WiNhWWTEMe8fFhxWvNSWPFhePK0AB4jbJiKvUtBJcall9bU', '2023-06-27 10:11:58', '2023-06-27 10:11:58');
INSERT INTO `users` VALUES (8, 'Gozhali', 'gozhali@yahoo.com', '08881728090120', '$2y$10$vlFlzN1y3cr8KFbfzg.nDOY5ypjClNBT9mRJw.zfeqpxQVnwXsmNW', 0, '2023-06-27 10:14:08', 'FXJvo8RnYtTxsTSJ4uxZdKRRwgjBxVYmlDfAnFFPwCl2IkImOF0duojvZbao', '2023-06-27 10:14:08', '2023-06-27 10:14:08');
INSERT INTO `users` VALUES (9, 'Aldo', 'aldo@gmail.com', '089813198738', '$2a$10$vctB5UfzGy0TKvmmDrXqbuW5f5JaHNXIXcNs0qi0mcz6At35eZ1Kq', 0, '2023-06-27 10:17:16', '1XM7DuSKFr', '2023-06-27 10:17:16', '2023-06-27 10:17:16');
INSERT INTO `users` VALUES (10, 'Garok', 'garok12@gmail.com', '08765436478124', '$2y$10$vlFlzN1y3cr8KFbfzg.nDOY5ypjClNBT9mRJw.zfeqpxQVnwXsmNW', 0, '2023-06-27 10:24:22', 'I3C4GaGIlSXoQZq9rZBHtLN5dxo8xyjcHei7fy1Dkp83CJWisqG6SScB0qxu', '2023-06-27 10:24:22', '2023-07-31 13:54:40');
INSERT INTO `users` VALUES (11, 'Lucky', 'novita.lucky2211@gmail.com', '089123472931', '$2y$10$tf2YIYp7iHPyL3yQ.uPM0.W6UXW5lPDPhhsVJStfqySOwIp/frDFi', 0, '2023-06-27 10:26:50', 'te6rg889wW', '2023-06-27 10:26:50', '2023-06-27 10:26:50');
INSERT INTO `users` VALUES (12, 'Udin', 'udin@gmail.com', '088818363910101', '$2y$10$M.y/i/6LUVctilDsCtOC/uZ/A1RnNUoZ.YWq1wAIyrEP0Ifwoo91G', 0, '2023-06-27 10:27:14', 'TCTsWdfSHVK3tfb4c2yRo2G5RN7wJynPHtOI3A8vpfhr1u1P0PQF2JxHHVsM', '2023-06-27 10:27:14', '2023-07-04 13:36:36');
INSERT INTO `users` VALUES (13, 'Fauziah', 'fauziahherdi16@gmail.com', '08222222222', '$2y$10$czZfyB68JeoFbaHQ2mqdOOAC8t.WifVZDH8NDiK.r2BKLU5RWAY5O', 0, '2023-06-27 10:27:35', 'C7Ax3rNmrpNpWMxjtlSqyXE8D50i05RZmNg9mUYT7SfhgvUenLkdqCuHG2Xi', '2023-06-27 10:27:35', '2023-06-27 10:27:35');
INSERT INTO `users` VALUES (14, 'Winda Budijayatri', 'windajayatri123@gmail.com', '082316083338', '$2y$10$qEB9c.Nl0QBmhe8CmDgqMuyYEJDi1CoVnAV32VY8I96VbywLBmnYC', 0, '2023-06-27 10:28:18', 'hQqtiYNOJk', '2023-06-27 10:28:18', '2023-06-27 10:28:18');
INSERT INTO `users` VALUES (15, 'Arul Rachman', 'arulrachmanfaruqhy@gmail.com', '087779751479', '$2y$10$czZfyB68JeoFbaHQ2mqdOOAC8t.WifVZDH8NDiK.r2BKLU5RWAY5O', 0, '2023-06-27 10:36:36', 'tBuwvexXaHbTtxQPR1ih8fARlX8IDBjVILTWhj3SV7VXhCxSRNPUrNoknxqd', '2023-06-27 10:36:36', '2023-06-27 10:36:36');
INSERT INTO `users` VALUES (16, 'Zelfy', 'zelfymen212@gmail.com', '09871274619264', '$2y$10$QKlwRQrSTLFOSM7RUHvhpOXmk1/wvyGLOnVvz6tYXwPvmEAqUuIgq', 0, '2023-06-27 10:37:47', 'yhZ9adO8do', '2023-06-27 10:37:47', '2023-06-27 10:37:47');
INSERT INTO `users` VALUES (17, 'Vestia Rama Mahendra', 'ramastore0412@gmail.com', '08999278922', '$2y$10$/X4nqi5p7Kb29A4cEPwU9OOt9o54krYvpgOFOoIkOMBlDp9/bC5BW', 0, '2023-06-27 10:55:13', 'wZI52tl7IP', '2023-06-27 10:55:14', '2023-06-27 10:55:14');
INSERT INTO `users` VALUES (18, 'Lulu Millati Anjani', 'lulumillati2016@gmail.com', '089619582059', '$2y$10$F2RIbe9bey96pShQmU3N2O461dyErOoFjhTAmGviBsi8qB.wbBvF.', 0, '2023-06-27 11:03:19', 'BLL5yApmui', '2023-06-27 11:03:19', '2023-06-27 11:03:19');
INSERT INTO `users` VALUES (19, 'Ahmad Sanusi', 'ahmad.sanusi@mailinator.com', '089606265960', '$2y$10$czZfyB68JeoFbaHQ2mqdOOAC8t.WifVZDH8NDiK.r2BKLU5RWAY5O', 0, '2023-06-27 11:04:17', '9gStBgDl0xWNhVfEan5b9aHmzygjTpGAbsnogtd6lzUzfvxQFbLoahML5ZDk', '2023-06-27 11:04:17', '2023-06-27 11:04:17');
INSERT INTO `users` VALUES (20, 'Salsa', 'salsa@gmail.com', '089772773', '$2y$10$czZfyB68JeoFbaHQ2mqdOOAC8t.WifVZDH8NDiK.r2BKLU5RWAY5O', 0, '2023-06-27 11:47:22', 'CGa6N05QcDuRo89h6OPOM04re8lY6Ii2inUIa0FVH9brBv6WYMeDpDvnPCcv', '2023-06-27 11:47:22', '2023-06-27 11:47:22');
INSERT INTO `users` VALUES (21, 'Ismiraj', 'ismirajuh@upnvj.ac.id', '089633700034', '$2y$10$8Z7eLWbQnL7zwHgvGpV7geCn5Qeldp69QA0lg55Dn4NxdMuqbYLp2', 0, '2023-07-04 13:27:17', 'MXxlU6iBUN', '2023-07-04 13:27:17', '2023-07-04 13:27:17');
INSERT INTO `users` VALUES (22, 'Devina Agustin', 'devinaagustin2@gmail.com', '089653658355', '$2y$10$22SU4GX1eNgFJSt1FDijXOpdXA/zaEI2NLXNWskoQsj8uIPgwAynm', 0, '2023-07-04 13:30:22', 'ZjbCHMlTWL', '2023-07-04 13:30:22', '2023-07-04 13:30:22');
INSERT INTO `users` VALUES (23, 'Fara Diva Prameswari', 'faradivap30@gmail.com', '089661725067', '$2y$10$x6faF00q2sPBS9dmT/tHVueayVlc7fHCuLWg0M5JsIWCxRJKucymS', 0, '2023-07-04 13:49:48', 'OH0Y0sS80F', '2023-07-04 13:49:48', '2023-07-04 13:49:48');
INSERT INTO `users` VALUES (24, 'Listya', 'listyaramdhani11@gmail.com', '082298729915', '$2y$10$eQ81UlbiQBbt8wPXLdCE8ebxRfESnVF3I7Hq8UI/wnvEizt29ScBa', 0, '2023-07-04 13:57:04', 'Hrir2eqU5w', '2023-07-04 13:57:04', '2023-07-04 13:57:04');
INSERT INTO `users` VALUES (25, 'Kun', 'djmaru1933@gmail.com', '082128672643', '$2y$10$G8NVjwJ//B7endg1SbU0uudeQVTKUkd27qUXd7w.HHqW6cHP310jW', 0, '2023-07-04 14:34:08', 'HFQevWnQx4', '2023-07-04 14:34:08', '2023-07-04 14:34:08');
INSERT INTO `users` VALUES (26, 'Daffa Zamiira Pradana', 'daffa@gmail.com', '088124685581', '$2y$10$EuJBj/OF..TD8uzQFrOjUONQse2Nn29k8wlkUVvuFpkBf4cy5f0Ku', 0, '2023-07-06 15:00:31', '2xGmTZNS23', '2023-07-06 15:00:31', '2023-07-06 15:00:31');
INSERT INTO `users` VALUES (27, 'Lukmanul Hakim', 'iam.lukmanhakim01@gmail.com', '085950810411', '$2y$10$38P5X8WBCf2UYTbhjX/OEOgwKepOabQvJOLq.1fO5p7XBZVwJBUTG', 0, '2023-07-06 15:05:22', 'abZWZPduhh', '2023-07-06 15:05:22', '2023-07-06 15:05:22');
INSERT INTO `users` VALUES (28, 'Asep', 'fauzanrazak526@gmail.com', '083898762341', '$2y$10$Ke6ni0bXbjB49JysDTBliuApotVgZjEPUsMNec7262dkhiFXNvS9a', 0, '2023-07-06 18:26:53', 'bUm54kufFX', '2023-07-06 18:26:53', '2023-07-06 18:26:53');
INSERT INTO `users` VALUES (29, 'Muhammad Farhan Alibasyah', 'muhammadfarhanalibasyah4@gmail.com', '081220405736', '$2y$10$TKjWL5hC5kLGQADJ5dZvW.qYeKZjtws7q8dTDXq22HLM2ZoleIZFC', 0, '2023-07-06 19:33:03', 'Dnczy8yrAY', '2023-07-06 19:33:03', '2023-07-06 19:33:03');
INSERT INTO `users` VALUES (30, 'Indri Oktafiani', 'indrioktafiani7@gmail.com', '085703106074', '$2y$10$ZWB20J.QyaITLwGqbT8fr.aqOPLMAx/SknXsZ8OY39CJ6oZkyJ6ey', 0, '2023-07-06 19:50:08', '1z5z4eNsW2', '2023-07-06 19:50:08', '2023-07-06 19:50:08');
INSERT INTO `users` VALUES (31, 'Dwi Novitasari', 'dwiins89@gmail.com', '081573219981', '$2y$10$Ok7Oh1MJrmFQ7H05K6DBZ.itUoJWux7HRLMLwFdTyvHTE5/GAjR7S', 0, '2023-07-06 20:55:26', 'g6OCWE3Eyh', '2023-07-06 20:55:26', '2023-07-06 20:55:26');
INSERT INTO `users` VALUES (32, 'Rahul Ken', 'rahulken@gmail.com', '081223924653', '$2y$10$notuSjszrwquXzOjui1dHutQCRMJ/RtngGktuEXBrL3mFIPWe9h4O', 0, '2023-07-09 09:08:31', '6mhMXikmH32LJavkt9uLhJT7UIrGIAiaw2mzXc5VCcE7P40LebH6SY9QtPwS', '2023-07-09 09:08:31', '2023-07-09 17:49:28');
INSERT INTO `users` VALUES (33, 'Indra Lazuardi', 'jaga06@gmail.com', '0879583525653', '$2y$10$qibVfVopv1V8rfzCKv3q2uZW1IHkbtJCkdgT1pvvkYv9Ks92XSrCG', 0, '2023-07-09 09:33:36', 'tJD72MeXcXJDzr1tfk4NJnoo6o4RGHDkMijCUNBhQ2eHGaE7ikX67U7lj6xg', '2023-07-09 09:33:36', '2023-07-09 17:48:24');
INSERT INTO `users` VALUES (34, 'Gaduh Dadi Wibowo', 'gd_wibowo12@gmail.com', '0872807658428', '$2y$10$BrRbZYDwTbRqeQhc1d6ldeof5vb2p3Xi6tSI2pkSDCduJWaWLNgbi', 0, '2023-07-09 09:39:20', 'fy1BqYKIoAfq0E9IY3RYxwwW0LDS5222jwJX9UryXDvP4nVCBiIeGF0g9IlL', '2023-07-09 09:39:20', '2023-07-09 17:48:35');
INSERT INTO `users` VALUES (35, 'Cakra Zulkarnain', 'zul78@gmail.com', '085290193729', '$2y$10$OP1BR2uTwTOD6x0eLChip.jwSd7kJA3RK.Zm8c7MD4YUU5wsUWPNO', 0, '2023-07-09 12:17:15', '7GojKlK8fyJOKpkFxCvwuPx8WaqRlQmeC2x1lvAWd5yRuDzGQ8zkIYKKbv1I', '2023-07-09 12:17:15', '2023-07-09 17:49:06');
INSERT INTO `users` VALUES (36, 'Paulin Kuswandari', 'kuswandari@gmail.com', '0884110939912', '$2y$10$ULAkCd.4lokTaYRi/bu6Mup92H0W1dEp8mY2gThJUEQ1a6LmxM3Ty', 0, '2023-07-09 12:22:16', 'RajkKvXf6PaBuArKYJ0UaBi9XkLfcNTmKHHOde4Ou9W6FerqwWNKri2Kp0AO', '2023-07-09 12:22:16', '2023-07-09 16:50:53');
INSERT INTO `users` VALUES (37, 'Pranawa Maryadi', 'p_maryadi11@gmail.com', '08964405035959', '$2y$10$z7Gs.LGgES9VKXJGQKfzlOhkh9gEx9bohIL30ySyMK/JW60s3Qpra', 0, '2023-07-09 12:30:42', 'GVHNCpTaYo7ox8CnrjgTG3AtpmUzJnZZC6cY0IHZGTbJzNg1U43JA1GqyIOA', '2023-07-09 12:30:42', '2023-07-09 17:48:46');
INSERT INTO `users` VALUES (38, 'Wahyu Asirwanda H', 'wahyu.asirwanda@gmail.com', '0865484545494', '$2y$10$.NDWrSepD936ru6gM6klZO8VVNOQriUWpVY7jyVMn2VvqNAIVUNK6', 0, '2023-07-09 12:45:39', 'sihUWsWIFxsCesgybkxX8ZZ6RelWo1D1Uq2vDAItCEu8l3mctIb9d1MhI7od', '2023-07-09 12:45:39', '2023-07-09 16:50:41');
INSERT INTO `users` VALUES (39, 'Argono Wibisono', 'argono19@gmail.com', '0897891961572', '$2y$10$CmFscecNkZfEzf4y20wGieR/PoXszRtbmEexIVLQWVpa9eWQLHCN6', 0, '2023-07-09 12:49:45', 'F5W83JOhDPxP3NhjTKO0aL0VASfFd1NPtCOUgNTD4tTMo2xYF7UTRd8pkvIv', '2023-07-09 12:49:45', '2023-07-09 12:49:45');
INSERT INTO `users` VALUES (40, 'Laila Faridah', 'lai_farida@gmail.com', '081316318355', '$2y$10$3FvPiTLkbt3to8a9K5KHIufolNKAJEq97og9mUOsdjA1j6eWxrVN.', 0, '2023-07-09 12:50:44', 'pY8aS7N7QTyECgNOGa5kBJ2yxxy8r7tnv8q6nJaejvm5REIQggNCC4824FX5', '2023-07-09 12:50:44', '2023-07-09 17:49:20');
INSERT INTO `users` VALUES (41, 'Kamal Siregar', 'kamal.siregar@gmail.com', '0870262653344', '$2y$10$8kmxOO3Z0dlQYghAU0W7bOV8iMob6Pr4HHrQUGfqSZcxhLBcI8Eqy', 0, '2023-07-09 12:55:49', 'iPptGfjDl4EXjdlDxE4EDykGMQ2wx5r5wWF69zinKva0SKDOP9wGyoa5dMjE', '2023-07-09 12:55:49', '2023-07-09 12:55:49');
INSERT INTO `users` VALUES (42, 'Lurhur Prabowo', 'lurhur_21@gmail.com', '089825978838', '$2y$10$6jhSPsKCi.1RJls8t03Uyuny5qBZlpdiST5TnOCx/9/5t7jl1FssO', 0, '2023-07-09 13:00:12', 'gtMPqFvU5MM0qFKDiR9nF3WkoKh4y3NCSIfRbGNDqXRFExHOB6t1g5et0jLS', '2023-07-09 13:00:12', '2023-07-09 13:00:12');
INSERT INTO `users` VALUES (43, 'Ella Septi Nasyidah', 'ella.nasyidah@gmail.com', '0871418089056', '$2y$10$JeUjkiwHBKDKfKxB7gqToegOj5HKoHkSzg/nQ4Lpwj.3IUMf1xqhS', 0, '2023-07-09 13:07:32', 'PfLG8litq7K2BO47bbYaggbJVNebstIRa3B69SstNiIYIr7ROl9iSvs9DLQF', '2023-07-09 13:07:32', '2023-07-09 13:07:32');
INSERT INTO `users` VALUES (44, 'Jati Baktiadi Irawan', 'jati.irawan@gmail.com', '089266295976', '$2y$10$iySGDif7wOHTbEQCWXEP6uYESh4R0wjRqO1dmd7lbAitQxFOpd/kK', 0, '2023-07-09 13:16:25', 'RxtJHv8MUCrlckQl8tz17BUSZ38xcG0frXOjlZ7ZRhbSQqEF7RvaObBw0sJr', '2023-07-09 13:16:25', '2023-07-09 13:16:25');
INSERT INTO `users` VALUES (45, 'Manah Natsir', 'natsir66@gmail.com', '0812631388355', '$2y$10$rA2fJtXHaN3PBRJbFWuE4uF8Y/IdDpmDDR.wegUk9Bq9FMtCSer7i', 0, '2023-07-09 13:16:35', 'cmq28sGW4mmsmfhBxnottjNOaKHLZ436Xif7xpwoOaw47Xd0rsN9fz75l9dR', '2023-07-09 13:16:35', '2023-07-09 17:48:55');
INSERT INTO `users` VALUES (46, 'A. Jaya Mansur', 'mansur.jaya@gmail.com', '0812812720962', '$2y$10$.KqoIRaC8mBI5l7oRvRt5O6TLtBvsoG6EhPwF3vkjFqE/7G5go4Fy', 0, '2023-07-09 13:35:35', 'fTKuMIkThV96dYNyUgJbTGeqC1kv4P4RXBkZJPBUGidFcySc5kB89orQbOEL', '2023-07-09 13:35:35', '2023-07-09 13:35:35');
INSERT INTO `users` VALUES (47, 'Agus Maheswara', 'agus.maheswara@gmail.com', '0812446323339', '$2y$10$GryYfcNtOIvDkzKQvJMeNOjtm3MbmmDCAPRP.YgC3if9Ia7oQgrv2', 0, '2023-07-09 13:41:32', 'kNyr7UQdnFL6lCGXl5fN6C5McxtkY6Fw4qdz2BOmFKg4LpdNz9irm8XfnhKV', '2023-07-09 13:41:32', '2023-07-09 13:41:32');
INSERT INTO `users` VALUES (48, 'Daniswara Megantara', 'daniswara@gmail.com', '081316313552', '$2y$10$I0Gg0jhky3RZYWv2ZyE3POkNtDaPgVP3p.Y7jhSfKtdCIgqGkw15y', 0, '2023-07-09 13:45:54', 'QgZXmznMI3c5edTR5OuaIarDdmzCsN0cXExYpEOXPDvS4OhAFgziOeUA33bd', '2023-07-09 13:45:54', '2023-07-09 17:49:44');
INSERT INTO `users` VALUES (49, 'Padmi Purwanti', 'purwanti@gmail.com', '087475520868', '$2y$10$qttY0VBjq7EgbN7054CbZu3wm.yKlyDECOsadCjGXbKPQq4oArdEy', 0, '2023-07-09 13:48:44', 'RqbxNsUo0s', '2023-07-09 13:48:44', '2023-07-09 13:48:44');
INSERT INTO `users` VALUES (50, 'Tri Leo', 'tri11@gmail.com', '081316312355', '$2y$10$RcrGgeiqDJjk.tj8h3Bj9.nfJhLAaY.ODKvC2TD.ptLccJouB.Ipe', 0, '2023-07-09 13:52:30', 'yB3s4WRrva', '2023-07-09 13:52:30', '2023-07-09 17:49:58');
INSERT INTO `users` VALUES (51, 'Ayu Permata', 'permata02@gmail.com', '086457743442', '$2y$10$aAJiSDBFBROKau8iJZ0jo.AVrZKiLCiiXsmbyDSHuNsDi89gZjP0u', 0, '2023-07-09 17:51:55', 'cD8RdyKhCGBNTNmxxkLcIvSFQpZxwpQQbjo3BRmyOU0XWhrSzGpUBCgtTPH9', '2023-07-09 17:51:55', '2023-07-09 17:51:55');
INSERT INTO `users` VALUES (52, 'Kartika Icha', 'icha79@gmail.com', '083831539028', '$2y$10$BUZ8C4K3rGWVxeO9tmBL9O7ju7j1te8wbmNRQr3F5zDjDtSX22krK', 0, '2023-07-09 17:58:18', 'huCtwUOdSugnD92wYeljLMesaOkrxfym3kMxTgnKvsnYj6HyhCitMYw7AvDW', '2023-07-09 17:58:18', '2023-07-09 17:58:18');
INSERT INTO `users` VALUES (53, 'Asmuni Hakim', 'hakim37@gmail.com', '085325081266', '$2y$10$N.tZefbiz8gZi.4MggvcHer7P3W.DMJkAQMSlMWwXiMHzQmhSV4oe', 0, '2023-07-09 18:03:33', 'k93s8ZhUo3bwblLz8GqDIG1un5mHwJ3aF8mzUaSeDBEeXjoQG8X7WiHXzlWN', '2023-07-09 18:03:33', '2023-07-09 18:03:33');
INSERT INTO `users` VALUES (54, 'Farah Agustina', 'farah12@gmail.com', '087743779039', '$2y$10$BjLSc0bmCKLoMgwv0W1HDuypSyFbLocftTEhJkl9EPA3xWzGRjibG', 0, '2023-07-09 18:09:01', 'Xfmsg6z9YEpaLwFsGuk65ARmRQeKd4sO7nMyzTl3VIOrNX7YUzqNhrjkBj8w', '2023-07-09 18:09:01', '2023-07-09 18:09:01');
INSERT INTO `users` VALUES (55, 'Kamila Yuni Z', 'kamil_yun12@gmail.com', '081681975374', '$2y$10$reFElc3dlVDy7I.wZzktDunRmTS2menvx4ONDpjVNKIT6A5e.Be1S', 0, '2023-07-09 18:10:34', 'sEdyKu8IYnWrTmhcqT3Zk6A21K6Uv0NBZn0h0BaWQ6HGTvEuUwe96EBHGKHW', '2023-07-09 18:10:34', '2023-07-09 18:10:34');
INSERT INTO `users` VALUES (56, 'Ade Rahimah', 'rahimah.ade11@gmail.com', '088638920861', '$2y$10$iOuLXFmz2QChce4x2zG/n.xRXID5NFI0.buQsKBlpR/ildR8S9TJi', 0, '2023-07-09 18:13:37', 'hP5mjyCXqjx2dGysETqxqKDUw8tKlpOJAfffR0OcXHVBxsVVRwCkZvw4AIAd', '2023-07-09 18:13:37', '2023-07-09 18:13:37');
INSERT INTO `users` VALUES (57, 'Daliono Wibowo', 'dali.wibowo@gmail.com', '0812724970659', '$2y$10$WIPx2O6.KgW8yuHPrMXBMe/sEH60GXpyNxQdNXbrYPnzU9wjolZw6', 0, '2023-07-09 18:15:44', 'Rmh8DgifBkpR4Yrf14KwvIsvM8gRPr9Mk7lBLp6D0zmDjYnyDzRfrHsaBOPJ', '2023-07-09 18:15:44', '2023-07-09 18:15:44');
INSERT INTO `users` VALUES (58, 'Karta Tamba', 'tamba15@yahoo.com', '08868355280', '$2y$10$ZNONOTW0vJDrifM7Z8FFf.VMnyDGKL.xLNxcvUaks3TAG57W6pI0q', 0, '2023-07-09 18:22:24', 'OxTQelRdXttOjoRVeCr8dSHY48D0Tm5odGy0lVVFjT600QgzH9FwNO83KJae', '2023-07-09 18:22:24', '2023-07-09 18:22:24');
INSERT INTO `users` VALUES (59, 'Yusuf Oman A', 'yusuf21@gmail.com', '089224171215', '$2y$10$2bQ9HqMZb062E1L5RdAMpeFJ0EfEbarL3mHGyLst5GmWrpoU.HhVe', 0, '2023-07-09 18:45:19', 'oYuN2l5e5P', '2023-07-09 18:45:19', '2023-07-09 18:45:19');
INSERT INTO `users` VALUES (60, 'Pranata Winarno', 'winarno@gmail.com', '088189488412', '$2y$10$E57Vpj4aJzCQYMrONDIIsuHWRoGmDVB9vRbsrWYrq6ssj.rigQ6jS', 0, '2023-07-09 19:08:48', 'DsR77NuxHCAHpzOpWxthZfGQxvRflrpzGmWAZHsQv84mTuw1YbMvw3Cau8St', '2023-07-09 19:08:48', '2023-07-09 19:08:48');
INSERT INTO `users` VALUES (61, 'Gina Rahmawati', 'rahma.gina@gmail.com', '088531151748', '$2y$10$QuICTz2Uubroxj/qgs.kVu8bMRS3R1DNo2hLVgaEqk.s30OcT1rDm', 0, '2023-07-09 19:15:35', 'flTiu72mo8kXuhNxjFwmIlGq3IS47MgG9i8cFx2YbeYuv5a7Y7ckJ09c2ozo', '2023-07-09 19:15:35', '2023-07-09 19:15:35');
INSERT INTO `users` VALUES (62, 'Kurnia Habibi', 'habibi60@gmail.com', '088720563086', '$2y$10$AXdHdPlzYP2FrHp4pBBpkedtHtFFpzzxzOgd68n0HEoncCsj3QPD.', 0, '2023-07-09 19:22:40', 'j3CZWyQmzVknKpIHJaqgWyH3eVpiHP4Vbn2SzRhJ4cbFXOjy2tqOPB9Yf4mi', '2023-07-09 19:22:40', '2023-07-09 19:22:40');
INSERT INTO `users` VALUES (63, 'Lantar Widodo', 'lantar.widodo@yahoo.co.id', '088683552806', '$2y$10$7AGw0u1G8QfuSZZUUBAHGeD8HxuiSo7Uk9YAmKuOZjYndWEO9WiDe', 0, '2023-07-09 19:24:27', 'yyDcr2woZ3tH8u5PwOVGdYEjqP7kzttn2ouSQsSyyLKbv2X9yB1yKiWRWAWh', '2023-07-09 19:24:27', '2023-07-09 19:24:27');
INSERT INTO `users` VALUES (64, 'Sabrina Wahyuni', 'sabrina14@gmail.com', '085311517428', '$2y$10$PDiAW5Zf6kba3MTvqmBYS.wDziPvleL3AbY1p4IKaOICqs1Usbu8G', 0, '2023-07-09 19:38:52', 'jK7YJMrTCEu34W08NUkI2FmavfjgbaFVfVqYf9fE9wqVS3bR6NLNqIqKRMWY', '2023-07-09 19:38:52', '2023-07-09 19:38:52');
INSERT INTO `users` VALUES (65, 'Ani Andriani', 'andriani@gmail.com', '088634874919', '$2y$10$i20877TH0zBKyEzXktbNMeiijwk7M7r8ehAoVXL0.5KYiBkYWHYr6', 0, '2023-07-09 19:44:50', 'baXqe0KGQ5VDlSaaEWMesxuXzkUAyf57iN6dW8mBDzhnMJe5jZNeRAHoYxlT', '2023-07-09 19:44:50', '2023-07-09 19:44:50');
INSERT INTO `users` VALUES (66, 'Purwa Suwarno', 'suwarno10@gmail.com', '081164615324', '$2y$10$p4qFZR.8Ovnc1LK/30Q4GOB1I/TlCJXhWYPbNeKqBAxc5DaBAelOK', 0, '2023-07-09 19:51:57', 'rOoqiLFLw5tBE0HGjmbpYI5QvYh8t4CyfZwQfWz9M9MWjB9QCmD6jGPQU5mn', '2023-07-09 19:51:57', '2023-07-09 19:51:57');
INSERT INTO `users` VALUES (67, 'Zaenab Purwanti', 'zaenab48@gmail.com', '0884922845110', '$2y$10$2ZsiActujJ4kh/e4JsGz2uiY1ea/iOM/CUB6TQEk1Yux/hNKLzPPa', 0, '2023-07-09 20:35:53', 'a4VMGRO5PhopH8KU30GNbD197gXxVHfVCOgYKFrG9BqvIYE8e5Q9vsCs1kOt', '2023-07-09 20:35:53', '2023-07-09 20:35:53');
INSERT INTO `users` VALUES (68, 'Mumpuni Gunarto', 'gunarto42@gmail.com', '082168391021', '$2y$10$dAIpqC0yqEqWZy.rlalj8O7Eh6ObYcHP2FO6I1Mey7OEFECfHIPza', 0, '2023-07-09 20:40:42', 'Cde3m3XMvnBV4gGD2g14YGzAAR51ZIrDXkcj77EsD8fTraSHuNHOW7u4z8b5', '2023-07-09 20:40:42', '2023-07-09 20:40:42');
INSERT INTO `users` VALUES (69, 'Omar Artawan P', 'omar77@gmail.com', '0885773717428', '$2y$10$7.sRgNO4j0EXT6yeru.Ab.r5kntZldjk2IfaM2rpIPqNH.ZnkDwru', 0, '2023-07-09 20:58:00', 'Vogo8tRnqI', '2023-07-09 20:58:00', '2023-07-09 20:58:00');
INSERT INTO `users` VALUES (70, 'Makuta Maulana', 'makuta.maulana@yahoo.co.id', '083211227405', '$2y$10$66O26nn2Z3.Gx./OxuqulOTx28iR5YR66zIcfN4Bz5kVoThgx9EPy', 0, '2023-07-14 19:21:00', 'fAcO5PBYIv7ykhjy29gJNeQGQGdeKbJWKULpXZwDoQuYxPGxYi1k6biZCJEE', '2023-07-14 19:21:00', '2023-07-14 19:21:00');
INSERT INTO `users` VALUES (71, 'Edi Suwarno', 'edi16@yahoo.co.id', '0886705525657', '$2y$10$2Eo1mdf19ZCzEzPyYRCpieqEZGh4gwYDrfTk8HIdGzh1r1dV5Hjpe', 0, '2023-07-14 19:32:09', 'dvzTqLvFUptCbzXiW0jMZhTisXqmdOBNpJ7d7jgYlyHcGXepmlinzBa0oeLn', '2023-07-14 19:32:09', '2023-07-14 19:32:09');
INSERT INTO `users` VALUES (72, 'Devi Astuti', 'astuti.devi@gmail.com', '085630864481', '$2y$10$LxsL35cW.MPYy8H0kc7mGeyqeecE4kqLLRwRkUZd2RrPN8TmBJz2e', 0, '2023-07-14 19:32:12', 'f6Z8FDPTufiK8a4VmeS7GV9wvMlBmwsQJV3BsF8jrCBiT9mk2NyqDZWeT8k4', '2023-07-14 19:32:12', '2023-07-14 19:32:12');
INSERT INTO `users` VALUES (73, 'Asmianto Setiawan', 'setiawan.anto@yahoo.co.id', '089524918654', '$2y$10$yCeQ8k1vpMTzljZovauUQO3FsefPxvgpDxCDgnWcwNb6MTah2kg6G', 0, '2023-07-14 19:41:37', 'cAgW5Im4iob4cBmTugsMnPWGHpGDu57fhPhKlLx1b1JAam093w9AYpDuJI5l', '2023-07-14 19:41:37', '2023-07-14 19:41:37');
INSERT INTO `users` VALUES (74, 'Satya Manullang', 'satya.manul@gmail.com', '082275447093', '$2y$10$ZLRWzp/EoJhlk6vKp5IkW.MkMKUSUgoK9WXl0cdoscxljZnt47xbW', 0, '2023-07-14 19:47:40', '6Yn0E6RRxx9JZRJx3bOGovEzRfzMMNZs69PkPrGIebukYr1X49xsg0ZILK2V', '2023-07-14 19:47:40', '2023-07-14 19:47:40');
INSERT INTO `users` VALUES (75, 'Opung Wibisono', 'opung15@gmail.com', '083343448335', '$2y$10$ipgHSjHsHdffvXvudHT9fOJfRR5XN5aWIjqNe9tEkAr41ZAwUCb8u', 0, '2023-07-14 19:52:09', 'wlRtOOsb0GRFhnn6He8QmFIS0Vt3MddcEAMGu2qy0QJaEWozG6wcNTun8xqf', '2023-07-14 19:52:09', '2023-07-14 19:52:09');
INSERT INTO `users` VALUES (76, 'Sakura Fitriani', 'sakura19@gmail.com', '089623174867', '$2y$10$uSK0VFsdnjEMic44mhoD3ODJx6IsTxsSMATcEiozD6ZNv2AtRoszi', 0, '2023-07-14 20:00:59', 'ooJsdVQInZBbNC3TtO1Y4AjeZi5I0ch9p3wultzpU2BG26vlNyfsSXctTFoy', '2023-07-14 20:00:59', '2023-07-15 12:13:24');
INSERT INTO `users` VALUES (77, 'Titin Padmasari', 'tisari_17@gmail.com', '089624355497', '$2y$10$ITPJyFRrCJ84TybL0nscJuejd7U4TV7HTHPPkcrfBtPB/Ornksmxe', 0, '2023-07-14 20:01:18', 'JuqkCRcehP8BvtYHERyko3EHRNWen9M0i5rOesqAUwSKuKIwplsdKwsoKxxg', '2023-07-14 20:01:18', '2023-07-14 20:01:18');
INSERT INTO `users` VALUES (78, 'Zaenab Andriani', 'an_zaenab22@gmail.com', '083305352879', '$2y$10$S0KH5zwL519VhCXWvHtUfu6W6Bx3AWtdjE5wt3AZGbh8AXtIKdJnC', 0, '2023-07-14 20:07:55', 'qwn13gvgHiTqFpX8CUb85sMEUDRWR1PkODtzlZsggfvt9JZW3mfvo5oRaNrC', '2023-07-14 20:07:55', '2023-07-14 20:07:55');
INSERT INTO `users` VALUES (79, 'Restu Yance Purwanti', 'purwanti.restu@pratama.ac.id', '088464518702', '$2y$10$ifPgQzX5BqGOza7hBYcxJOd25UFAZICJlJlFCgeb.pVGiiB0iNZ86', 0, '2023-07-14 21:32:49', 'EZ6BQWxe9jeJGarqctQSuOeDzQkgw1t3COMENBGpnFqeJLkq6elJ2nFvFvAu', '2023-07-14 21:32:49', '2023-07-14 21:32:49');
INSERT INTO `users` VALUES (80, 'Makuta Gunarto', 'gunarto.makuta@gmail.com', '0897785823277', '$2y$10$uvr.CZdM0KiEnnHyreKjxuDKYqm1AQ/QE6gFxK8mh0OUU3YFDuo/S', 0, '2023-07-14 21:45:20', 'HbNZtDfTkOX8sky55PrcngMCSxOdVIecBoeEfEuqABJkdbrY2ZrOB3ZkNOC3', '2023-07-14 21:45:20', '2023-07-14 21:45:20');
INSERT INTO `users` VALUES (81, 'Viman Karman Saptono', 'karman43@gmail.com', '082196430183', '$2y$10$4c/egJHFH6guUbXFZoEB5ufWLUZk6bhIz46sPygEQSgcTtzXOYQoO', 0, '2023-07-14 21:59:36', '1G7pJNeCZX0Z4iDsN8bkMbGA9yR9dH6jTBjsCXM3ovPlfA8k8Jhr7ps1F2gf', '2023-07-14 21:59:36', '2023-07-14 21:59:36');
INSERT INTO `users` VALUES (82, 'Jaya Marpaung', 'jaya16@yahoo.co.id', '082279182543', '$2y$10$.WpU8VZYs./k1F8H6AoSueKp4IzaUKupS0A3m3u6i8xMvVJUUcTz.', 0, '2023-07-14 22:07:44', '9v9png0zxhBtMD3Rt1RBZpr4W8UzYDNOeg6kCuCc41RuEl5Kkeaytfae7q3m', '2023-07-14 22:07:44', '2023-07-14 22:07:44');
INSERT INTO `users` VALUES (83, 'Via Yuliarti', 'via92@gmail.com', '083358342571', '$2y$10$93FZ6j1R63jH1P2d.1O3hexFD8lgvBmibObiAfS1Ky8ApjYn818le', 0, '2023-07-14 22:17:02', 'T1RIzfdK1Y51ZzwI9D8x1jqdBH9NbuH0cMcitq5ahJtCaDNV1dGmCVNqGuJr', '2023-07-14 22:17:02', '2023-07-14 22:17:02');
INSERT INTO `users` VALUES (84, 'Danu Setiawan', 'danu14@gmail.com', '088347012073', '$2y$10$Lvpld34Gnu0DyeA5teZ29ux2zv/9jcXwI6kcUKBbHw/hZk4JhM8Le', 0, '2023-07-14 22:22:34', 'nVWb2djFSwul5gQy3YzUu5nPK4PL7mgnlkXJjUAfOGB5MmiIkwhVMhaUXsFT', '2023-07-14 22:22:34', '2023-07-14 22:22:34');
INSERT INTO `users` VALUES (85, 'Fathonah Lestari', 'lestari65@gmail.com', '088351573495', '$2y$10$czZfyB68JeoFbaHQ2mqdOOAC8t.WifVZDH8NDiK.r2BKLU5RWAY5O', 0, '2023-07-14 22:26:53', '6Swah3nPnIGqKWSXRTjikvkFOHWstWLnZdMbCGS401GYCeo6ZrBvhnLC7LnW', '2023-07-14 22:26:53', '2023-07-14 22:26:53');
INSERT INTO `users` VALUES (86, 'Saiful Santoso', 'santoso@yahoo.co.id', '085963981264', '$2y$10$KsRfuo/dKZEw09YXWwNAXeJelrU8o/ZIpVyphVRglOg2XpUCRI7hm', 0, '2023-07-14 22:39:14', 'AZj3uWCdEflI2XJ8uhLrfjwqtFIrTYLCre1cRwBU8jZH7CUXnd0n7Aaahv66', '2023-07-14 22:39:14', '2023-07-14 22:39:14');
INSERT INTO `users` VALUES (87, 'Silvia Siti S', 'silvi58@yahoo.co.id', '088417986502', '$2y$10$lPVE5Dr4vPdyAc8n9pQRaOzfQrrVh7xNc6s3cG2qKeatKXwQ8Gxsq', 0, '2023-07-14 22:46:09', 'aiiq1mFSQWXb3aLubPBlL6qsS7McZDhiIoBIhSFyBriRLkcb9ULBrk7dJXOM', '2023-07-14 22:46:09', '2023-07-14 22:46:09');
INSERT INTO `users` VALUES (88, 'Galur Sutrisno', 'sutrisno.galur@gmail.com', '088269828778', '$2y$10$oNBR2NY7tI8J6rZlnqQoPeHCxK4BTsYmZIRR/AiQFui2uqo20bXjC', 0, '2023-07-14 22:53:13', 'dJnXOlUWSfexxfADaMMdcoMdJWDqTpgYGQgAYn4tOWbRgB9IgS2woJjNqQXX', '2023-07-14 22:53:14', '2023-07-14 22:53:14');
INSERT INTO `users` VALUES (89, 'Ibnu Warsa Winarno', 'warsa.ibnu75@gmail.com', '083870735023', '$2y$10$I/f4JcbQQL4CoVctJk1pSeEKYXW0LPqGO2j2ZHCVqlVeq4K2CvOuW', 0, '2023-07-14 23:03:15', 'pSfTmzd01s', '2023-07-14 23:03:15', '2023-07-14 23:03:15');
INSERT INTO `users` VALUES (90, 'Yuni Yulianti', 'yuni.yulianti@yahoo.co.id', '0884154053107', '$2y$10$czZfyB68JeoFbaHQ2mqdOOAC8t.WifVZDH8NDiK.r2BKLU5RWAY5O', 0, '2023-07-15 06:29:41', 'AELsYq6E03Zj2cSXlgU66du4x7k7guvKHESWgxWrZxeiMNmrPGu0KKuP4A03', '2023-07-15 06:29:41', '2023-07-15 06:29:41');
INSERT INTO `users` VALUES (91, 'Liman Natsir', 'liman.natsir@gmail.com', '088637298615', '$2y$10$BAGllTgdUEmo0bcrQGDxzeLpHG7J2VS0isZleQLSUPpiUtG7iRNLy', 0, '2023-07-15 11:27:13', 'T797KykmCT7Hlay2OJJ6qjImmRWEfa4NFCSXiTiGDYxh2nvqe1DFC4lFyEwI', '2023-07-15 11:27:13', '2023-07-15 11:27:13');
INSERT INTO `users` VALUES (92, 'Farhunnisa Namaga', 'far.namaga@gmail.com', '0895128557505', '$2y$10$/b48SUDJcjvTOzcT9bFB2uXs2YOlIUpXBDOZ46plkUOAp5YDKh1.i', 0, '2023-07-15 11:30:31', 'I4PYQUMli4DHgS6m0L7Fc8VZlljXibtQX8enpZIvvllGunnbNKMjzi21iNVs', '2023-07-15 11:30:31', '2023-07-15 11:30:31');
INSERT INTO `users` VALUES (93, 'Jamil Kurniawan', 'jamil.kurniawan@yahoo.co.id', '088678283938', '$2y$10$aRfr76GsWe3qmYSAAo1Mm.N.Fu0a/lz0tDkNTXq2.GrSUKxlvhofK', 0, '2023-07-15 11:34:10', '3skByJQn4Ro8jz72YMafOc6iFVcIFkElaYVvXFJHWdzEkPKS0DXw4AyFzMn3', '2023-07-15 11:34:10', '2023-07-15 11:34:10');
INSERT INTO `users` VALUES (94, 'Raina Citra Hariyah', 'citra.hariyah@gmail.com', '088501319875', '$2y$10$07JAsz5wGJtz8X2iuJS9oO12aswGnkF7ksuw9xcSSs4o.60VQJDAm', 0, '2023-07-15 11:36:02', 'i0BkTNZi8HbGlfWZChDy5e7p7rvqWYBXn7uJO9UyHyJOrzKKmqMiIHfDq3fM', '2023-07-15 11:36:02', '2023-07-15 11:36:02');
INSERT INTO `users` VALUES (95, 'Asirwada Jaiman Suwarno', 'suwarno.asir@yahoo.co.id', '088919328955', '$2y$10$IWYdg/XhVoq8AMRiqwAqHeXjl7oAGK62Le/e0kTPamIw6poJhbexa', 0, '2023-07-15 11:39:22', '7kRmJ5B2m3z5x3I33i1tkcrMGbFqGUGqy40W8sfwnGwUFFV4YcDsjDThr6WK', '2023-07-15 11:39:22', '2023-07-15 11:39:22');
INSERT INTO `users` VALUES (96, 'Anastasia Melani', 'melani.anastasia@gmail.com', '082235458644', '$2y$10$eSBVMKKgRfVqpXH5WVvOguum6F/glmFo9.sN1aaXcOeZHD8mAsgCm', 0, '2023-07-15 11:44:05', 'Hwq7RyRbRDbom3RB1URN41bCyQvsjssAPnvmGMENIVuoVYyjDlqv91iH5l7S', '2023-07-15 11:44:05', '2023-07-15 11:44:05');
INSERT INTO `users` VALUES (97, 'Narji Maulana', 'maulana11@gmail.com', '082201203286', '$2y$10$.VPFrd06FX9iQbziV/rb8.O07LRsjmMQbU/oxqcIZEDJmAGtbSjqa', 0, '2023-07-15 11:49:22', 'UjNyqNO9FvUP9T4fSKxeRzO5jpqSAzwEDhvOzCNSgtheBYZtNGlxNpJjUniS', '2023-07-15 11:49:22', '2023-07-15 11:49:22');
INSERT INTO `users` VALUES (98, 'Yessi Dian Hassanah', 'yessi.dian12@yahoo.co.id', '082164235531', '$2y$10$jiYbwXv//BFax8YwFf.x3utOwT5EhPCS6.t.UdS0vPYNRlfTmiY2K', 0, '2023-07-15 11:49:52', 'sezUuPYN6ZkJXfgpWwJMunlS7waZexqKjHCOOkcDTF0EhKWObAJQ00P5COH3', '2023-07-15 11:49:52', '2023-07-15 11:49:52');
INSERT INTO `users` VALUES (99, 'Rina Utami', 'utami.rina11@gmail.com', '0838158432221', '$2y$10$yjY825iK6c1sWC/SbW/7gexJLDkkapCaRKKRrUdczIw8T3DJJ0mv.', 0, '2023-07-15 11:54:06', 'R1l906JocRDX8CGLGYk099qAKHhhHl2FLZXYHt8xGCVMQUW0R8FIlCcpcuhi', '2023-07-15 11:54:06', '2023-07-15 11:54:06');
INSERT INTO `users` VALUES (100, 'Niyaga Wahyudin', 'niyadin@yahoo.co.id', '089521640798', '$2y$10$Z7jCuCOz.itt7u8MXekL5uQMoSghsWO0UMf461JghVo.Kbjen1wn2', 0, '2023-07-15 11:59:05', 'BCoY9PGIW4Ntql8cpgtPZLioJJO8DXk7vOKntUiuiVsx7p66aOWAwsOYg5va', '2023-07-15 11:59:05', '2023-07-15 11:59:05');
INSERT INTO `users` VALUES (101, 'Nabila Puspasari', 'nasari@yahoo.co.id', '087742321737', '$2y$10$qMJD2J7gjmIQkjV7PfgPk.S.7RMmpeTZqw7aWfuxog9XgflT7jLZi', 0, '2023-07-15 12:04:09', 'b09nhMVkyp', '2023-07-15 12:04:09', '2023-07-15 12:04:09');
INSERT INTO `users` VALUES (102, 'Uchita Sabri Pratiwi', 'spratiwi@gmail.com', '085254528539', '$2y$10$FWVSu21gZkIb55FZHhhf9uh.I193uAEV84BKm.zMbQgW7V7PcBHgq', 0, '2023-07-15 12:05:45', 'o7tytFyUjQvKPV0SdSwqNCInFxlJUrTOu83Z43o5Afn0uJLhRytnQGFo90N1', '2023-07-15 12:05:45', '2023-07-15 12:05:45');

SET FOREIGN_KEY_CHECKS = 1;
