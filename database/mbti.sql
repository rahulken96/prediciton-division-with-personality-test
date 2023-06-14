/*
 Navicat Premium Data Transfer

 Source Server         : xampp8
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : mbti_v1

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 07/06/2023 15:46:47
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
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `pernyataan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, 'Sikap flesibilitas / spontanitas adalah sesuatu yang sangat merepotkan ketika dalam bekerja', 'P');
INSERT INTO `questions` VALUES (2, 'Anda merasa kesulitan untuk mengerti suatu hal dengan bentuk catatan daripada berbicara', 'I');
INSERT INTO `questions` VALUES (3, 'Anda mencoba untuk membuat rencana terlebih dahulu ketika akan melakukan suatu pekerjaan', 'J');
INSERT INTO `questions` VALUES (4, 'Menjadi orang yang menilai segala sesuatu dengan gambaran khusus dan spesifik', 'F');
INSERT INTO `questions` VALUES (5, 'Anda menganggap diri anda adalah orang yang dapat menemukan ide dan mengembangkannya sekaligus saat didalam suatu diskusi', 'E');
INSERT INTO `questions` VALUES (6, 'Orang yang fokus bergerak dari gambaran umum baru ke detail ', 'N');
INSERT INTO `questions` VALUES (7, 'Anda mencoba untuk mengenal dan peduli akan lingkungan sekitar anda', 'E');
INSERT INTO `questions` VALUES (8, 'Mampu mengembangkan rencana dan tetap berpegang pada rencana itu beserta langkah-langkah praktisnya', 'S');
INSERT INTO `questions` VALUES (9, 'Anda lebih yakin bahwa meyakinkan orang dengan penjelasan yang menyentuh perasaan', 'F');
INSERT INTO `questions` VALUES (10, 'Anda adalah orang yang cenderung berfokus pada sedikit hobi namun mendalam', 'I');
INSERT INTO `questions` VALUES (11, 'Anda sering merasa tertutup dan mandiri dalam beberapa kondisi', 'I');
INSERT INTO `questions` VALUES (12, 'Jadwal dan target adalah situasi yang membuat anda menjadi lebih tertekan', 'P');
INSERT INTO `questions` VALUES (13, 'Biasanya Anda lebih mengandalkan pengalaman Anda daripada imaginasi Anda.', 'S');
INSERT INTO `questions` VALUES (14, 'Pekerjaan Anda cenderung berorientasi pada manusia dan hubungan diantaranya', 'F');
INSERT INTO `questions` VALUES (15, 'Anda merasa lebih cepat merasa kelelahan setelah menghabiskan waktu bersama sekelompok orang.', 'I');
INSERT INTO `questions` VALUES (16, 'Gaya kerja Anda lebih dekat dengan langkah-langkah yang metodis dan terorganisir.', 'S');
INSERT INTO `questions` VALUES (17, 'Dalam suatu diskusi, pengambilan keputusan harus berdasar kepada keputusan pribadi dan perasaan orang lain', 'F');
INSERT INTO `questions` VALUES (18, 'Anda adalah orang yang relatif bebas dan menyukai perubahan', 'N');
INSERT INTO `questions` VALUES (19, 'Mampu berpikir secara nyata dan realistis', 'J');
INSERT INTO `questions` VALUES (20, 'Anda merasa menjadi pribadi yang senang beraktifitas sendirian di rumah adalah sebagai pengalaman yang sangat menyenangkan', 'I');
INSERT INTO `questions` VALUES (21, 'Jika anda memiliki tim yang dipimpin, anda lebih memberi kebebasan bertindak asalkan tujuan tercapai', 'P');
INSERT INTO `questions` VALUES (22, 'Imajinasi yang menarik seringkali membuat anda lebih tertarik daripada fakta yang ada', 'N');
INSERT INTO `questions` VALUES (23, 'Anda mencoba untuk mengemukakan tujuan dan sasaran lebih dahulu dalam segala hal cenderung memiliki sifat yang terorganisir, berorientasi pada hasil, dan memiliki kejelasan dalam tindakan.', 'T');
INSERT INTO `questions` VALUES (24, 'Sebagai pekerja, anda adalah orang yang fokus pada target dan mengabaikan hal-hal baru cenderung memiliki sifat tegas dan kurang adaptif terhadap perubahan.', 'J');
INSERT INTO `questions` VALUES (25, 'Gaya kerja Anda lebih mementingkan kontinuitas dan stabilitas dalam suatu tugas', 'S');
INSERT INTO `questions` VALUES (26, 'Kepribadian yang fleksibel, dapat mengubah pendirian sesuai situasi.', 'P');
INSERT INTO `questions` VALUES (27, 'Memiliki kepribadian yang bertindak step by step dengan timeframe jelas cenderung terorganisir, terstruktur, dan terfokus dalam menjalankan tugas.', 'S');
INSERT INTO `questions` VALUES (28, 'Tidak lama bagi anda untuk melibatkan diri dalam segala hal, bahkan yang tidak berhubungan langsung dengan anda', 'E');
INSERT INTO `questions` VALUES (29, 'Anda biasanya lebih memilih tempat yang tenang dan pribadi sebagai lingkungan yang ideal untuk berkonsentrasi dalam melakukan tugas-tugasnya', 'I');
INSERT INTO `questions` VALUES (30, 'Anda biasanya sering mengumpulkan data, mengobservasi dengan seksama, dan menggunakan pemikiran kritis untuk memahami situasi sebelum mengambil keputusan', 'T');
INSERT INTO `questions` VALUES (31, 'Anda orang yang cenderung berhati-hati dalam bertindak dan tidak terburu-buru dalam mengambil langkah', 'I');
INSERT INTO `questions` VALUES (32, 'Anda cenderung yang menghargai seseorang karena sifat dan perilakunya', 'F');
INSERT INTO `questions` VALUES (33, 'Tetap membuka opsi Anda lebih penting daripada memiliki daftar yang harus dilakukan.', 'P');
INSERT INTO `questions` VALUES (34, 'Anda cenderung untuk menarik kesimpulan dengan sangat hati-hati terhadap setiap detail yang ada', 'S');
INSERT INTO `questions` VALUES (35, 'Anda mencoba untuk bisa memberikan ekspresi optimisme terhadap suatu pekerjaan', 'E');
INSERT INTO `questions` VALUES (36, 'Didalam diskusi, anda cenderung untuk memastikan pemahaman yang jelas dan mendalam tentang ide dan teori sebelum melangkah ke tahap praktik', 'S');
INSERT INTO `questions` VALUES (37, 'Pendekatan profesional tidak memperbolehkan melibatkan perasaan pribadi.', 'T');
INSERT INTO `questions` VALUES (38, 'Komunikator pribadi yang aktif dan mencari peluang untuk berinteraksi secara individu', 'I');
INSERT INTO `questions` VALUES (39, 'Dalam suatu diskusi, perasaan orang lain lebih diutamakan daripada kebenaran yang ada.', 'F');
INSERT INTO `questions` VALUES (40, 'Anda lebih senang berimprovisasi daripada menghabiskan waktu menyiapkan rencana terperinci.', 'P');
INSERT INTO `questions` VALUES (41, 'Anda cenderung berpegang teguh pada ide dan rencana sekarang karena menurut anda itu adalah hal yang penting didalam proyek', 'S');
INSERT INTO `questions` VALUES (42, 'Anda sering merasa tenggelam dalam pikiran sendiri, saat anda sedang bersantai', 'T');
INSERT INTO `questions` VALUES (43, 'Anda cenderung memperhatikan detail dan mengingatnya dengan baik', 'S');
INSERT INTO `questions` VALUES (44, 'Anda merasa tenang dalam situasi yang membuat tertekan dan dapat memunculkan potensi dalam diri anda.', 'P');
INSERT INTO `questions` VALUES (45, 'Berbicara langsung mengenai pekerjaan orang lain adalah hal yang merepotkan dan membuang waktu anda', 'I');
INSERT INTO `questions` VALUES (46, 'Anda menganggap diri Anda lebih konseptual daripada praktis', 'N');
INSERT INTO `questions` VALUES (47, 'Dalam pemikiran, anda membayangkan ide dan rencana yang belum tereksplorasi adalah hal yang merepotkan', 'J');
INSERT INTO `questions` VALUES (48, 'Emosi Anda lebih mengontrol Anda daripada Anda mengontrol emosi Anda.', 'T');
INSERT INTO `questions` VALUES (49, 'Anda merasa menjadi pribadi yang penuh semangat dan antusias ketika membantu orang lain keluar dari kesalahan dan mengarahkan mereka ke jalan yang benar', 'T');
INSERT INTO `questions` VALUES (50, 'Anda merasa khawatir bila anda tidak cepat tanggap untuk merespon terhadap situasi dan kondisi yang sedang berlangsung disekitar', 'P');
INSERT INTO `questions` VALUES (51, 'Dalam pemikiran, anda adalah orang yang menyukai tantangan untuk mendapatkan keterampilan baru', 'N');
INSERT INTO `questions` VALUES (52, 'Anda menganggap diri anda dapat membangun ide ketika sedang berbicara', 'E');
INSERT INTO `questions` VALUES (53, 'Anda sering memilih cara yang menurut anda unik dan belum ada orang lain yang melakukannya', 'N');
INSERT INTO `questions` VALUES (54, 'Anda sering merasa bahwa aturan dalam hidup adalah sesuatu yang wajar dan layak untuk ditaati', 'J');
INSERT INTO `questions` VALUES (55, 'Individu yang memiliki kepribadian yang kuat cenderung memprioritaskan tegaknya standar di atas segalanya', 'T');
INSERT INTO `questions` VALUES (56, 'Daftar perencanaan membuat anda berasa merepotkan', 'J');
INSERT INTO `questions` VALUES (57, 'Dalam kerjasama tim, anda lebih menuntut perlakuan yang adil dan sama pada semua orang', 'T');
INSERT INTO `questions` VALUES (58, 'Dalam pemikiran anda cenderung untuk berfokus pada keterkaitan sebab-akibat sebagai hal yang penting', 'T');
INSERT INTO `questions` VALUES (59, 'Kepribadian yang puas dan merasa berhasil ketika memiliki kemampuan yang baik untuk beradaptasi dengan setiap momentum yang terjadi', 'P');
INSERT INTO `questions` VALUES (60, 'Anda tidak membiarkan orang lain memengaruhi tindakan Anda.', 'E');

-- ----------------------------
-- Table structure for reports
-- ----------------------------
DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reports
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of results
-- ----------------------------
INSERT INTO `results` VALUES (1, 'ENFJ', 'Pemimpin yang karismatik dan menginspirasi, mampu memukau pendengarnya. Kreatif, peduli apa kata orang lain, pandai bergaul, menyukai tantangan, dan butuh apresiasi.', 'Konsultan, Psikolog, Pengajar, Marketing, Entertainer, Penulis, Motivator', 'INFP atau ISFP', 'Abraham Lincoln, Johnny Depp, Oprah Winfrey, Barack Obama', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (2, 'ENFP', 'Semangat yang antusias, kreatif dan bebas bergaul, yang selalu dapat menemukan alasan untuk tersenyum. Ramah, imajinatif, pandai berkomunikasi, dan bisa membaca kebutuhan orang lain.', 'Psikolog, Entertainer, Pengajar, Motivator, Presenter, Reporter, MC, Seniman', 'INTJ atau INFJ', 'Bob Dylan, Will Smith, Robin Williams', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (3, 'ENTJ', 'Pemimpin yang pemberani, imajinatif, dan berambisi kuat. Selalu menemukan cara atau menciptakan cara melakukan sesuatu.', 'Pebisnis, Pengacara, Hakim, Konsultan, Pemimpin Organisasi', 'INTP atau ISTP', 'Aristoteles, Harrison Ford, Franklin D. Roosevelt', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (4, 'ENTP', 'Pemikir yang cerdas dan serius yang gatal terhadap tantangan intelektual. Sanggup memecahkan masalah yang menantang. Banyak bicara, fleksibel, dan kurang konsisten.', 'Pengacara, Psikolog, Konsultan, Ilmuwan, Aktor, Marketing', 'INFJ atau INTJ', 'Thomas Edison, Walt Disney, Alexander the Great', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (5, 'ESFJ', 'Orang yang sangat peduli, sosial dan populer, selalu ingin membantu. Hangat, banyak bicara, membutuhkan keseimbangan, santai, sederhana, teliti, dan rajin merawat apa yang dimiliki.', 'Perencana Keuangan, Perawat, Guru, Bidang anak-anak', 'ISFP atau INFP', 'Bill Clinton, Sally Field', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (6, 'ESFP', 'Orang yang spontan, bersemangat dan antusias, hidup tidak akan membosankan saat berdekatan dengan mereka. Mudah berteman, ramah, menyenangkan, optimis, ceria, suka menjadi pusat perhatian, menghindari konflik, cepat, dan praktis.', 'Entertainer, Seniman, Marketing, Konselor, Desainer, Tour Guide', 'ISTJ atau ISFJ', 'Bill Clinton, Pablo Picasso, Woody Harrelson', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (7, 'ESTJ', 'Administrator istimewa, tidak ada duanya dalam mengelola sesuatu atau orang. Praktis, sistematis, disiplin, dan cenderung kaku.', 'Militer, Manajer, Polisi, Hakim, Pengacara, Guru, Sales, Auditor, Akuntan', 'ISTP atau INTP', 'George W. Bush, Alec Baldwin', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (8, 'ESTP', 'Orang yang cerdas, bersemangat dan sangat tanggap, benar-benar menikmati hidup yang menantang. Spontan, aktif, enerjik, ceplas-ceplos, berkarisma, mudah beradaptasi.', 'Marketing, Sales, Polisi, Pebisnis, Pialang Saham', 'ISFJ atau ISTJ', 'Madonna, Donald Trump, Lucille Ball', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (9, 'INFJ', 'Pendiam dan mistis, tetapi idealis yang sangat menginspirasi dan tak kenal lelah. Perhatian, tekun, idealis, visioner. Selalu ingin memahami pola pikir orang lain.', 'Pengajar, Psikolog, Dokter, Konselor, Pekerja Sosial, Fotografer, Seniman', 'ESFP atau ESTP', 'Plato, Nelson Mandela, George Harrison(The Beatles), Martin Luther King, Jr.', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (10, 'INFP', 'Orang yang puitis, baik hati dan altruisik, selalu ingin membantu aksi kebaikan. Perhatian dan peka, antusias dan setia, idealis dan perfeksionis, setia kepada prinsip yang digenggam.', 'Penulis, Sastrawan, Konselor, Psikolog, Pengajar, Seniman, Pemuka Agama', 'ENFJ atau ESFJ', 'Audrey Hepburn, J. R. R. Tolkien, Putri Diana, William Shakespeare', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (11, 'INTJ', 'Pemikir yang imajinatif dan orisinil. Memiliki motivasi tinggi untuk menjalankan ide-idenya hingga mencapai tujuan. Visioner, mandiri, dan percaya diri, memiliki kemampuan menganalisa yang bagus, skeptis, kritis, logis, dan kadang keras kepala.', 'Peneliti, Ilmuan, Insinyur, Teknisi, Hakim, Programmer', 'ENFP atau ENTP', 'John F. Kennedy', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (12, 'INTP', 'Menghargai intelektualitas dan pengetahuan, lebih suka bekerja sendiri, kritis, skeptis, mudah curiga dan pesimis, tidak suka memimpin, dan memiliki minat yang jelas.', 'Penulis Buku Teknis, Ahli Forensik, Jaksa, Pengacara, Teknisi', 'ENTJ atau ESTJ', 'Albert Einstein, Charles Darwin, Socrates, J.K. Rowling, C.G. Jung, Sir Isaac Newton', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (13, 'ISFJ', 'Pelindung yang sangat berdedikasi dan hangat, selalu siap membela orang yang dicintainya. penuh pertimbangan, serius, ramah, memiliki kemampuan mengorganisasi, detil, dan bisa diandalkan.', 'Desainer, Konselor, Penjaga Toko/Perpustakaan, Dunia Perhotelan.', 'ESFP atau ESTP', 'Mother Teresa, Michael Caine, Louisa May Alcott', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (14, 'ISFP', 'Seniman yang fleksibel dan mengagumkan, selalu siap menjelajahi dan mengalami hal baru. Berpikiran praktis, menghindari konflik, cenderung tidak mau memimpin, santai.', 'Seniman, Desainer, Pekerja Sosial, Psikolog, Guru, Aktor', 'ESFJ atau ENFJ', 'Marilyn Monroe, Barbara Streisand, Paul McCartney, Wolfgang Amadeus Mozart', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (15, 'ISTJ', 'Individu yang praktis dan mengutamakan fakta, yang keandalannya tidak dapat diragukan. Serius, senang pada fakta, tekun, pendengar yang baik, memegang aturan.', 'Polisi, Hakim, Pengacara, Dokter, Akuntan, Pemimpin Militer', 'ESFP atau ESTP', 'George Washington, Ratu Elizabeth, Henry Ford', '2023-05-30 06:25:29', '2023-05-30 06:25:29');
INSERT INTO `results` VALUES (16, 'ISTP', 'Experimenter yang pemberani dan praktis, menguasai semua jenis alat. Tenang, cenderung kaku, logis, rasional, kritis, percaya diri, pemecah masalah yang baik.', 'Polisi, Programmer, Ahli Komputer, Teknisi, Insinyur, Mekanik, Pilot, Atlet', 'ESTJ atau ENTJ', 'Tom Cruise, Clint Eastwood, Keith Richards', '2023-05-30 06:25:29', '2023-05-30 06:25:29');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noHP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `isAdmin` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Rosemary Gutkowski III', 'admin@admin.com', '+12605420526', '2023-05-30 06:25:29', '$2y$10$Wp.03.qQ5/gUwP.oAyBP8.b0CLjFiCSMQgWfzePQSZxVNIT2.mvn2', 'hZKWBjL8bjA3xpXHAie4YtR2qGGmmcvQiUJsRTTwFMV7fLg9R8CRzdRWd7rR', 1, '2023-05-30 06:25:29', '2023-05-30 06:25:29');

SET FOREIGN_KEY_CHECKS = 1;
