-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para sa_system
CREATE DATABASE IF NOT EXISTS `sa_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sa_system`;

-- Copiando estrutura para tabela sa_system.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_admin` varchar(255) NOT NULL,
  `foto_admin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.admin: ~1 rows (aproximadamente)
INSERT INTO `admin` (`id`, `nome_admin`, `foto_admin`) VALUES
	(1, 'Kiro_admin', NULL);

-- Copiando estrutura para tabela sa_system.assoc_cliente_tipo
CREATE TABLE IF NOT EXISTS `assoc_cliente_tipo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fk_cliente` bigint NOT NULL,
  `fk_tipo_cliente` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assoc_cliente_tipo_fk_cliente_49402cb5_fk_cliente_id` (`fk_cliente`),
  KEY `assoc_cliente_tipo_fk_tipo_cliente_fe309116_fk_tipo_cliente_id` (`fk_tipo_cliente`),
  CONSTRAINT `assoc_cliente_tipo_fk_cliente_49402cb5_fk_cliente_id` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `assoc_cliente_tipo_fk_tipo_cliente_fe309116_fk_tipo_cliente_id` FOREIGN KEY (`fk_tipo_cliente`) REFERENCES `tipo_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela sa_system.assoc_cliente_tipo: ~8 rows (aproximadamente)
INSERT INTO `assoc_cliente_tipo` (`id`, `fk_cliente`, `fk_tipo_cliente`) VALUES
	(1, 1, 1),
	(2, 5, 1),
	(3, 9, 1),
	(4, 4, 1),
	(5, 8, 1),
	(6, 3, 1),
	(7, 7, 1),
	(8, 10, 2),
	(9, 10, 1);

-- Copiando estrutura para tabela sa_system.assoc_infra_emp
CREATE TABLE IF NOT EXISTS `assoc_infra_emp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fk_empreendimento` bigint NOT NULL,
  `fk_infraestrutura_emp` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assoc_infra_emp_fk_empreendimento_0f779ab6_fk_empreendimento_id` (`fk_empreendimento`),
  KEY `assoc_infra_emp_fk_infraestrutura_em_b1f9e6b8_fk_infraestr` (`fk_infraestrutura_emp`),
  CONSTRAINT `assoc_infra_emp_fk_empreendimento_0f779ab6_fk_empreendimento_id` FOREIGN KEY (`fk_empreendimento`) REFERENCES `empreendimento` (`id`),
  CONSTRAINT `assoc_infra_emp_fk_infraestrutura_em_b1f9e6b8_fk_infraestr` FOREIGN KEY (`fk_infraestrutura_emp`) REFERENCES `infraestrutura_emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.assoc_infra_emp: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sa_system.assoc_infra_imovel
CREATE TABLE IF NOT EXISTS `assoc_infra_imovel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fk_imovel` bigint NOT NULL,
  `fk_infraestrutura_imovel` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assoc_infra_imovel_fk_imovel_174bea79_fk_imovel_id` (`fk_imovel`),
  KEY `assoc_infra_imovel_fk_infraestrutura_im_ad2ede32_fk_infraestr` (`fk_infraestrutura_imovel`),
  CONSTRAINT `assoc_infra_imovel_fk_imovel_174bea79_fk_imovel_id` FOREIGN KEY (`fk_imovel`) REFERENCES `imovel` (`id`),
  CONSTRAINT `assoc_infra_imovel_fk_infraestrutura_im_ad2ede32_fk_infraestr` FOREIGN KEY (`fk_infraestrutura_imovel`) REFERENCES `infraestrutura_imovel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.assoc_infra_imovel: ~68 rows (aproximadamente)
INSERT INTO `assoc_infra_imovel` (`id`, `fk_imovel`, `fk_infraestrutura_imovel`) VALUES
	(191, 32, 3),
	(192, 32, 8),
	(193, 32, 31),
	(194, 32, 34),
	(195, 32, 52),
	(196, 33, 3),
	(197, 33, 8),
	(198, 33, 31),
	(199, 33, 34),
	(200, 33, 52),
	(201, 34, 2),
	(202, 34, 6),
	(203, 34, 11),
	(204, 34, 19),
	(205, 35, 23),
	(206, 35, 24),
	(207, 35, 43),
	(208, 35, 44),
	(209, 35, 52),
	(210, 36, 7),
	(211, 36, 23),
	(212, 36, 44),
	(213, 36, 48),
	(214, 36, 49),
	(215, 37, 23),
	(216, 37, 35),
	(217, 37, 43),
	(218, 37, 50),
	(219, 38, 7),
	(220, 38, 44),
	(221, 38, 46),
	(222, 38, 52),
	(223, 39, 23),
	(224, 39, 42),
	(225, 39, 50),
	(226, 40, 11),
	(227, 40, 19),
	(228, 40, 35),
	(229, 40, 51),
	(230, 41, 22),
	(231, 41, 35),
	(232, 41, 44),
	(233, 42, 38),
	(234, 42, 44),
	(235, 42, 50),
	(236, 43, 43),
	(237, 43, 45),
	(238, 44, 43),
	(239, 45, 43),
	(240, 46, 43),
	(241, 47, 23),
	(242, 47, 50),
	(243, 47, 52),
	(244, 48, 23),
	(245, 48, 50),
	(246, 48, 52),
	(247, 49, 23),
	(248, 49, 43);

