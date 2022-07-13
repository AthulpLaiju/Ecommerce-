-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2022 at 04:27 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dreamhomdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `addplan`
--

CREATE TABLE `addplan` (
  `id` int(50) NOT NULL,
  `engid` varchar(100) NOT NULL,
  `floor` varchar(100) NOT NULL,
  `bdroms` varchar(100) NOT NULL,
  `bthrms` varchar(100) NOT NULL,
  `kitchn` varchar(100) NOT NULL,
  `drms` varchar(100) NOT NULL,
  `strms` varchar(100) NOT NULL,
  `lvrms` varchar(100) NOT NULL,
  `sitrms` varchar(100) NOT NULL,
  `pcost` varchar(100) NOT NULL,
  `sqft` varchar(100) NOT NULL,
  `pl_image` varchar(200) NOT NULL,
  `pf_image` varchar(250) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addplan`
--

INSERT INTO `addplan` (`id`, `engid`, `floor`, `bdroms`, `bthrms`, `kitchn`, `drms`, `strms`, `lvrms`, `sitrms`, `pcost`, `sqft`, `pl_image`, `pf_image`, `status`) VALUES
(1, '2', '02', '04', '04', '02', '01', '02', '02', '02', '15000', '', 'pictures/blog-3_4N4jVA3.jpg', '', ''),
(2, '2', '01', '01', '01', '01', '01', '01', '01', '01', '2400', '', 'pictures/3-bedrooms_sX96y4H.jpg', '', ''),
(3, '2', '01', '01', '01', '01', '01', '01', '01', '01', '15000', '1120', 'pictures/3-bedrooms_ADXFJUq.jpg', 'pictures/plan1_OsKxAjx.pdf', '');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add bplan', 7, 'add_bplan'),
(20, 'Can change bplan', 7, 'change_bplan'),
(21, 'Can delete bplan', 7, 'delete_bplan');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `buildplan`
--

CREATE TABLE `buildplan` (
  `reqid` int(30) NOT NULL,
  `area` varchar(100) DEFAULT NULL,
  `len` varchar(100) DEFAULT NULL,
  `wid` varchar(100) DEFAULT NULL,
  `floor` varchar(100) DEFAULT NULL,
  `room` varchar(100) DEFAULT NULL,
  `brooms` varchar(100) DEFAULT NULL,
  `kit` varchar(100) DEFAULT NULL,
  `drooms` varchar(100) DEFAULT NULL,
  `srooms` varchar(100) DEFAULT NULL,
  `lrooms` varchar(100) DEFAULT NULL,
  `sitout` varchar(100) DEFAULT NULL,
  `orooms` varchar(100) DEFAULT NULL,
  `odetails` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contractor`
--

CREATE TABLE `contractor` (
  `ctid` int(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `phonno` int(20) DEFAULT NULL,
  `lisno` varchar(20) DEFAULT NULL,
  `lisimg` varchar(20) DEFAULT NULL,
  `passwd` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cuid` int(20) NOT NULL,
  `custname` varchar(20) DEFAULT NULL,
  `addr` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phonno` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cuid`, `custname`, `addr`, `email`, `phonno`) VALUES
(1, 'qw', 'adur', 'qw@gmail.com', '888888888'),
(2, 'add', 'add,kerala', 'add@gmail.com', '222222222'),
(3, 'add', 'add,kerala', 'add@gmail.com', '222222222');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'dreamhomeapp', 'bplan'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-02-22 06:15:48'),
(2, 'auth', '0001_initial', '2022-02-22 06:15:49'),
(3, 'admin', '0001_initial', '2022-02-22 06:15:49'),
(4, 'contenttypes', '0002_remove_content_type_name', '2022-02-22 06:15:49'),
(5, 'auth', '0002_alter_permission_name_max_length', '2022-02-22 06:15:50'),
(6, 'auth', '0003_alter_user_email_max_length', '2022-02-22 06:15:50'),
(7, 'auth', '0004_alter_user_username_opts', '2022-02-22 06:15:50'),
(8, 'auth', '0005_alter_user_last_login_null', '2022-02-22 06:15:50'),
(9, 'auth', '0006_require_contenttypes_0002', '2022-02-22 06:15:50'),
(10, 'sessions', '0001_initial', '2022-02-22 06:15:50');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('34p1mpkrn3yz3lrosz853secvxzlw141', 'NmE5YzM5NTAyZGZlMjU4Yjc0MWE1OTE2YzdjOTcwNDQ4MzUwYjgzMTp7InN0YXR1cyI6InBlbmRpbmciLCJ1aWQiOjMsInBhc3N3ZCI6ImFkZCIsImlkIjo0LCJ1dHlwZSI6ImN1c3RvbWVyIiwiZW1haWwiOiJhZGRAZ21haWwuY29tIn0=', '2022-05-09 02:18:15'),
('6h2xlldwvv82et0xbgok5pp8jv62ldzg', 'MjU2Yjg3ZTk5NmYyZmJhNDQyMzg4Y2EyNWJiNjFlNTVkNmQ2OGRmYjp7InBhc3N3ZCI6ImFkbWluIiwidXR5cGUiOiJhZG1pbiIsImlkIjowLCJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSJ9', '2022-03-10 10:56:40'),
('crdzjxseoycqit1lopwio99slmqx6gbg', 'NmE5YzM5NTAyZGZlMjU4Yjc0MWE1OTE2YzdjOTcwNDQ4MzUwYjgzMTp7InN0YXR1cyI6InBlbmRpbmciLCJ1aWQiOjMsInBhc3N3ZCI6ImFkZCIsImlkIjo0LCJ1dHlwZSI6ImN1c3RvbWVyIiwiZW1haWwiOiJhZGRAZ21haWwuY29tIn0=', '2022-05-08 13:22:09'),
('f59sqt3cvvxaospbg89l4u0okci6o9f7', 'MzA0ZjhhYjg2OTY3ODQ2Yjc1MGMzNzkwZThlZjljOGJlMjgxOThkNzp7InN0YXR1cyI6ImFkbWluIiwidWlkIjowLCJwYXNzd2QiOiJhZG1pbiIsImVtYWlsIjoiYWRtaW4iLCJ1dHlwZSI6ImFkbWluIiwiaWQiOjB9', '2022-04-03 07:37:02'),
('foo4l9birv9li883rry6p21unn4mkv12', 'OGNjMjcxYWNiODJiNWFjM2ZlNWQyNWUwNGQzOWJlMjA2YzZmOTRmYTp7InBhc3N3ZCI6IjEyMzQ1IiwidXR5cGUiOiJjdXN0b21lciIsImlkIjoyMiwiZW1haWwiOiJhcnVuQGdtYWlsLmNvbSJ9', '2022-03-30 13:56:30'),
('fz0ninm8f9qf46psz9aolsdqawsrufnd', 'ZDk5OWViZDkyZTU3YmNmZDJlYTQ3ZWNlODgzNmI3NDEwYjI1ODQzNDp7InN0YXR1cyI6ImFkbWluIiwidWlkIjowLCJwYXNzd2QiOiJhZG1pbiIsImlkIjowLCJ1dHlwZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbiJ9', '2022-04-30 17:52:38'),
('gcfymfzypia3gekfudwl9cymyj4ybc3j', 'NmE5YzM5NTAyZGZlMjU4Yjc0MWE1OTE2YzdjOTcwNDQ4MzUwYjgzMTp7InN0YXR1cyI6InBlbmRpbmciLCJ1aWQiOjMsInBhc3N3ZCI6ImFkZCIsImlkIjo0LCJ1dHlwZSI6ImN1c3RvbWVyIiwiZW1haWwiOiJhZGRAZ21haWwuY29tIn0=', '2022-05-04 03:00:35'),
('mqiuvf0fnwghj82jtj58c96jd4q0l53r', 'NmE5YzM5NTAyZGZlMjU4Yjc0MWE1OTE2YzdjOTcwNDQ4MzUwYjgzMTp7InN0YXR1cyI6InBlbmRpbmciLCJ1aWQiOjMsInBhc3N3ZCI6ImFkZCIsImlkIjo0LCJ1dHlwZSI6ImN1c3RvbWVyIiwiZW1haWwiOiJhZGRAZ21haWwuY29tIn0=', '2022-05-09 02:06:41'),
('ynl9pfauc9jlp3rj2wcpwk4vu559ih9l', 'ZDk5OWViZDkyZTU3YmNmZDJlYTQ3ZWNlODgzNmI3NDEwYjI1ODQzNDp7InN0YXR1cyI6ImFkbWluIiwidWlkIjowLCJwYXNzd2QiOiJhZG1pbiIsImlkIjowLCJ1dHlwZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbiJ9', '2022-05-03 02:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `engineerr`
--

CREATE TABLE `engineerr` (
  `engid` int(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `phno` bigint(100) DEFAULT NULL,
  `lno` varchar(100) DEFAULT NULL,
  `p_image` varchar(100) DEFAULT NULL,
  `pf_image` varchar(100) NOT NULL,
  `passwd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `engineerr`
--

INSERT INTO `engineerr` (`engid`, `name`, `email`, `city`, `phno`, `lno`, `p_image`, `pf_image`, `passwd`) VALUES
(2, ' ads ', 'ads@gmail.com', 'asd', 7902786272, 's222222', 'pictures/blog-3_Ra8bCu8.jpg', '', 'ads'),
(3, 'ads', 'ad1@gmail.com', 'ad1', 7902786272, 's222222', 'pictures/agent-6_203TrZg.jpg', '', 'ad1'),
(4, 'qw', 'qw@gmail.com', 'qw', 8888888888, 's222222', 'pictures/Athul_P_Laiju_DiLACPG_S1ZRswG.jpg', '', 'qw'),
(5, 'qaz', 'qaz@gmail.com', 'ads', 8888888888, 's222222', 'pictures/agent-1.jpg', 'pictures/FB-SHARE_OH7gbUO.jpg', 'qaz');

-- --------------------------------------------------------

--
-- Table structure for table `engnplans`
--

CREATE TABLE `engnplans` (
  `planid` int(30) NOT NULL,
  `feet` varchar(40) DEFAULT NULL,
  `floor` int(20) DEFAULT NULL,
  `bedrooms` int(20) DEFAULT NULL,
  `bathrooms` int(20) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `planimg` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fid` int(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `feedback` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fid`, `email`, `feedback`) VALUES
(1, 'add@gmail.com', 'ooops');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(20) NOT NULL,
  `uid` bigint(50) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `passwd` varchar(30) DEFAULT NULL,
  `utype` varchar(30) DEFAULT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `uid`, `email`, `passwd`, `utype`, `status`) VALUES
(0, 0, 'admin', 'admin', 'admin', 'admin'),
(2, 2, 'ads@gmail.com', 'ads', 'engineer', 'Approve'),
(4, 3, 'add@gmail.com', 'add', 'customer', 'pending'),
(5, 3, 'ad1@gmail.com', 'ad1', 'engineer', 'Reject'),
(6, 4, 'qw@gmail.com', 'qw', 'engineer', 'Approve'),
(7, 5, 'qaz@gmail.com', 'qaz', 'engineer', 'Approve');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(100) NOT NULL,
  `reqid` varchar(100) NOT NULL,
  `engid` varchar(150) NOT NULL,
  `custid` varchar(100) NOT NULL,
  `pcost` varchar(100) NOT NULL,
  `cno` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `reqid`, `engid`, `custid`, `pcost`, `cno`) VALUES
(1, '1', '2', '2', '15000', '222222222222222222222222222'),
(2, '1', '2', '2', '15000', '222222222222222222222222222'),
(3, '2', '2', '3', '25000', '222222222222222222222222222'),
(4, '2', '2', '3', '25000', '222222222222222222222222222'),
(5, '', '2', '', '15000', '222222222222222222222222222'),
(6, '', '2', '', '15000', '222222222222222222222222222'),
(7, '3', '2', '3', '35000', '2222222222222222');

-- --------------------------------------------------------

--
-- Table structure for table `reqplan`
--

CREATE TABLE `reqplan` (
  `id` int(50) NOT NULL,
  `engid` varchar(100) NOT NULL,
  `custid` varchar(100) NOT NULL,
  `custmail` varchar(100) NOT NULL,
  `parea` varchar(100) NOT NULL,
  `floor` varchar(100) NOT NULL,
  `bdroms` varchar(100) NOT NULL,
  `bthrms` int(100) NOT NULL,
  `kitchn` varchar(100) NOT NULL,
  `drms` varchar(100) NOT NULL,
  `strms` varchar(100) NOT NULL,
  `lvrms` varchar(100) NOT NULL,
  `sitrms` varchar(100) NOT NULL,
  `sqft` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reqplan`
--

INSERT INTO `reqplan` (`id`, `engid`, `custid`, `custmail`, `parea`, `floor`, `bdroms`, `bthrms`, `kitchn`, `drms`, `strms`, `lvrms`, `sitrms`, `sqft`, `status`) VALUES
(1, '2', '2', 'add@gmail.com', '65', '01', '01', 1, '01', '01', '01', '01', '01', '1120', 'Approve'),
(2, '2', '3', 'add@gmail.com', '25', '01', '01', 1, '01', '01', '01', '01', '01', '1000', 'Approve'),
(3, '2', '3', 'add@gmail.com', '75', '02', '04', 4, '02', '01', '01', '01', '01', '1520', 'Approve');

-- --------------------------------------------------------

--
-- Table structure for table `spayment`
--

CREATE TABLE `spayment` (
  `id` int(100) NOT NULL,
  `reqid` varchar(100) NOT NULL,
  `engid` varchar(100) NOT NULL,
  `custid` varchar(100) NOT NULL,
  `pcost` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spayment`
--

INSERT INTO `spayment` (`id`, `reqid`, `engid`, `custid`, `pcost`, `status`) VALUES
(1, '3', '2', '3', '15000', 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `upreqplan`
--

CREATE TABLE `upreqplan` (
  `id` int(50) NOT NULL,
  `reqid` varchar(100) NOT NULL,
  `engid` varchar(100) NOT NULL,
  `custid` varchar(100) NOT NULL,
  `pcost` varchar(100) NOT NULL,
  `p_image` varchar(100) NOT NULL,
  `p_file` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `upreqplan`
--

INSERT INTO `upreqplan` (`id`, `reqid`, `engid`, `custid`, `pcost`, `p_image`, `p_file`, `status`) VALUES
(1, '1', '2', '2', '15000', 'pictures/3-bedrooms_A7IFU7F.jpg', 'pictures/205474-Lower_Floor_Plan.jpg', 'paid'),
(2, '1', '2', '2', '15000', 'pictures/FB-SHARE.jpg', 'pictures/plan1.pdf', 'paid'),
(3, '2', '2', '3', '25000', 'pictures/FB-SHARE_IKlbA1V.jpg', 'pictures/plan1_Y1K5qcz.pdf', 'paid'),
(4, '3', '2', '3', '35000', 'pictures/3-bedrooms_LBf6bYp.jpg', 'pictures/plan1_gUc1JZ1.pdf', 'paid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addplan`
--
ALTER TABLE `addplan`
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_type_id` (`content_type_id`,`codename`);

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
  ADD UNIQUE KEY `user_id` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `buildplan`
--
ALTER TABLE `buildplan`
  ADD PRIMARY KEY (`reqid`);

--
-- Indexes for table `contractor`
--
ALTER TABLE `contractor`
  ADD PRIMARY KEY (`ctid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cuid`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`);

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
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `engineerr`
--
ALTER TABLE `engineerr`
  ADD PRIMARY KEY (`engid`);

--
-- Indexes for table `engnplans`
--
ALTER TABLE `engnplans`
  ADD PRIMARY KEY (`planid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reqplan`
--
ALTER TABLE `reqplan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spayment`
--
ALTER TABLE `spayment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upreqplan`
--
ALTER TABLE `upreqplan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addplan`
--
ALTER TABLE `addplan`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buildplan`
--
ALTER TABLE `buildplan`
  MODIFY `reqid` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contractor`
--
ALTER TABLE `contractor`
  MODIFY `ctid` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cuid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `engineerr`
--
ALTER TABLE `engineerr`
  MODIFY `engid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `engnplans`
--
ALTER TABLE `engnplans`
  MODIFY `planid` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reqplan`
--
ALTER TABLE `reqplan`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spayment`
--
ALTER TABLE `spayment`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `upreqplan`
--
ALTER TABLE `upreqplan`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
