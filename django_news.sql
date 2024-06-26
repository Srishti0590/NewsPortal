-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306:4306
-- Generation Time: Sep 30, 2021 at 01:15 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `django_news`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_profile`
--

CREATE TABLE `accounts_profile` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Contact_Number` varchar(10) NOT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_profile`
--

INSERT INTO `accounts_profile` (`id`, `username`, `First_Name`, `Last_Name`, `Contact_Number`, `profile_picture`, `created_date`, `user_id`) VALUES
(1, 'kandel', 'Pradip', 'Kandel', '9807543291', 'static/profile/CheifEditor.jpg', '2021-09-24 05:59:39.540135', 1),
(2, 'Ashok', 'Ashok', 'Shrestha', '986554324', 'static/profile/121460078_1700927956755241_8474843521078721632_n.jpg', '2021-09-24 06:47:17.037932', 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add user', 3, 'add_user'),
(10, 'Can change user', 3, 'change_user'),
(11, 'Can delete user', 3, 'delete_user'),
(12, 'Can view user', 3, 'view_user'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add category', 6, 'add_category'),
(22, 'Can change category', 6, 'change_category'),
(23, 'Can delete category', 6, 'delete_category'),
(24, 'Can view category', 6, 'view_category'),
(25, 'Can add news', 7, 'add_news'),
(26, 'Can change news', 7, 'change_news'),
(27, 'Can delete news', 7, 'delete_news'),
(28, 'Can view news', 7, 'view_news'),
(29, 'Can add articles', 8, 'add_articles'),
(30, 'Can change articles', 8, 'change_articles'),
(31, 'Can delete articles', 8, 'delete_articles'),
(32, 'Can view articles', 8, 'view_articles'),
(33, 'Can add covid', 9, 'add_covid'),
(34, 'Can change covid', 9, 'change_covid'),
(35, 'Can delete covid', 9, 'delete_covid'),
(36, 'Can view covid', 9, 'view_covid'),
(37, 'Can add favourite', 10, 'add_favourite'),
(38, 'Can change favourite', 10, 'change_favourite'),
(39, 'Can delete favourite', 10, 'delete_favourite'),
(40, 'Can view favourite', 10, 'view_favourite'),
(41, 'Can add profile', 11, 'add_profile'),
(42, 'Can change profile', 11, 'change_profile'),
(43, 'Can delete profile', 11, 'delete_profile'),
(44, 'Can view profile', 11, 'view_profile'),
(45, 'Can add advertisement', 12, 'add_advertisement'),
(46, 'Can change advertisement', 12, 'change_advertisement'),
(47, 'Can delete advertisement', 12, 'delete_advertisement'),
(48, 'Can view advertisement', 12, 'view_advertisement');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$rQnmeIiN6gO0tVur3rJ0ls$zqHycJ4lmtLNYWsP1vv2usEuaBqrSibLGIsAupRXPHo=', '2021-09-30 11:12:15.299550', 1, 'kandel', '', '', 'pradipkandel008@gmail.com', 1, 1, '2021-09-24 05:59:38.804746'),
(2, 'pbkdf2_sha256$260000$9PQrPiEtkGKHOL1RvM03WR$y0TCY4S21WEpFVwJw6r73TnbM9GfER8xs0LyCj2ztoo=', '2021-09-30 09:13:14.876511', 0, 'Ashok', '', '', 'srishtiparajuli2056@gmail.com', 0, 1, '2021-09-24 06:47:16.612608');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(11, 'accounts', 'profile'),
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(3, 'auth', 'user'),
(4, 'contenttypes', 'contenttype'),
(12, 'news', 'advertisement'),
(8, 'news', 'articles'),
(6, 'news', 'category'),
(9, 'news', 'covid'),
(10, 'news', 'favourite'),
(7, 'news', 'news'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-09-24 05:58:29.833864'),
(2, 'auth', '0001_initial', '2021-09-24 05:58:38.362934'),
(3, 'accounts', '0001_initial', '2021-09-24 05:58:39.580795'),
(4, 'contenttypes', '0002_remove_content_type_name', '2021-09-24 05:58:40.522753'),
(5, 'auth', '0002_alter_permission_name_max_length', '2021-09-24 05:58:41.401128'),
(6, 'auth', '0003_alter_user_email_max_length', '2021-09-24 05:58:41.635577'),
(7, 'auth', '0004_alter_user_username_opts', '2021-09-24 05:58:41.691794'),
(8, 'auth', '0005_alter_user_last_login_null', '2021-09-24 05:58:42.232713'),
(9, 'auth', '0006_require_contenttypes_0002', '2021-09-24 05:58:42.290693'),
(10, 'auth', '0007_alter_validators_add_error_messages', '2021-09-24 05:58:42.338850'),
(11, 'auth', '0008_alter_user_username_max_length', '2021-09-24 05:58:42.518037'),
(12, 'auth', '0009_alter_user_last_name_max_length', '2021-09-24 05:58:42.664965'),
(13, 'auth', '0010_alter_group_name_max_length', '2021-09-24 05:58:42.935135'),
(14, 'auth', '0011_update_proxy_permissions', '2021-09-24 05:58:43.041035'),
(15, 'auth', '0012_alter_user_first_name_max_length', '2021-09-24 05:58:43.364744'),
(16, 'news', '0001_initial', '2021-09-24 05:58:43.905563'),
(17, 'news', '0002_auto_20210904_0032', '2021-09-24 05:58:45.298862'),
(18, 'news', '0003_articles', '2021-09-24 05:58:45.560871'),
(19, 'news', '0004_news_news_title', '2021-09-24 05:58:45.677063'),
(20, 'news', '0005_alter_news_news_title', '2021-09-24 05:58:46.493189'),
(21, 'news', '0006_alter_news_news_image', '2021-09-24 05:58:47.307705'),
(22, 'news', '0007_alter_news_news_image', '2021-09-24 05:58:47.362616'),
(23, 'news', '0008_alter_news_news_image', '2021-09-24 05:58:47.402615'),
(24, 'news', '0009_auto_20210922_0022', '2021-09-24 05:58:48.808982'),
(25, 'news', '0010_auto_20210922_1726', '2021-09-24 05:58:48.933270'),
(26, 'news', '0011_favourite', '2021-09-24 05:58:50.519913'),
(27, 'sessions', '0001_initial', '2021-09-24 05:58:50.942127'),
(28, 'news', '0012_auto_20210924_1343', '2021-09-24 07:59:09.539828'),
(29, 'news', '0013_auto_20210924_1348', '2021-09-24 08:04:04.152203'),
(30, 'news', '0014_advertisement', '2021-09-24 16:26:17.566283'),
(31, 'accounts', '0002_auto_20210924_2251', '2021-09-24 17:06:54.274617');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5cgi5ocezvbnf8c3lq64lns547x4gj1x', '.eJxVjEsOAiEQBe_C2hC6-Ygu3XsGAt0gowaSYWZlvLtOMgvdvqp6LxHiutSwjjyHicVZgDj8binSI7cN8D22W5fU2zJPSW6K3OmQ1875edndv4MaR_3WmLwHMIwFrDagqaCzRqFNcLJIVIpiyrEkdWQNGdB679EZ7UhHNkq8P8PoNyc:1mVtz5:4NQ0_-RK2TLXz9t0S-glgVDaO8oYg4cBvFKnZaq5gJo', '2021-10-14 11:12:15.495323'),
('ryqwsbpkqbfz98bya28vdaqvflxr0p4v', '.eJxVjMsOwiAQRf-FtSFQmAFcuvcbyPCSqoGktCvjv2uTLnR7zzn3xTxta_XbyIufEzuziZ1-t0DxkdsO0p3arfPY27rMge8KP-jg157y83K4fweVRv3WKKAISNFKUZykBK5EBIFlsuACIRjUKIpRpGzQEtFA0EJFq7XBpDR7fwDDiTaT:1mUjlw:2M4oZxsUFxhk4QAIyOujrbmymVgGrqqQf-c2gSr-WwE', '2021-10-11 06:05:52.462340');

-- --------------------------------------------------------

--
-- Table structure for table `news_advertisement`
--

CREATE TABLE `news_advertisement` (
  `id` bigint(20) NOT NULL,
  `ad_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news_advertisement`
--

INSERT INTO `news_advertisement` (`id`, `ad_title`) VALUES
(5, 'static/uploads/41411900.gif');

-- --------------------------------------------------------

--
-- Table structure for table `news_articles`
--

CREATE TABLE `news_articles` (
  `id` bigint(20) NOT NULL,
  `article_title` varchar(500) DEFAULT NULL,
  `article_description` longtext NOT NULL,
  `created_date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news_articles`
--

INSERT INTO `news_articles` (`id`, `article_title`, `article_description`, `created_date`) VALUES
(3, '9/11 terrorist attacks: Twenty years later', 'The 9/11 terrorist attacks on America came at a time when the United States enjoyed unlimited power. In October 2001, the US launched military attacks in Afghanistan \"to disrupt the use of Afghanistan as a terrorist base of operations and to attack the military capability of the Taliban regime\". Enduring freedom was the name given to this operation.The 20th anniversary of the 9/11 terrorist attacks marked the end of the war on terrorism. US President Joe Biden in a speech said it is up to the \"Afghan leaders to come together, fight for themselves, fight for their nation.\" On September 7, Taliban hoisted their flag over the presidential palace and unveiled their interim government: all male, no women, and overwhelmingly Pushtuns.', '2021-09-27 02:10:34.826203'),
(6, 'Artificial intelligence: Strategic tool in diplomacy', 'The world today is abuzz with ever expanding digitalisation with its grip ever increasing. The first two decades of this century have witnessed its growing use in social, economic and political activities, and even in sensitive security concerns. It appears that without its use nothing can move forward. Amazingly together, artificial intelligence (AI) has been making its speedy progress as an integral part of the digitalisation process to meet the challenges not only of mundane human activities but also of state actions.The term artificial intelligence was first coined by an American scientist, John McCarthy, in 1956, who defined AI as \"the science and engineering of making intelligent machines, especially intelligent computer programs\". Currently, experts define it as a machine-based (computerised) system, for given human defined objectives, making predictions, recommendations or decisions influencing real or virtual environments. Some other experts go further and use the term \"super intelligence\" to describe AI that exceeds human intelligence across any task.', '2021-09-30 07:17:47.103472');

-- --------------------------------------------------------

--
-- Table structure for table `news_category`
--

CREATE TABLE `news_category` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(200) DEFAULT NULL,
  `category_description` longtext NOT NULL,
  `created_date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news_category`
--

INSERT INTO `news_category` (`id`, `category_name`, `category_description`, `created_date`) VALUES
(2, 'Business', 'View the latest business news about the world’s top companies, and explore articles on global markets, finance, tech, and the innovations driving us forward.', '2021-09-24 18:13:08.842536'),
(3, 'Economy', 'The latest news on the economy, job market, real estate industry and workplace. Includes coverage of the Federal Reserve and government spending at the state and national level.', '2021-09-24 18:13:52.957762'),
(4, 'Sports', 'Watch the best live coverage of your favourite sports: Football, Golf, Rugby, Cricket, F1, Boxing, NFL, NBA, plus the latest sports news, transfers & scores.', '2021-09-24 18:14:20.985074'),
(5, 'World', 'Latest news from around the globe, including the nuclear arms race, migration, North Korea, Brexit and more.', '2021-09-24 18:15:00.340456'),
(6, 'Others', 'Latest World news news, comment and analysis from the Guardian, the world\'s leading liberal voice.', '2021-09-24 18:16:01.053346'),
(7, 'Politics', 'Get the latest news in politics from The Daily News. Get breaking news and in-depth coverage with videos and photos.', '2021-09-24 18:17:11.271930'),
(8, 'Culture and Arts', 'Culture & Arts', '2021-09-24 18:17:41.280197'),
(9, 'Health', 'Find the latest news on food &amp; diet, healthcare and healthy living.', '2021-09-27 02:11:25.038173');

-- --------------------------------------------------------

--
-- Table structure for table `news_covid`
--

CREATE TABLE `news_covid` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `new_cases` varchar(500) DEFAULT NULL,
  `recovered_patients` varchar(500) DEFAULT NULL,
  `recovery_percentage` varchar(500) DEFAULT NULL,
  `tests_done` varchar(500) DEFAULT NULL,
  `total_deaths` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news_covid`
