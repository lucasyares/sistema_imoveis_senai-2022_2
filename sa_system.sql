-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Maio-2024 às 01:43
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
CREATE DATABASE IF NOT EXISTS `sa_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sa_system`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL,
  `nome_admin` varchar(255) NOT NULL,
  `foto_admin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `assoc_infra_emp`
--

CREATE TABLE `assoc_infra_emp` (
  `id` bigint(20) NOT NULL,
  `fk_empreendimento` bigint(20) NOT NULL,
  `fk_infraestrutura_emp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `assoc_infra_imovel`
--

CREATE TABLE `assoc_infra_imovel` (
  `id` bigint(20) NOT NULL,
  `fk_imovel` bigint(20) NOT NULL,
  `fk_infraestrutura_imovel` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `assoc_infra_im_perfil`
--

CREATE TABLE `assoc_infra_im_perfil` (
  `id` bigint(20) NOT NULL,
  `fk_infraestrutura_imovel` bigint(20) NOT NULL,
  `fk_perfil` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add admin', 6, 'add_admin'),
(22, 'Can change admin', 6, 'change_admin'),
(23, 'Can delete admin', 6, 'delete_admin'),
(24, 'Can view admin', 6, 'view_admin'),
(25, 'Can add corretor', 7, 'add_corretor'),
(26, 'Can change corretor', 7, 'change_corretor'),
(27, 'Can delete corretor', 7, 'delete_corretor'),
(28, 'Can view corretor', 7, 'view_corretor'),
(29, 'Can add endereco', 8, 'add_endereco'),
(30, 'Can change endereco', 8, 'change_endereco'),
(31, 'Can delete endereco', 8, 'delete_endereco'),
(32, 'Can view endereco', 8, 'view_endereco'),
(33, 'Can add infraestrutura emp', 9, 'add_infraestruturaemp'),
(34, 'Can change infraestrutura emp', 9, 'change_infraestruturaemp'),
(35, 'Can delete infraestrutura emp', 9, 'delete_infraestruturaemp'),
(36, 'Can view infraestrutura emp', 9, 'view_infraestruturaemp'),
(37, 'Can add infraestrutura imovel', 10, 'add_infraestruturaimovel'),
(38, 'Can change infraestrutura imovel', 10, 'change_infraestruturaimovel'),
(39, 'Can delete infraestrutura imovel', 10, 'delete_infraestruturaimovel'),
(40, 'Can view infraestrutura imovel', 10, 'view_infraestruturaimovel'),
(41, 'Can add subtipo imovel', 11, 'add_subtipoimovel'),
(42, 'Can change subtipo imovel', 11, 'change_subtipoimovel'),
(43, 'Can delete subtipo imovel', 11, 'delete_subtipoimovel'),
(44, 'Can view subtipo imovel', 11, 'view_subtipoimovel'),
(45, 'Can add tipo cliente', 12, 'add_tipocliente'),
(46, 'Can change tipo cliente', 12, 'change_tipocliente'),
(47, 'Can delete tipo cliente', 12, 'delete_tipocliente'),
(48, 'Can view tipo cliente', 12, 'view_tipocliente'),
(49, 'Can add tipo conta', 13, 'add_tipoconta'),
(50, 'Can change tipo conta', 13, 'change_tipoconta'),
(51, 'Can delete tipo conta', 13, 'delete_tipoconta'),
(52, 'Can view tipo conta', 13, 'view_tipoconta'),
(53, 'Can add tipo imovel', 14, 'add_tipoimovel'),
(54, 'Can change tipo imovel', 14, 'change_tipoimovel'),
(55, 'Can delete tipo imovel', 14, 'delete_tipoimovel'),
(56, 'Can view tipo imovel', 14, 'view_tipoimovel'),
(57, 'Can add cliente', 15, 'add_cliente'),
(58, 'Can change cliente', 15, 'change_cliente'),
(59, 'Can delete cliente', 15, 'delete_cliente'),
(60, 'Can view cliente', 15, 'view_cliente'),
(61, 'Can add user', 16, 'add_user'),
(62, 'Can change user', 16, 'change_user'),
(63, 'Can delete user', 16, 'delete_user'),
(64, 'Can view user', 16, 'view_user'),
(65, 'Can add empreendimento', 17, 'add_empreendimento'),
(66, 'Can change empreendimento', 17, 'change_empreendimento'),
(67, 'Can delete empreendimento', 17, 'delete_empreendimento'),
(68, 'Can view empreendimento', 17, 'view_empreendimento'),
(69, 'Can add foto empreendimento', 18, 'add_fotoempreendimento'),
(70, 'Can change foto empreendimento', 18, 'change_fotoempreendimento'),
(71, 'Can delete foto empreendimento', 18, 'delete_fotoempreendimento'),
(72, 'Can view foto empreendimento', 18, 'view_fotoempreendimento'),
(73, 'Can add imovel', 19, 'add_imovel'),
(74, 'Can change imovel', 19, 'change_imovel'),
(75, 'Can delete imovel', 19, 'delete_imovel'),
(76, 'Can view imovel', 19, 'view_imovel'),
(77, 'Can add foto imovel', 20, 'add_fotoimovel'),
(78, 'Can change foto imovel', 20, 'change_fotoimovel'),
(79, 'Can delete foto imovel', 20, 'delete_fotoimovel'),
(80, 'Can view foto imovel', 20, 'view_fotoimovel'),
(81, 'Can add assoc infra emp', 21, 'add_associnfraemp'),
(82, 'Can change assoc infra emp', 21, 'change_associnfraemp'),
(83, 'Can delete assoc infra emp', 21, 'delete_associnfraemp'),
(84, 'Can view assoc infra emp', 21, 'view_associnfraemp'),
(85, 'Can add assoc infra imovel', 22, 'add_associnfraimovel'),
(86, 'Can change assoc infra imovel', 22, 'change_associnfraimovel'),
(87, 'Can delete assoc infra imovel', 22, 'delete_associnfraimovel'),
(88, 'Can view assoc infra imovel', 22, 'view_associnfraimovel'),
(89, 'Can add perfil', 23, 'add_perfil'),
(90, 'Can change perfil', 23, 'change_perfil'),
(91, 'Can delete perfil', 23, 'delete_perfil'),
(92, 'Can view perfil', 23, 'view_perfil'),
(93, 'Can add assoc infra im perfil', 24, 'add_associnfraimperfil'),
(94, 'Can change assoc infra im perfil', 24, 'change_associnfraimperfil'),
(95, 'Can delete assoc infra im perfil', 24, 'delete_associnfraimperfil'),
(96, 'Can view assoc infra im perfil', 24, 'view_associnfraimperfil'),
(97, 'Can add conta', 25, 'add_conta'),
(98, 'Can change conta', 25, 'change_conta'),
(99, 'Can delete conta', 25, 'delete_conta'),
(100, 'Can view conta', 25, 'view_conta');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` bigint(20) NOT NULL,
  `nome_cliente` varchar(255) NOT NULL,
  `foto_cliente` varchar(100) DEFAULT NULL,
  `telefone_cliente` varchar(255) DEFAULT NULL,
  `estagio_cliente` varchar(255) NOT NULL,
  `fk_corretor` bigint(20) DEFAULT NULL,
  `tipo_cliente` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta`
--

CREATE TABLE `conta` (
  `id` bigint(20) NOT NULL,
  `fk_origem` int(11) NOT NULL,
  `email_conta` varchar(255) NOT NULL,
  `senha_conta` varchar(255) NOT NULL,
  `fk_tipo_conta` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `corretor`
--

CREATE TABLE `corretor` (
  `id` bigint(20) NOT NULL,
  `nome_corretor` varchar(255) NOT NULL,
  `foto_corretor` varchar(100) DEFAULT NULL,
  `cpf_corretor` varchar(255) NOT NULL,
  `rg_corretor` varchar(255) NOT NULL,
  `telefone_corretor` varchar(255) NOT NULL
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
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(6, 'app_cad_users', 'admin'),
(21, 'app_cad_users', 'associnfraemp'),
(22, 'app_cad_users', 'associnfraimovel'),
(24, 'app_cad_users', 'associnfraimperfil'),
(15, 'app_cad_users', 'cliente'),
(25, 'app_cad_users', 'conta'),
(7, 'app_cad_users', 'corretor'),
(17, 'app_cad_users', 'empreendimento'),
(8, 'app_cad_users', 'endereco'),
(18, 'app_cad_users', 'fotoempreendimento'),
(20, 'app_cad_users', 'fotoimovel'),
(19, 'app_cad_users', 'imovel'),
(9, 'app_cad_users', 'infraestruturaemp'),
(10, 'app_cad_users', 'infraestruturaimovel'),
(23, 'app_cad_users', 'perfil'),
(11, 'app_cad_users', 'subtipoimovel'),
(12, 'app_cad_users', 'tipocliente'),
(13, 'app_cad_users', 'tipoconta'),
(14, 'app_cad_users', 'tipoimovel'),
(16, 'app_cad_users', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2024-05-29 23:36:37.695527'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-05-29 23:36:37.753650'),
(3, 'auth', '0001_initial', '2024-05-29 23:36:37.925879'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-05-29 23:36:37.959674'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-05-29 23:36:37.964635'),
(6, 'auth', '0004_alter_user_username_opts', '2024-05-29 23:36:37.968727'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-05-29 23:36:37.973714'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-05-29 23:36:37.981719'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-05-29 23:36:37.987036'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-05-29 23:36:37.992348'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-05-29 23:36:37.998993'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-05-29 23:36:38.008840'),
(13, 'auth', '0011_update_proxy_permissions', '2024-05-29 23:36:38.013977'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-05-29 23:36:38.018295'),
(15, 'app_cad_users', '0001_initial', '2024-05-29 23:36:39.483501'),
(16, 'admin', '0001_initial', '2024-05-29 23:36:39.582634'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-05-29 23:36:39.591610'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-29 23:36:39.599362'),
(19, 'sessions', '0001_initial', '2024-05-29 23:36:39.623531');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empreendimento`
--

CREATE TABLE `empreendimento` (
  `id` bigint(20) NOT NULL,
  `nome_empreendimento` varchar(255) NOT NULL,
  `taxa_empreendimento` double DEFAULT NULL,
  `fk_endereco` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id` bigint(20) NOT NULL,
  `logradouro_endereco` varchar(255) NOT NULL,
  `numero_endereco` varchar(255) NOT NULL,
  `bairro_endereco` varchar(255) NOT NULL,
  `cidade_endereco` varchar(255) NOT NULL,
  `cep_endereco` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto_empreendimento`
--

CREATE TABLE `foto_empreendimento` (
  `id` bigint(20) NOT NULL,
  `url_foto_empreendimento` varchar(255) NOT NULL,
  `fk_empreendimento` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto_imovel`
--

CREATE TABLE `foto_imovel` (
  `id` bigint(20) NOT NULL,
  `url_foto_imovel` varchar(255) NOT NULL,
  `fk_imovel` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel`
--

CREATE TABLE `imovel` (
  `id` bigint(20) NOT NULL,
  `data_criacao_imovel` datetime(6) NOT NULL,
  `data_atualizacao_imovel` datetime(6) DEFAULT NULL,
  `complemento_endereco_imovel` varchar(255) DEFAULT NULL,
  `area_total_imovel` double DEFAULT NULL,
  `area_privativa_imovel` double DEFAULT NULL,
  `preco_imovel` double NOT NULL,
  `num_quarto_imovel` int(11) NOT NULL,
  `num_suite_imovel` int(11) NOT NULL,
  `num_banheiro_imovel` int(11) NOT NULL,
  `num_garagem_imovel` int(11) NOT NULL,
  `fk_corretor` bigint(20) NOT NULL,
  `fk_empreendimento` bigint(20) DEFAULT NULL,
  `fk_endereco` bigint(20) NOT NULL,
  `fk_proprietario` bigint(20) NOT NULL,
  `fk_tipo_imovel` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `infraestrutura_emp`
--

CREATE TABLE `infraestrutura_emp` (
  `id` bigint(20) NOT NULL,
  `nome_infraestrutura_emp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `infraestrutura_imovel`
--

CREATE TABLE `infraestrutura_imovel` (
  `id` bigint(20) NOT NULL,
  `nome_infraestrutura_imovel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` bigint(20) NOT NULL,
  `bairro_perfil` varchar(255) DEFAULT NULL,
  `area_total_perfil` double DEFAULT NULL,
  `area_privativa_perfil` double DEFAULT NULL,
  `preco_perfil` double DEFAULT NULL,
  `num_quarto_perfil` int(11) DEFAULT NULL,
  `num_suite_perfil` int(11) DEFAULT NULL,
  `num_banheiro_perfil` int(11) DEFAULT NULL,
  `num_garagem_perfil` int(11) DEFAULT NULL,
  `fk_cliente` bigint(20) NOT NULL,
  `fk_subtipo_imovel` bigint(20) DEFAULT NULL,
  `fk_tipo_imovel` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `subtipo_imovel`
--

CREATE TABLE `subtipo_imovel` (
  `id` bigint(20) NOT NULL,
  `nome_subtipo_imovel` varchar(255) NOT NULL,
  `fk_tipo_imovel` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_cliente`
--

CREATE TABLE `tipo_cliente` (
  `id` bigint(20) NOT NULL,
  `nome_tipo_cliente` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_conta`
--

CREATE TABLE `tipo_conta` (
  `id` bigint(20) NOT NULL,
  `nome_tipo_conta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_imovel`
--

CREATE TABLE `tipo_imovel` (
  `id` bigint(20) NOT NULL,
  `nome_tipo_imovel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `corretor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_user_permissions`
--

CREATE TABLE `user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `assoc_infra_emp`
--
ALTER TABLE `assoc_infra_emp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assoc_infra_emp_fk_empreendimento_0f779ab6_fk_empreendimento_id` (`fk_empreendimento`),
  ADD KEY `assoc_infra_emp_fk_infraestrutura_em_b1f9e6b8_fk_infraestr` (`fk_infraestrutura_emp`);

--
-- Índices para tabela `assoc_infra_imovel`
--
ALTER TABLE `assoc_infra_imovel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assoc_infra_imovel_fk_imovel_174bea79_fk_imovel_id` (`fk_imovel`),
  ADD KEY `assoc_infra_imovel_fk_infraestrutura_im_ad2ede32_fk_infraestr` (`fk_infraestrutura_imovel`);

--
-- Índices para tabela `assoc_infra_im_perfil`
--
ALTER TABLE `assoc_infra_im_perfil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assoc_infra_im_perfi_fk_infraestrutura_im_9ea7ee0a_fk_infraestr` (`fk_infraestrutura_imovel`),
  ADD KEY `assoc_infra_im_perfil_fk_perfil_09d1a9d2_fk_perfil_id` (`fk_perfil`);

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
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_fk_corretor_338e2ea5_fk_corretor_id` (`fk_corretor`),
  ADD KEY `cliente_tipo_cliente_3c214078_fk_tipo_cliente_id` (`tipo_cliente`);

--
-- Índices para tabela `conta`
--
ALTER TABLE `conta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conta_fk_tipo_conta_a36e1b8d_fk_tipo_conta_id` (`fk_tipo_conta`);

--
-- Índices para tabela `corretor`
--
ALTER TABLE `corretor`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_user_id` (`user_id`);

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
-- Índices para tabela `empreendimento`
--
ALTER TABLE `empreendimento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empreendimento_fk_endereco_e187769e_fk_endereco_id` (`fk_endereco`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `foto_empreendimento`
--
ALTER TABLE `foto_empreendimento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foto_empreendimento_fk_empreendimento_7e14349b_fk_empreendi` (`fk_empreendimento`);

--
-- Índices para tabela `foto_imovel`
--
ALTER TABLE `foto_imovel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foto_imovel_fk_imovel_1ae90861_fk_imovel_id` (`fk_imovel`);

--
-- Índices para tabela `imovel`
--
ALTER TABLE `imovel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fk_corretor` (`fk_corretor`),
  ADD KEY `imovel_fk_empreendimento_4c7756ac_fk_empreendimento_id` (`fk_empreendimento`),
  ADD KEY `imovel_fk_endereco_52901fab_fk_endereco_id` (`fk_endereco`),
  ADD KEY `imovel_fk_proprietario_ee0f63c3_fk_cliente_id` (`fk_proprietario`),
  ADD KEY `imovel_fk_tipo_imovel_12d9bc24_fk_tipo_imovel_id` (`fk_tipo_imovel`);

--
-- Índices para tabela `infraestrutura_emp`
--
ALTER TABLE `infraestrutura_emp`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `infraestrutura_imovel`
--
ALTER TABLE `infraestrutura_imovel`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perfil_fk_cliente_f8543c2d_fk_cliente_id` (`fk_cliente`),
  ADD KEY `perfil_fk_subtipo_imovel_9d374c91_fk_subtipo_imovel_id` (`fk_subtipo_imovel`),
  ADD KEY `perfil_fk_tipo_imovel_20a3ab84_fk_tipo_imovel_id` (`fk_tipo_imovel`);

--
-- Índices para tabela `subtipo_imovel`
--
ALTER TABLE `subtipo_imovel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subtipo_imovel_fk_tipo_imovel_bd054c1c_fk_tipo_imovel_id` (`fk_tipo_imovel`);

--
-- Índices para tabela `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tipo_conta`
--
ALTER TABLE `tipo_conta`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tipo_imovel`
--
ALTER TABLE `tipo_imovel`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `admin_id` (`admin_id`),
  ADD UNIQUE KEY `cliente_id` (`cliente_id`),
  ADD UNIQUE KEY `corretor_id` (`corretor_id`);

--
-- Índices para tabela `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_groups_user_id_group_id_40beef00_uniq` (`user_id`,`group_id`),
  ADD KEY `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id`);

--
-- Índices para tabela `user_user_permissions`
--
ALTER TABLE `user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` (`user_id`,`permission_id`),
  ADD KEY `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `assoc_infra_emp`
--
ALTER TABLE `assoc_infra_emp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `assoc_infra_imovel`
--
ALTER TABLE `assoc_infra_imovel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `assoc_infra_im_perfil`
--
ALTER TABLE `assoc_infra_im_perfil`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conta`
--
ALTER TABLE `conta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `corretor`
--
ALTER TABLE `corretor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `empreendimento`
--
ALTER TABLE `empreendimento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `foto_empreendimento`
--
ALTER TABLE `foto_empreendimento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `foto_imovel`
--
ALTER TABLE `foto_imovel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imovel`
--
ALTER TABLE `imovel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `infraestrutura_emp`
--
ALTER TABLE `infraestrutura_emp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `infraestrutura_imovel`
--
ALTER TABLE `infraestrutura_imovel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `subtipo_imovel`
--
ALTER TABLE `subtipo_imovel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_conta`
--
ALTER TABLE `tipo_conta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_imovel`
--
ALTER TABLE `tipo_imovel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `user_user_permissions`
--
ALTER TABLE `user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `assoc_infra_emp`
--
ALTER TABLE `assoc_infra_emp`
  ADD CONSTRAINT `assoc_infra_emp_fk_empreendimento_0f779ab6_fk_empreendimento_id` FOREIGN KEY (`fk_empreendimento`) REFERENCES `empreendimento` (`id`),
  ADD CONSTRAINT `assoc_infra_emp_fk_infraestrutura_em_b1f9e6b8_fk_infraestr` FOREIGN KEY (`fk_infraestrutura_emp`) REFERENCES `infraestrutura_emp` (`id`);

--
-- Limitadores para a tabela `assoc_infra_imovel`
--
ALTER TABLE `assoc_infra_imovel`
  ADD CONSTRAINT `assoc_infra_imovel_fk_imovel_174bea79_fk_imovel_id` FOREIGN KEY (`fk_imovel`) REFERENCES `imovel` (`id`),
  ADD CONSTRAINT `assoc_infra_imovel_fk_infraestrutura_im_ad2ede32_fk_infraestr` FOREIGN KEY (`fk_infraestrutura_imovel`) REFERENCES `infraestrutura_imovel` (`id`);

--
-- Limitadores para a tabela `assoc_infra_im_perfil`
--
ALTER TABLE `assoc_infra_im_perfil`
  ADD CONSTRAINT `assoc_infra_im_perfi_fk_infraestrutura_im_9ea7ee0a_fk_infraestr` FOREIGN KEY (`fk_infraestrutura_imovel`) REFERENCES `infraestrutura_imovel` (`id`),
  ADD CONSTRAINT `assoc_infra_im_perfil_fk_perfil_09d1a9d2_fk_perfil_id` FOREIGN KEY (`fk_perfil`) REFERENCES `perfil` (`id`);

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
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_fk_corretor_338e2ea5_fk_corretor_id` FOREIGN KEY (`fk_corretor`) REFERENCES `corretor` (`id`),
  ADD CONSTRAINT `cliente_tipo_cliente_3c214078_fk_tipo_cliente_id` FOREIGN KEY (`tipo_cliente`) REFERENCES `tipo_cliente` (`id`);

--
-- Limitadores para a tabela `conta`
--
ALTER TABLE `conta`
  ADD CONSTRAINT `conta_fk_tipo_conta_a36e1b8d_fk_tipo_conta_id` FOREIGN KEY (`fk_tipo_conta`) REFERENCES `tipo_conta` (`id`);

--
-- Limitadores para a tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Limitadores para a tabela `empreendimento`
--
ALTER TABLE `empreendimento`
  ADD CONSTRAINT `empreendimento_fk_endereco_e187769e_fk_endereco_id` FOREIGN KEY (`fk_endereco`) REFERENCES `endereco` (`id`);

--
-- Limitadores para a tabela `foto_empreendimento`
--
ALTER TABLE `foto_empreendimento`
  ADD CONSTRAINT `foto_empreendimento_fk_empreendimento_7e14349b_fk_empreendi` FOREIGN KEY (`fk_empreendimento`) REFERENCES `empreendimento` (`id`);

--
-- Limitadores para a tabela `foto_imovel`
--
ALTER TABLE `foto_imovel`
  ADD CONSTRAINT `foto_imovel_fk_imovel_1ae90861_fk_imovel_id` FOREIGN KEY (`fk_imovel`) REFERENCES `imovel` (`id`);

--
-- Limitadores para a tabela `imovel`
--
ALTER TABLE `imovel`
  ADD CONSTRAINT `imovel_fk_corretor_c65f8446_fk_corretor_id` FOREIGN KEY (`fk_corretor`) REFERENCES `corretor` (`id`),
  ADD CONSTRAINT `imovel_fk_empreendimento_4c7756ac_fk_empreendimento_id` FOREIGN KEY (`fk_empreendimento`) REFERENCES `empreendimento` (`id`),
  ADD CONSTRAINT `imovel_fk_endereco_52901fab_fk_endereco_id` FOREIGN KEY (`fk_endereco`) REFERENCES `endereco` (`id`),
  ADD CONSTRAINT `imovel_fk_proprietario_ee0f63c3_fk_cliente_id` FOREIGN KEY (`fk_proprietario`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `imovel_fk_tipo_imovel_12d9bc24_fk_tipo_imovel_id` FOREIGN KEY (`fk_tipo_imovel`) REFERENCES `tipo_imovel` (`id`);

--
-- Limitadores para a tabela `perfil`
--
ALTER TABLE `perfil`
  ADD CONSTRAINT `perfil_fk_cliente_f8543c2d_fk_cliente_id` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `perfil_fk_subtipo_imovel_9d374c91_fk_subtipo_imovel_id` FOREIGN KEY (`fk_subtipo_imovel`) REFERENCES `subtipo_imovel` (`id`),
  ADD CONSTRAINT `perfil_fk_tipo_imovel_20a3ab84_fk_tipo_imovel_id` FOREIGN KEY (`fk_tipo_imovel`) REFERENCES `tipo_imovel` (`id`);

--
-- Limitadores para a tabela `subtipo_imovel`
--
ALTER TABLE `subtipo_imovel`
  ADD CONSTRAINT `subtipo_imovel_fk_tipo_imovel_bd054c1c_fk_tipo_imovel_id` FOREIGN KEY (`fk_tipo_imovel`) REFERENCES `tipo_imovel` (`id`);

--
-- Limitadores para a tabela `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_admin_id_364ee567_fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `user_cliente_id_09fe8f4c_fk_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `user_corretor_id_47f11c43_fk_corretor_id` FOREIGN KEY (`corretor_id`) REFERENCES `corretor` (`id`);

--
-- Limitadores para a tabela `user_groups`
--
ALTER TABLE `user_groups`
  ADD CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_groups_user_id_abaea130_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Limitadores para a tabela `user_user_permissions`
--
ALTER TABLE `user_user_permissions`
  ADD CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
