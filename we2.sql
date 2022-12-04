-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: we2say
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user info',7,'add_userinfo'),(26,'Can change user info',7,'change_userinfo'),(27,'Can delete user info',7,'delete_userinfo'),(28,'Can view user info',7,'view_userinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'viewer','userinfo');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-11-15 14:35:08.021939'),(2,'auth','0001_initial','2022-11-15 14:35:08.588454'),(3,'admin','0001_initial','2022-11-15 14:35:08.829674'),(4,'admin','0002_logentry_remove_auto_add','2022-11-15 14:35:08.861703'),(5,'admin','0003_logentry_add_action_flag_choices','2022-11-15 14:35:08.881721'),(6,'contenttypes','0002_remove_content_type_name','2022-11-15 14:35:08.939774'),(7,'auth','0002_alter_permission_name_max_length','2022-11-15 14:35:09.002832'),(8,'auth','0003_alter_user_email_max_length','2022-11-15 14:35:09.033860'),(9,'auth','0004_alter_user_username_opts','2022-11-15 14:35:09.039865'),(10,'auth','0005_alter_user_last_login_null','2022-11-15 14:35:09.097918'),(11,'auth','0006_require_contenttypes_0002','2022-11-15 14:35:09.112931'),(12,'auth','0007_alter_validators_add_error_messages','2022-11-15 14:35:09.133951'),(13,'auth','0008_alter_user_username_max_length','2022-11-15 14:35:09.181995'),(14,'auth','0009_alter_user_last_name_max_length','2022-11-15 14:35:09.258064'),(15,'auth','0010_alter_group_name_max_length','2022-11-15 14:35:09.321121'),(16,'auth','0011_update_proxy_permissions','2022-11-15 14:35:09.386181'),(17,'auth','0012_alter_user_first_name_max_length','2022-11-15 14:35:09.466253'),(18,'sessions','0001_initial','2022-11-15 14:35:09.546326'),(19,'viewer','0001_initial','2022-11-15 14:35:09.594369'),(20,'viewer','0002_alter_userinfo_passwd','2022-11-15 14:35:09.658428'),(21,'viewer','0003_alter_userinfo_passwd','2022-11-15 14:35:09.705471'),(22,'viewer','0004_userinfo_register','2022-11-16 12:04:14.621968'),(23,'viewer','0005_userinfo_expiry_alter_userinfo_email','2022-11-16 12:17:50.482954'),(24,'viewer','0006_alter_userinfo_expiry','2022-11-16 12:30:05.873146'),(25,'viewer','0007_userinfo_last_userinfo_usedmonth_userinfo_usedyears_and_more','2022-11-16 15:02:46.601714'),(26,'viewer','0008_alter_userinfo_expiry_alter_userinfo_who','2022-11-17 12:59:42.249465'),(27,'viewer','0009_alter_userinfo_register','2022-11-17 13:13:01.528747'),(28,'viewer','0010_alter_userinfo_register','2022-11-17 13:18:52.583777'),(29,'viewer','0011_alter_userinfo_email_alter_userinfo_passwd','2022-11-17 13:24:51.799563'),(30,'viewer','0012_remove_userinfo_email_remove_userinfo_passwd_and_more','2022-11-17 13:33:23.154489'),(31,'viewer','0013_remove_userinfo_eemail_remove_userinfo_epasswd_and_more','2022-11-17 13:39:06.221033'),(32,'viewer','0014_userinfo_user_uid_userinfo_user_uuid_and_more','2022-11-18 20:54:03.399639'),(33,'viewer','0015_alter_userinfo_email_alter_userinfo_passwd','2022-11-18 20:54:03.463689'),(34,'viewer','0016_rename_register_userinfo_registertime_and_more','2022-11-19 10:35:30.169817'),(35,'viewer','0017_userinfo_dirty_alter_userinfo_expiry_and_more','2022-11-30 00:36:04.191359');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3x4cftyijj7e1o8job8q3tpj46xcme18','eyJpbmZvIjp7ImVtYWlsIjoiYWEiLCJleHBpcnkiOiIyMDIyMTExNiJ9fQ:1ovKBy:5eXgI6cA4vkvCNG0HmmhYUi9Utv_aDOViOAIF42RTTA','2022-11-30 15:19:10.863832'),('61je5esxcdp8pl3j4xnivt6e5csi9i3q','.eJwNyUkKgDAMAMC_5GykTdxPfiVtUyi4i6CIf7fXmRfSElcYXtBZ0gQDyBmiJa7GfS_9OkMBem_peHKRIUJLaJqs15VCto6pdeIY69YQsmiPPXcBGzXROwm1Wg_f9wNDrR3K:1p0QB5:BeLXlEDa8YzKigbYVay9dTRuqQD4PYmRgErSXBvlt8M','2022-12-15 00:43:19.925014'),('dspui3o426vwd2cysbirotbyr1kihtok','eyJpbmZvIjp7ImVtYWlsIjoiYXNkZmdAMTYzLmNvbSIsImV4cGlyeSI6IjIwMjItMTItMDIifX0:1oyaQf:_wSG8GqVjdhwqzV9WKWcgUia_iq7X7DZayMmRum4M7o','2022-12-09 23:15:49.857354'),('evbdmnhpwthukkpq4my2j1gr8foh7mxo','eyJpbmZvIjp7ImVtYWlsIjoiZGQiLCJleHBpcnkiOiIyMDIyMTEyNiJ9fQ:1ovLmH:md2t34RmkJ501WN9jTWLYrk5GdttRjPV7ehEvhz4HUA','2022-11-30 17:00:45.266888'),('o9h71dm009okcmgi88ijx6vy2gl63lx3','eyJpbmZvIjp7ImVtYWlsIjoiZGQiLCJleHBpcnkiOiIyMDIyLTExLTI1In19:1ox6bz:9nN_r6anmEh8pZPy4HsUJtYsyZkQn5AYxEHjQQr1JWY','2022-12-05 21:13:23.153046'),('r7iyyowuqrhiy0api42lr96u9ebymkdk','eyJpbmZvIjp7ImVtYWlsIjoiZGQiLCJleHBpcnkiOiIyMDIyMTEyNiJ9fQ:1ovKgK:sJxJW68Z3jmjNLVxHwuFga41PMAuZbvwq87ODa17xqQ','2022-11-30 15:50:32.986031'),('tc91gflefwo2usg9r2wyq9fdlc4akxgz','eyJpbmZvIjp7ImVtYWlsIjoiZGQiLCJleHBpcnkiOiIyMDIyMTEyNiJ9fQ:1ovKYl:OWRjHkoWBQNY8BaJvwJJDPjKq2vIvataiButd61KNYM','2022-11-30 15:42:43.786559');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewer_userinfo`
--

DROP TABLE IF EXISTS `viewer_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viewer_userinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `registerTime` datetime(6) NOT NULL,
  `expiry` date NOT NULL,
  `last` date NOT NULL,
  `who` varchar(32) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  `user_uid` varchar(8) DEFAULT NULL,
  `user_uuid` varchar(36) DEFAULT NULL,
  `registerIP` varchar(16) DEFAULT NULL,
  `usedDownMonth` int NOT NULL,
  `usedDownYear` int NOT NULL,
  `usedUpMonth` int NOT NULL,
  `usedUpYear` int NOT NULL,
  `dirty` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewer_userinfo`
--

LOCK TABLES `viewer_userinfo` WRITE;
/*!40000 ALTER TABLE `viewer_userinfo` DISABLE KEYS */;
INSERT INTO `viewer_userinfo` VALUES (37,'2022-11-18 21:30:51.156818','2022-11-25','2022-11-18','hello','dd','dd','9a2ca2d0','2518e074-9716-44e2-aac6-806eb2347276',NULL,0,0,0,0,0),(39,'2022-11-29 23:21:29.167934','2022-12-06','2022-11-29','hello','aoe@qq.com','asdf1234','8807e690','8807e690-7a85-3c60-bf4f-5988cf9a7783',NULL,0,0,0,0,0),(40,'2022-11-29 23:49:36.530586','2022-12-06','2022-11-29','hello','asdf1234@qq.com','asdf1234','8327bab3','8327bab3-5702-3ae9-938d-6e0fcbad5e1c',NULL,0,0,0,0,0),(41,'2022-11-30 00:22:12.279364','2022-12-07','2022-11-30','hello','asdf3@qq.com','asdf1234','542ef860','542ef860-e99e-348a-873c-a7274b25837a',NULL,0,0,0,0,0),(42,'2022-11-30 00:22:45.423524','2022-12-07','2022-11-30','hello','path','asdf1234','qJivfCkY','638209a2-d2ae-342a-8b29-bacacb8c7755',NULL,0,0,0,0,0),(43,'2022-11-30 00:40:01.969659','2022-12-07','2022-11-30','hello','qwer@ere.com','iefja','0a4e36e7','0a4e36e7-3c09-3024-9499-6863f56e83fd',NULL,0,0,0,0,0);
/*!40000 ALTER TABLE `viewer_userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-04 15:22:57
