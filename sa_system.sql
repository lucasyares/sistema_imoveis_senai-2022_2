-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Abr-2024 às 19:41
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sa_system`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `app_cad_users_imoveis_s`
--

CREATE TABLE `app_cad_users_imoveis_s` (
  `id` bigint(20) NOT NULL,
  `Foto` varchar(100) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Descrption` longtext NOT NULL,
  `Status` varchar(12) NOT NULL,
  `crated_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `criador_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `app_cad_users_imoveis_s`
--

INSERT INTO `app_cad_users_imoveis_s` (`id`, `Foto`, `Name`, `Descrption`, `Status`, `crated_at`, `update_at`, `criador_user_id`) VALUES
(32, 'imoveis_photos/download_IX2QSu0.jfif', 'Gato feio', '1234', 'Disponível', '2024-04-11 17:31:10.196961', '2024-04-11 17:31:10.196961', 1),
(33, 'imoveis_photos/bah_OOpaXOw.webp', 'Teste_01', 'criação do imovel com o A1', 'Disponível', '2024-04-11 17:38:12.927189', '2024-04-11 17:38:12.927189', 38);

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add imoveis_s', 7, 'add_imoveis_s'),
(26, 'Can change imoveis_s', 7, 'change_imoveis_s'),
(27, 'Can delete imoveis_s', 7, 'delete_imoveis_s'),
(28, 'Can view imoveis_s', 7, 'view_imoveis_s');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user`
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
-- Extraindo dados da tabela `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$fNdU0NN7C1QIgqt1QQrbyn$0xCujjTYkhXIU5cadMNukpT7xAMOiQc9f0INw1/i8bo=', '2024-04-11 17:38:53.763186', 1, 'LucasYares', '', '', 'jonnyney@gmail.com', 1, 1, '2024-02-28 18:24:52.299451'),
(2, 'pbkdf2_sha256$720000$cmLUl7HNZjsylayWYd6ZF1$j1AHe4XM+elI7mU/V4lrYLeCrGv+T92UklGwgOeO6pI=', NULL, 1, 'Erik', '', '', 'tojiva.games@gmail.com', 1, 1, '2024-02-29 19:32:01.212727'),
(33, 'pbkdf2_sha256$720000$dy8Q48u4Q6ue0cKiEdPCQJ$nHlgaWIpY8dWyIJQXMt+RkKHfm5Nzxl0tJ0AxH1VIZc=', NULL, 0, 'Pedro1', '', '', '', 0, 1, '2024-03-13 17:25:34.271191'),
(35, 'pbkdf2_sha256$720000$5fdPzxkM9vhDuyykff82FJ$YcFUohNNaspSJP2TPdusOPPrbRQwpFyhEAlB8HxwJP4=', NULL, 0, 'aaa', '', '', '', 0, 1, '2024-03-13 17:27:09.677190'),
(36, 'pbkdf2_sha256$720000$FrUTBl2FbOu8gMlPIX1kb9$s32FahMVG8p3zB3nYL9ZELkxSvz+uTy3441KFM6E51o=', NULL, 0, 'LucasY', '', '', '', 0, 1, '2024-03-13 17:29:04.094916'),
(37, 'pbkdf2_sha256$720000$31p7WzEHyTl9cYxbDTvvlW$gcLuHHKra2xYDDU2Tz+F+kgKPjyLXD86mDOaeRQJoSs=', NULL, 1, 'Administrador', '', '', '', 1, 1, '2024-03-25 19:21:57.000000'),
(38, 'pbkdf2_sha256$720000$CzJ44bcIWOwrLm3EiH6Ulc$tVwzXRoW8JIXe7zlpE2lUcb60PTCPnmRxRBiCThsfEw=', '2024-04-11 17:37:48.294400', 0, 'a1', '', '', '', 0, 1, '2024-04-11 17:07:13.166691');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-03-12 19:06:30.861321', '1', 'imoveis_s object (1)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2024-03-12 19:30:50.381263', '1', 'imoveis_s object (1)', 2, '[]', 7, 1),
(3, '2024-03-12 20:11:47.942505', '7', 'Lucasa', 3, '', 4, 1),
(4, '2024-03-13 16:58:18.770008', '3', 'Lucas', 3, '', 4, 1),
(5, '2024-03-13 16:58:24.428524', '17', 'Lucasa', 3, '', 4, 1),
(6, '2024-03-13 16:58:29.069983', '5', 'LucasY', 3, '', 4, 1),
(7, '2024-03-13 16:58:37.532611', '4', 'Paolo', 3, '', 4, 1),
(8, '2024-03-13 16:58:42.013316', '6', 'SidineiYares', 3, '', 4, 1),
(9, '2024-03-13 17:00:10.429213', '21', 'LucasY', 3, '', 4, 1),
(10, '2024-03-13 17:00:16.900427', '22', 'Pedro', 3, '', 4, 1),
(11, '2024-03-13 17:01:33.517220', '23', 'Pedro', 3, '', 4, 1),
(12, '2024-03-13 17:01:44.852512', '27', 'Pedro', 3, '', 4, 1),
(13, '2024-03-13 17:02:04.339279', '28', 'Pedro', 3, '', 4, 1),
(14, '2024-03-13 17:18:28.024618', '29', 'Pedro', 3, '', 4, 1),
(15, '2024-03-13 17:18:40.504308', '31', 'Pedro', 3, '', 4, 1),
(16, '2024-03-13 17:26:54.519834', '34', 'aaa', 3, '', 4, 1),
(17, '2024-03-13 17:26:59.762389', '32', 'Pedro', 3, '', 4, 1),
(18, '2024-03-13 17:35:22.589389', '1', 'Gato bonito', 2, '[{\"changed\": {\"fields\": [\"Foto\"]}}]', 7, 1),
(19, '2024-03-25 19:21:58.234501', '37', 'Administrador', 1, '[{\"added\": {}}]', 4, 1),
(20, '2024-03-25 19:22:07.696963', '37', 'Administrador', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]', 4, 1),
(21, '2024-03-25 19:27:41.218341', '1', 'Gato bonito', 2, '[]', 7, 1),
(22, '2024-03-25 19:30:49.124501', '2', 'teste', 1, '[{\"added\": {}}]', 7, 1),
(23, '2024-03-26 18:24:07.743410', '3', 'ffedfe', 2, '[{\"changed\": {\"fields\": [\"Foto\"]}}]', 7, 1),
(24, '2024-03-26 18:25:28.434971', '5', 'Gato bonitoeee', 3, '', 7, 1),
(25, '2024-03-26 18:25:31.760243', '4', 'Teste 1', 3, '', 7, 1),
(26, '2024-03-26 18:25:47.016195', '3', 'ffedfe', 3, '', 7, 1),
(27, '2024-03-26 19:26:18.268001', '9', 'M,', 3, '', 7, 1),
(28, '2024-03-26 19:26:23.130389', '8', 'DE3', 3, '', 7, 1),
(29, '2024-03-26 19:26:29.992010', '10', 'Teste 2', 3, '', 7, 1),
(30, '2024-03-26 19:26:32.977437', '7', 'SSCA', 3, '', 7, 1),
(31, '2024-03-26 19:26:37.628227', '6', 'Nheee', 3, '', 7, 1),
(32, '2024-04-11 17:16:56.487902', '30', 'Teste 1', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'app_cad_users', 'imoveis_s'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-27 17:33:06.505980'),
(2, 'auth', '0001_initial', '2024-02-27 17:33:06.874348'),
(3, 'admin', '0001_initial', '2024-02-27 17:33:06.985817'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-02-27 17:33:06.992764'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-27 17:33:07.001740'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-02-27 17:33:07.071572'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-02-27 17:33:07.123413'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-02-27 17:33:07.137387'),
(9, 'auth', '0004_alter_user_username_opts', '2024-02-27 17:33:07.145381'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-02-27 17:33:07.189237'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-02-27 17:33:07.190235'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-02-27 17:33:07.197216'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-02-27 17:33:07.208186'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-02-27 17:33:07.223146'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-02-27 17:33:07.237116'),
(16, 'auth', '0011_update_proxy_permissions', '2024-02-27 17:33:07.244091'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-02-27 17:33:07.257055'),
(18, 'sessions', '0001_initial', '2024-02-27 17:33:07.288970'),
(19, 'app_cad_users', '0001_initial', '2024-03-12 18:54:59.263387'),
(20, 'app_cad_users', '0002_alter_imoveis_s_foto', '2024-03-26 19:16:50.999468'),
(21, 'app_cad_users', '0002_imoveis_s_criador_user', '2024-04-11 17:29:32.041477');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8umidns2ta7y9xkjbrg94cgdi73pqoi4', '.eJxVjEEOwiAQRe_C2hCgUMCle89AZpipVA0kpV0Z765NutDtf-_9l0iwrSVtnZc0kzgLLU6_G0J-cN0B3aHemsytrsuMclfkQbu8NuLn5XD_Dgr08q0RjbE2Tuj0qNkZiDgZrQYC9irkwfNI6KKxjIGyVk67qJiDtz5yxCzeH99AN9U:1rpCQK:N5niRwWtz7dbFxsGQOC6ls3xKaW4VF__j0abmketo_Y', '2024-04-09 19:25:28.204752'),
('co4i7vzvliejbqf9wxyk8zmlu8zwrx44', '.eJxVjEEOwiAQRe_C2hCgUMCle89AZpipVA0kpV0Z765NutDtf-_9l0iwrSVtnZc0kzgLLU6_G0J-cN0B3aHemsytrsuMclfkQbu8NuLn5XD_Dgr08q0RjbE2Tuj0qNkZiDgZrQYC9irkwfNI6KKxjIGyVk67qJiDtz5yxCzeH99AN9U:1rk7K1:PP8eDemp-CAY5oC62WYTenq1onrQxODSIfoYtkL9VLA', '2024-03-26 18:57:57.900208'),
('nifaeuwvbg3cqvb7lnrrkvvgwmmxkpb0', '.eJxVjEEOwiAQRe_C2hCgUMCle89AZpipVA0kpV0Z765NutDtf-_9l0iwrSVtnZc0kzgLLU6_G0J-cN0B3aHemsytrsuMclfkQbu8NuLn5XD_Dgr08q0RjbE2Tuj0qNkZiDgZrQYC9irkwfNI6KKxjIGyVk67qJiDtz5yxCzeH99AN9U:1ruyNx:_RrrBneutVCdehQIlCD0JlgibIqwiwsACPPSaojP214', '2024-04-25 17:38:53.765200'),
('s4g9atib1fe5ss84793qk2xnwhmhdyoe', 'e30:1rk6RU:QmoGWxtJ6bV3Yz3ahbgcShBx8Su-K1ZkUA-50bGV9Jo', '2024-03-26 18:01:36.620409'),
('z0zquad6p2pqr1n8qfpdin5s4schj607', 'e30:1rk6GD:sbD70ttsxb_M8Hdev1ruRi6kiroNQKToGdTZ2iTmmrM', '2024-03-26 17:49:57.828711');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `app_cad_users_imoveis_s`
--
ALTER TABLE `app_cad_users_imoveis_s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_cad_users_imoveis_s_criador_user_id_5a23412d_fk_auth_user_id` (`criador_user_id`);

--
-- Índices para tabela `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Índices para tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Índices para tabela `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices para tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Índices para tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Índices para tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Índices para tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Índices para tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `app_cad_users_imoveis_s`
--
ALTER TABLE `app_cad_users_imoveis_s`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `app_cad_users_imoveis_s`
--
ALTER TABLE `app_cad_users_imoveis_s`
  ADD CONSTRAINT `app_cad_users_imoveis_s_criador_user_id_5a23412d_fk_auth_user_id` FOREIGN KEY (`criador_user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limitadores para a tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limitadores para a tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