-- Copiando estrutura para tabela sa_system.assoc_infra_im_perfil
CREATE TABLE IF NOT EXISTS `assoc_infra_im_perfil` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fk_infraestrutura_imovel` bigint NOT NULL,
  `fk_perfil` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assoc_infra_im_perfi_fk_infraestrutura_im_9ea7ee0a_fk_infraestr` (`fk_infraestrutura_imovel`),
  KEY `assoc_infra_im_perfil_fk_perfil_09d1a9d2_fk_perfil_id` (`fk_perfil`),
  CONSTRAINT `assoc_infra_im_perfi_fk_infraestrutura_im_9ea7ee0a_fk_infraestr` FOREIGN KEY (`fk_infraestrutura_imovel`) REFERENCES `infraestrutura_imovel` (`id`),
  CONSTRAINT `assoc_infra_im_perfil_fk_perfil_09d1a9d2_fk_perfil_id` FOREIGN KEY (`fk_perfil`) REFERENCES `perfil` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.assoc_infra_im_perfil: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sa_system.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.auth_group: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sa_system.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.auth_group_permissions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sa_system.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.auth_permission: ~104 rows (aproximadamente)
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
	(64, 'Can view user', 16, 'view_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
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
	(100, 'Can view conta', 25, 'view_conta'),
	(101, 'Can add assoc cliente tipo', 26, 'add_assocclientetipo'),
	(102, 'Can change assoc cliente tipo', 26, 'change_assocclientetipo'),
	(103, 'Can delete assoc cliente tipo', 26, 'delete_assocclientetipo'),
	(104, 'Can view assoc cliente tipo', 26, 'view_assocclientetipo');

-- Copiando estrutura para tabela sa_system.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(255) NOT NULL,
  `foto_cliente` varchar(100) DEFAULT NULL,
  `telefone_cliente` varchar(255) DEFAULT NULL,
  `estagio_cliente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fk_corretor` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_fk_corretor_338e2ea5_fk_corretor_id` (`fk_corretor`),
  CONSTRAINT `cliente_fk_corretor_338e2ea5_fk_corretor_id` FOREIGN KEY (`fk_corretor`) REFERENCES `corretor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.cliente: ~9 rows (aproximadamente)
INSERT INTO `cliente` (`id`, `nome_cliente`, `foto_cliente`, `telefone_cliente`, `estagio_cliente`, `fk_corretor`) VALUES
	(1, 'Lucas Yares Silva', 'clientes/prs.png', NULL, '', NULL),
	(2, 'Teste Chatooo', 'clientes/kali.png', NULL, '', NULL),
	(3, 'Teste crypt', 'clientes/kali_ENfvhmN.png', NULL, '', NULL),
	(4, 'Teste Crypt last', 'clientes/william-huynh-jackson-blackhole.jpg', NULL, '', NULL),
	(5, 'Lucas', 'clientes/william-huynh-jackson-blackhole_krKxH61.jpg', '(47) 99655-2738', '', NULL),
	(6, 'Lucas Yares Silva', 'clientes/banner-2.jpg', '(47) 99655-2738', '', NULL),
	(7, 'ELISANGE HIPOLITO PERERA SILVA', 'clientes/banner-1.jpg', '(47) 99655-2738', '', NULL),
	(8, 'teste new', 'clientes/euuu.jpg', '(11) 11111-11111', 'Proposta', 1),
	(9, 'teste new(SEM_ESTAGIO)', 'clientes/euuu_su5c1gY.jpg', '(11) 11111-1111', NULL, NULL),
	(10, 'Homem aranha', 'clientes/images.jfif', '(11) 11111-1111', 'Visita', 1);

-- Copiando estrutura para tabela sa_system.conta
CREATE TABLE IF NOT EXISTS `conta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fk_origem` int DEFAULT NULL,
  `email_conta` varchar(255) NOT NULL,
  `senha_conta` varchar(255) NOT NULL,
  `fk_tipo_conta` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conta_fk_tipo_conta_a36e1b8d_fk_tipo_conta_id` (`fk_tipo_conta`),
  CONSTRAINT `conta_fk_tipo_conta_a36e1b8d_fk_tipo_conta_id` FOREIGN KEY (`fk_tipo_conta`) REFERENCES `tipo_conta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.conta: ~3 rows (aproximadamente)
INSERT INTO `conta` (`id`, `fk_origem`, `email_conta`, `senha_conta`, `fk_tipo_conta`) VALUES
	(1, 0, 'chato@gmail.com', 'null', NULL),
	(2, 0, 'crypt@crypt', 'null', NULL),
	(3, NULL, 'dalee@certeza.com', 'pbkdf2_sha256$720000$VDOWgay1NLZ0UnRorBbCvA$of/bJVNOxpL3568UUe1vPyX+GlD4BBVH88kceIr7oKs=', NULL);

-- Copiando estrutura para tabela sa_system.corretor
CREATE TABLE IF NOT EXISTS `corretor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_corretor` varchar(255) NOT NULL,
  `foto_corretor` varchar(100) DEFAULT NULL,
  `cpf_corretor` varchar(255) NOT NULL,
  `rg_corretor` varchar(255) NOT NULL,
  `telefone_corretor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.corretor: ~1 rows (aproximadamente)
INSERT INTO `corretor` (`id`, `nome_corretor`, `foto_corretor`, `cpf_corretor`, `rg_corretor`, `telefone_corretor`) VALUES
	(1, 'Monkey Teste', 'corretores/euuu.jpg', '12121313223', '22222222', '47999999999'),
	(2, 'Wolverine', 'corretores/images.jfif', '12165152984', '123', '(49)44444-4444');

-- Copiando estrutura para tabela sa_system.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.django_admin_log: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sa_system.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.django_content_type: ~26 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(6, 'app_cad_users', 'admin'),
	(26, 'app_cad_users', 'assocclientetipo'),
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

-- Copiando estrutura para tabela sa_system.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.django_migrations: ~24 rows (aproximadamente)
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
	(19, 'sessions', '0001_initial', '2024-05-29 23:36:39.623531'),
	(20, 'app_cad_users', '0002_remove_imovel_fk_tipo_imovel_endereco_uf_endereco_and_more', '2024-06-06 02:33:29.469603'),
	(21, 'app_cad_users', '0003_alter_imovel_fk_subtipo_imovel', '2024-06-06 02:37:31.978307'),
	(22, 'app_cad_users', '0004_alter_fotoempreendimento_url_foto_empreendimento_and_more', '2024-06-06 23:40:47.591942'),
	(23, 'app_cad_users', '0005_alter_imovel_fk_corretor', '2024-06-10 22:58:53.175102'),
	(24, 'app_cad_users', '0006_remove_cliente_tipo_cliente_assocclientetipo', '2024-06-12 22:16:54.627145');

-- Copiando estrutura para tabela sa_system.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.django_session: ~4 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('3ij26stc8w8262maixvbxcq7cpc0b1pp', 'e30:1sDVwn:qotCOgdNEKUFYAICSg6ygF0U1DvRq9FMmTqc7Yuqb8w', '2024-06-15 21:07:29.818313'),
	('6yw530wudhnqutbrtz0dbeui1d5voien', '.eJxVjDsOwjAUBO_iGllx_A0lPWeI1n7POIBsKZ8KcXeIlALanZl9iRHbWsZt4XmcSJzFIE6_W0R6cN0B3VFvTaZW13mKclfkQRd5bcTPy-H-HRQs5Vsj58yRNXXGm45c7wwAE3QgPagMA3aGBsBGb5NXNnQxx15psFWsnXh_AA9mOIo:1sHsnr:O8UCsOpYoFou1ZHnEsG3f7NZDodpGSb45jjdtFiou64', '2024-06-27 22:20:19.850415'),
	('gc3fnnlkz7olijn9vjn53a23kpowpgpj', '.eJxVjDsOwjAUBO_iGll2_A0lPWew1nnPOIASKU4qxN0hUgpod2b2JRK2taat8ZJGEmehjTj9jhnDg6ed0B3TbZbDPK3LmOWuyIM2eZ2Jn5fD_TuoaPVbo5TCmQ0pG6wi33kLwEYTyfS6wIK9pR5wObghaBdVLrnTBuw0Gy_eHy_BOLU:1sJjgN:nGX5C6e76gOd6QizGaaFPTKk_-2m_6VoaaHs-c-4kcU', '2024-07-03 01:00:15.493468'),
	('j9exdb3gpggb1glf65zf0zwc6wta4usz', '.eJxVjEsOwjAMBe-SNYpoEzcOS_Y9Q-TENimgVupnhbg7VOoCtm9m3ssk2taatkXmNLC5GDSn3y1Teci4A77TeJtsmcZ1HrLdFXvQxfYTy_N6uH8HlZb6rb2ouKgYm0wq5AFiGxA9Q2FUIghdE9hRB0UgK7TKLiihL-Ih49m8Pwc1OLo:1sDVyC:vXGFJrBiZMO9QDS05lOGiMulZ0daTaqGHp78oZvBgP0', '2024-06-15 21:08:56.557616'),
	('yirxe1jqc2qylipjt9tc8pb0kik9y42o', '.eJxVjDsOwjAUBO_iGllx_A0lPWeI1n7POIBsKZ8KcXeIlALanZl9iRHbWsZt4XmcSJzFIE6_W0R6cN0B3VFvTaZW13mKclfkQRd5bcTPy-H-HRQs5Vsj58yRNXXGm45c7wwAE3QgPagMA3aGBsBGb5NXNnQxx15psFWsnXh_AA9mOIo:1sHC0X:NrWoDV7V3T461aunAYaEkpSVUi3KGX4SKJb0j86Tjbc', '2024-06-26 00:38:33.514094');

-- Copiando estrutura para tabela sa_system.empreendimento
CREATE TABLE IF NOT EXISTS `empreendimento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_empreendimento` varchar(255) NOT NULL,
  `taxa_empreendimento` double DEFAULT NULL,
  `fk_endereco` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empreendimento_fk_endereco_e187769e_fk_endereco_id` (`fk_endereco`),
  CONSTRAINT `empreendimento_fk_endereco_e187769e_fk_endereco_id` FOREIGN KEY (`fk_endereco`) REFERENCES `endereco` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.empreendimento: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sa_system.endereco
CREATE TABLE IF NOT EXISTS `endereco` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `logradouro_endereco` varchar(255) NOT NULL,
  `numero_endereco` varchar(255) NOT NULL,
  `bairro_endereco` varchar(255) NOT NULL,
  `cidade_endereco` varchar(255) NOT NULL,
  `cep_endereco` varchar(255) NOT NULL,
  `uf_endereco` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.endereco: ~83 rows (aproximadamente)
INSERT INTO `endereco` (`id`, `logradouro_endereco`, `numero_endereco`, `bairro_endereco`, `cidade_endereco`, `cep_endereco`, `uf_endereco`) VALUES
	(1, 'Rua Victor Konder', '54', 'Iririú', 'Joinville', '89227-240', 'SC'),
	(2, 'Avenida Tucano', '54', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(3, 'Avenida Tucano', '54', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(4, 'Avenida Tucano', '54', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(5, 'Avenida Tucano', '54', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(6, 'Avenida Tucano', '54', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(7, 'Avenida Tucano', '54', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(8, 'Avenida Tucano', '54', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(9, 'Avenida Tucano', '54', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(10, 'Avenida Tucano', '54', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(11, 'Avenida Tucano', '54', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(12, 'Avenida Tucano', '54', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(13, 'Avenida Tucano', '54', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(14, 'Avenida Tucano', '54', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(15, 'Avenida Tucano', '333', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(21, 'Avenida Tucano', '111111', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(23, 'Avenida Tucano', '22222', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(24, 'Avenida Tucano', '22222', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(25, 'Avenida Tucano', '22222', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(26, 'Avenida Tucano', '22222', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(27, 'Avenida Tucano', '22222', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(28, 'Avenida Tucano', '22222', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(29, 'Avenida Tucano', '22222', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(30, 'Avenida Tucano', '22222', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(31, 'Avenida Tucano', '6', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(32, 'Avenida Tucano', '6', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(34, 'Avenida Tucano', '21', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(35, 'Avenida Tucano', '21', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(36, 'Avenida Tucano', '21', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(37, 'Avenida Tucano', '21', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(52, 'Avenida Tucano', '23', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(54, 'Avenida Tucano', '43', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(55, 'Avenida Tucano', '43', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(56, 'Avenida Tucano', '43', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(57, 'Avenida Tucano', '43', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(58, 'Avenida Tucano', '43', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(59, 'Avenida Tucano', '43', 'São Conrado', 'Cariacica', '29141-180', 'ES'),
	(61, 'Ana Júlia', '1', 'Ana Júlia', 'Joinville', '89231-995', 'SC'),
	(62, 'Ana Júlia', '1', 'Ana Júlia', 'Joinville', '89231-995', 'SC'),
	(63, 'Ana Júlia', '1', 'Ana Júlia', 'Joinville', '89231-995', 'SC'),
	(64, 'Alvino Souza do Nascimento', '3', 'Alvino Souza do Nascimento', 'Joinville', '89226-990', 'SC'),
	(65, 'Alvino Souza do Nascimento', '3', 'Alvino Souza do Nascimento', 'Joinville', '89226-990', 'SC');
INSERT INTO `endereco` (`id`, `logradouro_endereco`, `numero_endereco`, `bairro_endereco`, `cidade_endereco`, `cep_endereco`, `uf_endereco`) VALUES
	(66, 'Rua Doutor João Colin', '5', 'América', 'Joinville', '89204-901', 'SC'),
	(67, 'Rua Doutor João Colin', '5', 'América', 'Joinville', '89204-901', 'SC'),
	(68, 'Rua Paraíba', '8', 'Anita Garibaldi', 'Joinville', '89203-901', 'SC'),
	(69, 'Rua Paraíba', '8', 'Anita Garibaldi', 'Joinville', '89203-901', 'SC'),
	(70, 'Rua Paraíba', '3', 'Anita Garibaldi', 'Joinville', '89203-901', 'SC'),
	(71, 'Estrada Anaburgo ', '6', ' Vila Nova', 'Joinville', '89237-990', 'SC'),
	(72, 'Estrada Anaburgo ', '6', ' Vila Nova', 'Joinville', '89237-990', 'SC'),
	(73, 'Rua Xavantes', '3', 'Atiradores', 'Joinville', '89203-900', 'SC'),
	(74, 'Rua Beiramar', '7', 'Beiramar', 'Joinville', '89231-996', 'SC'),
	(75, 'Rua Beiramar', '5', 'Beiramar', 'Joinville', '89232-302', 'SC'),
	(76, 'Rua Beiramar', '5', 'Beiramar', 'Joinville', '89232-302', 'SC'),
	(77, 'Rua Kurt Meinert', '2', 'Paranaguamirin', 'Joinville', '89231-997', 'SC'),
	(78, 'Rua Kurt Meinert', '8', 'Paranaguamirim', 'Joinville', '89231-997', 'SC'),
	(79, 'Avenida Kurt Meinert', '9', 'Bucarein', 'Joinville', '89231-998', 'SC'),
	(80, 'Rua do Príncipe', '4', 'Centro', 'Joinville', '89201-900', 'SC'),
	(81, 'Rua Beiramar', '24', 'Aventureiro', 'Joinville', '89231-996', 'SC'),
	(82, 'Rua do Príncipe', '98', 'Centro', 'Joinville', '89201-900', 'SC'),
	(83, 'Avenida Juscelino Kubitschek', '12', 'Centro', 'Joinville', '89201-906', 'SC'),
	(84, 'Praça Marechal Castelo Branco', '12', 'Centro', 'Joinville', '89201-910', 'SC');

-- Copiando estrutura para tabela sa_system.foto_empreendimento
CREATE TABLE IF NOT EXISTS `foto_empreendimento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url_foto_empreendimento` varchar(255) NOT NULL,
  `fk_empreendimento` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foto_empreendimento_fk_empreendimento_7e14349b_fk_empreendi` (`fk_empreendimento`),
  CONSTRAINT `foto_empreendimento_fk_empreendimento_7e14349b_fk_empreendi` FOREIGN KEY (`fk_empreendimento`) REFERENCES `empreendimento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.foto_empreendimento: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sa_system.foto_imovel
CREATE TABLE IF NOT EXISTS `foto_imovel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url_foto_imovel` varchar(255) NOT NULL,
  `fk_imovel` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foto_imovel_fk_imovel_1ae90861_fk_imovel_id` (`fk_imovel`),
  CONSTRAINT `foto_imovel_fk_imovel_1ae90861_fk_imovel_id` FOREIGN KEY (`fk_imovel`) REFERENCES `imovel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.foto_imovel: ~94 rows (aproximadamente)
INSERT INTO `foto_imovel` (`id`, `url_foto_imovel`, `fk_imovel`) VALUES
	(38, 'imoveis/i334X9E7q16S2p2_27127660b09a052c8f.jpg', 36),
	(39, 'imoveis/i334X9E7q16S2p2_27127660b09c5d08be.jpg', 36),
	(40, 'imoveis/i334X9E7q16S2p2_27127660b098aab90c.jpg', 36),
	(41, 'imoveis/i334X9E7q16S2p2_27127660b098f3811c.jpg', 36),
	(42, 'imoveis/iFw148v475Kk_2676265a962e90a2ca.jpg', 37),
	(43, 'imoveis/iFw148v475Kk_2676265a962f61831a.jpg', 37),
	(44, 'imoveis/iFw148v475Kk_2676265a96346d9eef.jpg', 37),
	(45, 'imoveis/iFw148v475Kk_2676265a96313988bc.jpg', 37),
	(46, 'imoveis/i1um456se4I76b1_2691565cfa81b14fe7.jpg', 38),
	(47, 'imoveis/i1um456se4I76b1_2691565cfa81d187f5.jpg', 38),
	(48, 'imoveis/i1um456se4I76b1_2691565cfa81f043c0.jpg', 38),
	(49, 'imoveis/i1um456se4I76b1_2691565cfa814c613e.jpg', 38),
	(50, 'imoveis/i1um456se4I76b1_2691565cfa8194fd27.jpg', 38),
	(51, 'imoveis/i1um456se4I76b1_2691565cfa81779b76.jpg', 38),
	(52, 'imoveis/iRpl3662C13ms67_265576557a7d7ca70d.jpg', 39),
	(53, 'imoveis/iRpl3662C13ms67_265576557a73db49a4.jpg', 39),
	(54, 'imoveis/iRpl3662C13ms67_265576557a715eef14.jpg', 39),
	(55, 'imoveis/iRpl3662C13ms67_265576557a721017c9.jpg', 39),
	(56, 'imoveis/iRpl3662C13ms67_265576557a731508a9.jpg', 39),
	(57, 'imoveis/if8bP929q53_2357965c3d0ffa1c96.jpg', 40),
	(58, 'imoveis/if8bP929q53_2357965c3d04b82825.jpg', 40),
	(59, 'imoveis/if8bP929q53_2357965c3d010a8711.jpg', 40),
	(60, 'imoveis/if8bP929q53_2357965c3d10a24cf4.jpg', 40),
	(61, 'imoveis/if8bP929q53_2357965c3d024aa064.jpg', 40),
	(62, 'imoveis/if8bP929q53_2357965c3d054baaf2.jpg', 40),
	(63, 'imoveis/i30fzHGn2930q54KD8_23821653fde4f406b3.jpg', 41),
	(64, 'imoveis/i30fzHGn2930q54KD8_23821653fde5c83ac2.jpg', 41),
	(65, 'imoveis/i30fzHGn2930q54KD8_23821653fde42b4ddf.jpg', 41),
	(66, 'imoveis/i30fzHGn2930q54KD8_23821653fde816f870.jpg', 41),
	(67, 'imoveis/i30fzHGn2930q54KD8_23821653fdf240d1ed.jpg', 41),
	(68, 'imoveis/i30fzHGn2930q54KD8_23821653fe00f6dd9c.jpg', 41),
	(69, 'imoveis/ihLwH_2614364f640a4e23f0.jpg', 42),
	(70, 'imoveis/ihLwH_2614364f640dbdc1ef_1.jpg', 42),
	(71, 'imoveis/ihLwH_2614364f640dbdc1ef.jpg', 42),
	(72, 'imoveis/ihLwH_2614364f640fb8e3dc.jpg', 42),
	(73, 'imoveis/ihLwH_2614364f6403a63216.jpg', 42),
	(74, 'imoveis/ihLwH_2614364f6405b3efc1.jpg', 42),
	(75, 'imoveis/ihLwH_2614364f64045d304b.jpg', 42),
	(76, 'imoveis/ihLwH_2614364f6408520009.jpg', 42),
	(77, 'imoveis/i8xhE8_2599864dd0baf1cb4d.jpg', 45),
	(78, 'imoveis/i8xhE8_2599864dd0bcbb0436.jpg', 45),
	(79, 'imoveis/i8xhE8_2599864dd0bdf81868.jpg', 45),
	(80, 'imoveis/i8xhE8_2599864dd0be95d559.jpg', 45),
	(81, 'imoveis/i8xhE8_2599864dd0c4434a1a.jpg', 45),
	(82, 'imoveis/i8xhE8_2599864dd0c80924c5.jpg', 45),
	(83, 'imoveis/i7L0G7V4o97A274_26266651356a5e9f64.jpg', 46),
	(84, 'imoveis/i7L0G7V4o97A274_26266651356b334f66.jpg', 46),
	(85, 'imoveis/i7L0G7V4o97A274_26266651356bcb6a6e.jpg', 46),
	(86, 'imoveis/i7L0G7V4o97A274_26266651356c62ba10.jpg', 46),
	(87, 'imoveis/i7L0G7V4o97A274_26266651356e2318ec.jpg', 46),
	(88, 'imoveis/i7L0G7V4o97A274_262666513571d90750.jpg', 46),
	(89, 'imoveis/i7L0G7V4o97A274_262666513572732c42.jpg', 46),
	(90, 'imoveis/i7L0G7V4o97A274_2626665135745213a4.jpg', 46),
	(91, 'imoveis/i8xhE8_2599864dd0baf1cb4d_CR8UKip.jpg', 46),
	(92, 'imoveis/i8xhE8_2599864dd0bcbb0436_E7yRnQ5.jpg', 46),
	(93, 'imoveis/i8xhE8_2599864dd0bdf81868_IodSeaW.jpg', 46),
	(94, 'imoveis/i8xhE8_2599864dd0be95d559_RI8f5Jw.jpg', 46),
	(95, 'imoveis/i8xhE8_2599864dd0c4434a1a_AGc67wM.jpg', 46),
	(96, 'imoveis/i8xhE8_2599864dd0c80924c5_8yjDwP9.jpg', 46);
INSERT INTO `foto_imovel` (`id`, `url_foto_imovel`, `fk_imovel`) VALUES
	(97, 'imoveis/itF1d9V988888v7yBy492_27415664e8a7e8b140.jpg', 47),
	(98, 'imoveis/itF1d9V988888v7yBy492_27415664e8a8c8afe8.jpg', 47),
	(99, 'imoveis/itF1d9V988888v7yBy492_27415664e8a846fb9f.jpg', 47),
	(100, 'imoveis/itF1d9V988888v7yBy492_27415664e8a8216b14.jpg', 47),
	(101, 'imoveis/itF1d9V988888v7yBy492_27415664e8a838432a.jpg', 47),
	(102, 'imoveis/itF1d9V988888v7yBy492_27415664e8a8757124.jpg', 47),
	(103, 'imoveis/i6O5omY4195P233wf_2734466391f9fedeac.jpg', 48),
	(104, 'imoveis/i6O5omY4195P233wf_2734466391fa24d2dc.jpg', 48),
	(105, 'imoveis/i6O5omY4195P233wf_2734466391fa67ef92.jpg', 48),
	(106, 'imoveis/i6O5omY4195P233wf_2734466391fa466e43.jpg', 48),
	(107, 'imoveis/i6O5omY4195P233wf_2734466391fb69eeb1.jpg', 48),
	(108, 'imoveis/i6O5omY4195P233wf_2734466391fb144da3.jpg', 48),
	(109, 'imoveis/i6O5omY4195P233wf_2734466391fb5145ea.jpg', 48),
	(110, 'imoveis/i6O5omY4195P233wf_2734466391fbbb7158.jpg', 48),
	(111, 'imoveis/iD98xv3p6N5w16o_2417866565a01d087f.jpg', 49),
	(112, 'imoveis/iD98xv3p6N5w16o_2417866565a005fb70.jpg', 49),
	(113, 'imoveis/iD98xv3p6N5w16o_24178665659ed26808.jpg', 49),
	(114, 'imoveis/iD98xv3p6N5w16o_24178665659ef5a033.jpg', 49),
	(115, 'imoveis/iD98xv3p6N5w16o_24178665659f0ebd3c.jpg', 49),
	(116, 'imoveis/iD98xv3p6N5w16o_24178665659f2c1b4a.jpg', 49),
	(117, 'imoveis/iD98xv3p6N5w16o_24178665659f6de65e.jpg', 49),
	(118, 'imoveis/iD98xv3p6N5w16o_24178665659fdea829.jpg', 49);

-- Copiando estrutura para tabela sa_system.imovel
CREATE TABLE IF NOT EXISTS `imovel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_criacao_imovel` datetime(6) NOT NULL,
  `data_atualizacao_imovel` datetime(6) DEFAULT NULL,
  `complemento_endereco_imovel` varchar(255) DEFAULT NULL,
  `area_total_imovel` double DEFAULT NULL,
  `area_privativa_imovel` double DEFAULT NULL,
  `preco_imovel` double NOT NULL,
  `num_quarto_imovel` int NOT NULL,
  `num_suite_imovel` int NOT NULL,
  `num_banheiro_imovel` int NOT NULL,
  `num_garagem_imovel` int NOT NULL,
  `fk_corretor` bigint DEFAULT NULL,
  `fk_empreendimento` bigint DEFAULT NULL,
  `fk_endereco` bigint NOT NULL,
  `fk_proprietario` bigint NOT NULL,
  `fk_subtipo_imovel` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `imovel_fk_empreendimento_4c7756ac_fk_empreendimento_id` (`fk_empreendimento`),
  KEY `imovel_fk_endereco_52901fab_fk_endereco_id` (`fk_endereco`),
  KEY `imovel_fk_proprietario_ee0f63c3_fk_cliente_id` (`fk_proprietario`),
  KEY `imovel_fk_subtipo_imovel_018c6713_fk_subtipo_imovel_id` (`fk_subtipo_imovel`),
  KEY `imovel_fk_corretor_c65f8446` (`fk_corretor`),
  CONSTRAINT `imovel_fk_corretor_c65f8446_fk_corretor_id` FOREIGN KEY (`fk_corretor`) REFERENCES `corretor` (`id`),
  CONSTRAINT `imovel_fk_empreendimento_4c7756ac_fk_empreendimento_id` FOREIGN KEY (`fk_empreendimento`) REFERENCES `empreendimento` (`id`),
  CONSTRAINT `imovel_fk_endereco_52901fab_fk_endereco_id` FOREIGN KEY (`fk_endereco`) REFERENCES `endereco` (`id`),
  CONSTRAINT `imovel_fk_proprietario_ee0f63c3_fk_cliente_id` FOREIGN KEY (`fk_proprietario`) REFERENCES `cliente` (`id`),
  CONSTRAINT `imovel_fk_subtipo_imovel_018c6713_fk_subtipo_imovel_id` FOREIGN KEY (`fk_subtipo_imovel`) REFERENCES `subtipo_imovel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.imovel: ~37 rows (aproximadamente)
INSERT INTO `imovel` (`id`, `data_criacao_imovel`, `data_atualizacao_imovel`, `complemento_endereco_imovel`, `area_total_imovel`, `area_privativa_imovel`, `preco_imovel`, `num_quarto_imovel`, `num_suite_imovel`, `num_banheiro_imovel`, `num_garagem_imovel`, `fk_corretor`, `fk_empreendimento`, `fk_endereco`, `fk_proprietario`, `fk_subtipo_imovel`) VALUES
	(29, '2024-06-13 22:59:20.286274', '2024-06-13 22:59:20.389658', 'Teste do infra sla', 2, NULL, 2, 222, 2, 2, 2, 1, NULL, 52, 1, 2),
	(32, '2024-06-14 00:11:46.273576', '2024-06-14 00:11:46.286463', 'Teste', 100, NULL, 230000, 5, 5, 2, 3, 1, NULL, 62, 1, 9),
	(33, '2024-06-14 00:12:43.034298', '2024-06-14 00:12:43.042692', 'Teste', 100, NULL, 230000, 5, 5, 2, 3, 1, NULL, 63, 1, 9),
	(34, '2024-06-14 00:14:07.544156', '2024-06-14 00:14:07.552160', 'Teste2', 90, NULL, 320000, 3, 1, 2, 2, 1, NULL, 65, 1, 1),
	(35, '2024-06-14 00:17:34.292849', '2024-06-14 00:17:34.302384', 'Casa de cor branca', 100, NULL, 250000, 3, 1, 2, 2, 1, NULL, 67, 5, 1),
	(36, '2024-06-14 00:19:28.171325', '2024-06-14 00:19:28.192256', 'Casa de cor branca', 100, NULL, 150000, 3, 0, 1, 2, 1, NULL, 69, 9, 1),
	(37, '2024-06-14 00:22:28.563570', '2024-06-14 00:22:28.580889', 'Germinado cor bege', 64, NULL, 120000, 2, 0, 1, 1, 1, NULL, 70, 4, 11),
	(38, '2024-06-14 00:25:08.815023', '2024-06-14 00:25:08.834560', 'Sobrado cor branca', 90, NULL, 290000, 2, 0, 1, 1, 1, NULL, 72, 1, 10),
	(39, '2024-06-14 00:27:42.499033', '2024-06-14 00:27:42.516521', 'Germinado Cor branca', 80, NULL, 250000, 1, 1, 1, 1, 1, NULL, 73, 1, 11),
	(40, '2024-06-14 00:30:15.817250', '2024-06-14 00:30:15.837792', 'Germinado cor laranja', 90, NULL, 350000, 2, 1, 2, 1, 1, NULL, 74, 1, 1),
	(41, '2024-06-14 00:33:56.547298', '2024-06-14 00:33:56.567335', 'Germinado cor branca', 80, NULL, 200000, 1, 1, 1, 1, 1, NULL, 76, 1, 11),
	(42, '2024-06-14 00:37:42.639066', '2024-06-14 00:37:42.665966', 'Germinado Sobrado', 80, NULL, 200000, 1, 1, 1, 2, 1, NULL, 77, 1, 11),
	(43, '2024-06-14 00:43:10.170122', '2024-06-14 00:43:10.175108', 'Germinado cor branca', 77, NULL, 200000, 2, 0, 1, 1, 1, NULL, 78, 4, 11),
	(44, '2024-06-14 00:46:10.446503', '2024-06-14 00:46:10.450476', 'Germinado cor branca', 65, NULL, 200000, 2, 0, 1, 1, 1, NULL, 79, 8, 11),
	(45, '2024-06-14 00:47:45.967252', '2024-06-14 00:47:45.983304', 'Germinado cor branca', 65, NULL, 160000, 2, 0, 1, 1, 1, NULL, 80, 3, 11),
	(46, '2024-06-14 00:50:28.409570', '2024-06-14 00:50:28.442633', 'Germinado cor cinza claro', 77, NULL, 250000, 2, 0, 1, 1, 1, NULL, 81, 1, 11),
	(47, '2024-06-14 00:52:32.367006', '2024-06-14 00:52:32.386724', 'Germinado cor bege', 137, NULL, 350000, 2, 1, 1, 2, 1, NULL, 82, 1, 11),
	(48, '2024-06-14 00:56:14.602998', '2024-06-14 00:56:14.626984', 'Germinado cor branca', 120, NULL, 300000, 2, 0, 1, 1, 1, NULL, 83, 7, 11),
	(49, '2024-06-14 00:59:10.680139', '2024-06-14 00:59:10.701699', 'Germinado branco', 77, NULL, 200000, 2, 0, 1, 1, 1, NULL, 84, 5, 11);

-- Copiando estrutura para tabela sa_system.infraestrutura_emp
CREATE TABLE IF NOT EXISTS `infraestrutura_emp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_infraestrutura_emp` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.infraestrutura_emp: ~44 rows (aproximadamente)
INSERT INTO `infraestrutura_emp` (`id`, `nome_infraestrutura_emp`) VALUES
	(1, 'Aquecimento Central'),
	(2, 'Bicicletário'),
	(3, 'Brinquedoteca'),
	(4, 'Central de Gás'),
	(5, 'Cerca Eletrificada'),
	(6, 'Churrasqueira Coletiva'),
	(7, 'Cinema'),
	(8, 'Circuito de TV'),
	(9, 'Elevador'),
	(10, 'Elevador de Serviço'),
	(11, 'Empresa de Monitoramento'),
	(12, 'Entrada de Serviço'),
	(13, 'Espaco Gourmet'),
	(14, 'Espaço Pet'),
	(15, 'Estacionamento'),
	(16, 'Estacionamento para Visitantes'),
	(17, 'Condomínio Fechado Depósito'),
	(18, 'Guarita'),
	(19, 'Gás Central'),
	(20, 'Hall de Entrada'),
	(21, 'Heliponto'),
	(22, 'Interfone'),
	(23, 'Jardim'),
	(24, 'Lavanderia'),
	(25, 'Piscina Coletiva'),
	(26, 'Sala Fitness'),
	(27, 'Sala de Jogos'),
	(28, 'Piscina Infantil'),
	(29, 'Playground'),
	(30, 'Portaria'),
	(31, 'Portaria 24h'),
	(32, 'Porteiro Eletrônico'),
	(33, 'Quadra de Esportes'),
	(34, 'Quadra de Tênis'),
	(35, 'Lounge Pilotis'),
	(36, 'Piscina Aquecida'),
	(37, 'Quiosque'),
	(38, 'Salão de Festas'),
	(39, 'Sauna Coletiva'),
	(40, 'Segurança'),
	(41, 'Spa'),
	(42, 'Terraço Coletivo'),
	(43, 'Vigilância 24h'),
	(44, 'Zelador');

-- Copiando estrutura para tabela sa_system.infraestrutura_imovel
CREATE TABLE IF NOT EXISTS `infraestrutura_imovel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_infraestrutura_imovel` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.infraestrutura_imovel: ~57 rows (aproximadamente)
INSERT INTO `infraestrutura_imovel` (`id`, `nome_infraestrutura_imovel`) VALUES
	(1, 'Adega'),
	(2, 'Água Quente'),
	(3, 'Alarme'),
	(4, 'Aquecedor a Gás'),
	(5, 'Aquecedor Solar'),
	(6, 'Ar Central'),
	(7, 'Ar Condicionado'),
	(8, 'Armários Embutidos'),
	(9, 'Área Gourmet'),
	(10, 'Área de Serviço'),
	(11, 'Banheira'),
	(12, 'Banheiro Social'),
	(13, 'Banheiro de Empregada'),
	(14, 'Bar'),
	(15, 'Cameras de Segurança'),
	(16, 'Cerca Elétrica'),
	(17, 'Churrasqueira'),
	(18, 'Copa'),
	(19, 'Copa Cozinha'),
	(20, 'Cozinha'),
	(21, 'Cozinha Americana'),
	(22, 'Cozinha Integrada'),
	(23, 'Cozinha Planejada'),
	(24, 'Dormitório com Armários'),
	(25, 'Edícula'),
	(26, 'Lareira Lavabo'),
	(27, 'Lavanderia Mezanino'),
	(28, 'Elevador Privativo'),
	(29, 'Escritório'),
	(30, 'Espera para Split'),
	(31, 'Estar Íntimo'),
	(32, 'Gradeado Hall'),
	(33, 'Hidromassagem'),
	(34, 'Home Theater'),
	(35, 'Deck'),
	(36, 'Dependência de Empregada Despensa'),
	(37, 'Jardim Privativo Jardim de Inverno'),
	(38, 'Mobiliado'),
	(39, 'Persianas Automatizadas'),
	(40, 'Persiana Elétrica'),
	(41, 'Piscina'),
	(42, 'Piso Elevado'),
	(43, 'Quintal'),
	(44, 'Reformado'),
	(45, 'Sacada'),
	(46, 'Sacada com Churrasqueira'),
	(47, 'Sala com Armários'),
	(48, 'Sala de Jantar'),
	(49, 'Sala de TV'),
	(50, 'Salas Integradas'),
	(51, 'Sauna'),
	(52, 'Semi Mobiliado'),
	(53, 'Split'),
	(54, 'Suíte Master'),
	(55, 'Terraço'),
	(56, 'Vista Panorâmica'),
	(57, 'Vista para o Mar');

-- Copiando estrutura para tabela sa_system.perfil
CREATE TABLE IF NOT EXISTS `perfil` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bairro_perfil` varchar(255) DEFAULT NULL,
  `area_total_perfil` double DEFAULT NULL,
  `area_privativa_perfil` double DEFAULT NULL,
  `preco_perfil` double DEFAULT NULL,
  `num_quarto_perfil` int DEFAULT NULL,
  `num_suite_perfil` int DEFAULT NULL,
  `num_banheiro_perfil` int DEFAULT NULL,
  `num_garagem_perfil` int DEFAULT NULL,
  `fk_cliente` bigint NOT NULL,
  `fk_subtipo_imovel` bigint DEFAULT NULL,
  `fk_tipo_imovel` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `perfil_fk_cliente_f8543c2d_fk_cliente_id` (`fk_cliente`),
  KEY `perfil_fk_subtipo_imovel_9d374c91_fk_subtipo_imovel_id` (`fk_subtipo_imovel`),
  KEY `perfil_fk_tipo_imovel_20a3ab84_fk_tipo_imovel_id` (`fk_tipo_imovel`),
  CONSTRAINT `perfil_fk_cliente_f8543c2d_fk_cliente_id` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `perfil_fk_subtipo_imovel_9d374c91_fk_subtipo_imovel_id` FOREIGN KEY (`fk_subtipo_imovel`) REFERENCES `subtipo_imovel` (`id`),
  CONSTRAINT `perfil_fk_tipo_imovel_20a3ab84_fk_tipo_imovel_id` FOREIGN KEY (`fk_tipo_imovel`) REFERENCES `tipo_imovel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.perfil: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sa_system.subtipo_imovel
CREATE TABLE IF NOT EXISTS `subtipo_imovel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_subtipo_imovel` varchar(255) NOT NULL,
  `fk_tipo_imovel` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subtipo_imovel_fk_tipo_imovel_bd054c1c_fk_tipo_imovel_id` (`fk_tipo_imovel`),
  CONSTRAINT `subtipo_imovel_fk_tipo_imovel_bd054c1c_fk_tipo_imovel_id` FOREIGN KEY (`fk_tipo_imovel`) REFERENCES `tipo_imovel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.subtipo_imovel: ~24 rows (aproximadamente)
INSERT INTO `subtipo_imovel` (`id`, `nome_subtipo_imovel`, `fk_tipo_imovel`) VALUES
	(1, 'Padrão', 1),
	(2, 'Giardino', 1),
	(5, 'Duplex', 1),
	(6, 'Loft', 1),
	(7, 'Studio', 1),
	(8, 'Quitinete', 1),
	(9, 'Plana', 2),
	(10, 'Sobrado', 2),
	(11, 'Geminado', 2),
	(12, 'Plana', 3),
	(13, 'Duplex', 3),
	(14, 'Triplex', 3),
	(15, 'Residencial', 4),
	(16, 'Comercial', 4),
	(17, 'Industrial', 4),
	(18, 'Grandes áreas', 4),
	(19, 'Chácara', 5),
	(20, 'Sítio', 5),
	(21, 'Fazenda', 5),
	(22, 'Casa', 6),
	(23, 'Loja', 6),
	(24, 'Sala', 6),
	(25, 'Galpão', 7),
	(26, 'Condomínio', 7);

-- Copiando estrutura para tabela sa_system.tipo_cliente
CREATE TABLE IF NOT EXISTS `tipo_cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_tipo_cliente` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.tipo_cliente: ~2 rows (aproximadamente)
INSERT INTO `tipo_cliente` (`id`, `nome_tipo_cliente`) VALUES
	(1, 'Proprietário'),
	(2, 'Comprador');

-- Copiando estrutura para tabela sa_system.tipo_conta
CREATE TABLE IF NOT EXISTS `tipo_conta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_tipo_conta` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.tipo_conta: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sa_system.tipo_imovel
CREATE TABLE IF NOT EXISTS `tipo_imovel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_tipo_imovel` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.tipo_imovel: ~7 rows (aproximadamente)
INSERT INTO `tipo_imovel` (`id`, `nome_tipo_imovel`) VALUES
	(1, 'Apartamento'),
	(2, 'Casa'),
	(3, 'Cobertura'),
	(4, 'Terreno'),
	(5, 'Rural'),
	(6, 'Comercial'),
	(7, 'Miscelânia');

-- Copiando estrutura para tabela sa_system.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `cliente_id` bigint DEFAULT NULL,
  `corretor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `admin_id` (`admin_id`),
  UNIQUE KEY `cliente_id` (`cliente_id`),
  UNIQUE KEY `corretor_id` (`corretor_id`),
  CONSTRAINT `user_admin_id_364ee567_fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `user_cliente_id_09fe8f4c_fk_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `user_corretor_id_47f11c43_fk_corretor_id` FOREIGN KEY (`corretor_id`) REFERENCES `corretor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.user: ~12 rows (aproximadamente)
INSERT INTO `user` (`id`, `password`, `last_login`, `is_superuser`, `email`, `is_active`, `is_staff`, `date_joined`, `admin_id`, `cliente_id`, `corretor_id`) VALUES
	(1, 'pbkdf2_sha256$720000$eCvFqzPVwahfZFNU8jGlg6$K8P7ffADfRkfyclj8atcdIxXgZZjR601ly9Z0Ps2TYE=', NULL, 0, 'yares@admin.test', 1, 0, '2024-05-30 18:18:12.478423', NULL, 1, NULL),
	(2, 'pbkdf2_sha256$720000$muHMOX7QClKUq6aRlKygrB$dkVSXZPgXPi0B/oVGxXYd4QRH/xaghGBvTtJeVsV/dk=', NULL, 0, 'chato@gmail.com', 1, 0, '2024-05-30 18:21:07.137712', NULL, 2, NULL),
	(3, 'pbkdf2_sha256$720000$5OxvXi17heqWDvOeq77M9I$EQpUy/UfBquPtf75OStxJjrN43XywtPAGggAbRiwBkc=', NULL, 0, 'crypt@crypt', 1, 0, '2024-05-30 18:24:44.977335', NULL, 3, NULL),
	(4, 'pbkdf2_sha256$720000$ALAR8YHGOOcKPBQV32YQMn$Zt8ys/FySPRr56J4XBu3afS5mbkmGy07z/XeICwgGkM=', NULL, 0, 'dalee@certeza.com', 1, 0, '2024-05-30 18:28:06.412430', NULL, 4, NULL),
	(6, 'pbkdf2_sha256$720000$vWHh1CR7SnpQsY5z4fDbpj$WJmP5VLpuL2S96DWrj8eUfi9LKgvZmmMQZ9jJ6I2rag=', NULL, 0, 'ftt@gmail.com', 1, 0, '2024-05-31 00:16:30.110694', NULL, 5, NULL),
	(7, 'pbkdf2_sha256$720000$4hVsMSAoSRfP0FlsxAZhCs$jIY7oSs1dMdvqfNN/O/UcSg48BibhdVvU4L5WwYIXig=', NULL, 0, 'kirowinchester@gmail.com', 1, 0, '2024-06-01 21:03:57.066160', NULL, 6, NULL),
	(8, 'pbkdf2_sha256$720000$3Qn5qXsmNrCOLkJsW0CMPY$sSxgTaftSDcMK9lWqNnOS7LJ9y8QaorrSTem5ybps0o=', '2024-06-01 21:08:56.524490', 0, 'teste_login@gmail.com', 1, 0, '2024-06-01 21:07:12.575529', NULL, 7, NULL),
	(9, 'pbkdf2_sha256$720000$oq5lpD81pCtrKtxi8aHafZ$blB93VKn/hh38wdVekxfLSrbjZmwdATuF0pWSyt8kg0=', '2024-06-19 00:39:41.210167', 0, 'monkeytest@gmail.com', 1, 0, '2024-06-10 22:26:09.491658', NULL, NULL, 1),
	(10, 'pbkdf2_sha256$720000$ZEDaPkkUMiZgPEt3tJeOCy$YyIb5qv9f83nCat1pSBd9RjM+RLa53U17yyqH4WceCo=', NULL, 0, 'exemplo@gmail.com', 1, 0, '2024-06-12 23:51:16.079702', NULL, 8, NULL),
	(11, 'pbkdf2_sha256$720000$d0cyiZpf0bghiBxX4DDybm$B/Ld07hRvrGlDmQOm1fAZ3a/TVy5XtGBa7nPq+HYQuA=', NULL, 0, 'exemplo1@gmail.com', 1, 0, '2024-06-13 00:05:24.961956', NULL, 9, NULL),
	(12, 'pbkdf2_sha256$720000$HCZEe7QWsTB28xJYmDuP8c$Q+sDGKAXnj1eWZr4xB9UYQPxXKGpBdqXP4hQ7ln0sHY=', NULL, 0, 'aranha@aranha', 1, 0, '2024-06-19 00:48:59.001393', NULL, 10, NULL),
	(13, 'pbkdf2_sha256$720000$oq5lpD81pCtrKtxi8aHafZ$blB93VKn/hh38wdVekxfLSrbjZmwdATuF0pWSyt8kg0=', '2024-06-19 01:00:15.491898', 1, 'admin@gmail.com', 1, 0, '2024-06-10 22:26:09.491658', 1, NULL, NULL),
	(14, 'pbkdf2_sha256$720000$L7FIguHr6BivIF7HOnXixj$nwT9L/PlXj0S9xdVvIP3k+KNgXrPKJ5DWkH0Osz8pbg=', NULL, 0, 'wolverine@gmail.com', 1, 0, '2024-06-19 01:02:44.786797', NULL, NULL, 2);

-- Copiando estrutura para tabela sa_system.user_groups
CREATE TABLE IF NOT EXISTS `user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_groups_user_id_group_id_40beef00_uniq` (`user_id`,`group_id`),
  KEY `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_groups_user_id_abaea130_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.user_groups: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela sa_system.user_user_permissions
CREATE TABLE IF NOT EXISTS `user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` (`user_id`,`permission_id`),
  KEY `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela sa_system.user_user_permissions: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
