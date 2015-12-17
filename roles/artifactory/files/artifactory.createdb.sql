-- MySQL dump 10.15  Distrib 10.0.22-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: artifactory
-- ------------------------------------------------------
-- Server version	10.0.22-MariaDB

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
-- Current Database: `artifactory`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `artifactory` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `artifactory`;

--
-- Table structure for table `aces`
--

DROP TABLE IF EXISTS `aces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aces` (
  `ace_id` bigint(20) NOT NULL,
  `acl_id` bigint(20) NOT NULL,
  `mask` smallint(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ace_id`),
  KEY `aces_acls_fk` (`acl_id`),
  KEY `aces_users_fk` (`user_id`),
  KEY `aces_groups_fk` (`group_id`),
  CONSTRAINT `aces_acls_fk` FOREIGN KEY (`acl_id`) REFERENCES `acls` (`acl_id`),
  CONSTRAINT `aces_groups_fk` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`),
  CONSTRAINT `aces_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aces`
--

LOCK TABLES `aces` WRITE;
/*!40000 ALTER TABLE `aces` DISABLE KEYS */;
INSERT INTO `aces` VALUES (19,18,1,15,NULL),(20,18,1,NULL,16),(23,22,3,15,NULL);
/*!40000 ALTER TABLE `aces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acls`
--

DROP TABLE IF EXISTS `acls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acls` (
  `acl_id` bigint(20) NOT NULL,
  `perm_target_id` bigint(20) DEFAULT NULL,
  `modified` bigint(20) DEFAULT NULL,
  `modified_by` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`acl_id`),
  KEY `acls_perm_target_id_idx` (`perm_target_id`),
  CONSTRAINT `acls_permission_targets_fk` FOREIGN KEY (`perm_target_id`) REFERENCES `permission_targets` (`perm_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acls`
--

LOCK TABLES `acls` WRITE;
/*!40000 ALTER TABLE `acls` DISABLE KEYS */;
INSERT INTO `acls` VALUES (18,17,1446644585951,'_system_'),(22,21,1446644586004,'_system_');
/*!40000 ALTER TABLE `acls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_names`
--

DROP TABLE IF EXISTS `archive_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive_names` (
  `name_id` bigint(20) NOT NULL,
  `entry_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`name_id`),
  UNIQUE KEY `archive_names_name_idx` (`entry_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_names`
--

LOCK TABLES `archive_names` WRITE;
/*!40000 ALTER TABLE `archive_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_paths`
--

DROP TABLE IF EXISTS `archive_paths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive_paths` (
  `path_id` bigint(20) NOT NULL,
  `entry_path` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`path_id`),
  KEY `archive_paths_path_idx` (`entry_path`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_paths`
--

LOCK TABLES `archive_paths` WRITE;
/*!40000 ALTER TABLE `archive_paths` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive_paths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artifactory_servers`
--

DROP TABLE IF EXISTS `artifactory_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifactory_servers` (
  `server_id` varchar(41) COLLATE utf8_bin NOT NULL,
  `start_time` bigint(20) NOT NULL,
  `context_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `membership_port` int(11) DEFAULT NULL,
  `server_state` varchar(12) COLLATE utf8_bin NOT NULL,
  `server_role` varchar(12) COLLATE utf8_bin NOT NULL,
  `last_heartbeat` bigint(20) NOT NULL,
  `artifactory_version` varchar(30) COLLATE utf8_bin NOT NULL,
  `artifactory_revision` int(11) DEFAULT NULL,
  `artifactory_release` bigint(20) DEFAULT NULL,
  `artifactory_running_mode` varchar(12) COLLATE utf8_bin NOT NULL,
  `license_hash` varchar(41) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifactory_servers`
--

LOCK TABLES `artifactory_servers` WRITE;
/*!40000 ALTER TABLE `artifactory_servers` DISABLE KEYS */;
INSERT INTO `artifactory_servers` VALUES ('Artifactory',1446644586131,'',0,'RUNNING','STANDALONE',1446645325714,'4.2.0',40030,1445160545149,'OSS','Artifactory OSS');
/*!40000 ALTER TABLE `artifactory_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `binaries`
--

DROP TABLE IF EXISTS `binaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `binaries` (
  `sha1` char(40) COLLATE utf8_bin NOT NULL,
  `md5` char(32) COLLATE utf8_bin NOT NULL,
  `bin_length` bigint(20) NOT NULL,
  PRIMARY KEY (`sha1`),
  UNIQUE KEY `binaries_md5_idx` (`md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binaries`
--

LOCK TABLES `binaries` WRITE;
/*!40000 ALTER TABLE `binaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `binaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `binary_blobs`
--

DROP TABLE IF EXISTS `binary_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `binary_blobs` (
  `sha1` char(40) COLLATE utf8_bin NOT NULL,
  `data` longblob,
  PRIMARY KEY (`sha1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binary_blobs`
--

LOCK TABLES `binary_blobs` WRITE;
/*!40000 ALTER TABLE `binary_blobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `binary_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_artifacts`
--

DROP TABLE IF EXISTS `build_artifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_artifacts` (
  `artifact_id` bigint(20) NOT NULL,
  `module_id` bigint(20) NOT NULL,
  `artifact_name` varchar(1024) COLLATE utf8_bin NOT NULL,
  `artifact_type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `sha1` char(40) COLLATE utf8_bin DEFAULT NULL,
  `md5` char(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`artifact_id`),
  KEY `build_artifacts_module_id_idx` (`module_id`),
  KEY `build_artifacts_sha1_idx` (`sha1`),
  KEY `build_artifacts_md5_idx` (`md5`),
  CONSTRAINT `build_artifacts_modules_fk` FOREIGN KEY (`module_id`) REFERENCES `build_modules` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_artifacts`
--

LOCK TABLES `build_artifacts` WRITE;
/*!40000 ALTER TABLE `build_artifacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_artifacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_dependencies`
--

DROP TABLE IF EXISTS `build_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_dependencies` (
  `dependency_id` bigint(20) NOT NULL,
  `module_id` bigint(20) NOT NULL,
  `dependency_name_id` varchar(1024) COLLATE utf8_bin NOT NULL,
  `dependency_scopes` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `dependency_type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `sha1` char(40) COLLATE utf8_bin DEFAULT NULL,
  `md5` char(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`dependency_id`),
  KEY `build_dependencies_module_idx` (`module_id`),
  KEY `build_dependencies_sha1_idx` (`sha1`),
  KEY `build_dependencies_md5_idx` (`md5`),
  CONSTRAINT `build_dependencies_modules_fk` FOREIGN KEY (`module_id`) REFERENCES `build_modules` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_dependencies`
--

LOCK TABLES `build_dependencies` WRITE;
/*!40000 ALTER TABLE `build_dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_jsons`
--

DROP TABLE IF EXISTS `build_jsons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_jsons` (
  `build_id` bigint(20) NOT NULL,
  `build_info_json` longblob,
  PRIMARY KEY (`build_id`),
  CONSTRAINT `build_jsons_builds_fk` FOREIGN KEY (`build_id`) REFERENCES `builds` (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_jsons`
--

LOCK TABLES `build_jsons` WRITE;
/*!40000 ALTER TABLE `build_jsons` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_jsons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_modules`
--

DROP TABLE IF EXISTS `build_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_modules` (
  `module_id` bigint(20) NOT NULL,
  `build_id` bigint(20) NOT NULL,
  `module_name_id` varchar(1024) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`module_id`),
  KEY `build_modules_build_id_idx` (`build_id`),
  CONSTRAINT `build_modules_builds_fk` FOREIGN KEY (`build_id`) REFERENCES `builds` (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_modules`
--

LOCK TABLES `build_modules` WRITE;
/*!40000 ALTER TABLE `build_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_promotions`
--

DROP TABLE IF EXISTS `build_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_promotions` (
  `build_id` bigint(20) NOT NULL,
  `created` bigint(20) NOT NULL,
  `created_by` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(64) COLLATE utf8_bin NOT NULL,
  `repo` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `promotion_comment` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `ci_user` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  UNIQUE KEY `build_promotions_created_idx` (`build_id`,`created`),
  KEY `build_promotions_status_idx` (`status`),
  CONSTRAINT `build_promotions_builds_fk` FOREIGN KEY (`build_id`) REFERENCES `builds` (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_promotions`
--

LOCK TABLES `build_promotions` WRITE;
/*!40000 ALTER TABLE `build_promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_props`
--

DROP TABLE IF EXISTS `build_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_props` (
  `prop_id` bigint(20) NOT NULL,
  `build_id` bigint(20) NOT NULL,
  `prop_key` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prop_value` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`prop_id`),
  KEY `build_props_build_id_idx` (`build_id`),
  KEY `build_props_prop_key_idx` (`prop_key`),
  KEY `build_props_prop_value_idx` (`prop_value`(255)),
  CONSTRAINT `build_props_builds_fk` FOREIGN KEY (`build_id`) REFERENCES `builds` (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_props`
--

LOCK TABLES `build_props` WRITE;
/*!40000 ALTER TABLE `build_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `builds`
--

DROP TABLE IF EXISTS `builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `builds` (
  `build_id` bigint(20) NOT NULL,
  `build_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `build_number` varchar(255) COLLATE utf8_bin NOT NULL,
  `build_date` bigint(20) NOT NULL,
  `ci_url` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `created` bigint(20) NOT NULL,
  `created_by` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `modified` bigint(20) DEFAULT NULL,
  `modified_by` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`build_id`),
  UNIQUE KEY `builds_name_number_date_idx` (`build_name`,`build_number`,`build_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `builds`
--

LOCK TABLES `builds` WRITE;
/*!40000 ALTER TABLE `builds` DISABLE KEYS */;
/*!40000 ALTER TABLE `builds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs` (
  `config_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `data` longblob NOT NULL,
  PRIMARY KEY (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
INSERT INTO `configs` VALUES ('artifactory.config.xml','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<config xmlns=\"http://artifactory.jfrog.org/xsd/1.6.3\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.jfrog.org/xsd/artifactory-v1_6_3.xsd\">\n    <offlineMode>false</offlineMode>\n    <helpLinksEnabled>true</helpLinksEnabled>\n    <fileUploadMaxSizeMb>0</fileUploadMaxSizeMb>\n    <dateFormat>dd-MM-yy HH:mm:ss z</dateFormat>\n    <addons>\n        <showAddonsInfo>true</showAddonsInfo>\n        <showAddonsInfoCookie>1446644584651</showAddonsInfoCookie>\n    </addons>\n    <bintrayConfig>\n        <fileUploadLimit>0</fileUploadLimit>\n    </bintrayConfig>\n    <security>\n        <anonAccessEnabled>true</anonAccessEnabled>\n        <anonAccessToBuildInfosDisabled>false</anonAccessToBuildInfosDisabled>\n        <hideUnauthorizedResources>false</hideUnauthorizedResources>\n        <passwordSettings>\n            <encryptionPolicy>supported</encryptionPolicy>\n        </passwordSettings>\n        <ldapSettings/>\n        <ldapGroupSettings/>\n    </security>\n    <backups>\n        <backup>\n            <key>backup-daily</key>\n            <enabled>true</enabled>\n            <cronExp>0 0 2 ? * MON-FRI</cronExp>\n            <retentionPeriodHours>0</retentionPeriodHours>\n            <createArchive>false</createArchive>\n            <excludedRepositories>\n                <repositoryRef>jcenter</repositoryRef>\n            </excludedRepositories>\n            <sendMailOnError>true</sendMailOnError>\n            <excludeBuilds>false</excludeBuilds>\n            <excludeNewRepositories>false</excludeNewRepositories>\n        </backup>\n        <backup>\n            <key>backup-weekly</key>\n            <enabled>false</enabled>\n            <cronExp>0 0 2 ? * SAT</cronExp>\n            <retentionPeriodHours>336</retentionPeriodHours>\n            <createArchive>false</createArchive>\n            <excludedRepositories>\n                <repositoryRef>jcenter</repositoryRef>\n            </excludedRepositories>\n            <sendMailOnError>true</sendMailOnError>\n            <excludeBuilds>false</excludeBuilds>\n            <excludeNewRepositories>false</excludeNewRepositories>\n        </backup>\n    </backups>\n    <indexer>\n        <enabled>false</enabled>\n        <cronExp>0 23 5 * * ?</cronExp>\n    </indexer>\n    <localRepositories>\n        <localRepository>\n            <key>ext-release-local</key>\n            <type>maven</type>\n            <description>Local repository for third party libraries</description>\n            <includesPattern>**/*</includesPattern>\n            <repoLayoutRef>maven-2-default</repoLayoutRef>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <blackedOut>false</blackedOut>\n            <handleReleases>true</handleReleases>\n            <handleSnapshots>false</handleSnapshots>\n            <maxUniqueSnapshots>0</maxUniqueSnapshots>\n            <suppressPomConsistencyChecks>true</suppressPomConsistencyChecks>\n            <propertySets/>\n            <archiveBrowsingEnabled>false</archiveBrowsingEnabled>\n            <snapshotVersionBehavior>unique</snapshotVersionBehavior>\n            <localRepoChecksumPolicyType>client-checksums</localRepoChecksumPolicyType>\n            <calculateYumMetadata>false</calculateYumMetadata>\n            <yumRootDepth>0</yumRootDepth>\n            <debianTrivialLayout>false</debianTrivialLayout>\n        </localRepository>\n        <localRepository>\n            <key>ext-snapshot-local</key>\n            <type>maven</type>\n            <description>Local repository for third party snapshots</description>\n            <includesPattern>**/*</includesPattern>\n            <repoLayoutRef>maven-2-default</repoLayoutRef>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <blackedOut>false</blackedOut>\n            <handleReleases>false</handleReleases>\n            <handleSnapshots>true</handleSnapshots>\n            <maxUniqueSnapshots>0</maxUniqueSnapshots>\n            <suppressPomConsistencyChecks>true</suppressPomConsistencyChecks>\n            <propertySets/>\n            <archiveBrowsingEnabled>false</archiveBrowsingEnabled>\n            <snapshotVersionBehavior>unique</snapshotVersionBehavior>\n            <localRepoChecksumPolicyType>client-checksums</localRepoChecksumPolicyType>\n            <calculateYumMetadata>false</calculateYumMetadata>\n            <yumRootDepth>0</yumRootDepth>\n            <debianTrivialLayout>false</debianTrivialLayout>\n        </localRepository>\n        <localRepository>\n            <key>jenkins-maven-release</key>\n            <type>maven</type>\n            <includesPattern>**/*</includesPattern>\n            <repoLayoutRef>maven-2-default</repoLayoutRef>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <blackedOut>false</blackedOut>\n            <handleReleases>true</handleReleases>\n            <handleSnapshots>true</handleSnapshots>\n            <maxUniqueSnapshots>0</maxUniqueSnapshots>\n            <suppressPomConsistencyChecks>false</suppressPomConsistencyChecks>\n            <propertySets/>\n            <archiveBrowsingEnabled>false</archiveBrowsingEnabled>\n            <snapshotVersionBehavior>unique</snapshotVersionBehavior>\n            <localRepoChecksumPolicyType>client-checksums</localRepoChecksumPolicyType>\n            <calculateYumMetadata>false</calculateYumMetadata>\n            <yumRootDepth>0</yumRootDepth>\n            <debianTrivialLayout>false</debianTrivialLayout>\n        </localRepository>\n        <localRepository>\n            <key>jenkins-maven-snapshot</key>\n            <type>maven</type>\n            <includesPattern>**/*</includesPattern>\n            <repoLayoutRef>maven-2-default</repoLayoutRef>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <blackedOut>false</blackedOut>\n            <handleReleases>true</handleReleases>\n            <handleSnapshots>true</handleSnapshots>\n            <maxUniqueSnapshots>0</maxUniqueSnapshots>\n            <suppressPomConsistencyChecks>false</suppressPomConsistencyChecks>\n            <propertySets/>\n            <archiveBrowsingEnabled>false</archiveBrowsingEnabled>\n            <snapshotVersionBehavior>unique</snapshotVersionBehavior>\n            <localRepoChecksumPolicyType>client-checksums</localRepoChecksumPolicyType>\n            <calculateYumMetadata>false</calculateYumMetadata>\n            <yumRootDepth>0</yumRootDepth>\n            <debianTrivialLayout>false</debianTrivialLayout>\n        </localRepository>\n        <localRepository>\n            <key>libs-release-local</key>\n            <type>maven</type>\n            <description>Local repository for in-house libraries</description>\n            <includesPattern>**/*</includesPattern>\n            <repoLayoutRef>maven-2-default</repoLayoutRef>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <blackedOut>false</blackedOut>\n            <handleReleases>true</handleReleases>\n            <handleSnapshots>false</handleSnapshots>\n            <maxUniqueSnapshots>0</maxUniqueSnapshots>\n            <suppressPomConsistencyChecks>true</suppressPomConsistencyChecks>\n            <propertySets/>\n            <archiveBrowsingEnabled>false</archiveBrowsingEnabled>\n            <snapshotVersionBehavior>unique</snapshotVersionBehavior>\n            <localRepoChecksumPolicyType>client-checksums</localRepoChecksumPolicyType>\n            <calculateYumMetadata>false</calculateYumMetadata>\n            <yumRootDepth>0</yumRootDepth>\n            <debianTrivialLayout>false</debianTrivialLayout>\n        </localRepository>\n        <localRepository>\n            <key>libs-snapshot-local</key>\n            <type>maven</type>\n            <description>Local repository for in-house snapshots</description>\n            <includesPattern>**/*</includesPattern>\n            <repoLayoutRef>maven-2-default</repoLayoutRef>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <blackedOut>false</blackedOut>\n            <handleReleases>false</handleReleases>\n            <handleSnapshots>true</handleSnapshots>\n            <maxUniqueSnapshots>0</maxUniqueSnapshots>\n            <suppressPomConsistencyChecks>true</suppressPomConsistencyChecks>\n            <propertySets/>\n            <archiveBrowsingEnabled>false</archiveBrowsingEnabled>\n            <snapshotVersionBehavior>unique</snapshotVersionBehavior>\n            <localRepoChecksumPolicyType>client-checksums</localRepoChecksumPolicyType>\n            <calculateYumMetadata>false</calculateYumMetadata>\n            <yumRootDepth>0</yumRootDepth>\n            <debianTrivialLayout>false</debianTrivialLayout>\n        </localRepository>\n        <localRepository>\n            <key>plugins-release-local</key>\n            <type>maven</type>\n            <description>Local repository for plugins</description>\n            <includesPattern>**/*</includesPattern>\n            <repoLayoutRef>maven-2-default</repoLayoutRef>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <blackedOut>false</blackedOut>\n            <handleReleases>true</handleReleases>\n            <handleSnapshots>false</handleSnapshots>\n            <maxUniqueSnapshots>0</maxUniqueSnapshots>\n            <suppressPomConsistencyChecks>true</suppressPomConsistencyChecks>\n            <propertySets/>\n            <archiveBrowsingEnabled>false</archiveBrowsingEnabled>\n            <snapshotVersionBehavior>unique</snapshotVersionBehavior>\n            <localRepoChecksumPolicyType>client-checksums</localRepoChecksumPolicyType>\n            <calculateYumMetadata>false</calculateYumMetadata>\n            <yumRootDepth>0</yumRootDepth>\n            <debianTrivialLayout>false</debianTrivialLayout>\n        </localRepository>\n        <localRepository>\n            <key>plugins-snapshot-local</key>\n            <type>maven</type>\n            <description>Local repository for plugins snapshots</description>\n            <includesPattern>**/*</includesPattern>\n            <repoLayoutRef>maven-2-default</repoLayoutRef>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <blackedOut>false</blackedOut>\n            <handleReleases>false</handleReleases>\n            <handleSnapshots>true</handleSnapshots>\n            <maxUniqueSnapshots>0</maxUniqueSnapshots>\n            <suppressPomConsistencyChecks>true</suppressPomConsistencyChecks>\n            <propertySets/>\n            <archiveBrowsingEnabled>false</archiveBrowsingEnabled>\n            <snapshotVersionBehavior>unique</snapshotVersionBehavior>\n            <localRepoChecksumPolicyType>client-checksums</localRepoChecksumPolicyType>\n            <calculateYumMetadata>false</calculateYumMetadata>\n            <yumRootDepth>0</yumRootDepth>\n            <debianTrivialLayout>false</debianTrivialLayout>\n        </localRepository>\n    </localRepositories>\n    <remoteRepositories>\n        <remoteRepository>\n            <key>jcenter</key>\n            <type>maven</type>\n            <description>Bintray Central Java repository</description>\n            <includesPattern>**/*</includesPattern>\n            <repoLayoutRef>maven-2-default</repoLayoutRef>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <blackedOut>false</blackedOut>\n            <handleReleases>true</handleReleases>\n            <handleSnapshots>false</handleSnapshots>\n            <maxUniqueSnapshots>0</maxUniqueSnapshots>\n            <suppressPomConsistencyChecks>true</suppressPomConsistencyChecks>\n            <propertySets/>\n            <archiveBrowsingEnabled>false</archiveBrowsingEnabled>\n            <url>http://jcenter.bintray.com</url>\n            <offline>false</offline>\n            <hardFail>false</hardFail>\n            <storeArtifactsLocally>true</storeArtifactsLocally>\n            <fetchJarsEagerly>false</fetchJarsEagerly>\n            <fetchSourcesEagerly>false</fetchSourcesEagerly>\n            <retrievalCachePeriodSecs>600</retrievalCachePeriodSecs>\n            <assumedOfflinePeriodSecs>300</assumedOfflinePeriodSecs>\n            <missedRetrievalCachePeriodSecs>1800</missedRetrievalCachePeriodSecs>\n            <remoteRepoChecksumPolicyType>generate-if-absent</remoteRepoChecksumPolicyType>\n            <unusedArtifactsCleanupPeriodHours>0</unusedArtifactsCleanupPeriodHours>\n            <shareConfiguration>false</shareConfiguration>\n            <synchronizeProperties>false</synchronizeProperties>\n            <listRemoteFolderItems>true</listRemoteFolderItems>\n            <rejectInvalidJars>false</rejectInvalidJars>\n            <allowAnyHostAuth>false</allowAnyHostAuth>\n            <socketTimeoutMillis>15000</socketTimeoutMillis>\n            <enableCookieManagement>false</enableCookieManagement>\n            <enableTokenAuthentication>false</enableTokenAuthentication>\n        </remoteRepository>\n    </remoteRepositories>\n    <virtualRepositories>\n        <virtualRepository>\n            <key>libs-release</key>\n            <type>maven</type>\n            <includesPattern>**/*</includesPattern>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <artifactoryRequestsCanRetrieveRemoteArtifacts>false</artifactoryRequestsCanRetrieveRemoteArtifacts>\n            <repositories>\n                <repositoryRef>libs-release-local</repositoryRef>\n                <repositoryRef>ext-release-local</repositoryRef>\n                <repositoryRef>remote-repos</repositoryRef>\n            </repositories>\n            <pomRepositoryReferencesCleanupPolicy>discard_active_reference</pomRepositoryReferencesCleanupPolicy>\n        </virtualRepository>\n        <virtualRepository>\n            <key>libs-snapshot</key>\n            <type>maven</type>\n            <includesPattern>**/*</includesPattern>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <artifactoryRequestsCanRetrieveRemoteArtifacts>false</artifactoryRequestsCanRetrieveRemoteArtifacts>\n            <repositories>\n                <repositoryRef>libs-snapshot-local</repositoryRef>\n                <repositoryRef>ext-snapshot-local</repositoryRef>\n                <repositoryRef>remote-repos</repositoryRef>\n            </repositories>\n            <pomRepositoryReferencesCleanupPolicy>discard_active_reference</pomRepositoryReferencesCleanupPolicy>\n        </virtualRepository>\n        <virtualRepository>\n            <key>plugins-release</key>\n            <type>maven</type>\n            <includesPattern>**/*</includesPattern>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <artifactoryRequestsCanRetrieveRemoteArtifacts>false</artifactoryRequestsCanRetrieveRemoteArtifacts>\n            <repositories>\n                <repositoryRef>plugins-release-local</repositoryRef>\n                <repositoryRef>ext-release-local</repositoryRef>\n                <repositoryRef>remote-repos</repositoryRef>\n            </repositories>\n            <pomRepositoryReferencesCleanupPolicy>discard_active_reference</pomRepositoryReferencesCleanupPolicy>\n        </virtualRepository>\n        <virtualRepository>\n            <key>plugins-snapshot</key>\n            <type>maven</type>\n            <includesPattern>**/*</includesPattern>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <artifactoryRequestsCanRetrieveRemoteArtifacts>false</artifactoryRequestsCanRetrieveRemoteArtifacts>\n            <repositories>\n                <repositoryRef>plugins-snapshot-local</repositoryRef>\n                <repositoryRef>ext-snapshot-local</repositoryRef>\n                <repositoryRef>remote-repos</repositoryRef>\n            </repositories>\n            <pomRepositoryReferencesCleanupPolicy>discard_active_reference</pomRepositoryReferencesCleanupPolicy>\n        </virtualRepository>\n        <virtualRepository>\n            <key>remote-repos</key>\n            <type>maven</type>\n            <includesPattern>**/*</includesPattern>\n            <dockerApiVersion>V1</dockerApiVersion>\n            <forceDockerAuthentication>false</forceDockerAuthentication>\n            <forceNugetAuthentication>false</forceNugetAuthentication>\n            <artifactoryRequestsCanRetrieveRemoteArtifacts>true</artifactoryRequestsCanRetrieveRemoteArtifacts>\n            <repositories>\n                <repositoryRef>jcenter</repositoryRef>\n            </repositories>\n            <pomRepositoryReferencesCleanupPolicy>discard_active_reference</pomRepositoryReferencesCleanupPolicy>\n        </virtualRepository>\n    </virtualRepositories>\n    <proxies/>\n    <propertySets/>\n    <urlBase>http://127.0.0.1/artifactory</urlBase>\n    <repoLayouts>\n        <repoLayout>\n            <name>maven-2-default</name>\n            <artifactPathPattern>[orgPath]/[module]/[baseRev](-[folderItegRev])/[module]-[baseRev](-[fileItegRev])(-[classifier]).[ext]</artifactPathPattern>\n            <distinctiveDescriptorPathPattern>true</distinctiveDescriptorPathPattern>\n            <descriptorPathPattern>[orgPath]/[module]/[baseRev](-[folderItegRev])/[module]-[baseRev](-[fileItegRev])(-[classifier]).pom</descriptorPathPattern>\n            <folderIntegrationRevisionRegExp>SNAPSHOT</folderIntegrationRevisionRegExp>\n            <fileIntegrationRevisionRegExp>SNAPSHOT|(?:(?:[0-9]{8}.[0-9]{6})-(?:[0-9]+))</fileIntegrationRevisionRegExp>\n        </repoLayout>\n        <repoLayout>\n            <name>ivy-default</name>\n            <artifactPathPattern>[org]/[module]/[baseRev](-[folderItegRev])/[type]s/[module](-[classifier])-[baseRev](-[fileItegRev]).[ext]</artifactPathPattern>\n            <distinctiveDescriptorPathPattern>true</distinctiveDescriptorPathPattern>\n            <descriptorPathPattern>[org]/[module]/[baseRev](-[folderItegRev])/[type]s/ivy-[baseRev](-[fileItegRev]).xml</descriptorPathPattern>\n            <folderIntegrationRevisionRegExp>\\d{14}</folderIntegrationRevisionRegExp>\n            <fileIntegrationRevisionRegExp>\\d{14}</fileIntegrationRevisionRegExp>\n        </repoLayout>\n        <repoLayout>\n            <name>gradle-default</name>\n            <artifactPathPattern>[org]/[module]/[baseRev](-[folderItegRev])/[module]-[baseRev](-[fileItegRev])(-[classifier]).[ext]</artifactPathPattern>\n            <distinctiveDescriptorPathPattern>true</distinctiveDescriptorPathPattern>\n            <descriptorPathPattern>[org]/[module]/ivy-[baseRev](-[fileItegRev]).xml</descriptorPathPattern>\n            <folderIntegrationRevisionRegExp>\\d{14}</folderIntegrationRevisionRegExp>\n            <fileIntegrationRevisionRegExp>\\d{14}</fileIntegrationRevisionRegExp>\n        </repoLayout>\n        <repoLayout>\n            <name>maven-1-default</name>\n            <artifactPathPattern>[org]/[type]s/[module]-[baseRev](-[fileItegRev])(-[classifier]).[ext]</artifactPathPattern>\n            <distinctiveDescriptorPathPattern>true</distinctiveDescriptorPathPattern>\n            <descriptorPathPattern>[org]/[type]s/[module]-[baseRev](-[fileItegRev]).pom</descriptorPathPattern>\n            <folderIntegrationRevisionRegExp>.+</folderIntegrationRevisionRegExp>\n            <fileIntegrationRevisionRegExp>.+</fileIntegrationRevisionRegExp>\n        </repoLayout>\n        <repoLayout>\n            <name>nuget-default</name>\n            <artifactPathPattern>[orgPath]/[module]/[module].[baseRev](-[fileItegRev]).nupkg</artifactPathPattern>\n            <distinctiveDescriptorPathPattern>false</distinctiveDescriptorPathPattern>\n            <folderIntegrationRevisionRegExp>.*</folderIntegrationRevisionRegExp>\n            <fileIntegrationRevisionRegExp>.*</fileIntegrationRevisionRegExp>\n        </repoLayout>\n        <repoLayout>\n            <name>npm-default</name>\n            <artifactPathPattern>[orgPath]/[module]/[module]-[baseRev](-[fileItegRev]).tgz</artifactPathPattern>\n            <distinctiveDescriptorPathPattern>false</distinctiveDescriptorPathPattern>\n            <folderIntegrationRevisionRegExp>.*</folderIntegrationRevisionRegExp>\n            <fileIntegrationRevisionRegExp>.*</fileIntegrationRevisionRegExp>\n        </repoLayout>\n        <repoLayout>\n            <name>bower-default</name>\n            <artifactPathPattern>[orgPath]/[module]/[module]-[baseRev](-[fileItegRev]).[ext]</artifactPathPattern>\n            <distinctiveDescriptorPathPattern>false</distinctiveDescriptorPathPattern>\n            <folderIntegrationRevisionRegExp>.*</folderIntegrationRevisionRegExp>\n            <fileIntegrationRevisionRegExp>.*</fileIntegrationRevisionRegExp>\n        </repoLayout>\n        <repoLayout>\n            <name>vcs-default</name>\n            <artifactPathPattern>[orgPath]/[module]/[refs&lt;tags|branches&gt;]/[baseRev]/[module]-[baseRev](-[fileItegRev])(-[classifier]).[ext]</artifactPathPattern>\n            <distinctiveDescriptorPathPattern>false</distinctiveDescriptorPathPattern>\n            <folderIntegrationRevisionRegExp>.*</folderIntegrationRevisionRegExp>\n            <fileIntegrationRevisionRegExp>[a-zA-Z0-9]{40}</fileIntegrationRevisionRegExp>\n        </repoLayout>\n        <repoLayout>\n            <name>sbt-default</name>\n            <artifactPathPattern>[org]/[module]/(scala_[scalaVersion&lt;.+&gt;])/(sbt_[sbtVersion&lt;.+&gt;])/[baseRev]/[type]s/[module](-[classifier]).[ext]</artifactPathPattern>\n            <distinctiveDescriptorPathPattern>true</distinctiveDescriptorPathPattern>\n            <descriptorPathPattern>[org]/[module]/(scala_[scalaVersion&lt;.+&gt;])/(sbt_[sbtVersion&lt;.+&gt;])/[baseRev]/[type]s/ivy.xml</descriptorPathPattern>\n            <folderIntegrationRevisionRegExp>\\d{14}</folderIntegrationRevisionRegExp>\n            <fileIntegrationRevisionRegExp>\\d{14}</fileIntegrationRevisionRegExp>\n        </repoLayout>\n        <repoLayout>\n            <name>simple-default</name>\n            <artifactPathPattern>[orgPath]/[module]/[module]-[baseRev](-[fileItegRev]).[ext]</artifactPathPattern>\n            <distinctiveDescriptorPathPattern>false</distinctiveDescriptorPathPattern>\n            <folderIntegrationRevisionRegExp>.*</folderIntegrationRevisionRegExp>\n            <fileIntegrationRevisionRegExp>.*</fileIntegrationRevisionRegExp>\n        </repoLayout>\n    </repoLayouts>\n    <remoteReplications/>\n    <localReplications/>\n    <gcConfig>\n        <cronExp>0 0 /4 * * ?</cronExp>\n    </gcConfig>\n    <cleanupConfig>\n        <cronExp>0 12 5 * * ?</cronExp>\n    </cleanupConfig>\n    <virtualCacheCleanupConfig>\n        <cronExp>0 12 0 * * ?</cronExp>\n    </virtualCacheCleanupConfig>\n    <systemMessageConfig>\n        <enabled>false</enabled>\n        <titleColor>#429F46</titleColor>\n        <showOnAllPages>false</showOnAllPages>\n    </systemMessageConfig>\n    <folderDownloadConfig>\n        <enabled>false</enabled>\n        <maxDownloadSizeMb>1024</maxDownloadSizeMb>\n        <maxFiles>5000</maxFiles>\n        <maxConcurrentRequests>10</maxConcurrentRequests>\n    </folderDownloadConfig>\n</config>\n');
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_properties`
--

DROP TABLE IF EXISTS `db_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_properties` (
  `installation_date` bigint(20) NOT NULL,
  `artifactory_version` varchar(30) COLLATE utf8_bin NOT NULL,
  `artifactory_revision` int(11) DEFAULT NULL,
  `artifactory_release` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`installation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_properties`
--

LOCK TABLES `db_properties` WRITE;
/*!40000 ALTER TABLE `db_properties` DISABLE KEYS */;
INSERT INTO `db_properties` VALUES (1446644579996,'4.2.0',40030,1445160545149);
/*!40000 ALTER TABLE `db_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` bigint(20) NOT NULL,
  `group_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `description` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `default_new_user` tinyint(4) DEFAULT NULL,
  `realm` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `realm_attributes` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `groups_group_name_idx` (`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (16,'readers','A group for read-only users',1,'artifactory',NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexed_archives`
--

DROP TABLE IF EXISTS `indexed_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexed_archives` (
  `archive_sha1` char(40) COLLATE utf8_bin NOT NULL,
  `indexed_archives_id` bigint(20) NOT NULL,
  PRIMARY KEY (`archive_sha1`),
  UNIQUE KEY `indexed_archives_id_uq` (`indexed_archives_id`),
  CONSTRAINT `indexed_archives_binaries_fk` FOREIGN KEY (`archive_sha1`) REFERENCES `binaries` (`sha1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexed_archives`
--

LOCK TABLES `indexed_archives` WRITE;
/*!40000 ALTER TABLE `indexed_archives` DISABLE KEYS */;
/*!40000 ALTER TABLE `indexed_archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexed_archives_entries`
--

DROP TABLE IF EXISTS `indexed_archives_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexed_archives_entries` (
  `indexed_archives_id` bigint(20) NOT NULL,
  `entry_path_id` bigint(20) NOT NULL,
  `entry_name_id` bigint(20) NOT NULL,
  PRIMARY KEY (`indexed_archives_id`,`entry_path_id`,`entry_name_id`),
  KEY `indexed_entries_path_idx` (`entry_path_id`),
  KEY `indexed_entries_name_idx` (`entry_name_id`),
  CONSTRAINT `entry_name_id_fk` FOREIGN KEY (`entry_name_id`) REFERENCES `archive_names` (`name_id`),
  CONSTRAINT `entry_path_id_fk` FOREIGN KEY (`entry_path_id`) REFERENCES `archive_paths` (`path_id`),
  CONSTRAINT `indexed_archives_id_fk` FOREIGN KEY (`indexed_archives_id`) REFERENCES `indexed_archives` (`indexed_archives_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexed_archives_entries`
--

LOCK TABLES `indexed_archives_entries` WRITE;
/*!40000 ALTER TABLE `indexed_archives_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `indexed_archives_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_props`
--

DROP TABLE IF EXISTS `module_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_props` (
  `prop_id` bigint(20) NOT NULL,
  `module_id` bigint(20) NOT NULL,
  `prop_key` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prop_value` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`prop_id`),
  KEY `module_props_module_id_idx` (`module_id`),
  KEY `module_props_prop_key_idx` (`prop_key`),
  KEY `module_props_prop_value_idx` (`prop_value`(255)),
  CONSTRAINT `module_props_modules_fk` FOREIGN KEY (`module_id`) REFERENCES `build_modules` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_props`
--

LOCK TABLES `module_props` WRITE;
/*!40000 ALTER TABLE `module_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_meta_infos`
--

DROP TABLE IF EXISTS `node_meta_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_meta_infos` (
  `node_id` bigint(20) NOT NULL,
  `props_modified` bigint(20) DEFAULT NULL,
  `props_modified_by` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`node_id`),
  CONSTRAINT `node_meta_infos_nodes_fk` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_meta_infos`
--

LOCK TABLES `node_meta_infos` WRITE;
/*!40000 ALTER TABLE `node_meta_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_meta_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_props`
--

DROP TABLE IF EXISTS `node_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_props` (
  `prop_id` bigint(20) NOT NULL,
  `node_id` bigint(20) NOT NULL,
  `prop_key` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prop_value` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`prop_id`),
  KEY `node_props_node_id_idx` (`node_id`),
  KEY `node_props_prop_key_idx` (`prop_key`),
  KEY `node_props_prop_value_idx` (`prop_value`(255)),
  CONSTRAINT `node_props_nodes_fk` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_props`
--

LOCK TABLES `node_props` WRITE;
/*!40000 ALTER TABLE `node_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `node_id` bigint(20) NOT NULL,
  `node_type` tinyint(4) NOT NULL,
  `repo` varchar(64) COLLATE utf8_bin NOT NULL,
  `node_path` varchar(1024) COLLATE utf8_bin NOT NULL,
  `node_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `depth` tinyint(4) NOT NULL,
  `created` bigint(20) NOT NULL,
  `created_by` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `modified` bigint(20) NOT NULL,
  `modified_by` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `updated` bigint(20) DEFAULT NULL,
  `bin_length` bigint(20) DEFAULT NULL,
  `sha1_actual` char(40) COLLATE utf8_bin DEFAULT NULL,
  `sha1_original` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `md5_actual` char(32) COLLATE utf8_bin DEFAULT NULL,
  `md5_original` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`node_id`),
  KEY `nodes_repo_path_name_idx` (`repo`,`node_path`(255),`node_name`),
  KEY `nodes_node_path_idx` (`node_path`(255)),
  KEY `nodes_node_name_idx` (`node_name`),
  KEY `nodes_sha1_actual_idx` (`sha1_actual`),
  KEY `nodes_md5_actual_idx` (`md5_actual`),
  CONSTRAINT `nodes_binaries_fk` FOREIGN KEY (`sha1_actual`) REFERENCES `binaries` (`sha1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` VALUES (1,0,'ext-release-local','.','.',0,1446644585115,NULL,1446644585115,NULL,1446644585115,0,NULL,NULL,NULL,NULL),(2,0,'ext-snapshot-local','.','.',0,1446644585132,NULL,1446644585132,NULL,1446644585132,0,NULL,NULL,NULL,NULL),(3,0,'libs-release-local','.','.',0,1446644585136,NULL,1446644585136,NULL,1446644585136,0,NULL,NULL,NULL,NULL),(4,0,'libs-snapshot-local','.','.',0,1446644585144,NULL,1446644585144,NULL,1446644585144,0,NULL,NULL,NULL,NULL),(5,0,'plugins-release-local','.','.',0,1446644585148,NULL,1446644585148,NULL,1446644585148,0,NULL,NULL,NULL,NULL),(6,0,'plugins-snapshot-local','.','.',0,1446644585155,NULL,1446644585155,NULL,1446644585155,0,NULL,NULL,NULL,NULL),(7,0,'jcenter-cache','.','.',0,1446644585176,NULL,1446644585176,NULL,1446644585176,0,NULL,NULL,NULL,NULL),(8,0,'repo','.','.',0,1446644585567,NULL,1446644585567,NULL,1446644585567,0,NULL,NULL,NULL,NULL),(9,0,'libs-release','.','.',0,1446644585576,NULL,1446644585576,NULL,1446644585576,0,NULL,NULL,NULL,NULL),(10,0,'libs-snapshot','.','.',0,1446644585579,NULL,1446644585579,NULL,1446644585579,0,NULL,NULL,NULL,NULL),(11,0,'plugins-release','.','.',0,1446644585583,NULL,1446644585583,NULL,1446644585583,0,NULL,NULL,NULL,NULL),(12,0,'plugins-snapshot','.','.',0,1446644585587,NULL,1446644585587,NULL,1446644585587,0,NULL,NULL,NULL,NULL),(13,0,'remote-repos','.','.',0,1446644585591,NULL,1446644585591,NULL,1446644585591,0,NULL,NULL,NULL,NULL),(24,0,'jenkins-maven-snapshot','.','.',0,1446644905979,NULL,1446644905979,NULL,1446644905979,0,NULL,NULL,NULL,NULL),(25,0,'jenkins-maven-release','.','.',0,1446644942010,NULL,1446644942010,NULL,1446644942010,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_target_repos`
--

DROP TABLE IF EXISTS `permission_target_repos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_target_repos` (
  `perm_target_id` bigint(20) NOT NULL,
  `repo_key` varchar(64) COLLATE utf8_bin NOT NULL,
  KEY `permission_target_repos_fk` (`perm_target_id`),
  CONSTRAINT `permission_target_repos_fk` FOREIGN KEY (`perm_target_id`) REFERENCES `permission_targets` (`perm_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_target_repos`
--

LOCK TABLES `permission_target_repos` WRITE;
/*!40000 ALTER TABLE `permission_target_repos` DISABLE KEYS */;
INSERT INTO `permission_target_repos` VALUES (17,'ANY'),(21,'ANY REMOTE');
/*!40000 ALTER TABLE `permission_target_repos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_targets`
--

DROP TABLE IF EXISTS `permission_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_targets` (
  `perm_target_id` bigint(20) NOT NULL,
  `perm_target_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `includes` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `excludes` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`perm_target_id`),
  UNIQUE KEY `permission_targets_name_idx` (`perm_target_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_targets`
--

LOCK TABLES `permission_targets` WRITE;
/*!40000 ALTER TABLE `permission_targets` DISABLE KEYS */;
INSERT INTO `permission_targets` VALUES (17,'Anything','**',NULL),(21,'Any Remote','**',NULL);
/*!40000 ALTER TABLE `permission_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `node_id` bigint(20) NOT NULL,
  `download_count` bigint(20) DEFAULT NULL,
  `last_downloaded` bigint(20) DEFAULT NULL,
  `last_downloaded_by` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`node_id`),
  CONSTRAINT `stats_nodes_fk` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_remote`
--

DROP TABLE IF EXISTS `stats_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_remote` (
  `node_id` bigint(20) NOT NULL,
  `origin` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `download_count` bigint(20) DEFAULT NULL,
  `last_downloaded` bigint(20) DEFAULT NULL,
  `last_downloaded_by` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`node_id`,`origin`),
  CONSTRAINT `stats_remote_nodes_fk` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_remote`
--

LOCK TABLES `stats_remote` WRITE;
/*!40000 ALTER TABLE `stats_remote` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `task_type` varchar(32) COLLATE utf8_bin NOT NULL,
  `task_context` varchar(1024) COLLATE utf8_bin NOT NULL,
  KEY `tasks_type_context_idx` (`task_type`,`task_context`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unique_ids`
--

DROP TABLE IF EXISTS `unique_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unique_ids` (
  `index_type` varchar(32) COLLATE utf8_bin NOT NULL,
  `current_id` bigint(20) NOT NULL,
  PRIMARY KEY (`index_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unique_ids`
--

LOCK TABLES `unique_ids` WRITE;
/*!40000 ALTER TABLE `unique_ids` DISABLE KEYS */;
INSERT INTO `unique_ids` VALUES ('general',2000);
/*!40000 ALTER TABLE `unique_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_props`
--

DROP TABLE IF EXISTS `user_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_props` (
  `user_id` bigint(20) NOT NULL,
  `prop_key` varchar(64) COLLATE utf8_bin NOT NULL,
  `prop_value` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`user_id`,`prop_key`),
  CONSTRAINT `user_props_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_props`
--

LOCK TABLES `user_props` WRITE;
/*!40000 ALTER TABLE `user_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `password` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `salt` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `gen_password_key` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `admin` tinyint(4) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `updatable_profile` tinyint(4) DEFAULT NULL,
  `realm` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `private_key` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `public_key` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `last_login_time` bigint(20) DEFAULT NULL,
  `last_login_ip` varchar(42) COLLATE utf8_bin DEFAULT NULL,
  `last_access_time` bigint(20) DEFAULT NULL,
  `last_access_ip` varchar(42) COLLATE utf8_bin DEFAULT NULL,
  `bintray_auth` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username_idx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (14,'admin','1f70548d73baca61aab8660733c7de81','CAFEBABEEBABEFAC',NULL,NULL,1,1,1,'internal',NULL,NULL,1446644879341,'172.17.42.1',0,NULL,NULL),(15,'anonymous','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,NULL,0,1,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `user_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `realm` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  UNIQUE KEY `users_groups_idx` (`user_id`,`group_id`),
  KEY `users_groups_groups_fk` (`group_id`),
  CONSTRAINT `users_groups_groups_fk` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`),
  CONSTRAINT `users_groups_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watches`
--

DROP TABLE IF EXISTS `watches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watches` (
  `watch_id` bigint(20) NOT NULL,
  `node_id` bigint(20) NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `since` bigint(20) NOT NULL,
  PRIMARY KEY (`watch_id`),
  KEY `watches_node_id_idx` (`node_id`),
  CONSTRAINT `watches_nodes_fk` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watches`
--

LOCK TABLES `watches` WRITE;
/*!40000 ALTER TABLE `watches` DISABLE KEYS */;
/*!40000 ALTER TABLE `watches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-04 13:55:28

-- Set privileges for Artifactory database
GRANT ALL on artifactory.* TO 'admin@localhost' IDENTIFIED BY 'Passw0rd!';
FLUSH PRIVILEGES;