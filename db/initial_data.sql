-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.88.4    Database: redmine
-- ------------------------------------------------------
-- Server version	5.5.38-0+wheezy1-log

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
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) DEFAULT NULL,
  `container_type` varchar(30) DEFAULT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `disk_filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(255) DEFAULT '',
  `digest` varchar(40) NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `disk_directory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attachments_on_author_id` (`author_id`),
  KEY `index_attachments_on_created_on` (`created_on`),
  KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (1,7,'Issue','S50314-143306.jpg','150314151332_S50314-143306.jpg',391215,'image/jpeg','a1b353897c214819cff9447858952431',0,8,'2015-03-14 15:13:32','','2015/03'),(3,28,'Issue','屏幕快照 2015-07-29 16.40.56.png','150729164121_e2f30829502221aba64e2f860ffc449e.png',78833,'image/png','f39e88ec9a947613829d32f01f6591e2',0,12,'2015-07-29 16:41:21','正常显示','2015/07'),(4,117,'Issue','屏幕快照 2015-08-03 下午4.42.55.png','150803164323_e4ebcf7f0da96fe95c68ba2ddf509839.png',139403,'image/png','bdeafc8c088375e38d09bb05e8a2d165',0,17,'2015-08-03 16:43:23','','2015/08'),(5,125,'Issue','屏幕快照 2015-08-04 8.52.15.png','150804085519_3f9bd1186fe8cac81ef8d2c8a5eadc99.png',19630,'image/png','634b13b61c21bd8089bb70246f80e137',0,12,'2015-08-04 08:55:19','','2015/08');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `host` varchar(60) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `account_password` varchar(255) DEFAULT '',
  `base_dn` varchar(255) DEFAULT NULL,
  `attr_login` varchar(30) DEFAULT NULL,
  `attr_firstname` varchar(30) DEFAULT NULL,
  `attr_lastname` varchar(30) DEFAULT NULL,
  `attr_mail` varchar(30) DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT '0',
  `tls` tinyint(1) NOT NULL DEFAULT '0',
  `filter` varchar(255) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_auth_sources_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT '1',
  `topics_count` int(11) NOT NULL DEFAULT '0',
  `messages_count` int(11) NOT NULL DEFAULT '0',
  `last_message_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boards_project_id` (`project_id`),
  KEY `index_boards_on_last_message_id` (`last_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changeset_id` int(11) NOT NULL,
  `action` varchar(1) NOT NULL DEFAULT '',
  `path` text NOT NULL,
  `from_path` text,
  `from_revision` varchar(255) DEFAULT NULL,
  `revision` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changesets_changeset_id` (`changeset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changeset_parents`
--

DROP TABLE IF EXISTS `changeset_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changeset_parents` (
  `changeset_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  KEY `changeset_parents_changeset_ids` (`changeset_id`),
  KEY `changeset_parents_parent_ids` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeset_parents`
--

LOCK TABLES `changeset_parents` WRITE;
/*!40000 ALTER TABLE `changeset_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `changeset_parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets`
--

DROP TABLE IF EXISTS `changesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changesets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `revision` varchar(255) NOT NULL,
  `committer` varchar(255) DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` longtext,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  KEY `index_changesets_on_user_id` (`user_id`),
  KEY `index_changesets_on_repository_id` (`repository_id`),
  KEY `index_changesets_on_committed_on` (`committed_on`),
  KEY `changesets_repos_scmid` (`repository_id`,`scmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets`
--

LOCK TABLES `changesets` WRITE;
/*!40000 ALTER TABLE `changesets` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets_issues`
--

DROP TABLE IF EXISTS `changesets_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changesets_issues` (
  `changeset_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets_issues`
--

LOCK TABLES `changesets_issues` WRITE;
/*!40000 ALTER TABLE `changesets_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commented_type` varchar(30) NOT NULL DEFAULT '',
  `commented_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `comments` text,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  KEY `index_comments_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `field_format` varchar(30) NOT NULL DEFAULT '',
  `possible_values` text,
  `regexp` varchar(255) DEFAULT '',
  `min_length` int(11) DEFAULT NULL,
  `max_length` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_all` tinyint(1) NOT NULL DEFAULT '0',
  `is_filter` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `searchable` tinyint(1) DEFAULT '0',
  `default_value` text,
  `editable` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '0',
  `format_store` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_projects`
--

DROP TABLE IF EXISTS `custom_fields_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_projects`
--

LOCK TABLES `custom_fields_projects` WRITE;
/*!40000 ALTER TABLE `custom_fields_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_roles`
--

DROP TABLE IF EXISTS `custom_fields_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_roles` (
  `custom_field_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  UNIQUE KEY `custom_fields_roles_ids` (`custom_field_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_roles`
--

LOCK TABLES `custom_fields_roles` WRITE;
/*!40000 ALTER TABLE `custom_fields_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_trackers`
--

DROP TABLE IF EXISTS `custom_fields_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_trackers`
--

LOCK TABLES `custom_fields_trackers` WRITE;
/*!40000 ALTER TABLE `custom_fields_trackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_values`
--

DROP TABLE IF EXISTS `custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customized_type` varchar(30) NOT NULL DEFAULT '',
  `customized_id` int(11) NOT NULL DEFAULT '0',
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `custom_values_customized` (`customized_type`,`customized_id`),
  KEY `index_custom_values_on_custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_values`
--

LOCK TABLES `custom_values` WRITE;
/*!40000 ALTER TABLE `custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(60) NOT NULL DEFAULT '',
  `description` text,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_project_id` (`project_id`),
  KEY `index_documents_on_category_id` (`category_id`),
  KEY `index_documents_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_email_addresses_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
INSERT INTO `email_addresses` VALUES (1,1,'bug@happysoft.cc',1,1,'2015-03-04 07:49:34','2015-07-30 13:03:07'),(2,3,'guoweidong@happysoft.cc',1,1,'2015-03-11 17:05:33','2015-03-11 17:05:33'),(4,5,'gumengli@happysoft.cc',1,1,'2015-03-11 18:09:26','2015-03-11 18:09:26'),(6,7,'524946068@qq.com',1,1,'2015-03-13 10:28:43','2015-03-13 10:28:43'),(7,8,'2697258818@qq.com',1,1,'2015-03-13 10:30:07','2015-03-13 10:30:07'),(9,10,'y@yue.house',1,1,'2015-06-25 11:07:36','2015-06-25 11:07:36'),(10,11,'shensiwei@happysoft.cc',1,1,'2015-07-29 09:55:13','2015-07-29 09:55:13'),(11,12,'hufeipeng@happysoft.cc',1,1,'2015-07-29 10:46:09','2015-07-29 10:46:09'),(12,13,'gaoyuehua@happysoft.cc',1,1,'2015-07-29 11:14:17','2015-07-29 11:14:17'),(13,14,'lige@happysoft.cc',1,1,'2015-07-29 11:22:07','2015-07-29 11:22:07'),(15,16,'zhangyu@happysoft.cc',1,1,'2015-07-29 11:41:45','2015-07-29 11:41:45'),(16,17,'wangtao@happysoft.cc',1,1,'2015-07-29 11:41:52','2015-07-29 11:41:52'),(17,18,'hanzhirong@happysoft.cc',1,1,'2015-07-29 11:42:46','2015-07-29 11:42:46'),(18,19,'qiuhao@yue.house',1,1,'2015-07-29 17:02:44','2015-07-29 17:02:44'),(19,19,'qiuhaolu@qq.com',0,0,'2015-07-29 17:03:13','2015-07-29 17:03:16'),(20,20,'jiangxuan@happysoft.cc',1,1,'2015-07-29 18:16:36','2015-07-29 18:16:36'),(21,22,'huangmin@happysoft.cc',1,1,'2015-07-29 19:42:29','2015-07-29 19:42:29'),(22,23,'huhaiyang@happysoft.cc',1,1,'2015-08-03 09:52:30','2015-08-03 09:52:30'),(23,24,'jianghaohao@happysoft.cc',1,1,'2015-08-03 09:58:01','2015-08-03 09:58:01'),(24,25,'hezhiwen@happysoft.cc',1,1,'2015-08-03 10:01:50','2015-08-03 10:01:50'),(25,26,'sunshuanglei@happysoft.cc',1,1,'2015-08-03 10:07:29','2015-08-03 10:07:29'),(26,27,'huchenfei@happysoft.cc',1,1,'2015-08-03 10:23:21','2015-08-03 10:23:21'),(27,28,'906205654@qq.com',1,1,'2015-08-06 13:58:21','2015-08-06 13:58:21'),(28,29,'rayben@vip.sina.com',1,1,'2015-08-06 21:00:22','2015-08-06 21:00:22'),(29,30,'michael@happysoft.cc',1,1,'2015-08-06 21:05:10','2015-08-06 21:05:10'),(30,31,'luyanmin@happysoft.cc',1,1,'2015-08-12 10:03:36','2015-08-12 10:03:36'),(31,32,'mingchang555@hotmail.com',1,1,'2015-08-12 10:03:40','2015-08-12 10:03:40');
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enabled_modules`
--

DROP TABLE IF EXISTS `enabled_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled_modules_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enabled_modules`
--

LOCK TABLES `enabled_modules` WRITE;
/*!40000 ALTER TABLE `enabled_modules` DISABLE KEYS */;
INSERT INTO `enabled_modules` VALUES (1,1,'issue_tracking'),(7,1,'repository'),(11,2,'issue_tracking'),(21,3,'issue_tracking'),(31,4,'issue_tracking'),(33,5,'documents'),(34,3,'time_tracking'),(35,5,'time_tracking'),(36,5,'issue_tracking'),(37,6,'issue_tracking'),(38,7,'issue_tracking'),(39,7,'time_tracking'),(40,8,'issue_tracking'),(41,8,'time_tracking'),(42,3,'gantt');
/*!40000 ALTER TABLE `enabled_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumerations`
--

DROP TABLE IF EXISTS `enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enumerations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enumerations_on_project_id` (`project_id`),
  KEY `index_enumerations_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumerations`
--

LOCK TABLES `enumerations` WRITE;
/*!40000 ALTER TABLE `enumerations` DISABLE KEYS */;
INSERT INTO `enumerations` VALUES (1,'低',1,0,'IssuePriority',1,NULL,NULL,'lowest'),(2,'正常',2,1,'IssuePriority',1,NULL,NULL,'default'),(3,'高',3,0,'IssuePriority',1,NULL,NULL,'highest'),(6,'用户文档',1,0,'DocumentCategory',1,NULL,NULL,NULL),(7,'技术文档',2,0,'DocumentCategory',1,NULL,NULL,NULL),(8,'Design',1,0,'TimeEntryActivity',1,NULL,NULL,NULL),(9,'Development',2,0,'TimeEntryActivity',1,NULL,NULL,NULL),(10,'Testing',3,0,'TimeEntryActivity',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
INSERT INTO `groups_users` VALUES (21,3),(21,11),(21,12),(21,13),(21,14),(21,16),(21,17),(21,18),(21,20);
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_categories`
--

DROP TABLE IF EXISTS `issue_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  `assigned_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_categories_project_id` (`project_id`),
  KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_categories`
--

LOCK TABLES `issue_categories` WRITE;
/*!40000 ALTER TABLE `issue_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_relations`
--

DROP TABLE IF EXISTS `issue_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_from_id` int(11) NOT NULL,
  `issue_to_id` int(11) NOT NULL,
  `relation_type` varchar(255) NOT NULL DEFAULT '',
  `delay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_relations`
--

LOCK TABLES `issue_relations` WRITE;
/*!40000 ALTER TABLE `issue_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_statuses`
--

DROP TABLE IF EXISTS `issue_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `default_done_ratio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_statuses_on_position` (`position`),
  KEY `index_issue_statuses_on_is_closed` (`is_closed`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_statuses`
--

LOCK TABLES `issue_statuses` WRITE;
/*!40000 ALTER TABLE `issue_statuses` DISABLE KEYS */;
INSERT INTO `issue_statuses` VALUES (1,'问题已分发',0,1,NULL),(2,'问题修复中',0,2,NULL),(3,'问题已解决,待确认',0,3,NULL),(4,'问题需帮助',0,4,NULL),(7,'推后解决',1,6,NULL),(8,'确认已解决',1,5,NULL);
/*!40000 ALTER TABLE `issue_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `due_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL,
  `fixed_version_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int(11) NOT NULL DEFAULT '0',
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `closed_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issues_project_id` (`project_id`),
  KEY `index_issues_on_status_id` (`status_id`),
  KEY `index_issues_on_category_id` (`category_id`),
  KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  KEY `index_issues_on_tracker_id` (`tracker_id`),
  KEY `index_issues_on_priority_id` (`priority_id`),
  KEY `index_issues_on_author_id` (`author_id`),
  KEY `index_issues_on_created_on` (`created_on`),
  KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,1,1,'个人资料更换头像不能用','入口：　点击登录->头像->个人资料->更改头像　\r\n现状：　不能更换头像\r\n期望：　更换头像成功\r\nps：　必要时请截图','2015-03-15',NULL,1,3,2,NULL,3,1,'2015-03-11 18:05:27','2015-03-11 18:10:58','2015-03-11',0,NULL,NULL,1,1,2,0,NULL),(2,1,1,'昵称和个性签名不能修改','入口：　点击　登录->头像->个性签名中\r\n现状：　昵称和个性签名不能修改\r\n期望：　可以修改\r\nps: (必要时截图)',NULL,NULL,1,3,2,NULL,1,0,'2015-03-11 18:35:06','2015-03-11 18:35:06','2015-03-11',0,NULL,NULL,2,1,2,0,NULL),(3,1,1,'行情页面需要添加一些版块','入口：　点击登录-> 行情\r\n现状：　缺少振幅榜和其他行业指数榜，再增加一个热门行业\r\n期望：　增加这些版块到行情页面\r\nps: (必要时截图)',NULL,NULL,1,5,2,NULL,1,0,'2015-03-11 18:40:26','2015-03-11 18:40:26','2015-03-11',0,NULL,NULL,3,1,2,0,NULL),(4,1,1,'更新新版中的时候，提示更新和不更新，选择更新新版，更新过之后不能安装。','入口：　点击登录-> 我的交易\r\n现状：　缺少一个模拟持仓明细，把模拟买入的股票有一个明细的一栏，如成本，市价，当前盈亏，持股数量，持股市值等。\r\n期望：　可参考优顾模拟炒股手机APP\r\nps: (必要时请截图)',NULL,NULL,1,3,2,NULL,1,1,'2015-03-11 18:46:07','2015-03-17 14:26:31','2015-03-11',0,NULL,NULL,4,1,2,0,NULL),(5,3,1,'比赛栏中，比赛的冠军奖励怎么建立，奖励地方只是显示null','每次在注册时，　输入手机号码后，　\r\n\r\n现在的情况：　　没有收到验证码\r\n期望的情况：　　应该收到４位数字的验证码，在１０秒钟之内。',NULL,NULL,3,3,2,NULL,3,2,'2015-03-13 09:51:54','2015-03-17 14:32:01','2015-03-17',0,NULL,NULL,5,1,2,0,NULL),(6,1,1,'新版中，乐股问题','',NULL,NULL,1,NULL,2,NULL,7,1,'2015-03-13 10:40:51','2015-03-17 13:49:47','2015-03-17',0,NULL,NULL,6,1,2,0,NULL),(7,1,1,'1.0.2改进问题列表','1.无光标\r\n2.主页卖出button偏移\r\n3.按代码搜索功能不完善，若在搜索框中输入00，结果列表应该是所有以00开头而不是所有含00字符的股票\r\n4.将个股添加自选后点击左上角刷新按钮后，列表中并没有显示新添加的自选，只有在退出重新打开终端才会显示上次退出前添加的自选\r\n5.所有的列表，比如自选列表，搜索结果列表，单击某项没有单击效果，最好将单击时的条目背景色设置为和主题色相近的颜色\r\n6.个股详情页面的均线、k线图左上角的股票代码自己股票名称都显示为黑色，和黑灰色背景混杂分辨不出\r\n7.k线图右边有矩形黑色块不知道是什么鬼\r\n8.日k，周k和月k图没有居中，整体右偏\r\n9.联系将涨幅榜跌幅榜换手率榜以类似选项卡的形式布局而不是以列表堆叠方式。\r\n\r\n\r\n\r\n\r\n\r\n严苛成就精品，累有所值，一起努力\r\n                                             —兔子',NULL,NULL,1,5,2,NULL,8,2,'2015-03-14 15:14:20','2015-03-18 11:50:45','2015-03-14',0,NULL,NULL,7,1,2,0,NULL),(8,1,1,'登录框中的文字光标是白色。　','登录框中的文字光标是白色。　\r\n\r\n期望：　在安卓中不要白色。　否则会跟背景色一样。',NULL,NULL,1,NULL,1,NULL,3,0,'2015-03-18 16:24:06','2015-03-18 16:24:06','2015-03-18',0,NULL,NULL,8,1,2,0,NULL),(9,1,1,'更换头像，更换签名','更换头像，更换签名 \r\n\r\n下次　app 启动 后才会改变\r\n\r\n',NULL,NULL,1,NULL,1,NULL,3,0,'2015-03-18 16:24:43','2015-03-18 16:24:43','2015-03-18',0,NULL,NULL,9,1,2,0,NULL),(10,2,1,'注册：  仅限手机号注册，做手机号验证','注册：  仅限手机号注册，做手机号验证\r\n\r\n',NULL,NULL,1,NULL,1,NULL,3,0,'2015-03-18 16:25:47','2015-03-18 16:25:47','2015-03-18',0,NULL,NULL,10,1,2,0,NULL),(11,1,1,'去掉新浪黑框框','已经搞定 ',NULL,NULL,3,NULL,2,NULL,3,0,'2015-03-18 16:26:34','2015-03-18 16:26:34','2015-03-18',0,NULL,NULL,11,1,2,0,NULL),(12,1,1,'搜索　00 （开头）或 60 （包含）','\r\n请自行完善． ',NULL,NULL,1,5,2,NULL,3,1,'2015-03-18 16:26:56','2015-03-23 10:21:10','2015-03-18',0,NULL,NULL,12,1,2,0,NULL),(13,1,1,'个性签名 ','个人资料　-> 个性签名\r\n\r\n（大师说的）\r\n先不要上．　第二期吧．\r\n１．　我们人手不够．\r\n２．　这个地方需求不明确．可以加，但是显示在哪里？　在论坛中？　还是？　个人资料界面中也没有显示个人签名的地方． \r\n\r\n而且这不是核心功能． ',NULL,NULL,1,NULL,1,NULL,3,0,'2015-03-18 16:40:55','2015-03-18 16:40:55','2015-03-18',0,NULL,NULL,13,1,2,0,NULL),(14,1,2,'首页 的图片文字: 需要居中. ','目前是不居中的. ',NULL,NULL,1,NULL,2,NULL,2,0,'2015-03-19 15:28:05','2015-03-19 15:28:05','2015-03-19',0,NULL,NULL,14,1,2,0,NULL),(15,1,2,'去掉搜索框(首页右上角)','',NULL,NULL,1,NULL,2,NULL,2,0,'2015-03-19 15:28:23','2015-03-19 15:28:23','2015-03-19',0,NULL,NULL,15,1,2,0,NULL),(16,1,2,'地图的中心 要有个红色的位置点.','',NULL,NULL,1,NULL,2,NULL,2,0,'2015-03-19 15:28:47','2015-03-19 15:28:47','2015-03-19',0,NULL,NULL,16,1,2,0,NULL),(17,1,2,'后台: 操作友好些.   ','统一各种操作的名称, 不要使用 update xxx 等默认的英文,要使用 \"保存\"这样的中文文字.\r\n',NULL,NULL,1,NULL,2,NULL,2,0,'2015-03-19 15:29:38','2015-03-19 15:29:38','2015-03-19',0,NULL,NULL,17,1,2,0,NULL),(18,1,2,'可以上传首页的幻灯片','现在是需要一个一个手工复制上去的.难用. \r\n\r\n最好给出一个可以直接上传的地方.',NULL,NULL,1,NULL,2,NULL,2,0,'2015-03-19 15:30:13','2015-03-19 15:30:13','2015-03-19',0,NULL,NULL,18,1,2,0,NULL),(19,1,3,'config/database.yml 不要放到git 中.','要使用 database.yml.example\r\n\r\n',NULL,NULL,1,NULL,2,NULL,2,0,'2015-03-19 15:36:57','2015-03-19 15:36:57','2015-03-19',0,NULL,NULL,19,1,2,0,NULL),(21,1,4,'首页','<p>分配给浩浩</p>\r\n',NULL,NULL,2,24,2,NULL,1,1,'2015-07-29 10:00:02','2015-08-03 10:09:33','2015-07-29',0,NULL,NULL,21,1,2,0,NULL),(22,2,3,'后台的接口需要加强安装性','一个规范的后台接口，需要： \r\n\r\n/interface/xx.json?\r\n    pid=    渠道的id ,例如： 360市场\r\n    os=     操作系统， ios或者android\r\n    version=  版本号，   1.0.5\r\n    timestamp  时间戳\r\n    md5     根据 timestamp , pid 等参数生成的md5值\r\n    platform    平台，例如： phone, pad, tv\r\n\r\n这样，我们后台就可以：\r\n1. 统计， 看用户是从 哪个平台，哪个渠道过来。\r\n2. 找到捣乱分子，把它屏蔽掉。  屏蔽ip,  pid 等\r\n3. （让nginx）对md5进行验证， 如果md5不能用，就拒绝它的请求。\r\n    ',NULL,NULL,1,NULL,2,NULL,11,0,'2015-07-29 10:12:44','2015-07-29 10:12:44','2015-07-29',0,NULL,NULL,22,1,2,0,NULL),(23,1,3,'在图片尚未加载成功时， 修改默认样式。 ','<p>例如，昨天Larry演示的， loader旋转一圈， 图片就加载好了。 如果不行的话， 换个好看点的 默认图片</p>\r\n',NULL,NULL,3,3,2,NULL,11,3,'2015-07-29 10:13:50','2015-07-30 20:15:09','2015-07-29',0,NULL,NULL,23,1,2,0,NULL),(25,2,3,'日志同步和分析','<p>1. log4r记录日志 2. crontab, rsync同步到日志服务器，进行集中汇总和分析</p>\r\n',NULL,NULL,1,13,1,NULL,13,1,'2015-07-29 11:36:54','2015-08-12 09:50:30','2015-07-29',0,NULL,NULL,25,1,2,0,NULL),(26,1,5,'商城首页检索UI调整','<p>检索顶部需加一条线</p>\r\n','2015-07-29',NULL,8,17,2,NULL,1,3,'2015-07-29 11:49:52','2015-07-30 00:23:12','2015-07-29',0,NULL,NULL,26,1,2,0,'2015-07-30 00:23:12'),(27,1,5,'商城header栏－家居馆下划线的距离与其他板块不一致','','2015-07-29',NULL,8,17,2,NULL,1,3,'2015-07-29 11:51:16','2015-07-30 00:21:57','2015-07-29',0,NULL,NULL,27,1,2,0,'2015-07-30 00:21:57'),(28,1,5,'家具馆—最下面两个产品之间没有间距','','2015-07-29',NULL,8,12,2,NULL,1,4,'2015-07-29 11:52:13','2015-07-30 00:15:45','2015-07-29',0,NULL,NULL,28,1,2,0,'2015-07-30 00:15:45'),(29,1,5,'品牌团UI调整－header栏字体以及类目之间的间距（字体不一致，而且一高一低）','','2015-07-29',NULL,8,16,3,NULL,1,5,'2015-07-29 11:54:07','2015-08-11 16:47:10','2015-07-29',0,NULL,NULL,29,1,2,0,'2015-08-11 16:47:10'),(30,1,5,'商城检索，选择家居建材，调整到某类目详情页后，返回键不好点击','','2015-07-29',NULL,8,17,2,NULL,1,4,'2015-07-29 11:56:40','2015-07-30 00:18:03','2015-07-29',0,NULL,NULL,30,1,2,0,'2015-07-30 00:18:03'),(31,1,5,'商城检索－家居建材－花洒，除了显示花洒产品外，还有套餐，需调整接口','','2015-07-29',NULL,8,NULL,2,NULL,1,1,'2015-07-29 12:00:49','2015-07-30 00:21:23','2015-07-29',0,NULL,NULL,31,1,2,0,'2015-07-30 00:21:23'),(32,1,5,'商城检索－家居建材下，五金类目下子分类图片不显示','','2015-07-29',NULL,8,NULL,2,NULL,1,1,'2015-07-29 12:02:11','2015-07-30 00:03:17','2015-07-29',0,NULL,NULL,32,1,2,0,'2015-07-30 00:03:17'),(33,1,3,'适配—首页UI调整','','2015-07-29',NULL,8,3,2,NULL,1,2,'2015-07-29 12:08:11','2015-08-13 11:29:43','2015-07-29',0,NULL,NULL,33,1,2,0,'2015-08-13 11:29:43'),(34,1,3,'引导页最后一张改成停留2s自动跳过','','2015-07-29',NULL,8,18,2,NULL,1,1,'2015-07-29 12:11:07','2015-07-30 11:21:45','2015-07-29',0,NULL,NULL,34,1,2,0,'2015-07-30 11:21:45'),(35,1,3,'首页轮播图需自动切换,且应该顺序切换，间隔为5s(顺序切换还未解决）','',NULL,NULL,8,13,3,NULL,1,7,'2015-07-29 12:11:56','2015-08-13 11:29:09','2015-07-29',0,NULL,NULL,35,1,2,0,'2015-08-13 11:29:09'),(36,1,3,'各模块侧滑动效时间需缩短','<p>已修复，待确认</p>\r\n','2015-07-29',NULL,8,18,2,NULL,1,2,'2015-07-29 12:12:55','2015-07-30 19:55:44','2015-07-29',0,NULL,NULL,36,1,2,0,'2015-07-30 19:55:44'),(37,1,3,'所有进入和返回页面加上侧滑动效','','2015-07-29',NULL,8,18,2,NULL,1,1,'2015-07-29 12:17:15','2015-07-31 11:43:20','2015-07-29',0,NULL,NULL,37,1,2,0,'2015-07-31 11:43:20'),(38,1,3,'继续减少 app 的体积','<p>看看 还有哪些图片是可以删掉的。</p>\r\n',NULL,NULL,1,12,2,NULL,1,2,'2015-07-29 14:00:04','2015-07-30 14:06:13','2015-07-29',0,NULL,NULL,38,1,2,0,NULL),(39,1,3,'适配—5s上套餐页面两边有白边','','2015-07-29',NULL,1,23,2,NULL,1,2,'2015-07-29 14:29:39','2015-08-03 10:01:36','2015-07-29',0,NULL,NULL,39,1,2,0,NULL),(41,1,5,'适配－商城首页在6p上显示问题，价格栏都显示不对','',NULL,NULL,8,17,2,NULL,1,3,'2015-07-29 14:34:40','2015-07-30 00:17:15','2015-07-29',0,NULL,NULL,41,1,2,0,'2015-07-30 00:17:15'),(42,1,3,'找灵感检索修改','',NULL,NULL,8,22,2,NULL,1,3,'2015-07-29 14:39:06','2015-07-30 12:08:36','2015-07-29',0,NULL,NULL,42,1,2,0,'2015-07-30 00:18:39'),(43,1,5,'适配—品牌团详情页在5S上有些变形－人民币符号有一小半不显示','',NULL,NULL,8,16,2,NULL,1,4,'2015-07-29 14:53:05','2015-08-11 16:05:53','2015-07-29',0,NULL,NULL,43,1,2,0,'2015-08-11 16:05:53'),(44,1,3,'申请贷款和预约面积选项修改 选项改为：小于70 70-90 90-120 大于120','','2015-07-29',NULL,8,3,2,NULL,1,3,'2015-07-29 16:49:26','2015-07-30 00:24:36','2015-07-29',0,NULL,NULL,44,1,2,0,'2015-07-30 00:24:36'),(45,1,3,'管理—我的装修，把联系项目监理改为预约悦管家，点击后弹出400电话','','2015-07-29',NULL,8,22,2,NULL,1,1,'2015-07-29 16:51:43','2015-07-30 00:01:50','2015-07-29',0,NULL,NULL,45,1,2,0,'2015-07-30 00:01:50'),(46,2,3,'发现－专题需增加关注和分享功能（二期）','',NULL,NULL,1,NULL,1,NULL,1,0,'2015-07-29 16:53:07','2015-07-29 16:53:07','2015-07-29',0,NULL,NULL,46,1,2,0,NULL),(47,1,3,'管理－标准流程模版替换','','2015-07-29',NULL,8,NULL,2,NULL,1,1,'2015-07-29 16:53:37','2015-07-30 00:43:28','2015-07-29',0,NULL,NULL,47,1,2,0,'2015-07-30 00:43:28'),(48,1,3,'看现场中面积单位改成平方米','','2015-07-29',NULL,8,3,3,NULL,1,2,'2015-07-29 16:54:49','2015-07-30 00:38:51','2015-07-29',0,NULL,NULL,48,1,2,0,'2015-07-30 00:38:51'),(49,1,3,'分享图标更换以及名称修改，改成App图标和悦装网','','2015-07-29',NULL,8,3,3,NULL,1,3,'2015-07-29 16:55:45','2015-07-30 00:38:21','2015-07-29',0,NULL,NULL,49,1,2,0,'2015-07-30 00:37:11'),(50,4,3,'管理－我的装修需增加分享功能','',NULL,NULL,7,NULL,1,NULL,1,2,'2015-07-29 16:57:05','2015-07-30 12:09:22','2015-07-29',0,NULL,NULL,50,1,2,0,'2015-07-30 00:16:48'),(51,1,5,'检索－推荐将套餐包放到最上面，且贷款图片需更换','','2015-07-29',NULL,8,17,2,NULL,1,3,'2015-07-29 16:59:50','2015-07-30 00:04:47','2015-07-29',0,NULL,NULL,51,1,2,0,'2015-07-30 00:04:47'),(52,1,5,'检索－热销，需改成放单品，铺满整屏','',NULL,NULL,8,17,2,NULL,1,2,'2015-07-29 17:03:19','2015-07-30 19:38:34','2015-07-29',0,NULL,NULL,52,1,2,0,'2015-07-30 19:38:34'),(53,2,3,'后台需修改，每个模块应允许单独修改部分，而不是删掉整块，重新上传','',NULL,NULL,1,NULL,2,NULL,1,0,'2015-07-29 17:04:48','2015-07-29 17:04:48','2015-07-29',0,NULL,NULL,53,1,2,0,NULL),(54,2,3,'上传图片时，应给出图片大小限制，如超过标准（80K）则不允许上传','',NULL,NULL,1,NULL,2,NULL,1,0,'2015-07-29 17:06:13','2015-07-29 17:06:13','2015-07-29',0,NULL,NULL,54,1,2,0,NULL),(55,1,3,'悦工人中，项目经理改成工长','','2015-07-29',NULL,8,NULL,2,NULL,1,2,'2015-07-29 17:07:32','2015-07-30 19:45:13','2015-07-29',0,NULL,NULL,55,1,2,0,'2015-07-30 19:45:13'),(56,1,3,'使用 production 模式来部署 rails 服务器','',NULL,NULL,3,13,2,NULL,11,2,'2015-07-29 17:07:41','2015-07-30 14:32:31','2015-07-29',0,NULL,NULL,56,1,2,0,NULL),(57,1,3,'申请贷款和预约中，选址地址时，需要把除北京外的区域都放出来','','2015-07-29',NULL,8,3,2,NULL,1,2,'2015-07-29 17:09:18','2015-07-30 00:35:40','2015-07-29',0,NULL,NULL,57,1,2,0,'2015-07-30 00:35:40'),(58,1,3,'悦金融页面调整，需线下先给文案和图片','',NULL,NULL,8,13,2,NULL,1,1,'2015-07-29 17:15:48','2015-07-31 11:47:26','2015-07-29',0,NULL,NULL,58,1,2,0,'2015-07-31 11:47:26'),(59,1,3,'设计师模块，将悦家隐藏，不显示在App前端','','2015-07-29',NULL,8,NULL,2,NULL,1,1,'2015-07-29 20:20:03','2015-07-30 00:30:14','2015-07-29',0,NULL,NULL,59,1,2,0,'2015-07-30 00:30:14'),(60,1,5,'悦装优品页面，行与行之间有一条线，需去掉','',NULL,NULL,8,17,2,NULL,1,1,'2015-07-29 20:36:16','2015-07-30 00:25:48','2015-07-29',0,NULL,NULL,60,1,2,0,'2015-07-30 00:25:48'),(61,1,3,'灵感页面头像不显示，且更换头像后不能及时刷新','',NULL,NULL,8,13,3,NULL,1,4,'2015-07-29 21:11:20','2015-07-31 16:34:29','2015-07-29',0,NULL,NULL,61,1,2,0,'2015-07-31 16:34:29'),(62,1,5,'类目－推荐中，推荐商品部分UI调整，价格去掉','',NULL,NULL,8,17,2,NULL,1,2,'2015-07-30 00:05:44','2015-07-30 19:39:23','2015-07-30',0,NULL,NULL,62,1,2,0,'2015-07-30 19:39:23'),(63,1,5,'悦金融和登录／注册页面需增侧滑加动效','',NULL,NULL,8,NULL,1,NULL,1,3,'2015-07-30 00:11:02','2015-08-13 11:28:08','2015-07-30',0,NULL,NULL,63,1,2,0,'2015-08-13 11:28:08'),(64,1,5,'家居馆中出现悦装优品的商品','',NULL,NULL,8,22,3,NULL,1,2,'2015-07-30 00:13:32','2015-07-30 12:05:42','2015-07-30',0,NULL,NULL,64,1,2,0,'2015-07-30 12:05:42'),(65,1,3,'找灵感筛选逻辑修改，选择标签后，提示没有标签，但还是进行了检索','',NULL,NULL,8,22,1,NULL,1,4,'2015-07-30 00:20:15','2015-08-13 11:27:46','2015-07-30',0,NULL,NULL,65,1,2,0,'2015-08-13 11:27:46'),(66,4,3,'需增加字段限制提示，如设计师列表页，设计师的title不能超过10个字','',NULL,NULL,7,NULL,2,NULL,1,0,'2015-07-30 00:31:44','2015-07-30 00:31:44','2015-07-30',0,NULL,NULL,66,1,2,0,'2015-07-30 00:31:44'),(67,1,3,'悦工人检索，第一次进入时，字体偏小，之后就会变大','',NULL,NULL,8,NULL,2,NULL,1,2,'2015-07-30 00:45:22','2015-07-30 15:04:11','2015-07-30',0,NULL,NULL,67,1,2,0,'2015-07-30 15:04:11'),(68,1,3,'设计师列表页，错位显示，列表页与详情页不符','','2015-07-30',NULL,8,NULL,3,NULL,10,1,'2015-07-30 11:06:12','2015-07-30 14:42:43','2015-07-30',0,NULL,NULL,68,1,2,0,'2015-07-30 14:42:43'),(69,1,3,'类目检索中的品牌显示不对，未按照顺序显示','','2015-07-30',NULL,8,17,2,NULL,10,2,'2015-07-30 12:04:47','2015-07-30 19:35:20','2015-07-30',0,NULL,NULL,69,1,2,0,'2015-07-30 19:35:20'),(70,2,5,'商品上传和品牌上传的表单验证','',NULL,NULL,3,22,2,NULL,10,1,'2015-07-30 12:14:08','2015-08-04 11:08:13','2015-07-30',0,NULL,NULL,70,1,2,0,NULL),(71,1,3,'看现场模块图片被裁减，需增加放大图片功能','',NULL,NULL,8,3,2,NULL,10,3,'2015-07-30 14:32:09','2015-07-30 19:32:23','2015-07-30',0,NULL,NULL,71,1,2,0,'2015-07-30 19:32:23'),(72,1,5,'在app打开的第一个请求中加入version number 以便后期服务器识别用户 版本拓展用','','2015-08-07',NULL,3,3,1,NULL,20,2,'2015-07-30 14:36:47','2015-07-31 13:39:16','2015-07-30',0,1,NULL,72,1,2,0,NULL),(73,1,5,'App商城检索部分加上侧滑动效','',NULL,NULL,8,NULL,2,NULL,10,1,'2015-07-30 15:05:32','2015-07-30 19:43:40','2015-07-30',0,NULL,NULL,73,1,2,0,'2015-07-30 19:43:40'),(74,4,3,'http 的请求要合理。该放后台处理的，就放在后台 ','<p>（ 例如：验收标准 ， 三个产品的图，都应该放在后台，使用接口）</p>\r\n',NULL,NULL,7,NULL,1,NULL,11,0,'2015-07-30 15:35:41','2015-07-30 15:35:41','2015-07-30',0,NULL,NULL,74,1,2,0,'2015-07-30 15:35:41'),(75,4,3,'在前端做的事情，就要放在前端做。比如：活动结束所剩时间/小时','',NULL,NULL,7,NULL,2,NULL,11,0,'2015-07-30 15:36:25','2015-07-30 15:36:25','2015-07-30',0,NULL,NULL,75,1,2,0,'2015-07-30 15:36:25'),(76,4,3,'改进 后端的UI 设计。 （显示上传进度等）','<p><span style=\"color: rgb(0, 0, 0); font-family: Arial, Verdana, sans-serif; font-size: 14px; line-height: 19.0909080505371px;\">（使用jquery upload 上传，显示进度。 )</span></p>\r\n\r\n<p><span style=\"color: rgb(0, 0, 0); font-family: Arial, Verdana, sans-serif; font-size: 14px; line-height: 19.0909080505371px;\">使用  jquery validation </span></p>\r\n\r\n<p><span style=\"color: rgb(0, 0, 0); font-family: Arial, Verdana, sans-serif; font-size: 14px; line-height: 19.0909080505371px;\">使用 jquery masked input</span></p>\r\n\r\n<p> </p>\r\n',NULL,NULL,7,NULL,2,NULL,11,0,'2015-07-30 15:37:48','2015-07-30 15:37:48','2015-07-30',0,NULL,NULL,76,1,2,0,'2015-07-30 15:37:48'),(77,1,3,'申请贷款 以及 填写预约单 中的区域 无法联动更新','<p>问题重现：</p>\r\n\r\n<p>（1）用户选择首先选择 北京-北京-海淀区</p>\r\n\r\n<p>（2）用户重新选择江苏省 并确认</p>\r\n\r\n<p>（3）这时，区域是 江苏省-北京-海淀区 （错误）</p>\r\n','2015-07-30',NULL,8,3,3,NULL,20,3,'2015-07-30 16:20:04','2015-07-30 21:44:07','2015-07-30',100,2,NULL,77,1,2,0,'2015-07-30 21:44:07'),(78,1,5,'商品管理后台，每次更新产品时，商品类型会自动变成默认分类','','2015-07-30',NULL,4,22,2,NULL,10,2,'2015-07-30 17:50:19','2015-08-10 10:18:39','2015-07-30',0,NULL,NULL,78,1,2,0,NULL),(79,1,5,'家具馆第一次进入时，前两个产品不显示价格和购买人数等信息','',NULL,NULL,8,12,3,NULL,10,3,'2015-07-30 18:41:55','2015-07-31 14:47:50','2015-07-30',0,NULL,NULL,79,1,2,0,'2015-07-31 14:47:50'),(80,1,5,'商城header栏小图标展开后，切换到其他模块时，不能自动收回','',NULL,NULL,8,17,2,NULL,10,2,'2015-07-30 18:58:07','2015-08-06 09:49:32','2015-07-30',0,NULL,NULL,80,1,2,0,'2015-08-06 09:49:32'),(81,1,3,'注册登录后没有上传昵称，在灵感评论中则默认显示匿名','',NULL,NULL,3,13,3,NULL,10,2,'2015-07-30 19:51:30','2015-08-03 17:09:24','2015-07-30',0,NULL,NULL,81,1,2,0,NULL),(82,1,3,'家居馆中出现悦装优品的商品','',NULL,NULL,8,22,1,NULL,10,2,'2015-07-30 19:53:01','2015-07-31 11:48:47','2015-07-30',0,NULL,NULL,82,1,2,0,'2015-07-31 11:48:47'),(83,1,5,'家居馆大图比例修改成与悦划算一致','',NULL,NULL,8,12,2,NULL,10,3,'2015-07-30 19:58:59','2015-07-31 11:46:28','2015-07-30',0,NULL,NULL,83,1,2,0,'2015-07-31 11:46:28'),(84,1,5,'6plus上商城类目页面下部分有空白','',NULL,NULL,1,17,2,NULL,10,1,'2015-07-30 23:21:23','2015-07-31 11:47:59','2015-07-30',0,NULL,NULL,84,1,2,0,NULL),(85,1,3,'App商城类目－热销页面UI修改','',NULL,NULL,8,17,3,NULL,10,1,'2015-07-31 11:29:26','2015-07-31 14:34:08','2015-07-31',0,NULL,NULL,85,1,2,0,'2015-07-31 14:34:08'),(86,1,3,'我的关注－悦工人显示有6个关注，点击进去却不显示详情','',NULL,NULL,8,NULL,3,NULL,10,3,'2015-07-31 11:35:19','2015-07-31 14:48:08','2015-07-31',0,NULL,NULL,86,1,2,0,'2015-07-31 14:48:08'),(87,1,3,'品牌团详情页的返回键不好点','',NULL,NULL,8,16,3,NULL,10,1,'2015-07-31 11:51:28','2015-07-31 14:33:05','2015-07-31',0,NULL,NULL,87,1,2,0,'2015-07-31 14:33:05'),(88,1,3,'灵感检索，选择客厅和现代，检索出来的第一张图不显示关注人数','',NULL,NULL,8,22,2,NULL,10,2,'2015-07-31 14:28:35','2015-07-31 16:24:06','2015-07-31',0,NULL,NULL,88,1,2,0,'2015-07-31 16:24:06'),(89,1,3,'5s适配－找灵感评论输入框显示不对','',NULL,NULL,8,22,2,NULL,10,3,'2015-07-31 16:15:21','2015-08-06 09:48:47','2015-07-31',0,NULL,NULL,89,1,2,0,'2015-08-06 09:48:47'),(90,1,3,'找灵感检索删除标签后，应把倒序排列显示改成顺序','',NULL,NULL,8,22,2,NULL,10,2,'2015-07-31 16:37:26','2015-08-06 09:23:29','2015-07-31',0,NULL,NULL,90,1,2,0,'2015-08-06 09:23:29'),(91,1,3,'已经注册的用户 再次注册的时候 会提示“验证码错” （应该提示为‘用户已经注册’）','<p>（1） 进入app 点击‘我的’</p>\r\n\r\n<p>（2）点击注册</p>\r\n\r\n<p>（3）输入一个已经注册的用户名和密码，密码是个错误的密码</p>\r\n\r\n<p>（4）发现：提示验证码错误（应该提示用户已注册）</p>\r\n\r\n<p> </p>\r\n\r\n<p>P.S. 卫东如果觉的让跃华修这个问题更快，请转给跃华</p>\r\n',NULL,NULL,3,13,3,NULL,20,2,'2015-08-02 21:34:37','2015-08-03 17:02:41','2015-08-02',0,NULL,NULL,91,1,2,0,NULL),(92,2,3,'提供页面，可以方便看到预约量房的情况 ','<p>目前有3个地方：</p>\r\n\r\n<p>1. 手机app </p>\r\n\r\n<p>2. yuyue.happysoft.cc</p>\r\n\r\n<p>3. yue.house </p>\r\n\r\n<p>有400 电话和量房 表单页面。  需要把它们做统一。 </p>\r\n\r\n<p>提供出一个统一的 操作页面. </p>\r\n',NULL,NULL,3,26,2,NULL,11,2,'2015-08-03 09:51:58','2015-08-06 13:55:58','2015-08-03',0,NULL,NULL,92,1,2,0,NULL),(93,2,6,'为首页的搜索的所有纬度加上全选','',NULL,NULL,3,24,2,NULL,24,1,'2015-08-03 10:01:10','2015-08-04 09:08:21','2015-08-03',0,NULL,NULL,93,1,2,0,NULL),(94,1,6,'把首页的 排名信息 依据渠道曝光量 依据资源级别曝光量 依据资源位曝光量 都抽出城独立的页面','<ul class=\"nav nav-tabs\" id=\"myTabs\" role=\"tablist\" style=\"padding: 0px; margin: 0px 0px 20px; list-style: none; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(221, 221, 221); color: rgb(51, 51, 51); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; background-color: rgb(255, 255, 255);\">\r\n	<li role=\"presentation\" style=\"float: left; margin-bottom: -1px;\"><a aria-controls=\"position\" data-toggle=\"tab\" href=\"http://localhost:3000/positions?from=2015-08-03&amp;to=2015-08-03&amp;market_ids%5B%5D=1&amp;market_ids%5B%5D=2&amp;commit=%E7%A1%AE%E5%AE%9A#position\" role=\"tab\" style=\"color: rgb(0, 136, 204); display: block; padding: 8px 12px; margin-right: 2px; border: 1px solid transparent; border-radius: 4px 4px 0px 0px;\">排名信息</a></li>\r\n	<li role=\"presentation\" style=\"float: left; margin-bottom: -1px;\"><a aria-controls=\"market\" data-toggle=\"tab\" href=\"http://localhost:3000/positions?from=2015-08-03&amp;to=2015-08-03&amp;market_ids%5B%5D=1&amp;market_ids%5B%5D=2&amp;commit=%E7%A1%AE%E5%AE%9A#market\" role=\"tab\" style=\"color: rgb(0, 136, 204); display: block; padding: 8px 12px; margin-right: 2px; border: 1px solid transparent; border-radius: 4px 4px 0px 0px;\">依据渠道曝光量</a></li>\r\n	<li role=\"presentation\" style=\"float: left; margin-bottom: -1px;\"><a aria-controls=\"company_level\" data-toggle=\"tab\" href=\"http://localhost:3000/positions?from=2015-08-03&amp;to=2015-08-03&amp;market_ids%5B%5D=1&amp;market_ids%5B%5D=2&amp;commit=%E7%A1%AE%E5%AE%9A#company_level\" role=\"tab\" style=\"color: rgb(0, 136, 204); display: block; padding: 8px 12px; margin-right: 2px; border: 1px solid transparent; border-radius: 4px 4px 0px 0px;\">依据资源级别曝光量</a></li>\r\n	<li class=\"active\" role=\"presentation\" style=\"float: left; margin-bottom: -1px;\"><a aria-controls=\"module\" data-toggle=\"tab\" href=\"http://localhost:3000/positions?from=2015-08-03&amp;to=2015-08-03&amp;market_ids%5B%5D=1&amp;market_ids%5B%5D=2&amp;commit=%E7%A1%AE%E5%AE%9A#module\" role=\"tab\" style=\"color: rgb(85, 85, 85); display: block; padding: 8px 12px; margin-right: 2px; border-width: 1px; border-style: solid; border-color: rgb(221, 221, 221) rgb(221, 221, 221) transparent; border-radius: 4px 4px 0px 0px; cursor: default;\">依据资源位曝光量</a></li>\r\n</ul>\r\n\r\n<p> </p>\r\n\r\n<p>排名：  李戈</p>\r\n\r\n<p>依据渠道曝光量： 李戈</p>\r\n\r\n<p>依据资源级别曝光量： 双蕾</p>\r\n\r\n<p>依据资源位曝光量： 双蕾</p>\r\n',NULL,NULL,3,14,2,NULL,24,1,'2015-08-03 10:03:13','2015-08-03 15:33:03','2015-08-03',0,NULL,NULL,94,1,2,0,NULL),(95,1,6,'首页的默认欢迎页，应该显示监控记录。 而不是 现在的 渠道列表','',NULL,NULL,3,14,2,NULL,24,2,'2015-08-03 10:04:11','2015-08-03 10:38:10','2015-08-03',0,NULL,NULL,95,1,2,0,NULL),(96,1,6,'增加说明：  每天的抓取时间是晚上8点。','<p>具体放在哪里，请自行安排。   （使用 bootstrap 的 alert alert-info )</p>\r\n\r\n<p>双蕾。</p>\r\n',NULL,NULL,3,NULL,2,NULL,24,1,'2015-08-03 10:05:40','2015-08-03 10:44:11','2015-08-03',0,NULL,NULL,96,1,2,0,NULL),(97,4,4,'为  400 电话右侧 的”立刻参加“ 改成 ”立刻报名“ ','',NULL,NULL,7,25,2,NULL,11,0,'2015-08-03 10:10:35','2015-08-03 10:10:35','2015-08-03',0,NULL,NULL,97,1,2,0,'2015-08-03 10:10:35'),(98,4,4,'使用 nginx 做为页面的缓存 ','',NULL,NULL,7,11,2,NULL,11,1,'2015-08-03 10:12:36','2015-08-03 10:12:47','2015-08-03',0,NULL,NULL,98,1,2,0,'2015-08-03 10:12:36'),(99,2,3,'安卓端适配','',NULL,NULL,1,NULL,2,NULL,10,0,'2015-08-03 10:25:48','2015-08-03 10:25:48','2015-08-03',0,NULL,NULL,99,1,2,0,NULL),(100,1,3,'后台下拉框保存默认值修改－找灵感，发现和管理','',NULL,NULL,3,22,2,NULL,10,4,'2015-08-03 10:26:56','2015-08-13 09:07:30','2015-08-03',0,NULL,NULL,100,1,2,0,NULL),(101,2,3,'LBS','',NULL,NULL,1,NULL,1,NULL,10,0,'2015-08-03 10:27:33','2015-08-03 10:27:33','2015-08-03',0,NULL,NULL,101,1,2,0,NULL),(102,1,3,'预约单短信提醒','',NULL,NULL,8,13,3,NULL,10,4,'2015-08-03 10:28:18','2015-08-12 09:40:03','2015-08-03',0,NULL,NULL,102,1,2,0,'2015-08-12 09:40:03'),(103,1,3,'微信分享到朋友圈不成功','',NULL,NULL,3,23,3,NULL,10,1,'2015-08-03 10:29:07','2015-08-03 11:01:02','2015-08-03',0,NULL,NULL,103,1,2,0,NULL),(104,1,3,'接口要使用绝对路径','',NULL,NULL,1,NULL,2,NULL,10,0,'2015-08-03 10:32:20','2015-08-03 10:32:20','2015-08-03',0,NULL,NULL,104,1,2,0,NULL),(105,1,3,'使用 jquery upload 上传文件,给出百分比','',NULL,NULL,1,NULL,2,NULL,10,0,'2015-08-03 10:33:37','2015-08-03 10:33:37','2015-08-03',0,NULL,NULL,105,1,2,0,NULL),(106,1,3,'后台对于图片，要在上传之后，生成缩略图','',NULL,NULL,1,NULL,2,NULL,10,0,'2015-08-03 10:34:17','2015-08-03 10:34:17','2015-08-03',0,NULL,NULL,106,1,2,0,NULL),(107,1,7,'CRM的admin栏的“关于”界面bug','<p>CRM的admin栏的“关于”界面存在bug，里面的SugarCRM无法替换成HappyCRM，通过sublime可以找到对应的代码，但修改以后刷新界面无变化</p>\r\n',NULL,NULL,3,27,3,NULL,27,4,'2015-08-03 10:34:47','2015-08-12 09:27:51','2015-08-03',0,NULL,NULL,107,1,2,0,NULL),(108,1,3,'第一次注册登录后，仍然提示未登录','',NULL,NULL,3,13,3,NULL,10,2,'2015-08-03 10:41:25','2015-08-03 17:09:00','2015-08-03',0,NULL,NULL,108,1,2,0,NULL),(109,1,7,'几个对应栏目对应的浏览器的 title 无法更改，依旧显示SugarCRM','<p>几个对应栏目对应的浏览器标签无法更改，依旧显示SugarCRM，例如：客户，联系人等</p>\r\n',NULL,NULL,3,27,2,NULL,27,3,'2015-08-03 10:42:58','2015-08-12 10:10:26','2015-08-03',0,NULL,NULL,109,1,2,0,NULL),(110,1,7,'部署至远程服务器以后，刷新界面后，改动没有生效','<p>推送至远程服务器以后，刷新界面无更新，已经将服务器更改为<span style=\"color: rgb(0, 0, 0); font-family: Arial, Verdana, sans-serif; font-size: 14px; line-height: 21px;\"> </span><a class=\"id\" data-permalink=\"\" href=\"https://console.qingcloud.com/pek2/vxnets/vxnet-qyzjirb/\" style=\"color: rgb(31, 144, 200); display: inline-block; font-size: 11.9999990463257px; margin-right: 8px; vertical-align: top; word-wrap: break-word; word-break: normal; font-family: Monaco, Menlo, Consolas, \'Courier New\', monospace; line-height: 16px; background-color: rgb(255, 255, 255);\" target=\"_blank\">192.168.88.</a><span style=\"color: rgb(0, 0, 0); font-family: Arial, Verdana, sans-serif; font-size: 14px; line-height: 21px;\">111</span></p>\r\n',NULL,NULL,3,27,2,NULL,27,3,'2015-08-03 10:45:16','2015-08-12 10:13:11','2015-08-03',0,NULL,NULL,110,1,2,0,NULL),(111,2,3,'后台角色权限划分以及安全性','',NULL,NULL,1,13,2,NULL,10,2,'2015-08-03 11:26:20','2015-08-12 14:56:24','2015-08-03',0,NULL,NULL,111,1,2,0,NULL),(112,1,4,'400 电话 号码，改成 4008-455-299','',NULL,NULL,3,26,2,NULL,11,2,'2015-08-03 11:49:27','2015-08-03 18:59:20','2015-08-03',0,NULL,NULL,112,1,2,0,NULL),(113,1,4,'yue.house PC端，把“立刻参加”改成“立刻报名”','',NULL,NULL,3,26,2,NULL,11,1,'2015-08-03 11:50:47','2015-08-03 18:58:52','2015-08-03',0,NULL,NULL,113,1,2,0,NULL),(114,1,6,'首页时间选择框中明天的日期不应可选','<p>首页首页时间选择框中明天的日期不应可选</p>\r\n\r\n<p>例子：</p>\r\n\r\n<p>今天是0802，但在首页的时间选择框中，0803也是可选的。</p>\r\n',NULL,NULL,3,24,2,NULL,24,1,'2015-08-03 12:03:23','2015-08-03 15:47:25','2015-08-03',0,NULL,NULL,114,1,2,0,NULL),(115,4,3,'用户管理模块需记录用户注册时间和姓名','',NULL,NULL,7,13,2,NULL,10,0,'2015-08-03 14:44:25','2015-08-03 14:44:25','2015-08-03',0,NULL,NULL,115,1,2,0,'2015-08-03 14:44:25'),(116,4,4,'当用户报名时，为相关同学发送通知短信','<p>思路：</p>\r\n\r\n<p>1. 当用户输入信息后， 同步数据到 app后台 （ 使用 post 请求） </p>\r\n\r\n<p>2.  发送短信等事情， 由app 后台来做。</p>\r\n',NULL,NULL,7,14,2,NULL,14,0,'2015-08-03 16:21:20','2015-08-03 16:21:20','2015-08-03',0,NULL,NULL,116,1,2,0,'2015-08-03 16:21:20'),(117,1,3,'调整home页面的android适配','',NULL,NULL,1,23,3,NULL,17,1,'2015-08-03 16:43:37','2015-08-04 10:40:21','2015-08-03',0,NULL,NULL,117,1,2,0,NULL),(118,1,3,'调整商城页面的android适配','',NULL,NULL,1,17,3,NULL,17,1,'2015-08-03 16:44:18','2015-08-04 10:40:15','2015-08-03',0,NULL,NULL,118,1,2,0,NULL),(119,1,3,'调整管理页面的android适配','',NULL,NULL,1,16,3,NULL,17,1,'2015-08-03 16:44:42','2015-08-04 10:40:09','2015-08-03',0,NULL,NULL,119,1,2,0,NULL),(120,1,3,'调整 我的 页面的android适配','',NULL,NULL,1,3,3,NULL,17,2,'2015-08-03 16:45:17','2015-08-05 10:24:48','2015-08-03',0,NULL,NULL,120,1,2,0,NULL),(121,1,3,'品牌团时间没有根据实际时间减少','',NULL,NULL,8,16,3,NULL,10,2,'2015-08-03 16:45:40','2015-08-13 10:32:10','2015-08-03',0,NULL,NULL,121,1,2,0,'2015-08-13 10:32:10'),(122,1,4,'PC 首页，  图片的切换','<p>yue.house </p>\r\n\r\n<p>在 666 套餐配置，  鼠标移动到 “卫浴”， “地板”等小图标时， 需要切换下面的大图</p>\r\n',NULL,NULL,3,26,2,NULL,11,2,'2015-08-03 16:56:52','2015-08-06 13:54:53','2015-08-03',0,NULL,NULL,122,1,2,0,NULL),(123,4,4,'yue.house PC端，688, 888  “我要抢订” 的按钮，可以点击。','<p>688 跳到天猫店的 688 </p>\r\n\r\n<p>888 同理。</p>\r\n',NULL,NULL,7,25,2,NULL,11,0,'2015-08-03 16:58:03','2015-08-03 16:58:03','2015-08-03',0,NULL,NULL,123,1,2,0,'2015-08-03 16:58:03'),(124,1,3,'让几个人学会ios打包及分发','','2015-08-10',NULL,1,3,2,NULL,20,1,'2015-08-03 17:32:26','2015-08-07 10:08:53','2015-08-07',0,NULL,NULL,124,1,4,0,NULL),(125,1,3,'家居馆－两个大图上，X人已买之间间距太大','',NULL,NULL,8,12,2,NULL,10,2,'2015-08-03 17:40:24','2015-08-05 11:49:51','2015-08-03',0,NULL,NULL,125,1,2,0,'2015-08-05 11:49:51'),(126,1,3,'商城首页轮播图需加上圈，显示有几张图','',NULL,NULL,1,17,2,NULL,10,0,'2015-08-03 17:41:19','2015-08-03 17:41:19','2015-08-03',0,NULL,NULL,126,1,2,0,NULL),(127,1,4,'域名备案的进度','<p>yuehouse.co</p>\r\n\r\n<p>yuehouse.in</p>\r\n\r\n<p> </p>\r\n\r\n<p>同时敦促 信管局 赶紧对 .house 域名做备案</p>\r\n',NULL,NULL,1,11,2,NULL,11,0,'2015-08-04 09:26:11','2015-08-04 09:26:11','2015-08-04',0,NULL,NULL,127,1,2,0,NULL),(128,4,3,'app后台－预约单列表需加上序号，可以一目了然看到有多少人预约','',NULL,NULL,7,3,2,NULL,10,0,'2015-08-04 12:03:07','2015-08-04 12:03:07','2015-08-04',0,NULL,NULL,128,1,2,0,'2015-08-04 12:03:07'),(129,1,7,'登陆后，右上角 头像 -》 文档 -> 编辑， 电子邮件选项， 去掉SUGAR 客户端。','',NULL,NULL,3,27,2,NULL,27,3,'2015-08-04 14:34:35','2015-08-12 11:43:46','2015-08-04',0,NULL,NULL,129,1,2,0,NULL),(130,1,3,'WEB后台中的 预约客户列表，去掉删除按钮','<p>1. 去掉 删除按钮， 同时去掉 对应的action</p>\r\n\r\n<p>2. 要分页， 分页要有选项。( 25, 50, 100) </p>\r\n\r\n<p>3. 预约时间： <span style=\"color: rgb(51, 51, 51); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 13.3333330154419px; background-color: rgb(255, 255, 255);\">2015-08-04 06:04:22 +0800   去掉后面的 0800</span></p>\r\n',NULL,NULL,3,13,2,NULL,11,2,'2015-08-04 14:39:49','2015-08-05 09:29:35','2015-08-04',0,NULL,NULL,130,1,2,0,NULL),(131,1,4,'yue.house 首页，点击 688 “我要抢订” 按钮， 要跳转到天猫的对应链接。','<p>888 也是一样。</p>\r\n\r\n<p> </p>\r\n',NULL,NULL,3,14,2,NULL,26,1,'2015-08-04 15:49:58','2015-08-04 20:28:37','2015-08-04',0,NULL,NULL,131,1,2,0,NULL),(132,1,4,'首页MENU，凡是跳转到站外的， 都需要在“新窗口中打开”','<p>现在： 都是在原窗口中跳转的。</p>\r\n',NULL,NULL,3,14,2,NULL,26,1,'2015-08-04 15:50:47','2015-08-04 18:51:20','2015-08-04',0,NULL,NULL,132,1,2,0,NULL),(133,4,3,'App后台－用户管理，需增加序号，可以一目了然看到当前有多少用户注册','',NULL,NULL,7,13,3,NULL,10,0,'2015-08-04 17:11:22','2015-08-04 17:11:22','2015-08-04',0,NULL,NULL,133,1,2,0,'2015-08-04 17:11:22'),(134,2,3,'后台需增加角色管理','',NULL,NULL,1,NULL,2,NULL,10,0,'2015-08-04 17:11:45','2015-08-04 17:11:45','2015-08-04',0,NULL,NULL,134,1,2,0,NULL),(135,4,3,'App后台－用户管理，需增查询功能，通过电话查找','',NULL,NULL,7,13,2,NULL,10,0,'2015-08-04 17:13:45','2015-08-04 17:13:45','2015-08-04',0,NULL,NULL,135,1,2,0,'2015-08-04 17:13:45'),(136,4,3,'后台用户管理模块，应该按照注册时间倒序排列','',NULL,NULL,7,13,2,NULL,10,0,'2015-08-04 17:24:37','2015-08-04 17:24:37','2015-08-04',0,NULL,NULL,136,1,2,0,'2015-08-04 17:24:37'),(137,1,3,'iphone 5s 注册时， ‘ 获取验证码 \'不能完整显示','',NULL,NULL,3,13,2,NULL,11,1,'2015-08-04 19:49:41','2015-08-05 10:08:26','2015-08-04',0,NULL,NULL,137,1,2,0,NULL),(138,4,3,'使用 云图片服务 保存图片','',NULL,NULL,7,11,2,NULL,11,0,'2015-08-05 07:20:18','2015-08-05 07:20:18','2015-08-05',0,NULL,NULL,138,1,2,0,'2015-08-05 07:20:18'),(139,4,3,'图片上传后, 需要进行多种尺寸的转换. 比如把大图换成小图','',NULL,NULL,7,NULL,2,NULL,11,0,'2015-08-05 07:23:52','2015-08-05 07:23:52','2015-08-05',0,NULL,NULL,139,1,2,0,'2015-08-05 07:23:52'),(140,4,3,'上传图片时,对图片的尺寸, 文件大小进行说明, 进行验证','',NULL,NULL,7,NULL,2,NULL,11,0,'2015-08-05 07:24:19','2015-08-05 07:24:19','2015-08-05',0,NULL,NULL,140,1,2,0,'2015-08-05 07:24:19'),(141,2,3,'在办公室大屏幕上显示近期的各种信息监控，包括订单情况，服务器情况','<p>1. 订单情况： 今天多少订单， 本周内多少订单，最近订单的信息，本月多少订单</p>\r\n\r\n<p>订单列表：  通过PC 网站(yue.house) 的有多少， 通过app的有多少，列表是什么。</p>\r\n\r\n<p>2. 服务器情况： </p>\r\n\r\n<p>服务器的CPU 情况， 内存情况， 硬盘， 网路情况</p>\r\n\r\n<p>3. bug 情况。 </p>\r\n',NULL,NULL,1,31,2,NULL,11,2,'2015-08-05 09:24:33','2015-08-12 11:50:16','2015-08-05',0,NULL,NULL,141,1,2,0,NULL),(142,1,7,'中文版首次进入CRM，引导界面含有HappyCRM 7字样,将数字7去除','<p>首次进入CRM，引导界面含有Sugar等字样</p>\r\n',NULL,NULL,2,27,2,NULL,27,5,'2015-08-05 09:35:30','2015-08-12 15:08:12','2015-08-05',0,NULL,NULL,142,1,2,0,NULL),(143,1,3,'将APP中的灵感，发现，管理相关的图片相对路径改为绝对路径','<p>例：</p>\r\n\r\n<p class=\"p1\"><span class=\"s1\"> $</span><span class=\"s2\">.</span><span class=\"s1\">cover</span><span class=\"s2\">.</span><span class=\"s1\">setImage </span><span class=\"s3\">Settings</span><span class=\"s2\">.</span><span class=\"s1\">server</span><span class=\"s2\">+</span><span class=\"s1\">data</span><span class=\"s2\">.</span><span class=\"s4\">pic</span></p>\r\n\r\n<p class=\"p1\"><span class=\"s4\">修改为</span></p>\r\n\r\n<p class=\"p1\"><span class=\"s1\"> $</span><span class=\"s2\">.</span><span class=\"s1\">cover</span><span class=\"s2\">.</span><span class=\"s1\">setImage </span><span class=\"s1\">data</span><span class=\"s2\">.</span><span class=\"s4\">pic</span></p>\r\n\r\n<p class=\"p1\"><span class=\"s4\">后台接口由相对路径：</span></p>\r\n\r\n<ul class=\"obj collapsible\" style=\"list-style-type: none; padding: 0px; margin: 0px 0px 0px 2em; color: rgb(0, 0, 0); font-family: monospace; font-size: medium;\">\r\n	<li style=\"position: relative;\">\r\n	<div class=\"hoverable hovered selected\" style=\"-webkit-transition: background-color 0.2s ease-out 0.2s; transition: background-color 0.2s ease-out 0.2s; display: inline-block; outline-width: 1px; outline-style: dotted; padding: 1px 2px; border-radius: 2px; background-color: rgb(235, 238, 249);\"><span class=\"property\" style=\"font-weight: bold;\">pic</span>: \r\n\r\n	<div class=\"collapser\" style=\"position: absolute; top: 1px; left: -1.5em; cursor: default; -webkit-user-select: none; padding-right: 6px; padding-left: 6px;\"> </div>\r\n	{\r\n\r\n	<ul class=\"obj collapsible\" style=\"list-style-type: none; padding: 0px; margin: 0px 0px 0px 2em;\">\r\n		<li style=\"position: relative;\">\r\n		<div class=\"hoverable\" style=\"-webkit-transition: background-color 0.2s ease-out 0s; transition: background-color 0.2s ease-out 0s; display: inline-block; padding: 1px 2px; border-radius: 2px;\"><span class=\"property\" style=\"font-weight: bold;\">url</span>: <span class=\"type-string\" style=\"color: green;\">\"/uploads/source/pic/124/1212412414.jpg\"</span></div>\r\n		</li>\r\n	</ul>\r\n\r\n	<p>},</p>\r\n	</div>\r\n	</li>\r\n</ul>\r\n\r\n<p>修改为绝对路径：</p>\r\n\r\n<ul class=\"obj collapsible\" style=\"list-style-type: none; padding: 0px; margin: 0px 0px 0px 2em; color: rgb(0, 0, 0); font-family: monospace; font-size: medium;\">\r\n	<li style=\"position: relative;\">\r\n	<div class=\"hoverable selected\" style=\"-webkit-transition: background-color 0.2s ease-out 0s; transition: background-color 0.2s ease-out 0s; display: inline-block; outline-width: 1px; outline-style: dotted; padding: 1px 2px; border-radius: 2px;\"><span class=\"property\" style=\"font-weight: bold;\">pic</span>: <span class=\"type-string\" style=\"color: green;\">\"</span><a href=\"http://yue_app_test.happysoft.cc/uploads/source/pic/124/1212412414.jpg\">http://yue_app_test.happysoft.cc/uploads/source/pic/124/1212412414.jpg</a><span class=\"type-string\" style=\"color: green;\">\"</span>,</div>\r\n	</li>\r\n</ul>\r\n',NULL,NULL,2,22,2,NULL,22,3,'2015-08-05 09:37:30','2015-08-13 09:06:54','2015-08-05',0,NULL,NULL,143,1,2,0,NULL),(144,1,7,'CRM主界面下有Welcome to the Sugar 7...字样','<p>CRM主界面下发有Welcome to the Sugar 7...字样</p>\r\n',NULL,NULL,3,27,2,NULL,27,2,'2015-08-05 09:37:33','2015-08-05 19:02:53','2015-08-05',0,NULL,NULL,144,1,2,0,NULL),(145,1,7,'admin里面EmailSettings =》From Name有Sugar字样','<p>admin里面EmailSettings =》From Name有Sugar字样</p>\r\n',NULL,NULL,3,27,2,NULL,27,2,'2015-08-05 09:39:06','2015-08-12 11:51:44','2015-08-05',0,NULL,NULL,145,1,2,0,NULL),(146,1,7,'Admin=》Repair选项有Sugar字样','<p>Admin=》Repair选项有Sugar字样</p>\r\n',NULL,NULL,3,27,2,NULL,27,2,'2015-08-05 09:40:45','2015-08-12 11:56:00','2015-08-05',0,NULL,NULL,146,1,2,0,NULL),(147,1,4,'做SEO， 注册百度站长。','',NULL,NULL,1,11,2,NULL,11,0,'2015-08-05 10:16:35','2015-08-05 10:16:35','2015-08-05',0,NULL,NULL,147,1,2,0,NULL),(148,1,7,'英文版Admin界面以及Profile界面含有部分Sugar','<p>英文版Admin界面以及Profile界面含有部分Sugar</p>\r\n',NULL,NULL,3,27,2,NULL,27,4,'2015-08-05 11:20:18','2015-08-12 15:22:17','2015-08-05',0,NULL,NULL,148,1,2,0,NULL),(149,4,3,'将服务器返回的relative path改成absolute path','',NULL,NULL,7,13,2,NULL,13,0,'2015-08-05 11:42:38','2015-08-05 11:42:38','2015-08-05',0,NULL,NULL,149,1,2,0,'2015-08-05 11:42:38'),(150,1,3,'后台安全性－应不允许注册，除了admin账号，其他人都不允许自己注册新用户，而是由admin分配账号和权限','',NULL,NULL,1,NULL,3,NULL,10,0,'2015-08-05 15:38:11','2015-08-05 15:38:11','2015-08-05',0,NULL,NULL,150,1,2,0,NULL),(151,1,3,'后台下拉框保存默认值修改－套餐，案例，悦工人和设计师','',NULL,NULL,1,23,2,NULL,10,0,'2015-08-05 15:59:37','2015-08-05 15:59:37','2015-08-05',0,NULL,NULL,151,1,2,0,NULL),(152,1,3,'后台下拉框保存默认值修改－看现场','',NULL,NULL,1,3,2,NULL,10,0,'2015-08-05 16:08:47','2015-08-05 16:08:47','2015-08-05',0,NULL,NULL,152,1,2,0,NULL),(153,1,3,'后台下拉框保存默认值修改－悦金融','',NULL,NULL,1,13,2,NULL,10,0,'2015-08-05 16:10:38','2015-08-05 16:10:38','2015-08-05',0,NULL,NULL,153,1,2,0,NULL),(154,1,3,'后台意见反馈模块需增加姓名，电话字段，以及反馈时间 ','',NULL,NULL,8,16,2,NULL,10,2,'2015-08-05 16:18:47','2015-08-11 16:48:23','2015-08-05',0,NULL,NULL,154,1,2,0,'2015-08-11 16:48:23'),(155,1,3,'用户管理应分为客户和内部用户，客户是通过app注册的，浏览app段的，而内部用户是由admin创建并分配了角色的，可以在后台维护数据的','',NULL,NULL,1,11,2,NULL,10,1,'2015-08-05 16:43:42','2015-08-12 14:57:07','2015-08-05',0,NULL,NULL,155,1,2,0,NULL),(156,1,7,'主界面的下拉菜单框Help Dashboard选项，有Sugar 7 字样','<p>主界面的下拉菜单框Help Dashboard选项，有Sugar 7 字样</p>\r\n',NULL,NULL,2,27,2,NULL,27,2,'2015-08-05 19:04:42','2015-08-12 12:03:02','2015-08-05',0,NULL,NULL,156,1,2,0,NULL),(157,1,7,'Admin =》Email =》Inbound Email里面有警告','<p>Admin =》Email =》Inbound Email里面有警告：<span style=\"color: rgb(230, 23, 24); font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px; background-color: rgb(253, 253, 253);\">Inbound Email </span><b style=\"color: rgb(230, 23, 24); font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px; background-color: rgb(253, 253, 253);\">cannot</b><span style=\"color: rgb(230, 23, 24); font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px; background-color: rgb(253, 253, 253);\"> function without the IMAP c-client libraries enabled/compiled with the PHP module. Please contact your administrator to resolve this issue.</span></p>\r\n',NULL,NULL,1,11,1,NULL,27,1,'2015-08-05 19:06:52','2015-08-12 12:04:37','2015-08-05',0,NULL,NULL,157,1,2,0,NULL),(158,1,7,'顶部菜单栏：Meetings的下拉菜单栏的Schedule Meeting选项内Meeting Type栏含有Sugar','<p>顶部菜单栏：Meetings的下拉菜单栏的Schedule Meeting选项内Meeting Type栏含有Sugar</p>\r\n',NULL,NULL,1,11,1,NULL,27,2,'2015-08-05 19:10:57','2015-08-13 08:36:51','2015-08-05',0,NULL,NULL,158,1,2,0,NULL),(159,1,7,'顶部菜单栏Documents下拉菜单栏Creat Document选项的Source栏含有Sugar','<p>顶部菜单栏Documents下拉菜单栏Creat Document选项的Source栏含有Sugar</p>\r\n',NULL,NULL,1,11,1,NULL,27,2,'2015-08-05 19:13:08','2015-08-13 08:37:36','2015-08-05',0,NULL,NULL,159,1,2,0,NULL),(160,1,7,'CRM的Iphone6手机端网页，登陆时会出现SugarCRM界面','<p>CRM的Iphone6手机端网页，登陆时会出现SugarCRM界面</p>\r\n',NULL,NULL,3,11,2,NULL,27,1,'2015-08-05 19:14:28','2015-08-13 08:36:19','2015-08-05',0,NULL,NULL,160,1,2,0,NULL),(161,1,3,'把thin 做成自动启动的脚本','<p>这样就不需要手动启动了。</p>\r\n',NULL,NULL,1,11,2,NULL,11,0,'2015-08-06 10:50:04','2015-08-06 10:50:04','2015-08-06',0,NULL,NULL,161,1,2,0,NULL),(162,4,3,'使用aliyun  OSS 来做图片存储。','',NULL,NULL,7,11,2,NULL,11,0,'2015-08-06 10:50:25','2015-08-06 10:50:25','2015-08-06',0,NULL,NULL,162,1,2,0,'2015-08-06 10:50:25'),(163,1,3,'图片显示问题：图片第一次加载会显示不完全，文字被覆盖了 。','',NULL,NULL,1,NULL,1,NULL,28,0,'2015-08-06 17:51:08','2015-08-06 17:51:08','2015-08-06',0,NULL,NULL,163,1,2,0,NULL),(164,1,7,'首页Sugar','<p>登陆成功后，左侧twitter还是@sugar。</p>\r\n',NULL,NULL,2,27,1,NULL,29,3,'2015-08-06 21:02:12','2015-08-12 18:10:24','2015-08-06',0,NULL,NULL,164,1,2,0,NULL),(165,1,7,'Sugar的名字还是有出现','<p>在管理员设置界面，还是有Sugar出现。<img alt=\"\" src=\"data:image/png;base64,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4AY5LaEeXLJh1rdBSGUsuXWoZbeYYWnIEZeJmeVMSGX61AQszciZjdW1FtFTaxDafWH1iK0R2pe333z+nPSr/WNE754RJoHKe3eeOr9bPCSmeer8xg2j2byQiuhZRdhGlpaWlvb29gsXPv/ss88+/fTT/v7+t99++7dv/fbNN998/fXXX3311T179jz11FNr1qzp2dnz6quvrlx5l0v0VGI20+7wikinfxsnF1hKe32OjMjBmBgf5qJNOZjUf5GQ3qAbtgTVZnca7BlxhpTFEHrJUK99u0/TB4LUAtoLIn3wZ9keQTR0iZ4jcqw+5Freru6YqVhiC8JDbbSYi7bzlbmKpexyfjOvyldnRXgE8H4unaCUoctB9HSQmIBWT6JntbQYC4ieAEaSFz337NnT1dX1m9/8ZsaMGVOmTJk6derkyZMvvfTSiy+++NFHH33llVf6+voOHDhw4MCBQ4cOvfvuu1u3bg20r7cDQI1S5i4L6g4CtJqlHFVn2dOztH+Smun5L9HSQGxsI0tLS8tjjz0WKp7nzp978skn165dm8nz8MMPP/zww2vWrFm9evWaNWt27dp15513WkTPRIix7fu4pAOJQ9VUI2XocqpFwkL0TARET2JqACNlET1Xrlw5Y8aMHTt2vPXWW+++++7LL7989913X3rppevWrXvttdcOHz78wQcf9Pf3Hz169PDhw4ieAPVEmbssqDsI0GoV6z6xY2EsKufN58+J+4HefP6cukwe0bPqsY0sLS0tP3v00U8/+eTcufMjH3/80UcfHTt27PCRwwcPHnz77bffeuutN95449lnd65Zs+b555/f+8orK1asqAHRkx0bqxdEz2okugcxL5SI+K5gbkWIuloivKrbdEjLSlmUEX7tMvIy28oMy3IPZ2EVwwtFkvfYiUgxa11lpO10r6/hUAuuLEdR1jxpCbh2KM+6Vht5Lu0xWu3ae9xUC/alTJprje2g+Kf/ZwEM7djqT3VlmH+9A9Q5ZVnePn/+/EceeeSll1767W9/+/777x8/fvzll1+ePHny0qVLW1tbr7/++oULFy5YsODGG2+84YYbZs2aFciip7ZUnH+l/Ctn1AFgpcxdFtQdiJ61R+RunqUzxtmdG0bFxGIrnoieFcc2srS0tDyyfv253/1uZGTk5KmTg0NDxz/8sL+//70jRw4dPPT22++89dZb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\" /></p>\r\n',NULL,NULL,3,NULL,2,NULL,29,1,'2015-08-06 23:26:22','2015-08-10 15:02:16','2015-08-06',0,NULL,NULL,165,1,2,0,NULL),(166,1,6,'开放首页列表中编辑功能','<p><img height=\"73\" id=\"图片_x0020_1\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=3\" style=\"cursor: pointer;\" width=\"49\" /></p>\r\n',NULL,NULL,3,24,2,NULL,24,1,'2015-08-07 10:02:16','2015-08-10 11:21:46','2015-08-07',0,NULL,NULL,166,1,2,0,NULL),(167,1,6,'选择时间和对应统计方式之后再跳转页面','<p>如图，希望将“排名信息”、“渠道曝光量”、“资源级别曝光量”“资源位曝光量”变成如“渠道”下的可勾选的小模块形式，条形列表形式也可（只能单选）。</p>\r\n\r\n<p>对于<strong>第一次</strong>，整个引起页面刷新的操作流程为（不区分优先级，然而不可缺少任何一步）：</p>\r\n\r\n<p>设置日期（前后两个格）→点选渠道→点选资源级别→点选竞品列表→点选4个模块中的一个→点击确定→引起页面刷新，呈现对应表格</p>\r\n\r\n<p>请注意：整个流程请保留已选择信息（对勾）。在上一次页面刷新后，我可以改变任意点选内容，只要保证“日期”“ 渠道”“ 资源级别”“ 竞品列表”“ 4个模块”五个部分任意一个部分不为空的情况下，点击确定，刷新出另一张我需要的表。</p>\r\n\r\n<p><img height=\"515\" id=\"图片_x0020_3\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=5\" width=\"969\" /></p>\r\n',NULL,NULL,1,14,2,NULL,24,0,'2015-08-07 10:08:04','2015-08-07 10:08:04','2015-08-07',0,NULL,NULL,167,1,2,0,NULL),(168,3,3,'完成关于iOS app打包 上架的word文档的审查与续写','<p>参考Happysoft.cc的邮件</p>\r\n\r\n<p>邮件标题为 <a href=\"http://mail.ym.163.com/jy3/read/read.jsp?offset=0&amp;mid=AOoAFQDuAEPCvOTWF3jIcap3&amp;sid=l0fAn7n8P6l4m9hCNvDsfWoGGMGmLGSL&amp;fid=3&amp;fr=folder3\" style=\"color: rgb(0, 0, 0); margin-right: -10000px; display: inline; white-space: nowrap; overflow: hidden; font-family: verdana, Arial, Helvetica, sans-serif; font-size: 14px;\">审阅与续写 iOS App打包上架的说明</a></p>\r\n\r\n<p>word文档名称是 “关于Apple App打包，测试和上架App Store的那点事”</p>\r\n','2015-08-10',NULL,3,3,2,NULL,20,1,'2015-08-07 10:08:52','2015-08-09 15:18:28','2015-08-07',0,NULL,124,124,2,3,0,NULL),(169,2,6,'为价格策略添加可选删除功能','<p>价格策略页面上，举例来说，希望能够在“百度手机助手”上加入点选框，在最下方加入全选点选框，全选点选框下方/右方加入删除按钮。达成“任选删除”和“全部删除”的功能。</p>\r\n\r\n<p><img height=\"23\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=12\" width=\"24\" /><img height=\"135\" id=\"图片_x0020_4\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=6\" width=\"1025\" />​</p>\r\n',NULL,NULL,3,26,2,NULL,24,1,'2015-08-07 10:09:21','2015-08-07 15:45:37','2015-08-07',0,NULL,NULL,169,1,2,0,NULL),(170,2,6,'为价格策略页面添加生成时间及更新时间','<p>价格策略页面上，举例来说，希望能够在“百度手机助手”上加入点选框，在最下方加入全选点选框，全选点选框下方/右方加入删除按钮。达成“任选删除”和“全部删除”的功能。</p>\r\n\r\n<p><img height=\"23\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=12\" width=\"24\" /><img height=\"135\" id=\"图片_x0020_4\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=6\" width=\"1025\" /></p>\r\n',NULL,NULL,3,26,2,NULL,24,2,'2015-08-07 10:10:19','2015-08-07 11:45:51','2015-08-07',0,NULL,NULL,170,1,2,0,NULL),(171,2,6,'将首页表格上的表头设置为随页面浮动','<p>在监控记录页面上，希望能够固定首行（请注意固定的内容要根据筛选而确定），在图表右侧设置拉动条以供拉动。</p>\r\n\r\n<p><img height=\"121\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=13\" width=\"20\" /><img height=\"190\" id=\"图片_x0020_20\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=10\" width=\"1000\" /></p>\r\n',NULL,NULL,1,24,2,NULL,24,0,'2015-08-07 10:13:04','2015-08-07 10:13:04','2015-08-07',0,NULL,NULL,171,1,2,0,NULL),(172,1,6,'统计数据无法按照时间排序','<p>时间排序功能仍然无法实现。</p>\r\n\r\n<p><img height=\"66\" id=\"图片_x0020_18\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=8\" width=\"98\" /></p>\r\n',NULL,NULL,3,24,2,NULL,24,1,'2015-08-07 10:13:53','2015-08-07 10:16:29','2015-08-07',0,NULL,NULL,172,1,2,0,NULL),(173,1,6,'csv文件导出 未与筛选选项做关联','<p>csv的导出过程中，导出的内容和选择的内容不一致。请注意是所有选择的内容，而不仅仅是时间。</p>\r\n\r\n<p><img height=\"44\" id=\"图片_x0020_19\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=9\" width=\"179\" /></p>\r\n',NULL,NULL,1,14,2,NULL,24,0,'2015-08-07 10:14:55','2015-08-07 10:14:55','2015-08-07',0,NULL,NULL,173,1,2,0,NULL),(174,1,6,'表格显示美观性待改进','<p>呈现方式比较难看。尤其是在“时间”、“资源位”和Title的呈现上。希望“时间”尽量保证一行，“资源位”中的内容尽量保证两行以下，所有Title尽量保证一行。</p>\r\n\r\n<p><img height=\"316\" id=\"图片_x0020_22\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=11\" width=\"981\" /></p>\r\n',NULL,NULL,3,24,2,NULL,24,1,'2015-08-07 10:15:43','2015-08-07 10:16:11','2015-08-07',0,NULL,NULL,174,1,2,0,NULL),(175,1,6,'重新核对所有现有的抓取数据','<p>数据抓取准确性问题严重。</p>\r\n',NULL,NULL,1,NULL,2,NULL,24,0,'2015-08-07 10:23:28','2015-08-07 10:23:28','2015-08-07',0,NULL,NULL,175,1,2,0,NULL),(176,2,3,'注册：注册成功后 直接登录，不要再次登录了','',NULL,NULL,1,NULL,2,NULL,28,0,'2015-08-07 11:44:13','2015-08-07 11:44:13','2015-08-07',0,NULL,NULL,176,1,2,0,NULL),(177,1,3,'提交预约订单，重复提交多次 ，会收到多条短信，应该是点击预约后显示 loding 防止重复提交。','',NULL,NULL,3,3,3,NULL,28,2,'2015-08-07 14:08:04','2015-08-12 15:49:36','2015-08-07',0,NULL,NULL,177,1,2,0,NULL),(178,1,3,'不能允许普通用户登陆后台','<p>如题.</p>\r\n\r\n<p>我用 13522223382@yue.house 就可以看到后台的数据.   </p>\r\n\r\n<p> </p>\r\n\r\n<p>需要对所有用户做标识, 增加个属性, (例如 user_type , 有两个可用的值: customer 表示外部用户,  employee 表示内部员工,   ) 只有内部员工才可以登陆.  </p>\r\n',NULL,NULL,1,11,3,NULL,11,1,'2015-08-09 06:27:28','2015-08-11 18:35:04','2015-08-09',0,NULL,NULL,178,1,2,0,NULL),(179,1,3,'用户不输入用户密码,直接输入URL也可以访问 页面','<p>例如;http://yuehouse.happysoft.cc/users </p>\r\n',NULL,NULL,3,13,3,NULL,11,1,'2015-08-09 06:28:18','2015-08-11 15:55:42','2015-08-09',0,NULL,NULL,179,1,2,0,NULL),(180,2,3,'后台使用 阿里云 oss 来保存图片(  重复?)','',NULL,NULL,1,11,1,NULL,11,1,'2015-08-09 06:29:56','2015-08-12 09:51:35','2015-08-09',0,NULL,NULL,180,1,2,0,NULL),(181,4,3,'各种列表页面，增加分页，增加简单的检索','',NULL,NULL,7,28,2,NULL,11,1,'2015-08-10 07:51:03','2015-08-10 07:51:16','2015-08-10',0,NULL,NULL,181,1,2,0,'2015-08-10 07:51:03'),(182,4,3,'增加操作日志　','',NULL,NULL,7,28,2,NULL,11,0,'2015-08-10 07:51:32','2015-08-10 07:51:32','2015-08-10',0,NULL,NULL,182,1,2,0,'2015-08-10 07:51:32'),(183,1,3,'订单配置的菜单，跳转到了百度','',NULL,NULL,3,13,2,NULL,11,1,'2015-08-10 07:52:11','2015-08-12 14:56:45','2015-08-10',0,NULL,NULL,183,1,2,0,NULL),(184,1,3,'分享页面点击立即下载后跳转的链接应改成App store','',NULL,NULL,2,22,3,NULL,10,3,'2015-08-10 11:05:45','2015-08-13 09:02:50','2015-08-10',0,NULL,NULL,184,1,2,0,NULL),(185,1,3,'灵感页面不能分享','',NULL,NULL,3,22,3,NULL,10,2,'2015-08-10 11:06:46','2015-08-13 09:03:49','2015-08-10',0,NULL,NULL,185,1,2,0,NULL),(186,1,6,'时间排序与筛选选项无法对应','<p>时间排序与筛选选项无法对应</p>\r\n',NULL,NULL,3,24,2,NULL,24,1,'2015-08-10 11:31:01','2015-08-11 17:16:33','2015-08-10',0,NULL,NULL,186,1,2,0,NULL),(187,2,3,'搭建 titanium 论坛, 跟大师一起','',NULL,NULL,1,22,2,NULL,11,2,'2015-08-11 06:44:14','2015-08-11 06:56:32','2015-08-11',0,NULL,NULL,187,1,2,0,NULL),(188,4,4,'把 ＰＣ　商城部署到青云，　使用 mall.yuehouse.co ','<p>如题</p>\r\n\r\n<p> </p>\r\n',NULL,NULL,7,14,2,NULL,11,0,'2015-08-11 07:20:03','2015-08-11 07:20:03','2015-08-11',0,NULL,NULL,188,1,2,0,'2015-08-11 07:20:03'),(189,4,4,'把  www.yue.house 部署到　yuehouse.co ，','',NULL,NULL,7,26,2,NULL,11,1,'2015-08-11 07:20:25','2015-08-11 13:10:49','2015-08-11',0,NULL,NULL,189,1,2,0,'2015-08-11 07:20:25'),(190,1,3,'把　web　端绑定到　cms.yuehouse.co 这个域名 ，不再使用　yuehouse.happysoft.cc ，但是该域名要继续保留','<p>yuehouse.happysoft.cc -> cms.yuehouse.co</p>\r\n\r\n<p>前端app 统一使用　api.yuehouse.co</p>\r\n\r\n<p> </p>\r\n',NULL,NULL,3,13,2,NULL,11,1,'2015-08-11 07:23:38','2015-08-11 09:47:56','2015-08-11',0,NULL,NULL,190,1,2,0,NULL),(191,1,4,'搜索，首页','',NULL,NULL,1,24,2,NULL,10,0,'2015-08-11 10:26:37','2015-08-11 10:26:37','2015-08-11',0,NULL,NULL,191,1,2,0,NULL),(192,1,4,'功能-品牌团、品牌logo 做大图小图的适配','<p>希望解决：后台-后台上传 两种图 或者 程序压缩图片</p>\r\n',NULL,NULL,3,16,3,NULL,28,3,'2015-08-11 10:51:42','2015-08-13 09:49:53','2015-08-11',0,NULL,NULL,192,1,2,0,NULL),(193,1,4,'功能-首页 app下载二维码 不可用','<p>扫描二维码可从app store 下载</p>\r\n',NULL,NULL,1,24,2,NULL,28,0,'2015-08-11 10:57:43','2015-08-11 10:57:43','2015-08-11',0,NULL,NULL,193,1,2,0,NULL),(194,1,4,'功能-搜索功能 ui界面','<p>完成搜索的界面</p>\r\n',NULL,NULL,1,24,2,NULL,28,0,'2015-08-11 10:58:35','2015-08-11 10:58:35','2015-08-11',0,NULL,NULL,194,1,2,0,NULL),(195,1,4,'功能-搜索功能','<p>期望结果：关键字、类型、名称 的检索  出对应的商品列表</p>\r\n',NULL,NULL,1,24,2,NULL,28,0,'2015-08-11 10:59:36','2015-08-11 10:59:36','2015-08-11',0,NULL,NULL,195,1,2,0,NULL),(196,1,4,'功能-登录页面及功能','',NULL,NULL,1,NULL,2,NULL,28,1,'2015-08-11 11:15:45','2015-08-11 11:16:23','2015-08-11',0,NULL,NULL,196,1,2,0,NULL),(197,2,3,'修改登录／注册页面UI','',NULL,NULL,1,19,2,NULL,10,0,'2015-08-11 14:08:35','2015-08-11 14:08:35','2015-08-11',0,NULL,NULL,197,1,2,0,NULL),(198,1,3,'预约成功页面替换','',NULL,NULL,3,3,3,NULL,10,2,'2015-08-11 15:59:47','2015-08-12 15:49:56','2015-08-11',0,NULL,NULL,198,1,2,0,NULL),(199,1,7,'Please contact your sales representative or email sales@sugarcrm.com.','<p>Admin</p>\r\n',NULL,NULL,3,NULL,2,NULL,30,2,'2015-08-11 17:27:44','2015-08-12 14:59:54','2015-08-11',0,NULL,NULL,199,1,2,0,NULL),(200,1,7,'twitter 删了','<p>logo => crmproject => create <font color=\"#e61718\" face=\"Arial, Verdana, Helvetica, sans-serif\"><span style=\"background-color: rgb(255, 255, 255);\">下面=> edit => add dashlet => twitter 不要</span></font></p>\r\n',NULL,NULL,1,NULL,2,NULL,30,0,'2015-08-11 17:52:06','2015-08-11 17:52:06','2015-08-11',0,NULL,NULL,200,1,2,0,NULL),(201,1,3,'找灵感-评论框被遮住','',NULL,NULL,2,22,2,NULL,28,2,'2015-08-11 17:53:19','2015-08-13 09:53:32','2015-08-11',0,NULL,NULL,201,1,2,0,NULL),(202,1,7,'downloadPDF','<p>reports=>all opportunities=>download pdf=> pdf</p>\r\n',NULL,NULL,3,NULL,2,NULL,30,2,'2015-08-11 18:26:47','2015-08-12 15:56:07','2015-08-11',0,NULL,NULL,202,1,2,0,NULL),(203,1,7,'新用户首次登陆的引导界面，具有含有Sugar的网址链接','<p>新用户首次登陆的引导界面，具有含有Sugar的网址链接</p>\r\n',NULL,NULL,3,27,2,NULL,27,0,'2015-08-12 09:00:23','2015-08-12 09:00:23','2015-08-12',0,NULL,NULL,203,1,2,0,NULL),(206,1,8,'让bug 正文页面 可以粘贴图片','',NULL,NULL,3,NULL,2,NULL,11,0,'2015-08-12 13:58:59','2015-08-12 13:58:59','2015-08-12',0,NULL,NULL,206,1,2,0,NULL),(207,1,8,'逾期未完成的bug, 显示为红色字体','<p>或者， 超过一周未解决的bug, 也用红色字体显示</p>\r\n',NULL,NULL,1,31,2,NULL,11,0,'2015-08-12 14:01:08','2015-08-12 14:01:08','2015-08-12',0,NULL,NULL,207,1,2,0,NULL),(208,1,8,'bug列表中，  上一页，下一页要显示在列表的右上角。','',NULL,NULL,1,31,2,NULL,11,0,'2015-08-12 14:01:34','2015-08-12 14:01:34','2015-08-12',0,NULL,NULL,208,1,2,0,NULL),(209,1,8,'把“活动” 改成 “工作简报”','',NULL,NULL,1,31,2,NULL,11,1,'2015-08-12 14:47:09','2015-08-13 09:42:41','2015-08-12',0,NULL,NULL,209,1,2,0,NULL),(210,1,8,'我的工作台中， 要显示出 所有的BUG， 而不仅仅是前10个。','',NULL,NULL,1,31,2,NULL,11,0,'2015-08-12 14:59:18','2015-08-12 14:59:18','2015-08-12',0,NULL,NULL,210,1,2,0,NULL),(211,2,3,'App和yuehouse网站提交预约后，需给用户短信提醒','',NULL,NULL,3,13,3,NULL,10,2,'2015-08-12 18:20:30','2015-08-13 10:59:30','2015-08-12',0,NULL,NULL,211,1,2,0,NULL),(212,1,3,'找灵感－在未登录情况下，点击评论，未跳转到登录页面','',NULL,NULL,1,22,2,NULL,10,0,'2015-08-13 09:49:32','2015-08-13 09:49:32','2015-08-13',0,NULL,NULL,212,1,2,0,NULL),(213,1,3,'（测试版）管理－我的装修页面UI调整，日期颜色以及“我要预约”色块太小','',NULL,NULL,1,22,2,NULL,10,1,'2015-08-13 09:55:36','2015-08-13 09:56:35','2015-08-13',0,NULL,NULL,213,1,2,0,NULL),(214,1,3,'（测试版）在未登录情况下，点击我的关注－弹出登录框－点击X号，返回我的页面后直接跳转到首页','',NULL,NULL,3,3,2,NULL,10,2,'2015-08-13 10:00:48','2015-08-13 14:40:46','2015-08-13',0,NULL,NULL,214,1,2,0,NULL),(215,1,3,'（测试版）找灵感评论页面，如果是刚提交评论会显示0秒前，应改成刚刚','',NULL,NULL,1,22,1,NULL,10,0,'2015-08-13 10:04:52','2015-08-13 10:04:52','2015-08-13',0,NULL,NULL,215,1,2,0,NULL),(216,1,3,'（测试版）商城－悦划算页面不显示','',NULL,NULL,1,17,3,NULL,10,0,'2015-08-13 10:08:24','2015-08-13 10:08:24','2015-08-13',0,NULL,NULL,216,1,2,0,NULL),(217,1,3,'（测试版）商城－悦装优品页面不显示','',NULL,NULL,1,17,3,NULL,10,0,'2015-08-13 10:09:16','2015-08-13 10:09:16','2015-08-13',0,NULL,NULL,217,1,2,0,NULL),(218,1,3,'（正式版&测试版）商城header栏，点击下拉选择某个分类时，header栏也要显示在当前选择的分类','',NULL,NULL,1,17,2,NULL,10,0,'2015-08-13 10:13:35','2015-08-13 10:13:35','2015-08-13',0,NULL,NULL,218,1,2,0,NULL),(219,1,3,'（测试版）发现－精选列表页面，有些圈不显示，只有文字','',NULL,NULL,1,22,2,NULL,10,0,'2015-08-13 10:16:02','2015-08-13 10:16:02','2015-08-13',0,NULL,NULL,219,1,2,0,NULL),(220,1,3,'android 适配：首页 线没有对齐。','',NULL,NULL,1,3,2,NULL,28,0,'2015-08-13 10:47:54','2015-08-13 10:47:54','2015-08-13',0,NULL,NULL,220,1,2,0,NULL),(221,1,3,'android 适配： 套餐包 ， 滑动时候不应该覆盖header','',NULL,NULL,1,3,2,NULL,28,0,'2015-08-13 10:49:23','2015-08-13 10:49:23','2015-08-13',0,NULL,NULL,221,1,2,0,NULL),(222,1,3,'android 适配：返回按钮 不好使','',NULL,NULL,1,3,2,NULL,28,0,'2015-08-13 10:50:09','2015-08-13 10:50:09','2015-08-13',0,NULL,NULL,222,1,2,0,NULL),(223,1,3,'android 适配：找灵感适配，如： 页面半截，评论输入问题 遮罩 ','',NULL,NULL,1,22,2,NULL,28,1,'2015-08-13 10:52:30','2015-08-13 10:54:24','2015-08-13',0,NULL,NULL,223,1,2,0,NULL),(224,1,3,'android 适配：悦案例 ， 如：进入页面会向上滑动下','',NULL,NULL,1,3,2,NULL,28,0,'2015-08-13 10:53:40','2015-08-13 10:53:40','2015-08-13',0,NULL,NULL,224,1,2,0,NULL),(225,1,3,'android 适配 ：悦工人  进入列表页面会上滑动下','',NULL,NULL,1,3,2,NULL,28,0,'2015-08-13 10:55:35','2015-08-13 10:55:35','2015-08-13',0,NULL,NULL,225,1,2,0,NULL),(226,1,3,'android 适配：看现场 整个适配 UI调整','',NULL,NULL,1,3,2,NULL,28,0,'2015-08-13 10:56:34','2015-08-13 10:56:34','2015-08-13',0,NULL,NULL,226,1,2,0,NULL),(227,1,3,'android 适配：悦金融 以及 申请贷款页面 ','',NULL,NULL,1,3,2,NULL,28,0,'2015-08-13 10:58:59','2015-08-13 10:58:59','2015-08-13',0,NULL,NULL,227,1,2,0,NULL),(228,1,3,'android 适配： 预约单页面','',NULL,NULL,1,3,2,NULL,28,0,'2015-08-13 10:59:34','2015-08-13 10:59:34','2015-08-13',0,NULL,NULL,228,1,2,0,NULL),(229,1,3,'android 适配：发现模块','',NULL,NULL,1,22,2,NULL,28,0,'2015-08-13 11:01:09','2015-08-13 11:01:09','2015-08-13',0,NULL,NULL,229,1,2,0,NULL),(230,1,3,'android 适配：管理','',NULL,NULL,1,22,2,NULL,28,0,'2015-08-13 11:02:20','2015-08-13 11:02:20','2015-08-13',0,NULL,NULL,230,1,2,0,NULL),(231,1,3,'android 适配：我的 模块','',NULL,NULL,1,3,2,NULL,28,1,'2015-08-13 11:03:38','2015-08-13 11:04:20','2015-08-13',0,NULL,NULL,231,1,2,0,NULL),(232,1,3,'bug：我的页面－》点击 登陆 －》返回》页面全乱了','',NULL,NULL,1,3,2,NULL,28,0,'2015-08-13 11:05:36','2015-08-13 11:05:36','2015-08-13',0,NULL,NULL,232,1,2,0,NULL),(233,1,3,'android 适配：商城 － 品牌团','',NULL,NULL,1,16,2,NULL,28,0,'2015-08-13 11:06:44','2015-08-13 11:06:44','2015-08-13',0,NULL,NULL,233,1,2,0,NULL),(234,1,3,'android 适配：商城 （除品牌团 其他所有页面）','',NULL,NULL,1,17,2,NULL,28,0,'2015-08-13 11:07:24','2015-08-13 11:07:24','2015-08-13',0,NULL,NULL,234,1,2,0,NULL),(235,1,4,'促销的商品倒计时 ：显示倒计时需要显示单位 ，页面风格统一就可以了','',NULL,NULL,1,24,2,NULL,28,0,'2015-08-13 11:13:05','2015-08-13 11:13:05','2015-08-13',0,NULL,NULL,235,1,2,0,NULL),(236,2,4,'商品分类 点击不可用 分类点击应该显示商品分类的二级页面 ， 分类页面需要调ui','',NULL,NULL,1,24,2,NULL,28,0,'2015-08-13 11:16:38','2015-08-13 11:16:38','2015-08-13',0,NULL,NULL,236,1,2,0,NULL),(237,2,4,'很多点击 都不正确 不应刷新页面 ，有的置为不可点击就好了','',NULL,NULL,1,24,2,NULL,28,0,'2015-08-13 11:19:22','2015-08-13 11:19:22','2015-08-13',0,NULL,NULL,237,1,2,0,NULL),(238,2,4,'左侧悬浮菜单框 显示位置不准确 不稳定 ','',NULL,NULL,1,14,2,NULL,28,1,'2015-08-13 11:22:06','2015-08-13 11:24:41','2015-08-13',0,NULL,NULL,238,1,2,0,NULL),(239,1,4,'家具馆－每个分类版块 后跟了 三级分类 ，点击三级分类，页面没有刷新数据','',NULL,NULL,1,14,2,NULL,28,1,'2015-08-13 11:23:40','2015-08-13 11:25:11','2015-08-13',0,NULL,NULL,239,1,2,0,NULL),(240,1,4,'装修贷－轮播图 左右箭头需要调整UI','',NULL,NULL,3,25,2,NULL,28,1,'2015-08-13 11:26:44','2015-08-13 13:55:30','2015-08-13',0,NULL,NULL,240,1,2,0,NULL),(241,1,4,'品牌团－页面调整UI','',NULL,NULL,1,26,2,NULL,28,0,'2015-08-13 11:27:46','2015-08-13 11:27:46','2015-08-13',0,NULL,NULL,241,1,2,0,NULL),(242,4,4,'品牌专场－页面调整UI','',NULL,NULL,7,26,2,NULL,28,0,'2015-08-13 11:28:34','2015-08-13 11:28:34','2015-08-13',0,NULL,NULL,242,1,2,0,'2015-08-13 11:28:34'),(243,4,4,'悦家优品－调整UI','',NULL,NULL,7,26,2,NULL,28,0,'2015-08-13 11:29:08','2015-08-13 11:29:08','2015-08-13',0,NULL,NULL,243,1,2,0,'2015-08-13 11:29:08'),(244,1,3,'首页轮播图自动切换需改成顺序切换','',NULL,NULL,1,3,2,NULL,10,0,'2015-08-13 11:33:39','2015-08-13 11:33:39','2015-08-13',0,NULL,NULL,244,1,2,0,NULL),(245,1,3,'（测试环境）品牌团倒计时时间不是减少二十增加','',NULL,NULL,3,16,3,NULL,10,1,'2015-08-13 11:39:27','2015-08-13 14:51:09','2015-08-13',0,NULL,NULL,245,1,2,0,NULL),(246,1,3,'贷款申请页面也需增加短信提醒功能','',NULL,NULL,1,3,2,NULL,10,0,'2015-08-13 12:10:22','2015-08-13 12:10:22','2015-08-13',0,NULL,NULL,246,1,2,0,NULL),(247,1,3,'贷款申请页面需记录用户填写的信息，如预算，面积等，参加预约单管理页面','',NULL,NULL,1,3,2,NULL,10,0,'2015-08-13 13:23:20','2015-08-13 13:23:20','2015-08-13',0,NULL,NULL,247,1,2,0,NULL);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_details`
--

DROP TABLE IF EXISTS `journal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(30) NOT NULL DEFAULT '',
  `prop_key` varchar(30) NOT NULL DEFAULT '',
  `old_value` text,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `journal_details_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_details`
--

LOCK TABLES `journal_details` WRITE;
/*!40000 ALTER TABLE `journal_details` DISABLE KEYS */;
INSERT INTO `journal_details` VALUES (1,1,'attr','assigned_to_id',NULL,'3'),(2,2,'attr','status_id','1','3'),(3,3,'attr','subject','搜索股票不能字母选股，如：中国石化  打出ZGSH 出不来。','新版中，乐股问题'),(4,3,'attr','start_date','2015-03-13','2015-03-17'),(5,4,'attr','subject','我的交易信息中缺少一个模拟持仓细节','更新新版中的时候，提示更新和不更新，选择更新新版，更新过之后不能安装。'),(6,4,'attr','assigned_to_id','2','3'),(7,5,'attr','tracker_id','1','3'),(8,5,'attr','subject','不能收到　短信验证码 　','比赛栏中，比赛的冠军奖励怎么建立，奖励地方只是显示null'),(9,5,'attr','start_date','2015-03-13','2015-03-17'),(10,6,'attr','assigned_to_id',NULL,'5'),(11,9,'attr','subject','商城检索－选择花洒后，返回键不好点击','商城检索，选择家居建材，调整到某类目详情页后，返回键不好点击'),(14,12,'attr','assigned_to_id',NULL,'3'),(15,13,'attr','subject','＝','适配—5s上套餐页面两边有白边'),(16,13,'attr','due_date',NULL,'2015-07-29'),(17,13,'attr','assigned_to_id',NULL,'2'),(18,14,'attr','description','看看 还有哪些图片是可以删掉的。 ','<p>看看 还有哪些图片是可以删掉的。</p>\r\n'),(19,14,'attr','assigned_to_id',NULL,'12'),(20,16,'attachment','3',NULL,'屏幕快照 2015-07-29 16.40.56.png'),(21,17,'attr','subject','申请贷款和预约面积选项修改','申请贷款和预约面积选项修改 选项改为：小于70 70-90 90-120 大于120'),(22,17,'attr','due_date',NULL,'2015-07-29'),(23,18,'attr','assigned_to_id','12','13'),(24,20,'attr','description','检索顶部需加一条线','<p>检索顶部需加一条线</p>\r\n'),(25,24,'attr','status_id','1','3'),(26,25,'attr','status_id','1','3'),(27,26,'attr','status_id','1','3'),(28,27,'attr','status_id','1','3'),(29,28,'attr','status_id','1','3'),(30,29,'attr','status_id','1','3'),(31,30,'attr','status_id','1','3'),(32,31,'attr','status_id','1','3'),(33,32,'attr','status_id','1','3'),(34,33,'attr','status_id','1','3'),(35,34,'attr','status_id','1','3'),(36,35,'attr','status_id','1','3'),(37,36,'attr','assigned_to_id',NULL,'22'),(38,37,'attr','status_id','1','3'),(39,38,'attr','status_id','1','8'),(40,38,'attr','assigned_to_id',NULL,'22'),(41,39,'attr','status_id','1','8'),(42,40,'attr','status_id','3','8'),(43,41,'attr','subject','品牌团UI调整－header栏字体以及类目之间的间距','品牌团UI调整－header栏字体以及类目之间的间距（字体不一致，而且一高一低）'),(44,41,'attr','status_id','3','1'),(45,42,'attr','status_id','3','8'),(46,43,'attr','tracker_id','2','4'),(47,43,'attr','status_id','1','7'),(48,44,'attr','status_id','3','8'),(49,45,'attr','status_id','3','8'),(50,46,'attr','status_id','1','8'),(51,47,'attr','status_id','1','8'),(52,48,'attr','status_id','3','8'),(53,49,'attr','status_id','3','8'),(54,50,'attr','status_id','3','8'),(55,51,'attr','status_id','1','8'),(56,52,'attr','status_id','1','8'),(57,53,'attr','assigned_to_id','13','3'),(58,54,'attr','status_id','3','8'),(59,55,'attr','status_id','3','8'),(60,56,'attr','status_id','3','8'),(61,57,'attr','tracker_id','2','1'),(62,57,'attr','status_id','1','8'),(63,58,'attr','status_id','1','3'),(64,59,'attr','status_id','1','8'),(65,60,'attr','description','','<p>已修复，待确认</p>\r\n'),(66,61,'attr','priority_id','2','1'),(67,62,'attr','status_id','1','3'),(68,63,'attr','status_id','3','8'),(69,64,'attr','project_id','5','3'),(70,65,'attr','project_id','5','3'),(71,66,'attr','project_id','5','3'),(72,68,'attr','status_id','1','3'),(73,69,'attr','status_id','1','3'),(74,70,'attr','subject','在apply、','在app打开的第一个请求中加入version number 以便后期服务器识别用户 版本拓展用'),(75,70,'attr','due_date',NULL,'2015-08-07'),(76,70,'attr','assigned_to_id',NULL,'3'),(77,70,'attr','priority_id','2','1'),(78,70,'attr','estimated_hours',NULL,'1.0'),(79,71,'attr','status_id','1','8'),(80,72,'attr','status_id','3','8'),(81,73,'attr','status_id','1','3'),(82,74,'attr','subject','申请贷款 以及 填写预约单 中的区域 无法联动填写','申请贷款 以及 填写预约单 中的区域 无法联动更新'),(83,75,'attr','status_id','1','3'),(84,77,'attr','status_id','1','3'),(85,78,'attr','status_id','1','3'),(86,79,'attr','status_id','1','3'),(87,80,'attr','status_id','1','3'),(88,81,'attr','status_id','1','3'),(89,82,'attr','status_id','3','8'),(90,83,'attr','status_id','3','8'),(91,84,'attr','status_id','3','8'),(92,85,'attr','status_id','3','8'),(93,86,'attr','status_id','1','8'),(94,87,'attr','status_id','3','8'),(95,88,'attr','subject','悦金融页面需增加动效','悦金融和登录／注册页面需增侧滑加动效'),(96,89,'attr','status_id','1','8'),(97,90,'attr','subject','灵感页面头像不显示','灵感页面头像不显示，且更换头像后不能及时刷新'),(98,91,'attr','priority_id','2','1'),(99,92,'attr','description','例如，昨天Larry演示的，  loader旋转一圈， 图片就加载好了。\r\n\r\n如果不行的话， 换个好看点的 默认图片','<p>例如，昨天Larry演示的， loader旋转一圈， 图片就加载好了。 如果不行的话， 换个好看点的 默认图片</p>\r\n'),(100,92,'attr','status_id','1','3'),(101,94,'attr','status_id','1','3'),(102,95,'attr','status_id','3','8'),(103,95,'attr','done_ratio','0','100'),(104,96,'attr','status_id','1','3'),(105,97,'attr','priority_id','2','3'),(106,98,'attr','priority_id','3','2'),(107,99,'attr','priority_id','2','3'),(108,100,'attr','assigned_to_id',NULL,'2'),(109,100,'attr','priority_id','2','3'),(110,101,'attr','assigned_to_id','3','13'),(111,101,'attr','priority_id','1','3'),(112,102,'attr','status_id','1','8'),(113,103,'attr','status_id','3','8'),(114,104,'attr','status_id','1','8'),(115,105,'attr','priority_id','1','2'),(116,106,'attr','status_id','3','8'),(117,107,'attr','status_id','1','3'),(118,109,'attr','status_id','1','3'),(119,110,'attr','status_id','1','3'),(120,111,'attr','status_id','1','3'),(121,112,'attr','status_id','1','8'),(122,113,'attr','status_id','1','8'),(123,114,'attr','status_id','3','8'),(124,115,'attr','status_id','3','8'),(125,116,'attr','status_id','1','8'),(126,117,'attr','status_id','3','8'),(127,118,'attr','assigned_to_id',NULL,'23'),(128,119,'attr','subject','首页轮播图需自动切换，间隔为2s','首页轮播图需自动切换,且应该顺序切换，间隔为5s'),(129,120,'attr','description','分配给浩浩','<p>分配给浩浩</p>\r\n'),(130,120,'attr','assigned_to_id','1','24'),(131,121,'attr','assigned_to_id',NULL,'11'),(132,122,'attr','status_id','1','3'),(133,123,'attr','subject','注册登录后没有上传昵称，在灵感评论中则默认显示匿名','第一次注册登录后，仍然提示未登录'),(134,123,'attr','assigned_to_id',NULL,'13'),(135,123,'attr','priority_id','2','3'),(136,124,'attr','status_id','1','3'),(137,125,'attr','assigned_to_id','3','13'),(138,126,'attr','status_id','1','3'),(139,127,'attr','priority_id','2','3'),(140,128,'attr','assigned_to_id','25','26'),(141,129,'attr','status_id','1','3'),(142,130,'attr','status_id','1','3'),(143,131,'attr','status_id','1','3'),(144,132,'attr','status_id','1','3'),(145,133,'attr','status_id','1','3'),(146,135,'attr','status_id','1','3'),(147,136,'attr','status_id','1','3'),(148,137,'attachment','5',NULL,'屏幕快照 2015-08-04 8.52.15.png'),(149,137,'attr','status_id','1','3'),(150,139,'attr','status_id','1','3'),(151,140,'attr','status_id','1','3'),(152,140,'attr','assigned_to_id',NULL,'27'),(153,141,'attr','subject','几个对应栏目对应的浏览器标签无法更改，依旧显示SugarCRM','几个对应栏目对应的浏览器的 title 无法更改，依旧显示SugarCRM'),(154,142,'attr','status_id','1','3'),(155,142,'attr','assigned_to_id',NULL,'27'),(156,143,'attr','subject','推送至远程服务器以后，刷新界面无更新','部署至远程服务器以后，刷新界面后，改动没有生效'),(157,143,'attr','assigned_to_id',NULL,'27'),(158,144,'attr','status_id','1','3'),(159,145,'attr','status_id','1','3'),(160,146,'attr','priority_id','2','3'),(161,147,'attr','priority_id','2','3'),(162,148,'attr','priority_id','2','3'),(163,149,'attr','priority_id','2','3'),(164,150,'attr','status_id','1','3'),(165,151,'attr','status_id','1','3'),(166,152,'attr','status_id','1','3'),(167,153,'attr','priority_id','3','2'),(168,154,'attr','status_id','1','3'),(169,155,'attr','assigned_to_id',NULL,'13'),(170,156,'attr','assigned_to_id','25','26'),(171,157,'attr','status_id','1','3'),(172,158,'attr','status_id','1','3'),(173,159,'attr','status_id','1','3'),(174,160,'attr','assigned_to_id','13','11'),(175,161,'attr','status_id','1','3'),(176,162,'attr','status_id','1','3'),(177,163,'attr','assigned_to_id',NULL,'22'),(178,164,'attr','status_id','1','3'),(179,165,'attr','assigned_to_id','18','3'),(180,166,'attr','subject','CRM主界面下发有Welcome to the Sugar 7...字样','CRM主界面下有Welcome to the Sugar 7...字样'),(181,167,'attr','status_id','1','3'),(182,168,'attr','status_id','3','8'),(183,169,'attr','assigned_to_id',NULL,'26'),(184,170,'attr','subject','后台下拉框保存默认值修改（所有人都有）','后台下拉框保存默认值修改－找灵感，发现和管理'),(185,170,'attr','assigned_to_id',NULL,'22'),(186,171,'attr','status_id','1','3'),(187,172,'attr','status_id','1','3'),(188,173,'attr','status_id','1','3'),(189,174,'attr','subject','首次进入CRM，引导界面含有Sugar等字样','首次进入CRM，引导界面含有HappyCRM 7字样,将数字7去除'),(190,174,'attr','assigned_to_id',NULL,'11'),(191,175,'attr','status_id','1','3'),(192,176,'attr','status_id','3','8'),(193,177,'attr','status_id','3','8'),(194,178,'attr','status_id','3','8'),(195,179,'attr','subject','适配—品牌团详情页在5S上有些变形','适配—品牌团详情页在5S上有些变形－人民币符号有一小半不显示'),(196,179,'attr','status_id','3','1'),(197,180,'attr','status_id','1','3'),(198,181,'attr','status_id','1','3'),(199,182,'attr','status_id','1','3'),(200,183,'attr','status_id','1','3'),(201,185,'attr','status_id','1','3'),(202,186,'attr','status_id','1','3'),(203,187,'attr','status_id','1','3'),(204,188,'attr','status_id','1','3'),(205,189,'attr','description','<p>价格策略页面上，举例来说，希望能够在“百度手机助手”上加入点选框，在最下方加入全选点选框，全选点选框下方/右方加入删除按钮。达成“任选删除”和“全部删除”的功能。</p><p><img width=\"24\" height=\"23\" data-cke-saved-src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=12\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=12\"><img width=\"1025\" height=\"135\" id=\"图片_x0020_4\" data-cke-saved-src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=6\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=6\">​<br></p>','<p>价格策略页面上，举例来说，希望能够在“百度手机助手”上加入点选框，在最下方加入全选点选框，全选点选框下方/右方加入删除按钮。达成“任选删除”和“全部删除”的功能。</p>\r\n\r\n<p><img height=\"23\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=12\" width=\"24\" /><img height=\"135\" id=\"图片_x0020_4\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=6\" width=\"1025\" />​</p>\r\n'),(206,189,'attr','status_id','1','3'),(207,190,'attr','status_id','1','3'),(208,191,'attr','assigned_to_id',NULL,'28'),(209,192,'attr','status_id','1','2'),(210,193,'attr','status_id','1','2'),(211,194,'attr','status_id','1','4'),(212,195,'attr','status_id','1','3'),(213,196,'attr','status_id','2','3'),(214,197,'attr','status_id','1','3'),(215,198,'attr','assigned_to_id',NULL,'11'),(216,199,'attr','status_id','1','3'),(217,200,'attr','status_id','1','3'),(218,203,'attr','status_id','1','3'),(219,204,'attr','status_id','3','2'),(220,205,'attr','tracker_id','2','1'),(221,205,'attr','project_id','5','4'),(222,206,'attr','subject','ui-登录页面','功能-登录页面及功能'),(223,207,'attr','subject','把  www.yue.house 部署到　yuehouse.co ，　','把  www.yue.house 部署到　yuehouse.co ，'),(224,208,'attr','status_id','1','3'),(225,209,'attr','status_id','3','8'),(226,211,'attr','status_id','3','8'),(227,212,'attr','status_id','3','8'),(228,213,'attr','status_id','1','3'),(229,214,'attr','subject','首页轮播图需自动切换,且应该顺序切换，间隔为5s','首页轮播图需自动切换,且应该顺序切换，间隔为5s(顺序切换还未解决）'),(230,215,'attr','assigned_to_id','13','11'),(231,217,'attr','status_id','1','3'),(232,218,'attr','tracker_id','2','1'),(233,218,'attr','subject','预约成功页面话术修改','预约成功页面替换'),(234,218,'attr','assigned_to_id','19','3'),(235,219,'attr','tracker_id','2','1'),(236,219,'attr','status_id','3','8'),(237,220,'attr','description','1. log4r记录日志\r\n\r\n2. crontab, rsync同步到日志服务器，进行集中汇总和分析','<p>1. log4r记录日志 2. crontab, rsync同步到日志服务器，进行集中汇总和分析</p>\r\n'),(238,220,'attr','priority_id','2','1'),(239,221,'attr','assigned_to_id','23','11'),(240,221,'attr','priority_id','3','1'),(241,222,'attr','status_id','1','3'),(242,222,'attr','assigned_to_id','11','27'),(243,223,'attr','status_id','1','3'),(244,223,'attr','assigned_to_id','11','27'),(245,225,'attr','status_id','1','3'),(246,225,'attr','assigned_to_id','11','27'),(247,229,'attr','assigned_to_id',NULL,'3'),(248,229,'attr','priority_id','2','3'),(249,231,'attr','status_id','3','2'),(250,232,'attr','assigned_to_id','11','31'),(251,235,'attr','status_id','3','2'),(252,236,'attr','status_id','3','2'),(253,237,'attr','priority_id','2','1'),(254,239,'attr','status_id','1','3'),(255,240,'attr','assigned_to_id','13','11'),(256,243,'attr','subject','首次进入CRM，引导界面含有HappyCRM 7字样,将数字7去除','中文版首次进入CRM，引导界面含有HappyCRM 7字样,将数字7去除'),(257,245,'attr','status_id','2','3'),(258,246,'attr','status_id','1','3'),(259,247,'attr','status_id','1','3'),(260,248,'attr','status_id','1','3'),(261,250,'attr','status_id','3','2'),(262,251,'attr','priority_id','2','3'),(263,252,'attr','status_id','1','3'),(264,253,'attr','status_id','1','3'),(265,254,'attr','priority_id','2','1'),(266,255,'attr','priority_id','2','1'),(267,258,'attr','subject','将APP中的所有相对路径改为绝对路径','将APP中的灵感，发现，管理相关的图片相对路径改为绝对路径'),(268,260,'attr','assigned_to_id',NULL,'31'),(269,261,'attr','status_id','1','3'),(270,262,'attr','status_id','3','2'),(271,263,'attr','assigned_to_id','3','22'),(272,264,'attr','status_id','3','8'),(273,265,'attr','assigned_to_id',NULL,'22'),(274,266,'attr','status_id','1','3'),(275,267,'attr','assigned_to_id',NULL,'3'),(276,268,'attr','subject','悬浮菜单框 显示位置不准确 不稳定 ','左侧悬浮菜单框 显示位置不准确 不稳定 '),(277,269,'attr','subject','每个分类版块 后跟了 三级分类 ，点击三级分类，页面没有刷新数据','家具馆－每个分类版块 后跟了 三级分类 ，点击三级分类，页面没有刷新数据'),(278,270,'attr','status_id','3','8'),(279,271,'attr','status_id','3','8'),(280,272,'attr','status_id','3','8'),(281,273,'attr','status_id','3','8'),(282,274,'attr','status_id','1','3'),(283,275,'attr','status_id','1','3'),(284,276,'attr','status_id','1','3');
/*!40000 ALTER TABLE `journal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journalized_id` int(11) NOT NULL DEFAULT '0',
  `journalized_type` varchar(30) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `notes` text,
  `created_on` datetime NOT NULL,
  `private_notes` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  KEY `index_journals_on_user_id` (`user_id`),
  KEY `index_journals_on_journalized_id` (`journalized_id`),
  KEY `index_journals_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,1,'Issue',1,'','2015-03-11 18:10:58',0),(2,5,'Issue',3,'已经搞定，　部署到了测试服务器（　点击 http://ＸＸ　链接 即可查看） ','2015-03-13 09:52:59',0),(3,6,'Issue',7,'1，行情更新慢。\r\n2，涨幅榜中股价涨跌和涨跌幅换下位置和顺序。\r\n3，涨幅榜中涨幅前加个+号，跌幅榜中跌幅前有。\r\n4，模拟持仓中现在又不显示持仓的股票名称了。\r\n5，比赛中的比赛，报名后自己的持仓个股的盈利不能在比赛中显示，比赛的收益反倒是显示的是0\r\n','2015-03-17 13:49:47',0),(4,4,'Issue',7,'','2015-03-17 14:26:31',0),(5,5,'Issue',7,'','2015-03-17 14:32:01',0),(6,7,'Issue',3,'','2015-03-18 10:16:08',0),(7,7,'Issue',5,'已解决 4.将个股添加自选后点击左上角刷新按钮后，列表中并没有显示新添加的自选，只有在退出重新打开终端才会显示上次退出前添加的自选 \r\n现在添加自选股以后，就可以看到信添加的自选股','2015-03-18 11:50:45',0),(8,12,'Issue',5,'问题已解决','2015-03-23 10:21:10',0),(9,30,'Issue',1,'','2015-07-29 11:58:41',0),(10,23,'Issue',11,'参考答案：\r\nhttp://stackoverflow.com/questions/16282374/titanium-how-to-make-a-default-defaultimage-for-all-elements\r\n\r\n','2015-07-29 12:55:21',0),(12,23,'Issue',1,'','2015-07-29 13:54:04',0),(13,39,'Issue',1,'','2015-07-29 14:31:49',0),(14,38,'Issue',11,'','2015-07-29 16:35:28',0),(15,28,'Issue',12,'<p>已显示正常</p>\r\n','2015-07-29 16:39:16',0),(16,28,'Issue',12,'<p>飞鹏 胡 写到：</p>\r\n\r\n<blockquote>\r\n<p>已解决，现在显示正常了</p>\r\n</blockquote>\r\n\r\n<p> </p>\r\n','2015-07-29 16:41:43',0),(17,44,'Issue',1,'','2015-07-29 16:50:36',0),(18,56,'Issue',11,'','2015-07-29 17:08:01',0),(19,51,'Issue',17,'<p>套餐包放到最上面已修改。</p>\r\n\r\n<p>贷款图片还没有拿到  </p>\r\n','2015-07-29 17:30:07',0),(20,26,'Issue',17,'<p>检索（搜索）功能已删除</p>\r\n','2015-07-29 17:31:24',0),(21,41,'Issue',17,'<p>已修改</p>\r\n','2015-07-29 17:31:55',0),(22,30,'Issue',17,'<p>已修改</p>\r\n','2015-07-29 17:32:18',0),(23,27,'Issue',17,'<p>已修改</p>\r\n','2015-07-29 17:32:39',0),(24,27,'Issue',17,'','2015-07-29 19:42:21',0),(25,41,'Issue',17,'','2015-07-29 19:42:55',0),(26,57,'Issue',3,'','2015-07-29 19:43:03',0),(27,30,'Issue',17,'','2015-07-29 19:43:15',0),(28,48,'Issue',3,'','2015-07-29 19:43:45',0),(29,26,'Issue',17,'','2015-07-29 19:43:46',0),(30,28,'Issue',12,'','2015-07-29 19:44:07',0),(31,44,'Issue',3,'','2015-07-29 19:44:12',0),(32,51,'Issue',17,'','2015-07-29 19:44:15',0),(33,33,'Issue',3,'','2015-07-29 19:44:32',0),(34,55,'Issue',2,'','2015-07-29 19:53:04',0),(35,29,'Issue',16,'','2015-07-29 19:54:14',0),(36,42,'Issue',1,'','2015-07-29 22:14:47',0),(37,49,'Issue',3,'','2015-07-29 23:50:35',0),(38,45,'Issue',1,'','2015-07-30 00:01:50',0),(39,32,'Issue',1,'','2015-07-30 00:03:17',0),(40,51,'Issue',1,'','2015-07-30 00:04:47',0),(41,29,'Issue',1,'','2015-07-30 00:08:56',0),(42,28,'Issue',1,'','2015-07-30 00:15:45',0),(43,50,'Issue',1,'','2015-07-30 00:16:48',0),(44,41,'Issue',1,'','2015-07-30 00:17:15',0),(45,30,'Issue',1,'','2015-07-30 00:18:03',0),(46,42,'Issue',1,'','2015-07-30 00:18:39',0),(47,31,'Issue',1,'','2015-07-30 00:21:23',0),(48,27,'Issue',1,'','2015-07-30 00:21:57',0),(49,26,'Issue',1,'','2015-07-30 00:23:12',0),(50,44,'Issue',1,'','2015-07-30 00:24:36',0),(51,60,'Issue',1,'','2015-07-30 00:25:48',0),(52,59,'Issue',1,'','2015-07-30 00:30:14',0),(53,35,'Issue',1,'','2015-07-30 00:33:37',0),(54,57,'Issue',1,'','2015-07-30 00:35:40',0),(55,49,'Issue',1,'','2015-07-30 00:37:11',0),(56,48,'Issue',1,'','2015-07-30 00:38:51',0),(57,47,'Issue',1,'','2015-07-30 00:43:28',0),(58,67,'Issue',2,'','2015-07-30 10:24:30',0),(59,34,'Issue',1,'','2015-07-30 11:21:45',0),(60,36,'Issue',18,'','2015-07-30 11:47:59',0),(61,65,'Issue',10,'','2015-07-30 11:48:10',0),(62,64,'Issue',22,'','2015-07-30 11:56:53',0),(63,64,'Issue',1,'','2015-07-30 12:05:42',0),(64,65,'Issue',10,'','2015-07-30 12:08:03',0),(65,42,'Issue',10,'','2015-07-30 12:08:36',0),(66,50,'Issue',10,'','2015-07-30 12:09:22',0),(67,38,'Issue',12,'<p>已删除  \'app/asssts/images\' 中部分不需要的图片，并将部分图片进行了压缩！</p>\r\n','2015-07-30 14:06:13',0),(68,56,'Issue',13,'','2015-07-30 14:32:31',0),(69,61,'Issue',13,'','2015-07-30 14:33:21',0),(70,72,'Issue',20,'','2015-07-30 14:38:27',0),(71,68,'Issue',10,'','2015-07-30 14:42:43',0),(72,67,'Issue',1,'','2015-07-30 15:04:11',0),(73,71,'Issue',3,'','2015-07-30 15:44:23',0),(74,77,'Issue',20,'','2015-07-30 16:20:36',0),(75,77,'Issue',3,'','2015-07-30 17:35:42',0),(76,79,'Issue',12,'<p>已解决</p>\r\n','2015-07-30 19:05:06',0),(77,79,'Issue',12,'','2015-07-30 19:16:05',0),(78,52,'Issue',17,'','2015-07-30 19:26:42',0),(79,80,'Issue',17,'','2015-07-30 19:27:23',0),(80,69,'Issue',17,'','2015-07-30 19:27:40',0),(81,62,'Issue',17,'','2015-07-30 19:28:30',0),(82,71,'Issue',10,'','2015-07-30 19:32:23',0),(83,69,'Issue',10,'','2015-07-30 19:35:20',0),(84,52,'Issue',1,'','2015-07-30 19:38:34',0),(85,62,'Issue',1,'','2015-07-30 19:39:23',0),(86,73,'Issue',10,'','2015-07-30 19:43:40',0),(87,55,'Issue',1,'','2015-07-30 19:45:13',0),(88,63,'Issue',1,'','2015-07-30 19:46:46',0),(89,36,'Issue',1,'','2015-07-30 19:55:44',0),(90,61,'Issue',1,'','2015-07-30 19:56:34',0),(91,35,'Issue',20,'','2015-07-30 20:05:25',0),(92,23,'Issue',3,'','2015-07-30 20:15:09',0),(93,83,'Issue',12,'<p>已解决</p>\r\n','2015-07-30 21:32:13',0),(94,83,'Issue',12,'','2015-07-30 21:32:24',0),(95,77,'Issue',20,'','2015-07-30 21:44:07',0),(96,82,'Issue',22,'','2015-07-30 22:37:28',0),(97,81,'Issue',10,'','2015-07-31 11:30:39',0),(98,78,'Issue',10,'','2015-07-31 11:31:07',0),(99,29,'Issue',10,'','2015-07-31 11:32:35',0),(100,86,'Issue',10,'','2015-07-31 11:35:39',0),(101,35,'Issue',1,'','2015-07-31 11:38:32',0),(102,37,'Issue',1,'','2015-07-31 11:43:20',0),(103,83,'Issue',10,'','2015-07-31 11:46:28',0),(104,58,'Issue',1,'','2015-07-31 11:47:26',0),(105,84,'Issue',10,'','2015-07-31 11:47:59',0),(106,82,'Issue',10,'','2015-07-31 11:48:47',0),(107,29,'Issue',16,'','2015-07-31 12:57:52',0),(108,61,'Issue',13,'<p>可以上传，再确认一下吧。</p>\r\n','2015-07-31 13:00:45',0),(109,63,'Issue',2,'','2015-07-31 13:32:03',0),(110,72,'Issue',3,'','2015-07-31 13:39:16',0),(111,86,'Issue',2,'','2015-07-31 14:03:43',0),(112,87,'Issue',10,'','2015-07-31 14:33:05',0),(113,85,'Issue',10,'','2015-07-31 14:34:08',0),(114,79,'Issue',10,'','2015-07-31 14:47:50',0),(115,86,'Issue',10,'','2015-07-31 14:48:08',0),(116,88,'Issue',10,'','2015-07-31 16:24:06',0),(117,61,'Issue',1,'','2015-07-31 16:34:29',0),(118,39,'Issue',10,'','2015-08-03 10:01:36',0),(119,35,'Issue',10,'','2015-08-03 10:04:56',0),(120,21,'Issue',11,'','2015-08-03 10:09:33',0),(121,98,'Issue',11,'','2015-08-03 10:12:47',0),(122,95,'Issue',26,'','2015-08-03 10:36:11',0),(123,108,'Issue',10,'','2015-08-03 10:42:33',0),(124,96,'Issue',26,'','2015-08-03 10:44:11',0),(125,91,'Issue',10,'','2015-08-03 10:48:25',0),(126,103,'Issue',23,'','2015-08-03 11:01:02',0),(127,102,'Issue',10,'','2015-08-03 11:23:51',0),(128,112,'Issue',11,'','2015-08-03 11:49:48',0),(129,94,'Issue',14,'','2015-08-03 15:33:03',0),(130,114,'Issue',24,'','2015-08-03 15:47:25',0),(131,91,'Issue',13,'','2015-08-03 17:02:41',0),(132,108,'Issue',13,'','2015-08-03 17:09:00',0),(133,81,'Issue',13,'','2015-08-03 17:09:24',0),(134,102,'Issue',13,'<p>1. 有发送短信的功能。</p>\r\n\r\n<p> </p>\r\n\r\n<p>2. 有个GUI页面。  </p>\r\n\r\n<p>输入： 收件人， 和 短信内容</p>\r\n\r\n<p> </p>\r\n\r\n<p> </p>\r\n','2015-08-03 17:29:59',0),(135,113,'Issue',26,'','2015-08-03 18:58:52',0),(136,112,'Issue',26,'','2015-08-03 18:59:20',0),(137,125,'Issue',12,'<p>已解决！上图：</p>\r\n','2015-08-04 08:55:26',0),(138,107,'Issue',27,'<p>大师注： 已经搞定，需要提交代码。 </p>\r\n','2015-08-04 09:07:56',0),(139,93,'Issue',24,'','2015-08-04 09:08:21',0),(140,107,'Issue',27,'','2015-08-04 09:11:37',0),(141,109,'Issue',27,'<p>登陆后，  点击  客户 ， 浏览器标题栏 显示：  客户 >> SugarCRM</p>\r\n\r\n<p>点击 联系人， 同上。</p>\r\n','2015-08-04 09:13:50',0),(142,109,'Issue',27,'','2015-08-04 09:20:51',0),(143,110,'Issue',27,'','2015-08-04 09:27:17',0),(144,90,'Issue',22,'','2015-08-04 09:44:16',0),(145,89,'Issue',22,'','2015-08-04 10:04:16',0),(146,120,'Issue',11,'','2015-08-04 10:40:02',0),(147,119,'Issue',11,'','2015-08-04 10:40:09',0),(148,118,'Issue',11,'','2015-08-04 10:40:15',0),(149,117,'Issue',11,'','2015-08-04 10:40:21',0),(150,65,'Issue',22,'','2015-08-04 11:07:44',0),(151,70,'Issue',22,'','2015-08-04 11:08:13',0),(152,43,'Issue',12,'<p>UI 大部分已适配！（导航栏中的 “全部”标签间距 要等张瑜回来之后，由他自己改 代码的结构，不是 样式引起的问题！）  胡飞鹏 提交</p>\r\n','2015-08-04 12:03:34',0),(153,130,'Issue',11,'','2015-08-04 14:40:07',0),(154,129,'Issue',27,'','2015-08-04 14:59:15',0),(155,111,'Issue',13,'','2015-08-04 15:17:41',0),(156,122,'Issue',11,'<p>在 yue.house 中， 需要切换图片。  </p>\r\n\r\n<p>参考我发给大家的 psd 图。 </p>\r\n\r\n<p>需要切图的地方， 让小浩帮忙。 </p>\r\n','2015-08-04 15:47:22',0),(157,102,'Issue',13,'','2015-08-04 16:05:11',0),(158,132,'Issue',14,'','2015-08-04 18:51:20',0),(159,131,'Issue',14,'','2015-08-04 20:28:37',0),(160,141,'Issue',11,'','2015-08-05 09:24:55',0),(161,35,'Issue',13,'','2015-08-05 09:28:57',0),(162,130,'Issue',13,'','2015-08-05 09:29:35',0),(163,143,'Issue',22,'','2015-08-05 09:37:45',0),(164,137,'Issue',3,'','2015-08-05 10:08:26',0),(165,120,'Issue',3,'','2015-08-05 10:24:48',0),(166,144,'Issue',27,'','2015-08-05 10:29:05',0),(167,110,'Issue',27,'','2015-08-05 11:21:01',0),(168,125,'Issue',10,'','2015-08-05 11:49:51',0),(169,92,'Issue',11,'','2015-08-05 14:57:52',0),(170,100,'Issue',10,'','2015-08-05 15:58:11',0),(171,148,'Issue',27,'','2015-08-05 18:59:27',0),(172,146,'Issue',27,'','2015-08-05 19:00:37',0),(173,145,'Issue',27,'','2015-08-05 19:01:04',0),(174,142,'Issue',27,'<p>首次进入CRM，引导界面含有HappyCRM 7字样,将数字7去除</p>\r\n','2015-08-05 19:02:29',0),(175,144,'Issue',27,'','2015-08-05 19:02:53',0),(176,90,'Issue',10,'','2015-08-06 09:23:29',0),(177,89,'Issue',10,'','2015-08-06 09:48:47',0),(178,80,'Issue',10,'','2015-08-06 09:49:32',0),(179,43,'Issue',10,'','2015-08-06 09:51:36',0),(180,122,'Issue',26,'','2015-08-06 13:54:53',0),(181,92,'Issue',26,'','2015-08-06 13:55:58',0),(182,121,'Issue',16,'','2015-08-06 17:18:37',0),(183,43,'Issue',16,'','2015-08-07 09:37:10',0),(184,170,'Issue',24,'<p>价格策略页面上，希望新建按钮生成的条目能够按照生成的时间进行显示，并且显示最近的编辑时间。如图。</p>\r\n\r\n<p align=\"left\"><img height=\"39\" id=\"图片_x0020_17\" src=\"http://mail.ym.163.com/jy3/s?func=mbox:getMessageData&amp;sid=T0eAM768L6u4c2AEfSVC2rIcxdEYjFjD&amp;mid=AE*AUwB9AGHC2cjxcHi0Jap2&amp;Part=7\" width=\"596\" /></p>\r\n','2015-08-07 10:11:17',0),(185,174,'Issue',24,'','2015-08-07 10:16:11',0),(186,172,'Issue',24,'','2015-08-07 10:16:29',0),(187,154,'Issue',16,'','2015-08-07 11:08:06',0),(188,170,'Issue',26,'','2015-08-07 11:45:51',0),(189,169,'Issue',26,'','2015-08-07 15:45:37',0),(190,168,'Issue',3,'','2015-08-09 15:18:28',0),(191,181,'Issue',11,'','2015-08-10 07:51:16',0),(192,143,'Issue',22,'','2015-08-10 10:15:41',0),(193,100,'Issue',22,'','2015-08-10 10:17:27',0),(194,78,'Issue',22,'<p>三级联动的默认值不知道怎么去选择默认值，数据库中只存第三级的内容的一个字段</p>\r\n','2015-08-10 10:18:39',0),(195,166,'Issue',24,'','2015-08-10 11:21:46',0),(196,100,'Issue',22,'','2015-08-10 11:54:23',0),(197,165,'Issue',27,'','2015-08-10 15:02:16',0),(198,164,'Issue',27,'','2015-08-10 17:33:36',0),(199,185,'Issue',22,'','2015-08-10 18:04:54',0),(200,184,'Issue',22,'','2015-08-10 18:05:28',0),(201,187,'Issue',11,'<p>按照这里　一步一步来：https://github.com/ruby-china/ruby-china</p>\r\n','2015-08-11 06:55:35',0),(202,187,'Issue',11,'<p>使用　https://github.com/ruby-china/ruby-china　　这个源代码</p>\r\n\r\n<p>使用　upyun.com  注册，付费．</p>\r\n','2015-08-11 06:56:32',0),(203,190,'Issue',13,'','2015-08-11 09:47:56',0),(204,184,'Issue',22,'','2015-08-11 09:50:32',0),(205,192,'Issue',28,'','2015-08-11 10:56:08',0),(206,196,'Issue',28,'','2015-08-11 11:16:23',0),(207,189,'Issue',26,'yue.house 域名太新,暂时无法备案.  只能使用  yuehouse.co 暂时代替.\r\n\r\n所以: \r\n\r\n通过  yuehouse.co   访问  www.yue.house的内容  . \r\n通过 mall.yuehouse.co  访问  http://mall.yue.house/ 的内容. \r\n\r\n需要做的事: \r\n1. 在青云的 北京区 上, 有对应的服务器\r\n2. 在对应的服务器上, 分别做 www.yue.house,  以及 mall.yue.house的部署\r\n3. 让域名生效.','2015-08-11 13:10:49',0),(208,179,'Issue',13,'','2015-08-11 15:55:42',0),(209,43,'Issue',1,'','2015-08-11 16:05:53',0),(210,192,'Issue',16,'<p>更新后台 已经解决</p>\r\n','2015-08-11 16:09:34',0),(211,29,'Issue',1,'','2015-08-11 16:47:10',0),(212,154,'Issue',10,'','2015-08-11 16:48:23',0),(213,186,'Issue',24,'','2015-08-11 17:16:33',0),(214,35,'Issue',10,'','2015-08-11 18:15:04',0),(215,178,'Issue',13,'','2015-08-11 18:35:04',0),(216,107,'Issue',20,'<p>Verified this page for both English and Chinese Version. There is no Sugar any more. But we still find there is a warning heading like </p>\r\n\r\n<p><span style=\"color: rgb(230, 23, 24); font-family: Arial, Verdana, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\">警告：活动用户数量已经超出许可证允许的最大值:4请联系你的销售代表或 发送电子邮件到sales@sugarcrm.com.</span></p>\r\n\r\n<p> </p>\r\n\r\n<p><span style=\"color: rgb(230, 23, 24); font-family: Arial, Verdana, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\">We need to update the email address. This bug has been posted as bug #199.</span></p>\r\n\r\n<p> </p>\r\n\r\n<p><span style=\"color: rgb(230, 23, 24); font-family: Arial, Verdana, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\">For now, this issue can be closed.</span></p>\r\n','2015-08-12 09:27:51',0),(217,199,'Issue',27,'','2015-08-12 09:37:04',0),(218,198,'Issue',10,'','2015-08-12 09:39:09',0),(219,102,'Issue',10,'','2015-08-12 09:40:03',0),(220,25,'Issue',11,'','2015-08-12 09:50:30',0),(221,180,'Issue',11,'<p>重复了。  使用 up云 也可以。 </p>\r\n','2015-08-12 09:51:35',0),(222,156,'Issue',27,'','2015-08-12 10:03:29',0),(223,142,'Issue',27,'','2015-08-12 10:03:55',0),(224,109,'Issue',20,'<p>Checked both English and Chinese version, the titles in Accounts, Contacts, oppotunities, leads, Calendar, Reports, Quotes, Documents, Emails, Campaigns, Calls, Meetings, Tasks, Notes, Forecasts, Cases, Targets, Target Lists, Revenue line items are all OK.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Sugggest to close this bug.</p>\r\n','2015-08-12 10:10:26',0),(225,164,'Issue',27,'','2015-08-12 10:13:09',0),(226,110,'Issue',20,'<p>We need to clear the cache in your browser. The best practise is to login your CRM account with Browser\'s private mode such as Incognito Window in Chrome.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Suggest to close this bug.</p>\r\n','2015-08-12 10:13:11',0),(227,129,'Issue',20,'<p>Now, this has been changed to \"<span style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px; line-height: 18px; background-color: rgb(255, 255, 255);\">CRM 邮件客户端</span>\" in Chinese Version and changed to \"HappyCRM Email Client.\"</p>\r\n\r\n<p> </p>\r\n\r\n<p>Asked to Chenfei to uniform the naming. Waiting to verify this point.</p>\r\n','2015-08-12 10:26:16',0),(228,142,'Issue',20,'<p>Verify the English version. The problem has been solved.</p>\r\n\r\n<p> </p>\r\n\r\n<p>But the Chinese version still says \"欢迎使用Sugar 7\"</p>\r\n\r\n<p>Reopen this bug.</p>\r\n','2015-08-12 10:27:39',0),(229,177,'Issue',10,'','2015-08-12 10:44:03',0),(230,129,'Issue',20,'<p>Verified that both versions (Eng and Chn) are consistent now.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Suggest to close this bug.</p>\r\n','2015-08-12 11:43:46',0),(231,142,'Issue',20,'','2015-08-12 11:45:35',0),(232,141,'Issue',31,'<p>1. 今天有多少新订单. 什么时候到的. 什么时候解决的. 本周内多少,总共多少.</p>\r\n\r\n<p>2. 今天有多少新注册用户. 本周内多少. 总共多少</p>\r\n\r\n<p>3. 今天的用户访问量是多少.   ( 做完上面两个之后,单独再开一个 issue) </p>\r\n','2015-08-12 11:50:16',0),(233,145,'Issue',20,'<p>Should be solved. Need Michael to check.</p>\r\n','2015-08-12 11:51:44',0),(234,146,'Issue',20,'<p>Verified both chinese and english version. Now, it is changed to HappyCRM from Sugar</p>\r\n\r\n<p> </p>\r\n\r\n<p>Suggest to close this bug.</p>\r\n','2015-08-12 11:56:00',0),(235,148,'Issue',20,'<p>In English Version, follow the steps</p>\r\n\r\n<p>Click the top-right icon -> Profile -> Advanced tab</p>\r\n\r\n<p>You still see the Sugar (search Sugar)</p>\r\n\r\n<p>For example, \"<span style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px; line-height: 18px; background-color: rgb(255, 255, 255);\">Use this URL when establishing login settings for the Sugar Plug-in for Microsoft® Outlook® and the Sugar Plug-in for Microsoft® Word®. </span>\"</p>\r\n\r\n<p> </p>\r\n\r\n<p>Reopen this bug.</p>\r\n','2015-08-12 12:00:31',0),(236,156,'Issue',20,'<p>The problem is solved for Eng version. But not for Chinese Version. </p>\r\n\r\n<p> </p>\r\n\r\n<p>Reopen this bug.</p>\r\n','2015-08-12 12:03:03',0),(237,157,'Issue',20,'<p>Changed to lower priority since this is not a bug. We need more config to enable pop3.</p>\r\n','2015-08-12 12:04:37',0),(238,158,'Issue',20,'<p>This is a little bit harder problem. We may postpone to fix this bug.</p>\r\n','2015-08-12 12:06:32',0),(239,183,'Issue',13,'','2015-08-12 14:56:45',0),(240,155,'Issue',13,'','2015-08-12 14:57:07',0),(241,159,'Issue',20,'<p>We may need more time to investigate this issue.</p>\r\n','2015-08-12 14:57:16',0),(242,199,'Issue',20,'<p>Verified both Eng and Chn versions. Changed the email address to sales@happysoft.cc.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Should be fixed.</p>\r\n','2015-08-12 14:59:54',0),(243,142,'Issue',27,'','2015-08-12 15:08:12',0),(244,148,'Issue',20,'<p>Verified the bug has been fixed.</p>\r\n\r\n<p> </p>\r\n\r\n<p>Suggest to close it.</p>\r\n','2015-08-12 15:22:01',0),(245,148,'Issue',20,'','2015-08-12 15:22:17',0),(246,202,'Issue',20,'<p>This is not a bug. We can follow the following document to replace the logo</p>\r\n\r\n<p>http://support.sugarcrm.com/04_Knowledge_Base/02Administration/100Sugar_Settings/Changing_the_Logo_for_PDF_Files/</p>\r\n','2015-08-12 15:25:33',0),(247,177,'Issue',3,'','2015-08-12 15:49:36',0),(248,198,'Issue',3,'','2015-08-12 15:49:56',0),(249,202,'Issue',20,'<p>姜 譞 写到：</p>\r\n\r\n<blockquote>\r\n<p>This is not a bug. We can follow the following document to replace the logo</p>\r\n\r\n<p>http://support.sugarcrm.com/04_Knowledge_Base/02Administration/100Sugar_Settings/Changing_the_Logo_for_PDF_Files/</p>\r\n\r\n<p>Also the default logo image is stored under themes/default/images/pdf_logo_small.jpg</p>\r\n\r\n<p>If we want to change this, we only need to update our own image.</p>\r\n</blockquote>\r\n','2015-08-12 15:56:07',0),(250,164,'Issue',27,'','2015-08-12 18:10:24',0),(251,211,'Issue',10,'','2015-08-12 18:20:44',0),(252,201,'Issue',22,'','2015-08-12 18:44:43',0),(253,160,'Issue',20,'<p>Verified with Michael and Michael confirmed the problem does not exist anymore.</p>\r\n\r\n<p>Suggest to close this bug.</p>\r\n','2015-08-13 08:36:19',0),(254,158,'Issue',20,'','2015-08-13 08:36:51',0),(255,159,'Issue',20,'','2015-08-13 08:37:36',0),(256,184,'Issue',22,'<p> 现在做的是点击下载提示用户用safari打开，等android上线到应用宝后可以开启微下载，让应用宝跳转</p>\r\n','2015-08-13 09:02:50',0),(257,185,'Issue',22,'<p>现在已经能够在有微信的手机上分享灵感到朋友或是朋友圈了。</p>\r\n','2015-08-13 09:03:49',0),(258,143,'Issue',22,'<p>测试版本的灵感，发现，管理相关图片路径已经改变，正式服务器未改变。</p>\r\n\r\n<p>看现场，套餐，等图片未完成。</p>\r\n','2015-08-13 09:06:54',0),(259,100,'Issue',22,'<p>测试服务器已经完成，正式服务器未部署新的版本。</p>\r\n','2015-08-13 09:07:30',0),(260,209,'Issue',11,'','2015-08-13 09:42:41',0),(261,192,'Issue',16,'','2015-08-13 09:49:53',0),(262,201,'Issue',22,'','2015-08-13 09:53:32',0),(263,213,'Issue',10,'','2015-08-13 09:56:35',0),(264,121,'Issue',10,'','2015-08-13 10:32:10',0),(265,223,'Issue',28,'','2015-08-13 10:54:24',0),(266,211,'Issue',13,'','2015-08-13 10:59:30',0),(267,231,'Issue',28,'','2015-08-13 11:04:20',0),(268,238,'Issue',28,'','2015-08-13 11:24:41',0),(269,239,'Issue',28,'','2015-08-13 11:25:11',0),(270,65,'Issue',1,'','2015-08-13 11:27:46',0),(271,63,'Issue',1,'','2015-08-13 11:28:08',0),(272,35,'Issue',1,'','2015-08-13 11:29:09',0),(273,33,'Issue',1,'','2015-08-13 11:29:43',0),(274,240,'Issue',25,'','2015-08-13 13:55:30',0),(275,214,'Issue',3,'','2015-08-13 14:40:46',0),(276,245,'Issue',16,'','2015-08-13 14:51:09',0);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_roles`
--

DROP TABLE IF EXISTS `member_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inherited_from` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_member_roles_on_member_id` (`member_id`),
  KEY `index_member_roles_on_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_roles`
--

LOCK TABLES `member_roles` WRITE;
/*!40000 ALTER TABLE `member_roles` DISABLE KEYS */;
INSERT INTO `member_roles` VALUES (1,1,4,NULL),(3,3,4,NULL),(4,4,5,NULL),(5,5,5,NULL),(6,6,3,NULL),(7,7,3,NULL),(8,8,4,NULL),(9,9,4,NULL),(12,12,4,NULL),(13,13,4,NULL),(14,14,4,NULL),(15,15,4,NULL),(16,16,4,NULL),(17,17,4,NULL),(20,20,4,NULL),(21,21,4,NULL),(22,22,4,NULL),(23,23,4,NULL),(24,24,4,NULL),(25,25,4,NULL),(26,26,4,NULL),(27,27,4,NULL),(28,28,4,NULL),(29,29,4,NULL),(30,30,4,NULL),(31,31,4,NULL),(32,32,4,NULL),(33,33,4,NULL),(34,34,4,NULL),(35,35,4,NULL),(36,36,4,NULL),(37,37,4,NULL),(38,38,3,NULL),(39,39,3,NULL),(40,40,3,NULL),(41,41,3,NULL),(42,42,3,NULL),(43,43,4,NULL),(44,44,4,NULL),(45,45,4,NULL),(46,46,4,NULL),(47,47,4,NULL),(49,49,3,NULL),(50,50,3,NULL),(51,51,4,NULL),(52,52,4,NULL),(53,53,4,NULL),(54,54,4,NULL),(55,55,4,NULL),(56,56,4,NULL),(57,57,4,NULL),(58,58,4,NULL),(59,59,4,NULL),(60,60,4,NULL),(61,61,4,NULL),(62,62,4,NULL),(63,63,4,NULL),(64,64,4,NULL),(65,65,4,NULL),(66,66,4,NULL),(67,67,4,NULL),(68,68,4,NULL),(69,69,3,NULL),(70,70,3,NULL),(71,71,3,NULL),(72,72,3,NULL),(73,28,3,NULL),(74,29,3,NULL);
/*!40000 ALTER TABLE `member_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  KEY `index_members_on_user_id` (`user_id`),
  KEY `index_members_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,3,1,'2015-03-11 18:31:33',0),(3,5,1,'2015-03-11 18:31:33',0),(4,7,1,'2015-03-13 10:31:35',0),(5,8,1,'2015-03-13 10:31:35',0),(6,10,4,'2015-07-29 09:58:49',0),(7,11,4,'2015-07-29 09:58:49',0),(8,18,3,'2015-07-29 11:46:13',0),(9,3,3,'2015-07-29 11:46:13',0),(12,17,3,'2015-07-29 11:46:13',0),(13,16,3,'2015-07-29 11:46:13',0),(14,12,3,'2015-07-29 11:46:13',0),(15,13,3,'2015-07-29 11:46:13',0),(16,3,5,'2015-07-29 11:48:06',0),(17,10,5,'2015-07-29 11:48:06',0),(20,17,5,'2015-07-29 11:48:06',0),(21,16,5,'2015-07-29 11:48:06',0),(22,12,5,'2015-07-29 11:48:06',0),(23,13,5,'2015-07-29 11:48:06',0),(24,20,5,'2015-07-29 18:20:41',0),(25,22,5,'2015-07-29 22:14:29',0),(26,22,3,'2015-07-29 23:54:46',0),(27,14,6,'2015-08-03 09:58:44',0),(28,24,6,'2015-08-03 09:58:45',0),(29,11,6,'2015-08-03 09:58:45',0),(30,23,3,'2015-08-03 10:00:40',0),(31,26,6,'2015-08-03 10:08:32',0),(32,25,4,'2015-08-03 10:08:59',0),(33,26,4,'2015-08-03 10:08:59',0),(34,14,4,'2015-08-03 10:08:59',0),(35,24,4,'2015-08-03 10:08:59',0),(36,27,7,'2015-08-04 09:08:48',0),(37,11,7,'2015-08-04 09:08:48',0),(38,20,7,'2015-08-04 09:08:57',0),(39,10,7,'2015-08-04 09:08:57',0),(40,20,3,'2015-08-04 10:34:58',0),(41,11,3,'2015-08-04 10:34:58',0),(42,10,3,'2015-08-04 14:40:20',0),(43,19,3,'2015-08-05 14:56:25',0),(44,25,3,'2015-08-05 14:56:25',0),(45,26,3,'2015-08-05 14:56:25',0),(46,14,3,'2015-08-05 14:56:25',0),(47,24,3,'2015-08-05 14:56:25',0),(49,28,3,'2015-08-06 13:59:48',0),(50,28,4,'2015-08-06 14:00:14',0),(51,31,3,'2015-08-12 10:37:54',0),(52,32,3,'2015-08-12 10:37:54',0),(53,19,4,'2015-08-12 10:38:42',0),(54,31,4,'2015-08-12 10:38:42',0),(55,32,4,'2015-08-12 10:38:42',0),(56,16,4,'2015-08-12 10:38:42',0),(57,23,4,'2015-08-12 10:38:42',0),(58,13,4,'2015-08-12 10:38:42',0),(59,19,8,'2015-08-12 10:40:45',0),(60,25,8,'2015-08-12 10:40:45',0),(61,31,8,'2015-08-12 10:40:45',0),(62,32,8,'2015-08-12 10:40:45',0),(63,16,8,'2015-08-12 10:40:45',0),(64,24,8,'2015-08-12 10:40:45',0),(65,23,8,'2015-08-12 10:40:45',0),(66,3,8,'2015-08-12 10:40:45',0),(67,13,8,'2015-08-12 10:40:45',0),(68,22,8,'2015-08-12 10:40:45',0),(69,20,8,'2015-08-12 10:40:57',0),(70,28,8,'2015-08-12 10:40:57',0),(71,11,8,'2015-08-12 10:40:57',0),(72,10,8,'2015-08-12 10:40:57',0);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `author_id` int(11) DEFAULT NULL,
  `replies_count` int(11) NOT NULL DEFAULT '0',
  `last_reply_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `sticky` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messages_board_id` (`board_id`),
  KEY `messages_parent_id` (`parent_id`),
  KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  KEY `index_messages_on_author_id` (`author_id`),
  KEY `index_messages_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(60) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT '',
  `description` text,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_project_id` (`project_id`),
  KEY `index_news_on_author_id` (`author_id`),
  KEY `index_news_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_associations`
--

DROP TABLE IF EXISTS `open_id_authentication_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `assoc_type` varchar(255) DEFAULT NULL,
  `server_url` blob,
  `secret` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_associations`
--

LOCK TABLES `open_id_authentication_associations` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_nonces`
--

DROP TABLE IF EXISTS `open_id_authentication_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_nonces`
--

LOCK TABLES `open_id_authentication_nonces` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `homepage` varchar(255) DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `inherit_members` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lft` (`lft`),
  KEY `index_projects_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'happystock-乐股在线','','',1,NULL,'2015-03-11 17:31:59','2015-03-11 17:31:59','happystock',5,5,6,0),(2,'加迅迈凯','','',0,NULL,'2015-03-19 15:25:53','2015-07-29 09:51:10','jxmk',5,7,8,0),(3,'悦家app','','',1,NULL,'2015-03-19 15:36:20','2015-07-29 09:52:01','yuejia',1,9,12,0),(4,'悦家PC端商城 + PC 网站','','',1,NULL,'2015-07-29 09:58:11','2015-08-06 09:14:18','yue_house_pc_mall',1,13,14,0),(5,'App商城','','',1,3,'2015-07-29 11:29:19','2015-07-29 11:29:19','app',1,10,11,0),(6,'竞品监控项目','','http://youkubd.happysoft.cc',1,NULL,'2015-08-03 09:58:01','2015-08-03 09:58:01','jing_pin_jian_kong',1,15,16,0),(7,'CRM','','crm.happysoft.cc',1,NULL,'2015-08-03 10:13:14','2015-08-03 10:13:14','crm',1,1,2,0),(8,'happy bugs','','http://bug.happysoft.cc',1,NULL,'2015-08-12 10:39:49','2015-08-12 10:39:49','happy-bugs',1,3,4,0);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_trackers`
--

DROP TABLE IF EXISTS `projects_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_trackers` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  KEY `projects_trackers_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_trackers`
--

LOCK TABLES `projects_trackers` WRITE;
/*!40000 ALTER TABLE `projects_trackers` DISABLE KEYS */;
INSERT INTO `projects_trackers` VALUES (1,1),(1,2),(2,1),(2,2),(3,1),(3,2),(3,3),(3,4),(4,1),(4,2),(4,4),(5,1),(5,2),(5,4),(6,1),(6,2),(7,1),(7,2),(8,1),(8,2);
/*!40000 ALTER TABLE `projects_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `filters` text,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `column_names` text,
  `sort_criteria` text,
  `group_by` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `visibility` int(11) DEFAULT '0',
  `options` text,
  PRIMARY KEY (`id`),
  KEY `index_queries_on_project_id` (`project_id`),
  KEY `index_queries_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,NULL,'精简风格列表','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\n',11,'---\n- :status\n- :priority\n- :subject\n- :assigned_to\n- :author\n- :estimated_hours\n- :created_on\n',NULL,'','IssueQuery',0,'---\n:draw_relations: \n:draw_progress_line: \n'),(2,3,'test','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\ntracker_id:\n  :operator: =\n  :values:\n  - \'1\'\n',10,NULL,NULL,'','IssueQuery',0,'---\n:draw_relations: \n:draw_progress_line: \n');
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries_roles`
--

DROP TABLE IF EXISTS `queries_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries_roles` (
  `query_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  UNIQUE KEY `queries_roles_ids` (`query_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries_roles`
--

LOCK TABLES `queries_roles` WRITE;
/*!40000 ALTER TABLE `queries_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositories`
--

DROP TABLE IF EXISTS `repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `login` varchar(60) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `root_url` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT NULL,
  `path_encoding` varchar(64) DEFAULT NULL,
  `log_encoding` varchar(64) DEFAULT NULL,
  `extra_info` text,
  `identifier` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_repositories_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositories`
--

LOCK TABLES `repositories` WRITE;
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rich_rich_files`
--

DROP TABLE IF EXISTS `rich_rich_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rich_rich_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rich_file_file_name` varchar(255) DEFAULT NULL,
  `rich_file_content_type` varchar(255) DEFAULT NULL,
  `rich_file_file_size` int(11) DEFAULT NULL,
  `rich_file_updated_at` datetime DEFAULT NULL,
  `owner_type` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `uri_cache` text,
  `simplified_type` varchar(255) DEFAULT 'file',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rich_rich_files`
--

LOCK TABLES `rich_rich_files` WRITE;
/*!40000 ALTER TABLE `rich_rich_files` DISABLE KEYS */;
INSERT INTO `rich_rich_files` VALUES (1,'2015-07-29 14:32:34','2015-07-29 14:32:34','品牌团0723_修改.jpg','image/jpeg',5965921,'2015-07-29 14:32:30','Project',4,'{\"thumb\":\"/system/rich/rich_files/rich_files/000/000/001/thumb/%E5%93%81%E7%89%8C%E5%9B%A20723_%E4%BF%AE%E6%94%B9.jpg\",\"rich_thumb\":\"/system/rich/rich_files/rich_files/000/000/001/rich_thumb/%E5%93%81%E7%89%8C%E5%9B%A20723_%E4%BF%AE%E6%94%B9.jpg\",\"original\":\"/system/rich/rich_files/rich_files/000/000/001/original/%E5%93%81%E7%89%8C%E5%9B%A20723_%E4%BF%AE%E6%94%B9.jpg\"}','image'),(2,'2015-07-29 14:33:47','2015-07-29 14:33:47','cluster.gif','image/gif',10875,'2015-07-29 14:33:47','Project',4,'{\"thumb\":\"/system/rich/rich_files/rich_files/000/000/002/thumb/cluster.gif\",\"rich_thumb\":\"/system/rich/rich_files/rich_files/000/000/002/rich_thumb/cluster.gif\",\"original\":\"/system/rich/rich_files/rich_files/000/000/002/original/cluster.gif\"}','image'),(3,'2015-08-12 10:16:07','2015-08-12 10:16:07','悦家优品-品牌团.jpg','image/jpeg',1102140,'2015-08-12 10:16:06','Project',3,'{\"thumb\":\"/system/rich/rich_files/rich_files/000/000/003/thumb/%E6%82%A6%E5%AE%B6%E4%BC%98%E5%93%81-%E5%93%81%E7%89%8C%E5%9B%A2.jpg\",\"rich_thumb\":\"/system/rich/rich_files/rich_files/000/000/003/rich_thumb/%E6%82%A6%E5%AE%B6%E4%BC%98%E5%93%81-%E5%93%81%E7%89%8C%E5%9B%A2.jpg\",\"original\":\"/system/rich/rich_files/rich_files/000/000/003/original/%E6%82%A6%E5%AE%B6%E4%BC%98%E5%93%81-%E5%93%81%E7%89%8C%E5%9B%A2.jpg\"}','image'),(4,'2015-08-12 11:37:30','2015-08-12 11:37:30','Web_首页_35.png','image/png',14700,'2015-08-12 11:37:30','Project',6,'{\"thumb\":\"/system/rich/rich_files/rich_files/000/000/004/thumb/Web_%E9%A6%96%E9%A1%B5_35.png\",\"rich_thumb\":\"/system/rich/rich_files/rich_files/000/000/004/rich_thumb/Web_%E9%A6%96%E9%A1%B5_35.png\",\"original\":\"/system/rich/rich_files/rich_files/000/000/004/original/Web_%E9%A6%96%E9%A1%B5_35.png\"}','image');
/*!40000 ALTER TABLE `rich_rich_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `assignable` tinyint(1) DEFAULT '1',
  `builtin` int(11) NOT NULL DEFAULT '0',
  `permissions` text,
  `issues_visibility` varchar(30) NOT NULL DEFAULT 'default',
  `users_visibility` varchar(30) NOT NULL DEFAULT 'all',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Non member',1,1,1,'---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :add_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default','all'),(2,'Anonymous',2,1,2,'---\n- :view_issues\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_files\n- :browse_repository\n- :view_changesets\n','default','all'),(3,'管理员',3,1,0,'---\n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_boards\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_calendar\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_documents\n- :manage_files\n- :view_files\n- :view_gantt\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :manage_public_queries\n- :save_queries\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :manage_news\n- :comment_news\n- :manage_repository\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n- :log_time\n- :view_time_entries\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :manage_wiki\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :view_wiki_pages\n- :export_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages_attachments\n- :protect_wiki_pages\n','all','all'),(4,'开发工程师',4,1,0,'---\n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_versions\n- :add_subprojects\n- :add_messages\n- :edit_own_messages\n- :view_calendar\n- :view_documents\n- :manage_files\n- :view_files\n- :view_gantt\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :add_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :save_queries\n- :comment_news\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n- :log_time\n- :view_time_entries\n- :delete_wiki_pages\n- :view_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n','all','all'),(5,'Reporter',5,1,0,'---\n- :add_messages\n- :edit_own_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :delete_issues\n- :save_queries\n- :comment_news\n- :browse_repository\n- :view_changesets\n- :log_time\n- :view_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n','default','all');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('10'),('100'),('101'),('102'),('103'),('104'),('105'),('106'),('107'),('108'),('11'),('12'),('13'),('14'),('15'),('16'),('17'),('18'),('19'),('2'),('20'),('20090214190337'),('20090312172426'),('20090312194159'),('20090318181151'),('20090323224724'),('20090401221305'),('20090401231134'),('20090403001910'),('20090406161854'),('20090425161243'),('20090503121501'),('20090503121505'),('20090503121510'),('20090614091200'),('20090704172350'),('20090704172355'),('20090704172358'),('20091010093521'),('20091017212227'),('20091017212457'),('20091017212644'),('20091017212938'),('20091017213027'),('20091017213113'),('20091017213151'),('20091017213228'),('20091017213257'),('20091017213332'),('20091017213444'),('20091017213536'),('20091017213642'),('20091017213716'),('20091017213757'),('20091017213835'),('20091017213910'),('20091017214015'),('20091017214107'),('20091017214136'),('20091017214236'),('20091017214308'),('20091017214336'),('20091017214406'),('20091017214440'),('20091017214519'),('20091017214611'),('20091017214644'),('20091017214720'),('20091017214750'),('20091025163651'),('20091108092559'),('20091114105931'),('20091123212029'),('20091205124427'),('20091220183509'),('20091220183727'),('20091220184736'),('20091225164732'),('20091227112908'),('20100129193402'),('20100129193813'),('20100221100219'),('20100313132032'),('20100313171051'),('20100705164950'),('20100819172912'),('20101104182107'),('20101107130441'),('20101114115114'),('20101114115359'),('20110220160626'),('20110223180944'),('20110223180953'),('20110224000000'),('20110226120112'),('20110226120132'),('20110227125750'),('20110228000000'),('20110228000100'),('20110401192910'),('20110408103312'),('20110412065600'),('20110511000000'),('20110902000000'),('20111201201315'),('20120115143024'),('20120115143100'),('20120115143126'),('20120127174243'),('20120205111326'),('20120223110929'),('20120301153455'),('20120422150750'),('20120705074331'),('20120707064544'),('20120714122000'),('20120714122100'),('20120714122200'),('20120731164049'),('20120930112914'),('20121026002032'),('20121026003537'),('20121209123234'),('20121209123358'),('20121213084931'),('20130110122628'),('20130201184705'),('20130202090625'),('20130207175206'),('20130207181455'),('20130215073721'),('20130215111127'),('20130215111141'),('20130217094251'),('20130418001207-redmine_ckeditor'),('20130418001208-redmine_ckeditor'),('20130418001209-redmine_ckeditor'),('20130602092539'),('20130710182539'),('20130713104233'),('20130713111657'),('20130729070143'),('20130911193200'),('20131004113137'),('20131005100610'),('20131124175346'),('20131210180802'),('20131214094309'),('20131215104612'),('20131218183023'),('20140228130325'),('20140903143914'),('20140920094058'),('20141029181752'),('20141029181824'),('20141109112308'),('20141122124142'),('20150113194759'),('20150113211532'),('20150113213922'),('20150113213955'),('20150208105930'),('21'),('22'),('23'),('24'),('25'),('26'),('27'),('28'),('29'),('3'),('30'),('31'),('32'),('33'),('34'),('35'),('36'),('37'),('38'),('39'),('4'),('40'),('41'),('42'),('43'),('44'),('45'),('46'),('47'),('48'),('49'),('5'),('50'),('51'),('52'),('53'),('54'),('55'),('56'),('57'),('58'),('59'),('6'),('60'),('61'),('62'),('63'),('64'),('65'),('66'),('67'),('68'),('69'),('7'),('70'),('71'),('72'),('73'),('74'),('75'),('76'),('77'),('78'),('79'),('8'),('80'),('81'),('82'),('83'),('84'),('85'),('86'),('87'),('88'),('89'),('9'),('90'),('91'),('92'),('93'),('94'),('95'),('96'),('97'),('98'),('99');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settings_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'app_title','bug 管理系统','2015-07-29 09:41:43'),(2,'welcome_text','','2015-07-29 09:41:43'),(3,'attachment_max_size','100000','2015-07-29 09:41:43'),(4,'per_page_options','25,50,100','2015-07-29 09:41:43'),(5,'search_results_per_page','10','2015-07-29 09:41:43'),(6,'activity_days_default','30','2015-07-29 09:41:43'),(7,'host_name','bug.happysoft.cc','2015-07-29 09:41:43'),(8,'protocol','http','2015-07-29 09:41:43'),(9,'text_formatting','CKEditor','2015-07-29 14:31:49'),(10,'cache_formatted_text','0','2015-07-29 09:41:43'),(11,'wiki_compression','','2015-07-29 09:41:43'),(12,'feeds_limit','15','2015-07-29 09:41:43'),(13,'file_max_size_displayed','512','2015-07-29 09:41:43'),(14,'diff_max_lines_displayed','1500','2015-07-29 09:41:43'),(15,'repositories_encodings','','2015-07-29 09:41:43'),(16,'ui_theme','classic','2015-07-29 20:34:00'),(17,'default_language','zh','2015-07-29 09:42:04'),(18,'force_default_language_for_anonymous','1','2015-07-29 09:42:04'),(19,'force_default_language_for_loggedin','1','2015-07-29 09:42:04'),(20,'start_of_week','','2015-07-29 09:42:04'),(21,'date_format','','2015-07-29 09:42:04'),(22,'time_format','','2015-07-29 09:42:04'),(23,'user_format','lastname_firstname','2015-07-29 20:34:00'),(24,'gravatar_enabled','0','2015-07-29 09:42:04'),(25,'gravatar_default','','2015-07-29 09:42:04'),(26,'thumbnails_enabled','0','2015-07-29 09:42:04'),(27,'thumbnails_size','100','2015-07-29 09:42:04'),(28,'login_required','0','2015-07-29 09:42:33'),(29,'autologin','0','2015-07-29 09:42:33'),(30,'self_registration','3','2015-07-29 09:42:33'),(31,'unsubscribe','1','2015-07-29 09:42:33'),(32,'password_min_length','6','2015-07-29 09:42:33'),(33,'lost_password','1','2015-07-29 09:42:33'),(34,'max_additional_emails','5','2015-07-29 09:42:33'),(35,'openid','0','2015-07-29 09:42:33'),(36,'rest_api_enabled','0','2015-07-29 09:42:33'),(37,'jsonp_enabled','0','2015-07-29 09:42:33'),(38,'session_lifetime','43200','2015-07-29 09:42:33'),(39,'session_timeout','0','2015-07-29 09:42:33'),(40,'default_projects_public','1','2015-07-29 09:43:29'),(41,'default_projects_modules','---\n- issue_tracking\n- time_tracking\n','2015-07-29 18:30:10'),(42,'default_projects_tracker_ids','---\n- \'1\'\n- \'2\'\n- \'3\'\n- \'4\'\n','2015-07-29 20:25:36'),(43,'sequential_project_identifiers','0','2015-07-29 09:43:29'),(44,'new_project_user_role_id','4','2015-07-29 09:43:29'),(45,'mail_from','bug@happysoft.cc','2015-07-29 13:31:18'),(46,'bcc_recipients','1','2015-07-29 13:31:18'),(47,'plain_text_mail','0','2015-07-29 13:31:19'),(48,'default_notification_option','only_my_events','2015-07-29 13:31:19'),(49,'notified_events','---\n- issue_added\n- issue_updated\n','2015-07-29 13:31:19'),(50,'emails_header','','2015-07-29 13:31:19'),(51,'emails_footer','Happysoft管理组','2015-07-29 18:31:27'),(52,'enabled_scm','---\n- Git\n','2015-07-29 13:31:40'),(53,'autofetch_changesets','1','2015-07-29 13:31:40'),(54,'sys_api_enabled','0','2015-07-29 13:31:40'),(55,'repository_log_display_limit','100','2015-07-29 13:31:40'),(56,'commit_ref_keywords','refs,references,IssueID','2015-07-29 13:31:41'),(57,'commit_cross_project_ref','0','2015-07-29 13:31:41'),(58,'commit_logtime_enabled','0','2015-07-29 13:31:41'),(59,'commit_update_keywords','--- []\n','2015-07-29 13:31:41'),(60,'cross_project_issue_relations','0','2015-07-29 18:30:49'),(61,'link_copied_issue','ask','2015-07-29 18:30:49'),(62,'cross_project_subtasks','tree','2015-07-29 18:30:49'),(63,'issue_group_assignment','0','2015-07-29 18:30:49'),(64,'default_issue_start_date_to_creation_date','1','2015-07-29 18:30:49'),(65,'display_subprojects_issues','1','2015-07-29 18:30:49'),(66,'issue_done_ratio','issue_field','2015-07-29 18:30:49'),(67,'non_working_week_days','---\n- \'6\'\n- \'7\'\n','2015-07-29 18:30:49'),(68,'issues_export_limit','500','2015-07-29 18:30:49'),(69,'gantt_items_limit','500','2015-07-29 18:30:49'),(70,'issue_list_default_columns','---\n- tracker\n- status\n- priority\n- subject\n- assigned_to\n- updated_on\n- author\n- category\n- fixed_version\n- start_date\n- estimated_hours\n- created_on\n','2015-07-29 18:30:49');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_entries`
--

DROP TABLE IF EXISTS `time_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int(11) NOT NULL,
  `tmonth` int(11) NOT NULL,
  `tweek` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_entries_project_id` (`project_id`),
  KEY `time_entries_issue_id` (`issue_id`),
  KEY `index_time_entries_on_activity_id` (`activity_id`),
  KEY `index_time_entries_on_user_id` (`user_id`),
  KEY `index_time_entries_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_entries`
--

LOCK TABLES `time_entries` WRITE;
/*!40000 ALTER TABLE `time_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(30) NOT NULL DEFAULT '',
  `value` varchar(40) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_value` (`value`),
  KEY `index_tokens_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,1,'feeds','7afbedaef2d6093bf6e1c7f23fe21edd5d892052','2015-03-11 11:34:42'),(2,3,'feeds','c208d9aef954ba2d2198f3852e68631bb7961867','2015-03-11 17:29:16'),(3,8,'feeds','eb8bc0a940f35714a4bb3aa357f7bb5ccadc2da9','2015-03-13 10:37:48'),(4,7,'feeds','78a9449ba4dcb4524bf4cdbce25ced527cdeb799','2015-03-13 10:38:07'),(6,5,'feeds','a01af02fc11daef0471f004138591d8147da23eb','2015-03-18 10:16:49'),(7,10,'feeds','a29428e83c280ef3d13d26988c04443157d0b134','2015-06-25 15:33:40'),(9,11,'feeds','599abb30da26b060283df5550670e0c93e52d0df','2015-07-29 09:55:33'),(10,12,'feeds','8a69f0299e775dbb6676add6442a533a8fdc3873','2015-07-29 10:49:09'),(11,13,'feeds','4e44fd712f26afe6e7c931498d4cf1af7c212cde','2015-07-29 11:15:01'),(15,16,'feeds','49b3bd7eaf34293a0c5f6801e06724e38fdab623','2015-07-29 11:42:13'),(16,17,'feeds','c3a0e0672064af39f43f7fcec017df2edc3caa12','2015-07-29 11:42:38'),(17,14,'feeds','1cd8de3348dc3f21104e999f29f7fca6b75dc151','2015-07-29 11:53:36'),(18,18,'feeds','ef9394a36b00153e355120da1fc233c30b05f84f','2015-07-29 12:00:44'),(19,19,'feeds','477972478e7a18dac27a69ba5181165d0d6582f3','2015-07-29 17:03:32'),(20,20,'feeds','ac74de1f25fc2ec467578769b47b4d1d7c017ffb','2015-07-29 18:17:33'),(21,22,'feeds','7b418f438dc6582c5694769a7a13dcb2a9ca7e07','2015-07-29 19:43:35'),(25,23,'feeds','bc1a7f559140d33706ebb31009a45fb240b01c4c','2015-08-03 09:53:25'),(26,24,'feeds','dc6db7bb125d0073a64719deef1f17f2dc9d986b','2015-08-03 09:58:34'),(27,25,'feeds','9f4939d28585f5b06a1d9db0a750e2f922533ed8','2015-08-03 10:03:05'),(28,26,'feeds','12015b3a53a74b1cd3537b441d0c29befaf5a2e4','2015-08-03 10:07:48'),(29,27,'feeds','1b6131df56723314de583a343e4c43188ea17f1d','2015-08-03 10:23:32'),(31,24,'recovery','d92ee1be2fd3c42e5bde948c6b91888ec42a82d0','2015-08-03 15:15:14'),(34,28,'feeds','d3b80078ff26993d68d1c1467d8cbd188848b9dc','2015-08-06 13:59:37'),(35,29,'feeds','e201639e54f711ebd44c4438c02ba7aefc9fbdbb','2015-08-06 21:00:32'),(36,30,'feeds','e47b6395be15a8e695d3cc28fc1dabf7bda60b3a','2015-08-06 21:05:58'),(37,31,'feeds','c3322ad1caeba2f56db16cca4bd469b053405a79','2015-08-12 10:05:00'),(38,32,'feeds','aaa63bf6ead51d782ef3853615d1ea6ec700a450','2015-08-12 10:13:52');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackers`
--

DROP TABLE IF EXISTS `trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_in_chlog` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT '1',
  `fields_bits` int(11) DEFAULT '0',
  `default_status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackers`
--

LOCK TABLES `trackers` WRITE;
/*!40000 ALTER TABLE `trackers` DISABLE KEYS */;
INSERT INTO `trackers` VALUES (1,'Bug',1,1,0,0,1),(2,'功能点',1,2,1,0,1),(3,'Support',0,3,0,0,1),(4,'需增强',0,4,1,0,7);
/*!40000 ALTER TABLE `trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `others` text,
  `hide_mail` tinyint(1) DEFAULT '0',
  `time_zone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_preferences_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,1,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,''),(2,3,'---\n:gantt_zoom: 2\n:gantt_months: 6\n',0,NULL),(3,5,'--- {}\n',0,NULL),(6,8,'---\n:gantt_zoom: 2\n:gantt_months: 6\n',0,NULL),(7,7,'--- {}\n',0,NULL),(8,10,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:gantt_zoom: 2\n:gantt_months: 6\n',0,''),(9,11,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:my_page_layout:\n  top:\n  - issuesassignedtome\n  left: []\n  right: []\n:gantt_zoom: 2\n:gantt_months: 6\n',0,''),(10,12,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,'Beijing'),(11,13,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,''),(12,14,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:gantt_zoom: 2\n:gantt_months: 6\n',0,''),(14,16,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,''),(15,17,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,''),(16,18,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,''),(18,19,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,''),(19,20,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,'Beijing'),(20,22,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,''),(21,23,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,''),(22,24,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,''),(23,25,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,''),(24,26,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,''),(25,27,'--- {}\n',0,NULL),(26,28,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:gantt_zoom: 2\n:gantt_months: 6\n',0,''),(27,29,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,''),(28,30,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,''),(29,31,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,'Beijing'),(30,32,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,'');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `hashed_password` varchar(40) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) DEFAULT '',
  `auth_source_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `identity_url` varchar(255) DEFAULT NULL,
  `mail_notification` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(64) DEFAULT NULL,
  `must_change_passwd` tinyint(1) NOT NULL DEFAULT '0',
  `passwd_changed_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_id_and_type` (`id`,`type`),
  KEY `index_users_on_auth_source_id` (`auth_source_id`),
  KEY `index_users_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','a2c4eebaed06621a67d623e0f80bac1d555d5217','管理员','系统',1,1,'2015-08-13 11:10:27','',NULL,'2015-03-04 07:49:26','2015-07-30 13:03:07','User',NULL,'all','e03a71a43e1651f6754132ed5c3ad0ee',0,NULL),(2,'','','','Anonymous',0,0,NULL,'',NULL,'2015-03-04 07:53:51','2015-03-04 07:53:51','AnonymousUser',NULL,'only_my_events',NULL,0,NULL),(3,'guoweidong','08af6746635e020b9c3a8547e58d39eaac1ca4a5','卫东','郭',0,1,'2015-08-13 14:40:29','zh',NULL,'2015-03-11 17:05:33','2015-03-11 17:13:17','User',NULL,'only_my_events','b71b41dd8eee2f1006a6fe09f70ce938',0,'2015-03-11 17:05:33'),(5,'gumengli','b4a2af26ef6a9cf62746daac7aa6125a37e70246','梦丽','谷',0,1,'2015-03-23 10:19:30','zh',NULL,'2015-03-11 18:09:26','2015-03-11 18:09:51','User',NULL,'only_my_events','fc457c0a2df0d865b70b9a6de6fa9fe9',0,'2015-03-11 18:09:26'),(7,'zhaoxiangyang','f1e9dd8a5943a55368e54a885ee61f007faf8c56','向阳','赵',0,1,'2015-03-17 13:37:57','zh',NULL,'2015-03-13 10:28:43','2015-03-13 10:30:34','User',NULL,'only_my_events','568504e7a58471d2c1598065059059e7',0,'2015-03-13 10:28:43'),(8,'wangyimeng','d202d981aeab67862ac00fcc26232a24fda0fa0f','怡萌','王',0,1,'2015-03-14 17:40:40','zh',NULL,'2015-03-13 10:30:07','2015-03-13 10:30:31','User',NULL,'only_my_events','b60fed5a80b11cc3c060f95db9444b91',0,'2015-03-13 10:30:07'),(10,'Tiffany','19563c4a068a1a1e185abf0c9944da6a36dec599','园园','黄',1,1,'2015-08-13 11:32:44','zh',NULL,'2015-06-25 11:07:36','2015-08-04 10:10:36','User',NULL,'only_my_events','7c4fd689e5f36a04dbc81e3b70aa0304',0,'2015-08-04 10:10:36'),(11,'shensiwei@happysoft.cc','2fb101e4cec385754250692d371469b06dff2f42','思维','申',1,1,'2015-08-07 14:00:26','',NULL,'2015-07-29 09:55:13','2015-07-29 14:02:16','User',NULL,'only_my_events','1b423a917a225968f129ae58e64af44d',0,'2015-07-29 09:55:13'),(12,'hfp','9f6390256d420012f43c47dde1d889a47c5ce144','飞鹏','胡',0,1,'2015-08-07 09:10:25','',NULL,'2015-07-29 10:46:09','2015-07-29 10:46:23','User',NULL,'only_my_events','a1e533bdc9414dbd266349bc3057f9e4',0,'2015-07-29 10:46:09'),(13,'gaoyuehua@happysoft.cc','6ef0bbf50e8a70d8b0b8c9f5c19e13db845e1a48','跃华','高',0,1,'2015-08-13 10:59:16','',NULL,'2015-07-29 11:14:17','2015-07-29 21:49:33','User',NULL,'only_my_events','51f70af7a3767160d0f85db958d1fde0',0,'2015-07-29 11:14:17'),(14,'lige@happysoft.cc','77b0a73619f3a57ebe358dd458528504825bf0a7','戈','李',0,1,'2015-08-12 14:40:00','',NULL,'2015-07-29 11:22:07','2015-07-29 21:51:54','User',NULL,'only_my_events','55e76aff8cb0e2e2a1274dcc0588889c',0,'2015-07-29 11:22:07'),(16,'zhangyu@happysoft.cc','715c1c48aea333937b8f68d68c527c2caf590a9e','瑜','张',0,1,'2015-08-13 09:49:19','',NULL,'2015-07-29 11:41:45','2015-07-29 11:41:45','User',NULL,'only_my_events','a4fafa448dfd22c7db5667ac51a2cff4',0,'2015-07-29 11:41:45'),(17,'wangtao','040e9f89fd1883e359c98094ef9ae911b84d2817','涛','王',0,1,'2015-08-03 16:41:32','',NULL,'2015-07-29 11:41:52','2015-07-29 21:52:09','User',NULL,'only_my_events','95831621731362392b7d71a04042937f',0,'2015-07-29 11:41:52'),(18,'hanzhirong@happysoft.cc','b543e412e7fbf0fa273f6f7aa40a05667faebe74','志荣','韩',0,1,'2015-08-11 15:02:46','',NULL,'2015-07-29 11:42:46','2015-07-29 21:51:20','User',NULL,'only_my_events','707a63ee8884bb7fa20629586370297f',0,'2015-07-29 11:42:46'),(19,'caster261402','6b4f659d1a0a068010c65d9a8abea61f1e20b862','皓','仇',0,1,'2015-08-12 14:12:59','',NULL,'2015-07-29 17:02:44','2015-08-12 14:12:22','User',NULL,'only_my_events','fffdfe56a136f028094c6c4b492238d1',0,'2015-08-12 14:12:22'),(20,'heroleap','22953bfdded5511122bc99f588762d3cdcd15515','譞','姜',1,1,'2015-08-13 08:35:26','',NULL,'2015-07-29 18:16:36','2015-07-29 18:36:59','User',NULL,'all','978d1cf2cd6b1360672dd3bc5bad966e',0,'2015-07-29 18:36:59'),(21,'','','','全体程序员',0,1,NULL,'',NULL,'2015-07-29 18:26:13','2015-07-29 18:26:13','Group',NULL,'',NULL,0,NULL),(22,'huangmin','b004045c1ccc00ab7c40228d6a20c9087a8e078a','敏','黄',0,1,'2015-08-13 09:00:54','',NULL,'2015-07-29 19:42:29','2015-07-30 21:20:43','User',NULL,'only_my_events','4d0b301fd1ae0ef3d10fea01224bae5a',0,'2015-07-30 21:20:43'),(23,'huhaiyang@happysoft.cc','530448072b7764cdd3ebd9a2dc8fdeaa8030c928','海洋','胡',0,1,'2015-08-05 09:32:48','',NULL,'2015-08-03 09:52:30','2015-08-03 09:52:30','User',NULL,'only_my_events','f8407c34700fb5c6f863539b1b47d8bc',0,'2015-08-03 09:52:30'),(24,'jianghaohao','e953214a43273c664c2be938ade34bd7f4a5c248','浩浩','江',0,1,'2015-08-12 11:36:28','',NULL,'2015-08-03 09:58:01','2015-08-03 15:13:11','User',NULL,'only_my_events','2db07237ed623c36d3e5512b52b0c1b3',0,'2015-08-03 15:13:11'),(25,'hezhiwen@happysoft.cc','933995f693d535181641f91410c26194a5a856af','志文','何',0,1,'2015-08-13 11:42:17','',NULL,'2015-08-03 10:01:50','2015-08-06 09:12:23','User',NULL,'all','357fe0824c51162a927600803d07fa4f',0,'2015-08-06 09:12:23'),(26,'sslei','99b1f09a1dcf0c75d73a4dc35c60845a4ce40000','双蕾','孙',0,1,'2015-08-03 10:07:29','',NULL,'2015-08-03 10:07:29','2015-08-03 10:07:29','User',NULL,'only_my_events','d2fef9f275e6c3d1d28659efac7382a5',0,'2015-08-03 10:07:29'),(27,'neil','0b86c4c9765d5c97efcf4272499520890eb2f255','晨飞','户',0,1,'2015-08-12 18:09:38','',NULL,'2015-08-03 10:23:21','2015-08-12 18:09:24','User',NULL,'only_my_events','30a8926e52162e33c069775afb2b8411',0,'2015-08-12 18:09:24'),(28,'hong','e3fcd85abb6a61cbb114a8499d0614c76f45c904','红晓','王',1,1,'2015-08-12 18:49:02','zh',NULL,'2015-08-06 13:58:21','2015-08-06 13:58:21','User',NULL,'only_my_events','31b951bbdbab6a4dc3d77fb86a7d9360',0,'2015-08-06 13:58:21'),(29,'RayBen','88e8f55a4c9cebb4be055b0a4e5f9b1f821aaa97','贲腾 ','贲',0,1,'2015-08-06 23:25:29','',NULL,'2015-08-06 21:00:22','2015-08-06 21:00:22','User',NULL,'only_my_events','a8301ae367984d6d0b8b721e0fde63af',0,'2015-08-06 21:00:22'),(30,'Michael','19ded539d35ce39259a9af55390f751948a9cd91','Michael','Liu',0,1,'2015-08-11 17:26:31','',NULL,'2015-08-06 21:05:10','2015-08-06 21:05:10','User',NULL,'only_my_events','9c5ff380a1f16515800cd5102ad54b21',0,'2015-08-06 21:05:10'),(31,'luyanmin@happysoft.cc','7f652713164fea378dcdd2f72c986b607d99bd78','彦民','卢',0,1,'2015-08-12 10:03:36','',NULL,'2015-08-12 10:03:36','2015-08-12 10:04:51','User',NULL,'all','4d68de7b4792ed0ca17b9669b9474670',0,'2015-08-12 10:03:36'),(32,'zhangmingchang','24380c0cb8f9a3ddc0846afc14ecdfafcf62083c','明常','张',0,1,'2015-08-12 10:03:40','',NULL,'2015-08-12 10:03:40','2015-08-12 10:03:40','User',NULL,'only_my_events','d6b89a2e41e15dd2b734ac17c6c04a67',0,'2015-08-12 10:03:40');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `wiki_page_title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'open',
  `sharing` varchar(255) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `versions_project_id` (`project_id`),
  KEY `index_versions_on_sharing` (`sharing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchers`
--

DROP TABLE IF EXISTS `watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watchable_type` varchar(255) NOT NULL DEFAULT '',
  `watchable_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  KEY `index_watchers_on_user_id` (`user_id`),
  KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchers`
--

LOCK TABLES `watchers` WRITE;
/*!40000 ALTER TABLE `watchers` DISABLE KEYS */;
INSERT INTO `watchers` VALUES (4,'Issue',33,16),(5,'Issue',43,3),(6,'Issue',57,18),(7,'Issue',64,16),(8,'Issue',91,3),(9,'Issue',91,13),(10,'Issue',112,26),(11,'Issue',124,17),(12,'Issue',124,22),(14,'Issue',130,13),(15,'Issue',133,3),(16,'Issue',168,11),(17,'Issue',185,25),(18,'Issue',197,28),(19,'Issue',202,30),(20,'Issue',215,25),(21,'Issue',219,32);
/*!40000 ALTER TABLE `watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_content_versions`
--

DROP TABLE IF EXISTS `wiki_content_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` longblob,
  `compression` varchar(6) DEFAULT '',
  `comments` varchar(255) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  KEY `index_wiki_content_versions_on_updated_on` (`updated_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_content_versions`
--

LOCK TABLES `wiki_content_versions` WRITE;
/*!40000 ALTER TABLE `wiki_content_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_content_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_contents`
--

DROP TABLE IF EXISTS `wiki_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext,
  `comments` varchar(255) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_contents_page_id` (`page_id`),
  KEY `index_wiki_contents_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_contents`
--

LOCK TABLES `wiki_contents` WRITE;
/*!40000 ALTER TABLE `wiki_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_pages`
--

DROP TABLE IF EXISTS `wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  KEY `index_wiki_pages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_pages`
--

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_redirects`
--

DROP TABLE IF EXISTS `wiki_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `redirects_to` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `redirects_to_wiki_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_redirects`
--

LOCK TABLES `wiki_redirects` WRITE;
/*!40000 ALTER TABLE `wiki_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikis`
--

DROP TABLE IF EXISTS `wikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `wikis_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikis`
--

LOCK TABLES `wikis` WRITE;
/*!40000 ALTER TABLE `wikis` DISABLE KEYS */;
INSERT INTO `wikis` VALUES (1,1,'Wiki',1),(2,2,'Wiki',1),(3,3,'Wiki',1);
/*!40000 ALTER TABLE `wikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `old_status_id` int(11) NOT NULL DEFAULT '0',
  `new_status_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `assignee` tinyint(1) NOT NULL DEFAULT '0',
  `author` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(30) DEFAULT NULL,
  `field_name` varchar(30) DEFAULT NULL,
  `rule` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  KEY `index_workflows_on_old_status_id` (`old_status_id`),
  KEY `index_workflows_on_role_id` (`role_id`),
  KEY `index_workflows_on_new_status_id` (`new_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
INSERT INTO `workflows` VALUES (1,1,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(2,1,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(3,1,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(6,1,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(7,1,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(8,1,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(11,1,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(12,1,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(13,1,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(16,1,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(17,1,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(18,1,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(31,2,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(32,2,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(33,2,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(36,2,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(37,2,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(38,2,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(41,2,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(42,2,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(43,2,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(46,2,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(47,2,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(48,2,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(61,3,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(62,3,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(63,3,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(66,3,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(67,3,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(68,3,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(71,3,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(72,3,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(73,3,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(76,3,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(77,3,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(78,3,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(91,1,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(92,1,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(93,1,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(95,1,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(96,1,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(98,1,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(99,1,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(101,1,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(102,1,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(104,2,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(105,2,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(106,2,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(108,2,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(109,2,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(111,2,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(112,2,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(114,2,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(115,2,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(117,3,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(118,3,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(119,3,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(121,3,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(122,3,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(124,3,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(125,3,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(127,3,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(128,3,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(134,1,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(139,2,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(144,3,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(145,1,1,2,3,1,1,'WorkflowTransition',NULL,NULL),(146,1,1,3,3,1,1,'WorkflowTransition',NULL,NULL),(147,1,1,4,3,1,1,'WorkflowTransition',NULL,NULL),(148,1,1,8,3,0,1,'WorkflowTransition',NULL,NULL),(149,1,1,7,3,0,1,'WorkflowTransition',NULL,NULL),(150,1,2,1,3,1,1,'WorkflowTransition',NULL,NULL),(151,1,2,3,3,1,1,'WorkflowTransition',NULL,NULL),(152,1,2,4,3,1,1,'WorkflowTransition',NULL,NULL),(153,1,2,8,3,0,1,'WorkflowTransition',NULL,NULL),(154,1,2,7,3,0,1,'WorkflowTransition',NULL,NULL),(155,1,3,1,3,1,1,'WorkflowTransition',NULL,NULL),(156,1,3,2,3,1,1,'WorkflowTransition',NULL,NULL),(157,1,3,4,3,1,1,'WorkflowTransition',NULL,NULL),(158,1,3,8,3,0,1,'WorkflowTransition',NULL,NULL),(159,1,3,7,3,0,1,'WorkflowTransition',NULL,NULL),(160,1,4,1,3,1,1,'WorkflowTransition',NULL,NULL),(161,1,4,2,3,1,1,'WorkflowTransition',NULL,NULL),(162,1,4,3,3,1,1,'WorkflowTransition',NULL,NULL),(163,1,4,8,3,0,1,'WorkflowTransition',NULL,NULL),(164,1,4,7,3,0,1,'WorkflowTransition',NULL,NULL),(165,1,8,1,3,0,1,'WorkflowTransition',NULL,NULL),(166,1,8,2,3,0,1,'WorkflowTransition',NULL,NULL),(167,1,8,3,3,0,1,'WorkflowTransition',NULL,NULL),(168,1,8,4,3,0,1,'WorkflowTransition',NULL,NULL),(169,1,8,7,3,0,1,'WorkflowTransition',NULL,NULL),(170,1,7,1,3,0,1,'WorkflowTransition',NULL,NULL),(171,1,7,2,3,0,1,'WorkflowTransition',NULL,NULL),(172,1,7,3,3,0,1,'WorkflowTransition',NULL,NULL),(173,1,7,4,3,0,1,'WorkflowTransition',NULL,NULL),(174,1,7,8,3,0,1,'WorkflowTransition',NULL,NULL);
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-13 14:54:45
