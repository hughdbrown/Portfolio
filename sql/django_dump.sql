-- MySQL dump 10.13  Distrib 5.1.32, for Win32 (ia32)
--
-- Host: localhost    Database: django
-- ------------------------------------------------------
-- Server version	5.1.32-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answrs_answer`
--

DROP TABLE IF EXISTS `answrs_answer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `answrs_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `text` longtext NOT NULL,
  `is_best` tinyint(1) NOT NULL,
  `points` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answrs_answer_user_id` (`user_id`),
  KEY `answrs_answer_question_id` (`question_id`),
  CONSTRAINT `question_id_refs_id_6f24c73f` FOREIGN KEY (`question_id`) REFERENCES `answrs_question` (`id`),
  CONSTRAINT `user_id_refs_id_35b570ae` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `answrs_answer`
--

LOCK TABLES `answrs_answer` WRITE;
/*!40000 ALTER TABLE `answrs_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answrs_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answrs_category`
--

DROP TABLE IF EXISTS `answrs_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `answrs_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `answrs_category`
--

LOCK TABLES `answrs_category` WRITE;
/*!40000 ALTER TABLE `answrs_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `answrs_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answrs_question`
--

DROP TABLE IF EXISTS `answrs_question`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `answrs_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `description` longtext NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answrs_question_user_id` (`user_id`),
  KEY `answrs_question_category_id` (`category_id`),
  CONSTRAINT `category_id_refs_id_762e01d7` FOREIGN KEY (`category_id`) REFERENCES `answrs_category` (`id`),
  CONSTRAINT `user_id_refs_id_1bddd4b6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `answrs_question`
--

LOCK TABLES `answrs_question` WRITE;
/*!40000 ALTER TABLE `answrs_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `answrs_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answrs_userprofile`
--

DROP TABLE IF EXISTS `answrs_userprofile`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `answrs_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `best_answers` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_54236def` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `answrs_userprofile`
--

LOCK TABLES `answrs_userprofile` WRITE;
/*!40000 ALTER TABLE `answrs_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `answrs_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

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
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_5886d21f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_650f49a6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add flat page',9,'add_flatpage'),(26,'Can change flat page',9,'change_flatpage'),(27,'Can delete flat page',9,'delete_flatpage'),(28,'Can add entry',10,'add_entry'),(29,'Can change entry',10,'change_entry'),(30,'Can delete entry',10,'delete_entry'),(31,'Can add comment',11,'add_comment'),(32,'Can change comment',11,'change_comment'),(33,'Can delete comment',11,'delete_comment'),(34,'Can add slot',12,'add_slot'),(35,'Can change slot',12,'change_slot'),(36,'Can delete slot',12,'delete_slot'),(37,'Can add link',13,'add_link'),(38,'Can change link',13,'change_link'),(39,'Can delete link',13,'delete_link'),(40,'Can add carrier',14,'add_carrier'),(41,'Can change carrier',14,'change_carrier'),(42,'Can delete carrier',14,'delete_carrier'),(43,'Can add splash image',15,'add_splashimage'),(44,'Can change splash image',15,'change_splashimage'),(45,'Can delete splash image',15,'delete_splashimage'),(46,'Can add quote',16,'add_quote'),(47,'Can change quote',16,'change_quote'),(48,'Can delete quote',16,'delete_quote'),(49,'Can add song',17,'add_song'),(50,'Can change song',17,'change_song'),(51,'Can delete song',17,'delete_song'),(52,'Can add playlist',18,'add_playlist'),(53,'Can change playlist',18,'change_playlist'),(54,'Can delete playlist',18,'delete_playlist'),(55,'Can add playlist track',19,'add_playlisttrack'),(56,'Can change playlist track',19,'change_playlisttrack'),(57,'Can delete playlist track',19,'delete_playlisttrack'),(58,'Can add user profile',23,'add_userprofile'),(59,'Can change user profile',23,'change_userprofile'),(60,'Can delete user profile',23,'delete_userprofile'),(61,'Can add category',24,'add_category'),(62,'Can change category',24,'change_category'),(63,'Can delete category',24,'delete_category'),(64,'Can add question',25,'add_question'),(65,'Can change question',25,'change_question'),(66,'Can delete question',25,'delete_question'),(67,'Can add answer',26,'add_answer'),(68,'Can change answer',26,'change_answer'),(69,'Can delete answer',26,'delete_answer'),(82,'Can add country',31,'add_country'),(83,'Can change country',31,'change_country'),(84,'Can delete country',31,'delete_country'),(85,'Can add region',32,'add_region'),(86,'Can change region',32,'change_region'),(87,'Can delete region',32,'delete_region'),(88,'Can add winery',33,'add_winery'),(89,'Can change winery',33,'change_winery'),(90,'Can delete winery',33,'delete_winery'),(91,'Can add wine',34,'add_wine'),(92,'Can change wine',34,'change_wine'),(93,'Can delete wine',34,'delete_wine'),(94,'Can add bottle',35,'add_bottle'),(95,'Can change bottle',35,'change_bottle'),(96,'Can delete bottle',35,'delete_bottle'),(97,'Can add project',36,'add_project'),(98,'Can change project',36,'change_project'),(99,'Can delete project',36,'delete_project'),(100,'Can add image list',37,'add_imagelist'),(101,'Can change image list',37,'change_imagelist'),(102,'Can delete image list',37,'delete_imagelist');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'djangouser','Hugh','','hughdbrown@yahoo.com','sha1$c0887$59263ee4f9e2ceb13845a582cd05404229da00cd',1,1,1,'2009-04-23 20:37:10','2009-04-08 18:32:20'),(2,'djangoadmin','','','hughdbrown@yahoo.com','sha1$3fea1$0b889f70c0d53b9dbd9c93793879eeb67ba87351',1,1,1,'2009-04-14 19:08:43','2009-04-13 19:53:45');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f116770` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

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
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comment`
--

DROP TABLE IF EXISTS `blog_comment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `body` longtext NOT NULL,
  `submitted` datetime NOT NULL,
  `entry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comment_entry_id` (`entry_id`),
  CONSTRAINT `entry_id_refs_id_2ebcee0` FOREIGN KEY (`entry_id`) REFERENCES `blog_entry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_entry`
--

DROP TABLE IF EXISTS `blog_entry`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `blog_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `pub_date` datetime NOT NULL,
  `body` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_entry_slug` (`slug`),
  KEY `blog_entry_author_id` (`author_id`),
  CONSTRAINT `author_id_refs_id_664c0c7f` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `blog_entry`
--

LOCK TABLES `blog_entry` WRITE;
/*!40000 ALTER TABLE `blog_entry` DISABLE KEYS */;
INSERT INTO `blog_entry` VALUES (1,'First post','first-post','2009-04-09 11:00:26','asasdasdasd',1,1);
/*!40000 ALTER TABLE `blog_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crime_crime`
--

DROP TABLE IF EXISTS `crime_crime`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `crime_crime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `headline` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `location` varchar(300) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `details` longtext NOT NULL,
  `password` varchar(20) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `crime_crime`
--

LOCK TABLES `crime_crime` WRITE;
/*!40000 ALTER TABLE `crime_crime` DISABLE KEYS */;
INSERT INTO `crime_crime` VALUES (1,'qweqweqwe','2009-04-01','New York City',3,102.2,'asasdasd\r\nasda\r\nsd\r\n','Q','2009-04-09','2009-04-09'),(2,'asdasd','2009-04-01','New York',40.8782181410465,-73.9311218261719,'zxzxc','Q','2009-04-09','2009-04-09');
/*!40000 ALTER TABLE `crime_crime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_user_id` (`user_id`),
  KEY `django_admin_log_content_type_id` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2009-04-08 19:33:18',1,15,'2','storage/splash/Croatia2_371.jpg by ',1,''),(2,'2009-04-08 19:41:38',1,15,'3','storage/splash/lori_in_Croatia.jpg by ',1,''),(3,'2009-04-09 11:00:04',1,13,'1','How to use Django with Apache and mod_python',1,''),(4,'2009-04-09 11:00:54',1,10,'1','First post',1,''),(5,'2009-04-09 11:29:04',1,9,'1','/about/ -- About',1,''),(6,'2009-04-09 11:30:09',1,9,'2','/rss -- RSS',1,''),(7,'2009-04-09 11:33:52',1,9,'1','/about/ -- About',2,'Changed content.'),(8,'2009-04-09 11:36:13',1,9,'2','/rss -- RSS',2,'Changed content.'),(9,'2009-04-09 11:36:47',1,9,'2','/rss/ -- RSS',2,'Changed url.'),(10,'2009-04-09 11:37:30',1,9,'2','/rss/ -- RSS',2,'Changed content.'),(11,'2009-04-09 11:41:24',1,9,'2','/rss/ -- RSS',2,'Changed content.'),(12,'2009-04-09 11:42:59',1,9,'2','/rss/ -- RSS',2,'Changed content.'),(13,'2009-04-09 11:45:21',1,9,'1','/about/ -- About',2,'Changed content.'),(77,'2009-04-20 21:34:20',1,31,'1','USA',1,''),(78,'2009-04-20 21:34:26',1,31,'2','Australia',1,''),(79,'2009-04-20 21:34:31',1,31,'3','Argentina',1,''),(80,'2009-04-20 21:34:37',1,31,'4','Italy',1,''),(81,'2009-04-20 21:34:41',1,31,'5','France',1,''),(82,'2009-04-20 21:34:45',1,31,'6','Canada',1,''),(83,'2009-04-20 21:35:12',1,31,'7','Croatia',1,''),(84,'2009-04-20 21:35:47',1,32,'1','Napa Valley USA',1,''),(85,'2009-04-20 21:36:04',1,32,'2','Mendoza Argentina',1,''),(86,'2009-04-20 21:36:12',1,32,'3','Salta Argentina',1,''),(87,'2009-04-20 21:36:30',1,32,'4','Sonoma Valley USA',1,''),(88,'2009-04-20 21:36:48',1,32,'5','Okanagan Valley Canada',1,''),(89,'2009-04-20 21:36:56',1,32,'6','Niagar Canada',1,''),(90,'2009-04-20 21:37:10',1,32,'6','Niagara Canada',2,'Changed name.'),(91,'2009-04-20 21:38:42',1,33,'1','Vistalba',1,''),(92,'2009-04-20 21:41:27',1,34,'3','Vistalba Corte C Malbec Merlot',1,''),(93,'2009-04-20 21:45:09',1,35,'2','Vistalba Corte C: 2006',1,''),(94,'2009-04-20 22:18:18',1,35,'2','Vistalba Corte C: 2006',2,'Changed image.'),(95,'2009-04-23 20:41:00',1,36,'1','Project Learning Django',1,''),(96,'2009-04-24 02:03:34',1,37,'1','Image 1',1,''),(97,'2009-04-24 02:03:52',1,37,'2','Image 2',1,''),(98,'2009-04-24 02:04:10',1,37,'3','Image 3',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_flags`
--

DROP TABLE IF EXISTS `django_comment_flags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_comment_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `flag` varchar(30) NOT NULL,
  `flag_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`comment_id`,`flag`),
  KEY `django_comment_flags_user_id` (`user_id`),
  KEY `django_comment_flags_comment_id` (`comment_id`),
  KEY `django_comment_flags_flag` (`flag`),
  CONSTRAINT `comment_id_refs_id_373a05f7` FOREIGN KEY (`comment_id`) REFERENCES `django_comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_comment_flags`
--

LOCK TABLES `django_comment_flags` WRITE;
/*!40000 ALTER TABLE `django_comment_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comments`
--

DROP TABLE IF EXISTS `django_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  `object_pk` longtext NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(75) NOT NULL,
  `user_url` varchar(200) NOT NULL,
  `comment` longtext NOT NULL,
  `submit_date` datetime NOT NULL,
  `ip_address` char(15) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_comments_content_type_id` (`content_type_id`),
  KEY `django_comments_site_id` (`site_id`),
  KEY `django_comments_user_id` (`user_id`),
  CONSTRAINT `content_type_id_refs_id_d5868a5` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `site_id_refs_id_7248df08` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_comments`
--

LOCK TABLES `django_comments` WRITE;
/*!40000 ALTER TABLE `django_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'flat page','flatpages','flatpage'),(10,'entry','blog','entry'),(11,'comment','blog','comment'),(12,'slot','djschedule','slot'),(13,'link','links','link'),(14,'carrier','sms','carrier'),(15,'splash image','splash','splashimage'),(16,'quote','quotes','quote'),(17,'song','playlists','song'),(18,'playlist','playlists','playlist'),(19,'playlist track','playlists','playlisttrack'),(20,'comment','comments','comment'),(21,'comment flag','comments','commentflag'),(22,'crime','crime','crime'),(23,'user profile','answrs','userprofile'),(24,'category','answrs','category'),(25,'question','answrs','question'),(26,'answer','answrs','answer'),(31,'country','main','country'),(32,'region','main','region'),(33,'winery','main','winery'),(34,'wine','main','wine'),(35,'bottle','main','bottle'),(36,'project','work','project'),(37,'image list','work','imagelist');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage`
--

DROP TABLE IF EXISTS `django_flatpage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_flatpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `template_name` varchar(70) NOT NULL,
  `registration_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_flatpage_url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_flatpage`
--

LOCK TABLES `django_flatpage` WRITE;
/*!40000 ALTER TABLE `django_flatpage` DISABLE KEYS */;
INSERT INTO `django_flatpage` VALUES (1,'/about/','About','# What\'s Lindy Jam?\r\nLindy Jam is a weekly swing dance in Rochester, NY.  It\'s held every Wednesday from 8:30 PM to 10:30 PM at [Tango Cafe](http://www.tangocafedance.com/) ([map](http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=389+Gregory+St,+Rochester,+NY+14620&amp;sll=43.20168,-77.567969&amp;sspn=0.009494,0.020235&amp;ie=UTF8&amp;ll=43.143301,-77.601103&amp;spn=0.006341,0.008186&amp;z=17&amp;iwloc=addr)).  Admission is $4 (or free if it\'s your first time).\r\n\r\nIt\'s also a website that will get many nifty features in the future.\r\n\r\n# Who made the site?\r\nThe site was created and the backend code is maintained by [Steve Losh](http://stevelosh.com/).  The content is by you.  Contribute and make it better!\r\n\r\n# Have more questions?\r\nIf there\'s anything else you want to know, send an email to [questions@lindyjam.com](mailto:questions@lindyjam.com).\r\n',0,'flatpages/default.html',0),(2,'/rss/','RSS','# Want to stay on top of us?\r\nRSS feeds are a simple way to keep up to date with what happens on websites like this.\r\n\r\nTo subscribe to an RSS feed you\'ll need an RSS reader. [Google Reader](http://www.google.com/reader/) is one that you can use right in your web browser.  If you\'d rather use a program on your own computer to read, check out [Vienna](http://www.vienna-rss.org/) for Mac OS X or [SharpReader](http://www.sharpreader.net/) for Windows.\r\n\r\nWe\'ve got a bunch of feeds set up so far.  If you\'d like to see others, [email Steve](mailto:steve@stevelosh.com).\r\n\r\n## Blog Feeds\r\n[Blog Entries](/rss/blog-entries/) is a feed of each entry posted to the [blog](/blog).\r\n\r\n[Blog Comments](/rss/blog-comments/) is a feed of all the comments on [blog](/blog) entries.\r\n\r\n## Link Feeds\r\n[Links](/rss/links/) is a feed of new links posted on the [links](/links/) page.\r\n',0,'',0);
/*!40000 ALTER TABLE `django_flatpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage_sites`
--

DROP TABLE IF EXISTS `django_flatpage_sites`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_flatpage_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flatpage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flatpage_id` (`flatpage_id`,`site_id`),
  KEY `site_id_refs_id_4e3eeb57` (`site_id`),
  CONSTRAINT `flatpage_id_refs_id_3f17b0a6` FOREIGN KEY (`flatpage_id`) REFERENCES `django_flatpage` (`id`),
  CONSTRAINT `site_id_refs_id_4e3eeb57` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_flatpage_sites`
--

LOCK TABLES `django_flatpage_sites` WRITE;
/*!40000 ALTER TABLE `django_flatpage_sites` DISABLE KEYS */;
INSERT INTO `django_flatpage_sites` VALUES (9,1,1),(8,2,1);
/*!40000 ALTER TABLE `django_flatpage_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0b22818b1402781e5f31fa7ad58c705f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS5iMzZiN2RhZWJiNTEzYmUyMDM0\nMWM5NjBiNmE4MGUwMg==\n','2009-04-27 19:56:49'),('1cad79746291d3696e7c34db7b7c2423','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5lOTE4ZDgyNjEyODQwZTJkZDRj\nZjczOTgwZWNlNTEzNw==\n','2009-05-05 15:31:29'),('1cf91bdcb556c62798ad41c29d3fa7ec','gAJ9cQEuMTE4ZjYzNDkzNTJiYjk0MjE4ZDllZWE3Yzk2MDc4MDk=\n','2009-04-26 19:46:57'),('1d63e95238cd89ba883dc2b2ff5253b8','gAJ9cQEuMTE4ZjYzNDkzNTJiYjk0MjE4ZDllZWE3Yzk2MDc4MDk=\n','2009-05-05 16:01:02'),('264785b9bd2ae20cd7299cc3609c9015','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5lOTE4ZDgyNjEyODQwZTJkZDRj\nZjczOTgwZWNlNTEzNw==\n','2009-04-27 19:01:03'),('29855388c98d9a218fcc1fabd74d95a1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS44MzljMDlhMDFhMzIxNzk1Zjhi\nMWMxY2I3MGYxMjBjNw==\n','2009-05-04 21:34:09'),('2ca52e441fe9434b927b7ee19dcaa5c1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4yZjA0YTE1YWM4OTQ0MGVhNjY3\nZTZjMDQ2ODVlZDY3Nw==\n','2009-04-27 20:02:37'),('32c98e08fd8e8396912286843d3f685f','gAJ9cQEuNDJjNzM0Mjc3MzYzMWIwMWE3OTcwODE2MGFmNzg2OTg=\n','2009-04-23 14:18:03'),('3c23c98c6795179fd768cece91379f5d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS44MzljMDlhMDFhMzIxNzk1Zjhi\nMWMxY2I3MGYxMjBjNw==\n','2009-05-05 11:55:10'),('465bc61d70aca87f8393c8d2ff3705b2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS41NGM3NmI2YWY1ODhhNzBjNGFh\nYjc3NzUyZmE2Nzk0NQ==\n','2009-04-28 19:08:43'),('52f7ca40b013d3f1b26f1a28003f2efe','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS5iMzZiN2RhZWJiNTEzYmUyMDM0\nMWM5NjBiNmE4MGUwMg==\n','2009-04-27 21:04:23'),('8587c3a6074e9857c0048927a3749833','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4zNzY3OGU1ZjQ2N2E2ZjU3NWU2\nZTAwNzMyODM3MTU4Yg==\n','2009-04-27 19:35:17'),('8d38ea4e622a390615e2c4ac7c252d2d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5kMjUwODY3YjkzZTUwY2FiZmNi\nZGU5ODRhNjkzYTk2Zg==\n','2009-05-07 20:37:10'),('9ad40daff34dbb3afd9d7a0585ce4598','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4yZjA0YTE1YWM4OTQ0MGVhNjY3\nZTZjMDQ2ODVlZDY3Nw==\n','2009-04-27 21:15:09'),('be452b0b74f3007b5b0eb3a715f8181b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4zNzY3OGU1ZjQ2N2E2ZjU3NWU2\nZTAwNzMyODM3MTU4Yg==\n','2009-04-27 18:57:29'),('c3464be2aedc075b6b9bd7bdb30d4c94','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5lOTE4ZDgyNjEyODQwZTJkZDRj\nZjczOTgwZWNlNTEzNw==\n','2009-04-22 19:30:59'),('da650763a6e71a24ae6deda5f1334f79','gAJ9cQEuNDJjNzM0Mjc3MzYzMWIwMWE3OTcwODE2MGFmNzg2OTg=\n','2009-04-23 14:18:06'),('e226a76412321e2f6052cdccd3e15fe9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5lOTE4ZDgyNjEyODQwZTJkZDRj\nZjczOTgwZWNlNTEzNw==\n','2009-05-05 15:37:57'),('f72042f67bf0f79d4d8e019c422f4dfd','gAJ9cQEuNDJjNzM0Mjc3MzYzMWIwMWE3OTcwODE2MGFmNzg2OTg=\n','2009-04-28 17:14:22');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djschedule_slot`
--

DROP TABLE IF EXISTS `djschedule_slot`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `djschedule_slot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dj_date` date NOT NULL,
  `submitted` datetime DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(75) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `carrier_id` int(11) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djschedule_slot_carrier_id` (`carrier_id`),
  CONSTRAINT `carrier_id_refs_id_2e3730a3` FOREIGN KEY (`carrier_id`) REFERENCES `sms_carrier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `djschedule_slot`
--

LOCK TABLES `djschedule_slot` WRITE;
/*!40000 ALTER TABLE `djschedule_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `djschedule_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links_link`
--

DROP TABLE IF EXISTS `links_link`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `links_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `title` varchar(80) NOT NULL,
  `description` varchar(160) NOT NULL,
  `submitted` datetime NOT NULL,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `links_link`
--

LOCK TABLES `links_link` WRITE;
/*!40000 ALTER TABLE `links_link` DISABLE KEYS */;
INSERT INTO `links_link` VALUES (1,'http://docs.djangoproject.com/en/dev/howto/deployment/modpython/#serving-media-files','How to use Django with Apache and mod_python','mod_python','2009-04-09 11:00:04',1);
/*!40000 ALTER TABLE `links_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_borough`
--

DROP TABLE IF EXISTS `main_borough`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_borough` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_borough`
--

LOCK TABLES `main_borough` WRITE;
/*!40000 ALTER TABLE `main_borough` DISABLE KEYS */;
INSERT INTO `main_borough` VALUES (1,'Manhattan'),(2,'Queens'),(3,'Brooklyn'),(4,'Bronx'),(5,'Staten Island');
/*!40000 ALTER TABLE `main_borough` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_bottle`
--

DROP TABLE IF EXISTS `main_bottle`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_bottle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wine_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_bottle_wine_id` (`wine_id`),
  CONSTRAINT `wine_id_refs_id_2d605086` FOREIGN KEY (`wine_id`) REFERENCES `main_wine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_bottle`
--

LOCK TABLES `main_bottle` WRITE;
/*!40000 ALTER TABLE `main_bottle` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_bottle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_country`
--

DROP TABLE IF EXISTS `main_country`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_country`
--

LOCK TABLES `main_country` WRITE;
/*!40000 ALTER TABLE `main_country` DISABLE KEYS */;
INSERT INTO `main_country` VALUES (3,'Argentina'),(2,'Australia'),(6,'Canada'),(7,'Croatia'),(5,'France'),(4,'Italy'),(1,'USA');
/*!40000 ALTER TABLE `main_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_cuisine`
--

DROP TABLE IF EXISTS `main_cuisine`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_cuisine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_cuisine`
--

LOCK TABLES `main_cuisine` WRITE;
/*!40000 ALTER TABLE `main_cuisine` DISABLE KEYS */;
INSERT INTO `main_cuisine` VALUES (1,'Thai'),(2,'Chinese'),(3,'French'),(4,'Japanese'),(5,'Diner'),(6,'Afghan'),(7,'Belgian'),(8,'Brazilian'),(9,'Cuban'),(10,'Dim Sum'),(11,'Ethiopian'),(12,'Italian'),(13,'Continental'),(14,'Creole'),(15,'Eastern European'),(16,'German'),(17,'Greek'),(18,'Indian'),(19,'Korean'),(20,'Malaysian'),(21,'Mediterranean'),(22,'Middle Eastern'),(23,'Moroccan'),(24,'Portuguese'),(25,'Southeast Asian'),(26,'Turkish'),(27,'Vietnamese'),(28,'Ukrainian'),(29,'Russian');
/*!40000 ALTER TABLE `main_cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_neighborhood`
--

DROP TABLE IF EXISTS `main_neighborhood`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_neighborhood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `borough_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_neighborhood_borough_id` (`borough_id`),
  CONSTRAINT `borough_id_refs_id_51c8b67a` FOREIGN KEY (`borough_id`) REFERENCES `main_borough` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_neighborhood`
--

LOCK TABLES `main_neighborhood` WRITE;
/*!40000 ALTER TABLE `main_neighborhood` DISABLE KEYS */;
INSERT INTO `main_neighborhood` VALUES (1,'Upper West Side',1),(2,'Williamsburg',3),(3,'West Village',1),(4,'South Street Seaport',1),(5,'Prospect Heights',3),(6,'Park Slope',3),(7,'NoLita',1),(8,'NoHo',1),(9,'Meatpacking District',1),(10,'Lower East Side',1),(11,'Little Italy',1),(12,'Inwood',1),(13,'Greenwich Village',1),(14,'Gramercy Park',1),(15,'Flatiron District',1),(16,'Carroll Gardens',3),(17,'Brooklyn Heights',3),(18,'Bedford-Stuyvesant',3),(19,'Astoria',2),(20,'Chelsea',1),(21,'Cobble Hill',3),(22,'DUMBO',3),(23,'Flushing',2),(24,'Fort Greene',3),(25,'TriBeCa',1),(26,'Union Square',1),(27,'Washington Heights',1);
/*!40000 ALTER TABLE `main_neighborhood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_region`
--

DROP TABLE IF EXISTS `main_region`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `country_id_refs_id_43922ff2` (`country_id`),
  CONSTRAINT `country_id_refs_id_43922ff2` FOREIGN KEY (`country_id`) REFERENCES `main_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_region`
--

LOCK TABLES `main_region` WRITE;
/*!40000 ALTER TABLE `main_region` DISABLE KEYS */;
INSERT INTO `main_region` VALUES (1,'Napa Valley',1),(2,'Mendoza',3),(3,'Salta',3),(4,'Sonoma Valley',1),(5,'Okanagan Valley',6),(6,'Niagara',6);
/*!40000 ALTER TABLE `main_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_restaurant`
--

DROP TABLE IF EXISTS `main_restaurant`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `neighborhood_id` int(11) NOT NULL,
  `cuisine_id` int(11) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `description` longtext NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_restaurant_neighborhood_id` (`neighborhood_id`),
  KEY `main_restaurant_cuisine_id` (`cuisine_id`),
  CONSTRAINT `cuisine_id_refs_id_6552431f` FOREIGN KEY (`cuisine_id`) REFERENCES `main_cuisine` (`id`),
  CONSTRAINT `neighborhood_id_refs_id_5f34ef5a` FOREIGN KEY (`neighborhood_id`) REFERENCES `main_neighborhood` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_restaurant`
--

LOCK TABLES `main_restaurant` WRITE;
/*!40000 ALTER TABLE `main_restaurant` DISABLE KEYS */;
INSERT INTO `main_restaurant` VALUES (1,'Celeste','502 Amsterdam Ave., New York, NY 10024',1,12,'',40.784441,-73.975496,'Proudly Neapolitan in heritage are all sorts of impeccable fritti, as well as classic free-form pizzas out of the wood-fired oven, at Celeste. A flower-decked terrace leads into country-cottage quaint with sky-blue plates and exactly what you\'d eat in Naples: deep-fried buffalo-ricotta balls (soft and creamy). Savory seafood fritto misto. And the day\'s riff on zucchini blossoms. Quite a trick for Teodora\'s Giancarlo Quadalti, staunch partisan of Emilia-Romagna and chef-partner here. He\'s mastered the mantra of Upper West Side eats, too: big portions, small prices—antipasti and salads (anchovy crostini, sautéed mussels, stuffed eggplant rolls, thin-sliced artichokes with pecorino), artisanal pastas and their gelato dessert.\r\n','2009-04-14','2009-04-14');
/*!40000 ALTER TABLE `main_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_wine`
--

DROP TABLE IF EXISTS `main_wine`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_wine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  `grape` varchar(24) NOT NULL,
  `winery_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `grape` (`grape`),
  KEY `winery_id_refs_id_314649f0` (`winery_id`),
  CONSTRAINT `winery_id_refs_id_314649f0` FOREIGN KEY (`winery_id`) REFERENCES `main_winery` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_wine`
--

LOCK TABLES `main_wine` WRITE;
/*!40000 ALTER TABLE `main_wine` DISABLE KEYS */;
INSERT INTO `main_wine` VALUES (3,'Vistalba Corte C','Malbec Merlot',1);
/*!40000 ALTER TABLE `main_wine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_winery`
--

DROP TABLE IF EXISTS `main_winery`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_winery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `region_id_refs_id_7e76367d` (`region_id`),
  CONSTRAINT `region_id_refs_id_7e76367d` FOREIGN KEY (`region_id`) REFERENCES `main_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_winery`
--

LOCK TABLES `main_winery` WRITE;
/*!40000 ALTER TABLE `main_winery` DISABLE KEYS */;
INSERT INTO `main_winery` VALUES (1,'Vistalba',2);
/*!40000 ALTER TABLE `main_winery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists_playlist`
--

DROP TABLE IF EXISTS `playlists_playlist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `playlists_playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `name` varchar(50) NOT NULL,
  `where` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `playlists_playlist`
--

LOCK TABLES `playlists_playlist` WRITE;
/*!40000 ALTER TABLE `playlists_playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists_playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists_playlisttrack`
--

DROP TABLE IF EXISTS `playlists_playlisttrack`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `playlists_playlisttrack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `playlists_playlisttrack_song_id` (`song_id`),
  KEY `playlists_playlisttrack_playlist_id` (`playlist_id`),
  CONSTRAINT `playlist_id_refs_id_4a935ae3` FOREIGN KEY (`playlist_id`) REFERENCES `playlists_playlist` (`id`),
  CONSTRAINT `song_id_refs_id_155898cc` FOREIGN KEY (`song_id`) REFERENCES `playlists_song` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `playlists_playlisttrack`
--

LOCK TABLES `playlists_playlisttrack` WRITE;
/*!40000 ALTER TABLE `playlists_playlisttrack` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists_playlisttrack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists_song`
--

DROP TABLE IF EXISTS `playlists_song`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `playlists_song` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `artist` varchar(100) NOT NULL,
  `album` varchar(100) NOT NULL,
  `bpm` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `playlists_song`
--

LOCK TABLES `playlists_song` WRITE;
/*!40000 ALTER TABLE `playlists_song` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes_quote`
--

DROP TABLE IF EXISTS `quotes_quote`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quotes_quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` varchar(160) NOT NULL,
  `submitted` datetime NOT NULL,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `quotes_quote`
--

LOCK TABLES `quotes_quote` WRITE;
/*!40000 ALTER TABLE `quotes_quote` DISABLE KEYS */;
INSERT INTO `quotes_quote` VALUES (1,'Now is the time for all good men to come to the aid of the party.','2009-01-01 00:00:00',1);
/*!40000 ALTER TABLE `quotes_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_carrier`
--

DROP TABLE IF EXISTS `sms_carrier`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sms_carrier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `email_postfix` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sms_carrier`
--

LOCK TABLES `sms_carrier` WRITE;
/*!40000 ALTER TABLE `sms_carrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `splash_splashimage`
--

DROP TABLE IF EXISTS `splash_splashimage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `splash_splashimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photographer_id` int(11) NOT NULL,
  `credit_link` varchar(200) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `splash_splashimage_photographer_id` (`photographer_id`),
  CONSTRAINT `photographer_id_refs_id_786006da` FOREIGN KEY (`photographer_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `splash_splashimage`
--

LOCK TABLES `splash_splashimage` WRITE;
/*!40000 ALTER TABLE `splash_splashimage` DISABLE KEYS */;
INSERT INTO `splash_splashimage` VALUES (1,1,'http://www.flickr.com/photos/lauraslotkoff/collections/72157614339407566/',500,332,'storage/splash/splash2.jpg'),(2,1,'',2448,3264,'storage/splash/Croatia2_371.jpg'),(3,1,'',494,377,'storage/splash/lori_in_Croatia.jpg');
/*!40000 ALTER TABLE `splash_splashimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_imagelist`
--

DROP TABLE IF EXISTS `work_imagelist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `work_imagelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `image_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `work_imagelist_project_id` (`project_id`),
  CONSTRAINT `project_id_refs_id_120ee3cf` FOREIGN KEY (`project_id`) REFERENCES `work_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `work_imagelist`
--

LOCK TABLES `work_imagelist` WRITE;
/*!40000 ALTER TABLE `work_imagelist` DISABLE KEYS */;
INSERT INTO `work_imagelist` VALUES (1,1,'asdasdasd','storage/images/everyblock_021.png',10),(2,1,'zxczxczxc','storage/images/everyblock_031.png',20),(3,1,'sdfsdfsdf','storage/images/everyblock_011.png',30);
/*!40000 ALTER TABLE `work_imagelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_project`
--

DROP TABLE IF EXISTS `work_project`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `work_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `project_url` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `completion_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `work_project`
--

LOCK TABLES `work_project` WRITE;
/*!40000 ALTER TABLE `work_project` DISABLE KEYS */;
INSERT INTO `work_project` VALUES (1,'Learning Django','http://www.hughdbrown.com/','Since April 2009, I\'ve been programming websites in Django. Here are some projects I\'ve done to get up to speed on it.\r\n','2009-04-23');
/*!40000 ALTER TABLE `work_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-04-29 16:49:59
