-- MySQL dump 10.15  Distrib 10.0.25-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: gogs
-- ------------------------------------------------------
-- Server version	10.0.25-MariaDB

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
-- Current Database: `gogs`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `gogs` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gogs`;

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `mode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_access_S` (`user_id`,`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_token`
--

DROP TABLE IF EXISTS `access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sha1` varchar(40) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_access_token_sha1` (`sha1`),
  KEY `IDX_access_token_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_token`
--

LOCK TABLES `access_token` WRITE;
/*!40000 ALTER TABLE `access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `op_type` int(11) DEFAULT NULL,
  `act_user_id` bigint(20) DEFAULT NULL,
  `act_user_name` varchar(255) DEFAULT NULL,
  `act_email` varchar(255) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `repo_user_name` varchar(255) DEFAULT NULL,
  `repo_name` varchar(255) DEFAULT NULL,
  `ref_name` varchar(255) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `content` text,
  `created` datetime DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` VALUES (1,1,1,1,'gogs','gogs@devops.net',1,'gogs','maven-repo','',0,'','2015-10-30 15:26:42',1446218802),(5,1,1,1,'gogs','gogs@devops.net',5,'gogs','builder-repo','',0,'',NULL,1463127650),(6,1,5,1,'gogs','gogs@devops.net',5,'gogs','builder-repo','master',0,'{\"Len\":1,\"Commits\":[{\"Sha1\":\"586a55b7e66099eb51965cee17ae3a7bb6966f12\",\"Message\":\"first commit\\n\",\"AuthorEmail\":\"gogs@devops.net\",\"AuthorName\":\"gogs\"}],\"CompareUrl\":\"\"}',NULL,1463127824),(7,1,1,1,'gogs','gogs@devops.net',6,'gogs','pamm.seed','',0,'',NULL,1463404252);
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  `release_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_attachment_uuid` (`uuid`),
  KEY `IDX_attachment_issue_id` (`issue_id`),
  KEY `IDX_attachment_release_id` (`release_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collaboration`
--

DROP TABLE IF EXISTS `collaboration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collaboration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `mode` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_collaboration_S` (`repo_id`,`user_id`),
  KEY `IDX_collaboration_repo_id` (`repo_id`),
  KEY `IDX_collaboration_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collaboration`
--

LOCK TABLES `collaboration` WRITE;
/*!40000 ALTER TABLE `collaboration` DISABLE KEYS */;
/*!40000 ALTER TABLE `collaboration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `poster_id` bigint(20) DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `commit_id` bigint(20) DEFAULT NULL,
  `line` bigint(20) DEFAULT NULL,
  `content` text,
  `created` datetime DEFAULT NULL,
  `commit_sha` varchar(40) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_comment_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deploy_key`
--

DROP TABLE IF EXISTS `deploy_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deploy_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fingerprint` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_deploy_key_S` (`key_id`,`repo_id`),
  KEY `IDX_deploy_key_key_id` (`key_id`),
  KEY `IDX_deploy_key_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deploy_key`
--

LOCK TABLES `deploy_key` WRITE;
/*!40000 ALTER TABLE `deploy_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `deploy_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_address`
--

DROP TABLE IF EXISTS `email_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_email_address_email` (`email`),
  KEY `IDX_email_address_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_address`
--

LOCK TABLES `email_address` WRITE;
/*!40000 ALTER TABLE `email_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `follow_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_follow_FOLLOW` (`user_id`,`follow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hook_task`
--

DROP TABLE IF EXISTS `hook_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hook_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `hook_id` bigint(20) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` text,
  `payload_content` text,
  `content_type` int(11) DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `is_ssl` tinyint(1) DEFAULT NULL,
  `is_delivered` tinyint(1) DEFAULT NULL,
  `delivered` bigint(20) DEFAULT NULL,
  `is_succeed` tinyint(1) DEFAULT NULL,
  `request_content` text,
  `response_content` text,
  PRIMARY KEY (`id`),
  KEY `IDX_hook_task_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hook_task`
--

LOCK TABLES `hook_task` WRITE;
/*!40000 ALTER TABLE `hook_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `hook_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `index` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `poster_id` bigint(20) DEFAULT NULL,
  `milestone_id` bigint(20) DEFAULT NULL,
  `assignee_id` bigint(20) DEFAULT NULL,
  `is_pull` tinyint(1) DEFAULT NULL,
  `is_closed` tinyint(1) DEFAULT NULL,
  `content` text,
  `priority` int(11) DEFAULT NULL,
  `num_comments` int(11) DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `deadline_unix` bigint(20) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_issue_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_label`
--

DROP TABLE IF EXISTS `issue_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_issue_label_S` (`issue_id`,`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_label`
--

LOCK TABLES `issue_label` WRITE;
/*!40000 ALTER TABLE `issue_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_user`
--

DROP TABLE IF EXISTS `issue_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `milestone_id` bigint(20) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_assigned` tinyint(1) DEFAULT NULL,
  `is_mentioned` tinyint(1) DEFAULT NULL,
  `is_poster` tinyint(1) DEFAULT NULL,
  `is_closed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_issue_user_uid` (`uid`),
  KEY `IDX_issue_user_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_user`
--

LOCK TABLES `issue_user` WRITE;
/*!40000 ALTER TABLE `issue_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `num_issues` int(11) DEFAULT NULL,
  `num_closed_issues` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_label_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
/*!40000 ALTER TABLE `label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_source`
--

DROP TABLE IF EXISTS `login_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_actived` tinyint(1) NOT NULL DEFAULT '0',
  `cfg` text,
  `allow_auto_register` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_login_source_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_source`
--

LOCK TABLES `login_source` WRITE;
/*!40000 ALTER TABLE `login_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestone`
--

DROP TABLE IF EXISTS `milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `is_closed` tinyint(1) DEFAULT NULL,
  `num_issues` int(11) DEFAULT NULL,
  `num_closed_issues` int(11) DEFAULT NULL,
  `completeness` int(11) DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `deadline_unix` bigint(20) DEFAULT NULL,
  `closed_date_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_milestone_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestone`
--

LOCK TABLES `milestone` WRITE;
/*!40000 ALTER TABLE `milestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirror`
--

DROP TABLE IF EXISTS `mirror`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirror` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `interval` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `next_update` datetime DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  `next_update_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirror`
--

LOCK TABLES `mirror` WRITE;
/*!40000 ALTER TABLE `mirror` DISABLE KEYS */;
/*!40000 ALTER TABLE `mirror` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `description` text,
  `created` datetime DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2`
--

DROP TABLE IF EXISTS `oauth2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `token` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_oauth2_S` (`uid`,`type`,`identity`),
  UNIQUE KEY `UQE_oauth2_OAUTH` (`type`,`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2`
--

LOCK TABLES `oauth2` WRITE;
/*!40000 ALTER TABLE `oauth2` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_user`
--

DROP TABLE IF EXISTS `org_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `is_owner` tinyint(1) DEFAULT NULL,
  `num_teams` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_org_user_S` (`uid`,`org_id`),
  KEY `IDX_org_user_uid` (`uid`),
  KEY `IDX_org_user_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_user`
--

LOCK TABLES `org_user` WRITE;
/*!40000 ALTER TABLE `org_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_key`
--

DROP TABLE IF EXISTS `public_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `mode` int(11) NOT NULL DEFAULT '2',
  `type` int(11) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_public_key_owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_key`
--

LOCK TABLES `public_key` WRITE;
/*!40000 ALTER TABLE `public_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pull_request`
--

DROP TABLE IF EXISTS `pull_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pull_id` bigint(20) DEFAULT NULL,
  `pull_index` bigint(20) DEFAULT NULL,
  `head_repo_id` bigint(20) DEFAULT NULL,
  `base_repo_id` bigint(20) DEFAULT NULL,
  `head_user_name` varchar(255) DEFAULT NULL,
  `head_barcnh` varchar(255) DEFAULT NULL,
  `base_branch` varchar(255) DEFAULT NULL,
  `merge_base` varchar(40) DEFAULT NULL,
  `merged_commit_id` varchar(40) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `can_auto_merge` tinyint(1) DEFAULT NULL,
  `has_merged` tinyint(1) DEFAULT NULL,
  `merged` datetime DEFAULT NULL,
  `merger_id` bigint(20) DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `index` bigint(20) DEFAULT NULL,
  `head_branch` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `merged_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_pull_request_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pull_request`
--

LOCK TABLES `pull_request` WRITE;
/*!40000 ALTER TABLE `pull_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `pull_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release`
--

DROP TABLE IF EXISTS `release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `release` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `publisher_id` bigint(20) DEFAULT NULL,
  `tag_name` varchar(255) DEFAULT NULL,
  `lower_tag_name` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sha1` varchar(40) DEFAULT NULL,
  `num_commits` int(11) DEFAULT NULL,
  `note` text,
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `is_prerelease` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release`
--

LOCK TABLES `release` WRITE;
/*!40000 ALTER TABLE `release` DISABLE KEYS */;
/*!40000 ALTER TABLE `release` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository`
--

DROP TABLE IF EXISTS `repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) DEFAULT NULL,
  `lower_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `default_branch` varchar(255) DEFAULT NULL,
  `num_watches` int(11) DEFAULT NULL,
  `num_stars` int(11) DEFAULT NULL,
  `num_forks` int(11) DEFAULT NULL,
  `num_issues` int(11) DEFAULT NULL,
  `num_closed_issues` int(11) DEFAULT NULL,
  `num_pulls` int(11) DEFAULT NULL,
  `num_closed_pulls` int(11) DEFAULT NULL,
  `num_milestones` int(11) NOT NULL DEFAULT '0',
  `num_closed_milestones` int(11) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) DEFAULT NULL,
  `is_bare` tinyint(1) DEFAULT NULL,
  `is_mirror` tinyint(1) DEFAULT NULL,
  `is_fork` tinyint(1) NOT NULL DEFAULT '0',
  `fork_id` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `enable_wiki` tinyint(1) NOT NULL DEFAULT '1',
  `enable_external_wiki` tinyint(1) DEFAULT NULL,
  `external_wiki_url` varchar(255) DEFAULT NULL,
  `enable_issues` tinyint(1) NOT NULL DEFAULT '1',
  `enable_external_tracker` tinyint(1) DEFAULT NULL,
  `external_tracker_format` varchar(255) DEFAULT NULL,
  `enable_pulls` tinyint(1) NOT NULL DEFAULT '1',
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_repository_S` (`owner_id`,`lower_name`),
  KEY `IDX_repository_name` (`name`),
  KEY `IDX_repository_lower_name` (`lower_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository`
--

LOCK TABLES `repository` WRITE;
/*!40000 ALTER TABLE `repository` DISABLE KEYS */;
INSERT INTO `repository` VALUES (1,1,'maven-repo','maven-repo','','','master',1,0,0,0,0,0,0,0,0,0,0,0,0,0,'2015-10-30 15:26:42','2015-10-30 15:26:42',1,NULL,NULL,1,NULL,NULL,1,1446218802,1446218802),(5,1,'builder-repo','builder-repo','Empty builder repository','','master',1,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,1,0,'',1,0,'',1,1463127650,1463127824),(6,1,'pamm.seed','pamm.seed','','','master',1,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,1,0,'',1,0,'',1,1463404252,1463404252);
/*!40000 ALTER TABLE `repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_star_S` (`uid`,`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) DEFAULT NULL,
  `lower_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `authorize` int(11) DEFAULT NULL,
  `num_repos` int(11) DEFAULT NULL,
  `num_members` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_team_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_repo`
--

DROP TABLE IF EXISTS `team_repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_repo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_repo_S` (`team_id`,`repo_id`),
  KEY `IDX_team_repo_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_repo`
--

LOCK TABLES `team_repo` WRITE;
/*!40000 ALTER TABLE `team_repo` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_repo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_user`
--

DROP TABLE IF EXISTS `team_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_user_S` (`team_id`,`uid`),
  KEY `IDX_team_user_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_user`
--

LOCK TABLES `team_user` WRITE;
/*!40000 ALTER TABLE `team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update_task`
--

DROP TABLE IF EXISTS `update_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `update_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `ref_name` varchar(255) DEFAULT NULL,
  `old_commit_id` varchar(255) DEFAULT NULL,
  `new_commit_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_update_task_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update_task`
--

LOCK TABLES `update_task` WRITE;
/*!40000 ALTER TABLE `update_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `update_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lower_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `login_type` int(11) DEFAULT NULL,
  `login_source` bigint(20) NOT NULL DEFAULT '0',
  `login_name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `rands` varchar(10) DEFAULT NULL,
  `salt` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `last_repo_visibility` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `allow_git_hook` tinyint(1) DEFAULT NULL,
  `avatar` varchar(2048) NOT NULL,
  `avatar_email` varchar(255) NOT NULL,
  `use_custom_avatar` tinyint(1) DEFAULT NULL,
  `num_followers` int(11) DEFAULT NULL,
  `num_followings` int(11) DEFAULT NULL,
  `num_stars` int(11) DEFAULT NULL,
  `num_repos` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `num_teams` int(11) DEFAULT NULL,
  `num_members` int(11) DEFAULT NULL,
  `max_repo_creation` int(11) NOT NULL DEFAULT '-1',
  `allow_import_local` tinyint(1) DEFAULT NULL,
  `num_following` int(11) NOT NULL DEFAULT '0',
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_lower_name` (`lower_name`),
  UNIQUE KEY `UQE_user_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'gogs','gogs','','gogs@devops.net','ece2d30dde64b0ce933bf0fa47b809e3960e151f4d4da8b576d3c42f79dd9ddad8383505d754546fe8604d407a36822a3bc5',0,0,'',0,'','','MgQxgpFO3T','8nqtZmOG08','2015-10-30 15:26:09','2016-03-08 09:32:01',0,1,1,0,'215bf0afb9698ccfbd896d10b5dd4875','gogs@devops.net',0,0,0,0,3,'',0,0,-1,0,0,1446218769,1463404252);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,12);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch`
--

DROP TABLE IF EXISTS `watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_watch_WATCH` (`user_id`,`repo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch`
--

LOCK TABLES `watch` WRITE;
/*!40000 ALTER TABLE `watch` DISABLE KEYS */;
INSERT INTO `watch` VALUES (1,1,1),(5,1,5),(6,1,6);
/*!40000 ALTER TABLE `watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook`
--

DROP TABLE IF EXISTS `webhook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webhook` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `url` text,
  `content_type` int(11) DEFAULT NULL,
  `secret` text,
  `events` text,
  `is_ssl` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `hook_task_type` int(11) DEFAULT NULL,
  `meta` text,
  `last_status` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook`
--

LOCK TABLES `webhook` WRITE;
/*!40000 ALTER TABLE `webhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-16 13:12:17