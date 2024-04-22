-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sa_system
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_cad_users_imoveis_s`
--

DROP TABLE IF EXISTS `app_cad_users_imoveis_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_cad_users_imoveis_s` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `foto` varchar(100) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` longtext NOT NULL,
  `status` varchar(12) NOT NULL,
  `criado_em` datetime(6) NOT NULL,
  `atualizado_em` datetime(6) NOT NULL,
  `criador_user_id` int(11) DEFAULT NULL,
  `area_privativa` varchar(20) NOT NULL,
  `area_total` varchar(20) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `banheiros` varchar(20) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `estado` varchar(50) NOT NULL,
  `garagens` varchar(20) NOT NULL,
  `iptu` varchar(20) DEFAULT NULL,
  `preco_condominio` varchar(20) DEFAULT NULL,
  `preco_venda` varchar(20) DEFAULT NULL,
  `quartos` varchar(20) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `sacadas` varchar(20) NOT NULL,
  `salas` varchar(20) NOT NULL,
  `suites` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_cad_users_imoveis_s_criador_user_id_5a23412d_fk_auth_user_id` (`criador_user_id`),
  CONSTRAINT `app_cad_users_imoveis_s_criador_user_id_5a23412d_fk_auth_user_id` FOREIGN KEY (`criador_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_cad_users_imoveis_s`
--

LOCK TABLES `app_cad_users_imoveis_s` WRITE;
/*!40000 ALTER TABLE `app_cad_users_imoveis_s` DISABLE KEYS */;
INSERT INTO `app_cad_users_imoveis_s` VALUES
(32,'imoveis_photos/download_IX2QSu0.jfif','Gato feio','1234a','Disponível','2024-04-11 17:31:10.196961','2024-04-11 18:07:19.354943',1,'','','','','','',NULL,'','',NULL,NULL,NULL,'','','','',''),
(33,'imoveis_photos/bah_OOpaXOw.webp','Teste_01a','criação do imovel com o A1','Disponível','2024-04-11 17:38:12.927189','2024-04-11 18:04:25.968668',38,'','','','','','',NULL,'','',NULL,NULL,NULL,'','','','',''),
(34,'imoveis_photos/Imagem_Form_77ZJgoC.jpg','fgd','eeee','Disponível','2024-04-16 18:49:13.172017','2024-04-16 18:49:13.172017',38,'','','','','','',NULL,'','',NULL,NULL,NULL,'','','','',''),
(35,'imoveis_photos/screenshot.png','Lucas Yares','Teste com novas colunas {As colunas serão mostradas no banco de dados e na pagina admin,\r\nsó depois será implementada aqui no html}','Vendido','2024-04-21 19:29:16.436415','2024-04-21 19:34:58.540000',38,'12m²','20m²','Boa Vista','2','89227-240','Joinville','Perto de uma casa','SC','1','SLA BIXO','R$12,00','R$120,00','1','Victor Konder','24','8','3');
/*!40000 ALTER TABLE `app_cad_users_imoveis_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_cad_users_proprietario`
--

DROP TABLE IF EXISTS `app_cad_users_proprietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_cad_users_proprietario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rua` varchar(255) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(50) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `cadastro` datetime(6) NOT NULL,
  `atualizado_em` datetime(6) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `telefone` varchar(15) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_cad_users_proprietario`
--