--

INSERT INTO `news_covid` (`id`, `created_date`, `new_cases`, `recovered_patients`, `recovery_percentage`, `tests_done`, `total_deaths`) VALUES
(3, '2021-09-24 18:05:47.330635', '1330(RT-PCR 1036+Antigen 294', '1830 patients recovered', '95.5%', '9626 PCR Tests & 3996 antigen tests', '5 deaths'),
(4, '2021-09-26 08:31:31.978571', '34', '32', '34', '45', '3'),
(5, '2021-09-28 02:34:34.107262', '1430(RT-PCR 1036+Antigen 294)', '1830 patients recovered', '95.5%', '9626 PCR Tests & 3996 antigen tests', '5 deaths');

-- --------------------------------------------------------

--
-- Table structure for table `news_favourite`
--

CREATE TABLE `news_favourite` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `news_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `news_news`
--

CREATE TABLE `news_news` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `news_title` varchar(500) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `news_description` longtext DEFAULT NULL,
  `news_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news_news`
--

INSERT INTO `news_news` (`id`, `created_date`, `news_title`, `category_id`, `news_description`, `news_image`) VALUES
(2, '2021-09-24 18:19:03.410284', 'Hopes of tourism revival with new travel rules in place', 5, 'Nepal on Thursday threw away the seven-day quarantine requirement and resumed issuing on-arrival visas to all vaccinated foreign travellers in a bid to bring its virus-ravaged tourism industry back to life.\r\n\r\nVisitors should have received their last dose of Covid-19 vaccine at least 14 full days prior to entering Nepal. Those who are not vaccinated or partially vaccinated will not get on-arrival visas. They have to get their entry permits from Nepali diplomatic missions, and also spend 10 days in quarantine in government-listed hotels.\r\n\r\n\r\n\r\nhttps://bit.ly/2XLKboM', 'static/uploads/thumb.jpg'),
(3, '2021-09-24 18:20:40.197476', 'As MCC becomes a lightning rod for controversy, Deuba is in a tight spot', 7, '“The prime minister thanked the United State\'s government for continued cooperation in the socio-economic development of Nepal,” read the statement issued by the Foreign Ministry. “The conversation also covered various areas of Nepal’s development priorities, the US cooperation and the MCC.”\r\n\r\nThe MCC is a Washington-led programme under which Nepal would receive $500 million in grants from the American government, and it was signed in 2017. Deuba was prime minister then. However, following controversy surrounding the programme, the MCC is yet to be ratified by Nepal’s Parliament, a prerequisite for its implementation in the areas of electricity transmission and transport (road) sector.\r\n\r\nAs MCC Vice President Fatema Z Sumar is set to arrive in Nepal on Thursday, the American programme has become a hot potato once again.\r\n\r\nWhile the ruling Nepali Congress wants to push for its parliamentary ratification, its coalition partners, the Communist Party of Nepal (Maoist Centre) and the CPN (Unified Socialist), have some reservations.', 'static/uploads/thumb_1.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_profile`
--
ALTER TABLE `accounts_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `news_advertisement`
--
ALTER TABLE `news_advertisement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_articles`
--
ALTER TABLE `news_articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_category`
--
ALTER TABLE `news_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_covid`
--
ALTER TABLE `news_covid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_favourite`
--
ALTER TABLE `news_favourite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_favourite_news_id_c304b12d_fk_news_news_id` (`news_id`),
  ADD KEY `news_favourite_user_id_45170680_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `news_news`
--
ALTER TABLE `news_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_news_category_id_f060a768_fk_news_category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_profile`
--
ALTER TABLE `accounts_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `news_advertisement`
--
ALTER TABLE `news_advertisement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `news_articles`
--
ALTER TABLE `news_articles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `news_category`
--
ALTER TABLE `news_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `news_covid`
--
ALTER TABLE `news_covid`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `news_favourite`
--
ALTER TABLE `news_favourite`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `news_news`
--
ALTER TABLE `news_news`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_profile`
--
ALTER TABLE `accounts_profile`
  ADD CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `news_favourite`
--
ALTER TABLE `news_favourite`
  ADD CONSTRAINT `news_favourite_news_id_c304b12d_fk_news_news_id` FOREIGN KEY (`news_id`) REFERENCES `news_news` (`id`),
  ADD CONSTRAINT `news_favourite_user_id_45170680_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `news_news`
--
ALTER TABLE `news_news`
  ADD CONSTRAINT `news_news_category_id_f060a768_fk_news_category_id` FOREIGN KEY (`category_id`) REFERENCES `news_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