LOCK TABLES `app_cad_users_proprietario` WRITE;
/*!40000 ALTER TABLE `app_cad_users_proprietario` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_cad_users_proprietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add imoveis_s',7,'add_imoveis_s'),
(26,'Can change imoveis_s',7,'change_imoveis_s'),
(27,'Can delete imoveis_s',7,'delete_imoveis_s'),
(28,'Can view imoveis_s',7,'view_imoveis_s'),
(29,'Can add proprietario',8,'add_proprietario'),
(30,'Can change proprietario',8,'change_proprietario'),
(31,'Can delete proprietario',8,'delete_proprietario'),
(32,'Can view proprietario',8,'view_proprietario');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$720000$fNdU0NN7C1QIgqt1QQrbyn$0xCujjTYkhXIU5cadMNukpT7xAMOiQc9f0INw1/i8bo=','2024-04-21 19:29:54.542046',1,'LucasYares','','','jonnyney@gmail.com',1,1,'2024-02-28 18:24:52.299451'),
(2,'pbkdf2_sha256$720000$cmLUl7HNZjsylayWYd6ZF1$j1AHe4XM+elI7mU/V4lrYLeCrGv+T92UklGwgOeO6pI=',NULL,1,'Erik','','','tojiva.games@gmail.com',1,1,'2024-02-29 19:32:01.212727'),
(33,'pbkdf2_sha256$720000$dy8Q48u4Q6ue0cKiEdPCQJ$nHlgaWIpY8dWyIJQXMt+RkKHfm5Nzxl0tJ0AxH1VIZc=',NULL,0,'Pedro1','','','',0,1,'2024-03-13 17:25:34.271191'),
(35,'pbkdf2_sha256$720000$5fdPzxkM9vhDuyykff82FJ$YcFUohNNaspSJP2TPdusOPPrbRQwpFyhEAlB8HxwJP4=',NULL,0,'aaa','','','',0,1,'2024-03-13 17:27:09.677190'),
(36,'pbkdf2_sha256$720000$FrUTBl2FbOu8gMlPIX1kb9$s32FahMVG8p3zB3nYL9ZELkxSvz+uTy3441KFM6E51o=',NULL,0,'LucasY','','','',0,1,'2024-03-13 17:29:04.094916'),
(37,'pbkdf2_sha256$720000$31p7WzEHyTl9cYxbDTvvlW$gcLuHHKra2xYDDU2Tz+F+kgKPjyLXD86mDOaeRQJoSs=',NULL,1,'Administrador','','','',1,1,'2024-03-25 19:21:57.000000'),
(38,'pbkdf2_sha256$720000$CzJ44bcIWOwrLm3EiH6Ulc$tVwzXRoW8JIXe7zlpE2lUcb60PTCPnmRxRBiCThsfEw=','2024-04-21 19:24:21.598134',0,'a1','','','',0,1,'2024-04-11 17:07:13.166691');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2024-03-12 19:06:30.861321','1','imoveis_s object (1)',1,'[{\"added\": {}}]',7,1),
(2,'2024-03-12 19:30:50.381263','1','imoveis_s object (1)',2,'[]',7,1),
(3,'2024-03-12 20:11:47.942505','7','Lucasa',3,'',4,1),
(4,'2024-03-13 16:58:18.770008','3','Lucas',3,'',4,1),
(5,'2024-03-13 16:58:24.428524','17','Lucasa',3,'',4,1),
(6,'2024-03-13 16:58:29.069983','5','LucasY',3,'',4,1),
(7,'2024-03-13 16:58:37.532611','4','Paolo',3,'',4,1),
(8,'2024-03-13 16:58:42.013316','6','SidineiYares',3,'',4,1),
(9,'2024-03-13 17:00:10.429213','21','LucasY',3,'',4,1),
(10,'2024-03-13 17:00:16.900427','22','Pedro',3,'',4,1),
(11,'2024-03-13 17:01:33.517220','23','Pedro',3,'',4,1),
(12,'2024-03-13 17:01:44.852512','27','Pedro',3,'',4,1),
(13,'2024-03-13 17:02:04.339279','28','Pedro',3,'',4,1),
(14,'2024-03-13 17:18:28.024618','29','Pedro',3,'',4,1),
(15,'2024-03-13 17:18:40.504308','31','Pedro',3,'',4,1),
(16,'2024-03-13 17:26:54.519834','34','aaa',3,'',4,1),
(17,'2024-03-13 17:26:59.762389','32','Pedro',3,'',4,1),
(18,'2024-03-13 17:35:22.589389','1','Gato bonito',2,'[{\"changed\": {\"fields\": [\"Foto\"]}}]',7,1),
(19,'2024-03-25 19:21:58.234501','37','Administrador',1,'[{\"added\": {}}]',4,1),
(20,'2024-03-25 19:22:07.696963','37','Administrador',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),
(21,'2024-03-25 19:27:41.218341','1','Gato bonito',2,'[]',7,1),
(22,'2024-03-25 19:30:49.124501','2','teste',1,'[{\"added\": {}}]',7,1),
(23,'2024-03-26 18:24:07.743410','3','ffedfe',2,'[{\"changed\": {\"fields\": [\"Foto\"]}}]',7,1),
(24,'2024-03-26 18:25:28.434971','5','Gato bonitoeee',3,'',7,1),
(25,'2024-03-26 18:25:31.760243','4','Teste 1',3,'',7,1),
(26,'2024-03-26 18:25:47.016195','3','ffedfe',3,'',7,1),
(27,'2024-03-26 19:26:18.268001','9','M,',3,'',7,1),
(28,'2024-03-26 19:26:23.130389','8','DE3',3,'',7,1),
(29,'2024-03-26 19:26:29.992010','10','Teste 2',3,'',7,1),
(30,'2024-03-26 19:26:32.977437','7','SSCA',3,'',7,1),
(31,'2024-03-26 19:26:37.628227','6','Nheee',3,'',7,1),
(32,'2024-04-11 17:16:56.487902','30','Teste 1',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(7,'app_cad_users','imoveis_s'),
(8,'app_cad_users','proprietario'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2024-02-27 17:33:06.505980'),
(2,'auth','0001_initial','2024-02-27 17:33:06.874348'),
(3,'admin','0001_initial','2024-02-27 17:33:06.985817'),
(4,'admin','0002_logentry_remove_auto_add','2024-02-27 17:33:06.992764'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-02-27 17:33:07.001740'),
(6,'contenttypes','0002_remove_content_type_name','2024-02-27 17:33:07.071572'),
(7,'auth','0002_alter_permission_name_max_length','2024-02-27 17:33:07.123413'),
(8,'auth','0003_alter_user_email_max_length','2024-02-27 17:33:07.137387'),
(9,'auth','0004_alter_user_username_opts','2024-02-27 17:33:07.145381'),
(10,'auth','0005_alter_user_last_login_null','2024-02-27 17:33:07.189237'),
(11,'auth','0006_require_contenttypes_0002','2024-02-27 17:33:07.190235'),
(12,'auth','0007_alter_validators_add_error_messages','2024-02-27 17:33:07.197216'),
(13,'auth','0008_alter_user_username_max_length','2024-02-27 17:33:07.208186'),
(14,'auth','0009_alter_user_last_name_max_length','2024-02-27 17:33:07.223146'),
(15,'auth','0010_alter_group_name_max_length','2024-02-27 17:33:07.237116'),
(16,'auth','0011_update_proxy_permissions','2024-02-27 17:33:07.244091'),
(17,'auth','0012_alter_user_first_name_max_length','2024-02-27 17:33:07.257055'),
(18,'sessions','0001_initial','2024-02-27 17:33:07.288970'),
(19,'app_cad_users','0001_initial','2024-03-12 18:54:59.263387'),
(20,'app_cad_users','0002_alter_imoveis_s_foto','2024-03-26 19:16:50.999468'),
(21,'app_cad_users','0002_imoveis_s_criador_user','2024-04-11 17:29:32.041477'),
(22,'app_cad_users','0003_rename_update_at_imoveis_s_atualizado_em_and_more','2024-04-21 19:22:31.011123'),
(23,'app_cad_users','0004_proprietario','2024-04-21 21:11:46.259732');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('3nfu6ckjykkhdhammv4ux594d3zl8hsj','.eJxVjEEOwiAQRe_C2hCgUMCle89AZpipVA0kpV0Z765NutDtf-_9l0iwrSVtnZc0kzgLLU6_G0J-cN0B3aHemsytrsuMclfkQbu8NuLn5XD_Dgr08q0RjbE2Tuj0qNkZiDgZrQYC9irkwfNI6KKxjIGyVk67qJiDtz5yxCzeH99AN9U:1rycss:2lXvNG4CjgjNCc4JWaxEpRLXmS1C1SqE-n7tB4RH9z0','2024-05-05 19:29:54.638463'),
('8umidns2ta7y9xkjbrg94cgdi73pqoi4','.eJxVjEEOwiAQRe_C2hCgUMCle89AZpipVA0kpV0Z765NutDtf-_9l0iwrSVtnZc0kzgLLU6_G0J-cN0B3aHemsytrsuMclfkQbu8NuLn5XD_Dgr08q0RjbE2Tuj0qNkZiDgZrQYC9irkwfNI6KKxjIGyVk67qJiDtz5yxCzeH99AN9U:1rpCQK:N5niRwWtz7dbFxsGQOC6ls3xKaW4VF__j0abmketo_Y','2024-04-09 19:25:28.204752'),
('co4i7vzvliejbqf9wxyk8zmlu8zwrx44','.eJxVjEEOwiAQRe_C2hCgUMCle89AZpipVA0kpV0Z765NutDtf-_9l0iwrSVtnZc0kzgLLU6_G0J-cN0B3aHemsytrsuMclfkQbu8NuLn5XD_Dgr08q0RjbE2Tuj0qNkZiDgZrQYC9irkwfNI6KKxjIGyVk67qJiDtz5yxCzeH99AN9U:1rk7K1:PP8eDemp-CAY5oC62WYTenq1onrQxODSIfoYtkL9VLA','2024-03-26 18:57:57.900208'),
('s4g9atib1fe5ss84793qk2xnwhmhdyoe','e30:1rk6RU:QmoGWxtJ6bV3Yz3ahbgcShBx8Su-K1ZkUA-50bGV9Jo','2024-03-26 18:01:36.620409'),
('z0zquad6p2pqr1n8qfpdin5s4schj607','e30:1rk6GD:sbD70ttsxb_M8Hdev1ruRi6kiroNQKToGdTZ2iTmmrM','2024-03-26 17:49:57.828711');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-21 23:02:22
