-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: budrhlqn6juetn0zlpkm-mysql.services.clever-cloud.com    Database: budrhlqn6juetn0zlpkm
-- ------------------------------------------------------
-- Server version	8.0.28-19

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
-- Table structure for table `obs_cities`
--

DROP TABLE IF EXISTS `obs_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obs_cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_scope` int NOT NULL,
  `city_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `city_postcode` mediumint NOT NULL DEFAULT '0',
  `city_area` float NOT NULL DEFAULT '0',
  `city_population` int NOT NULL DEFAULT '0',
  `city_website` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs_cities`
--

LOCK TABLES `obs_cities` WRITE;
/*!40000 ALTER TABLE `obs_cities` DISABLE KEYS */;
INSERT INTO `obs_cities` VALUES (2,1,'Lorient',0,0,0,'');
/*!40000 ALTER TABLE `obs_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs_config`
--

DROP TABLE IF EXISTS `obs_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obs_config` (
  `config_id` int NOT NULL AUTO_INCREMENT,
  `config_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `config_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `config_param` (`config_param`),
  KEY `config_id` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs_config`
--

LOCK TABLES `obs_config` WRITE;
/*!40000 ALTER TABLE `obs_config` DISABLE KEYS */;
INSERT INTO `obs_config` VALUES (1,'vigilo_urlbase','vigilo.ulve-bzh.fr'),(2,'vigilo_http_proto','https'),(3,'vigilo_name','Vigilo'),(4,'vigilo_language','fr-FR'),(5,'vigilo_mapquest_api','mDi0yZAIcxjNRyA3'),(6,'twitter_expiry_time','24'),(7,'mysql_charset','utf8'),(8,'vigilo_timezone','Europe/Paris'),(9,'vigilo_db_version','0.0.19'),(10,'vigilo_shownonapproved','1'),(11,'vigilo_panel','jesuisundesdeux');
/*!40000 ALTER TABLE `obs_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs_list`
--

DROP TABLE IF EXISTS `obs_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obs_list` (
  `obs_id` int NOT NULL AUTO_INCREMENT,
  `obs_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `obs_city` smallint NOT NULL,
  `obs_cityname` varchar(255) COLLATE utf8_bin NOT NULL,
  `obs_coordinates_lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `obs_coordinates_lon` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `obs_address_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `obs_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `obs_explanation` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `obs_categorie` smallint NOT NULL DEFAULT '1',
  `obs_token` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `obs_time` bigint NOT NULL,
  `obs_status` smallint NOT NULL,
  `obs_app_version` varchar(50) COLLATE utf8_bin NOT NULL,
  `obs_approved` tinyint(1) NOT NULL DEFAULT '0',
  `obs_secretid` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `obs_complete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`obs_id`),
  KEY `token` (`obs_token`),
  KEY `city` (`obs_city`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs_list`
--

LOCK TABLES `obs_list` WRITE;
/*!40000 ALTER TABLE `obs_list` DISABLE KEYS */;
INSERT INTO `obs_list` VALUES (3,'56_lorient',2,'','47.748363','-3.394425','Rue de Saint-Maudé','','',7,'55C07ECA',1664311380,0,'vigilo-webapp-1.10.0',0,'6333608e89ef5303238950',1);
/*!40000 ALTER TABLE `obs_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs_resolutions`
--

DROP TABLE IF EXISTS `obs_resolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obs_resolutions` (
  `resolution_id` int NOT NULL AUTO_INCREMENT,
  `resolution_token` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `resolution_secretid` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `resolution_app_version` int NOT NULL,
  `resolution_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `resolution_time` bigint NOT NULL,
  `resolution_status` smallint NOT NULL,
  `resolution_withphoto` tinyint(1) NOT NULL DEFAULT '0',
  `resolution_complete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resolution_id`),
  KEY `token` (`resolution_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs_resolutions`
--

LOCK TABLES `obs_resolutions` WRITE;
/*!40000 ALTER TABLE `obs_resolutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `obs_resolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs_resolutions_tokens`
--

DROP TABLE IF EXISTS `obs_resolutions_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obs_resolutions_tokens` (
  `restok_resolutionid` int NOT NULL,
  `restok_observationid` int NOT NULL,
  KEY `resolutionid` (`restok_resolutionid`),
  KEY `obsid` (`restok_observationid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs_resolutions_tokens`
--

LOCK TABLES `obs_resolutions_tokens` WRITE;
/*!40000 ALTER TABLE `obs_resolutions_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `obs_resolutions_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs_roles`
--

DROP TABLE IF EXISTS `obs_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obs_roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_key` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `role_name` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `role_owner` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `role_login` varchar(60) COLLATE utf8_bin NOT NULL,
  `role_password` varchar(255) COLLATE utf8_bin NOT NULL,
  `role_city` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs_roles`
--

LOCK TABLES `obs_roles` WRITE;
/*!40000 ALTER TABLE `obs_roles` DISABLE KEYS */;
INSERT INTO `obs_roles` VALUES (5,'F07130023ACB3420A7520A5E11D507D010141626','admin','Florent Ulvé','florent.ulve','$2y$10$ct7Ihqo/7y/eId4NW/cTLOPWexHLhJSO5AVaeIApLnTMw.wgMptzi','');
/*!40000 ALTER TABLE `obs_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs_scopes`
--

DROP TABLE IF EXISTS `obs_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obs_scopes` (
  `scope_id` int NOT NULL AUTO_INCREMENT,
  `scope_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `scope_display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `scope_department` tinyint NOT NULL,
  `scope_coordinate_lat_min` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `scope_coordinate_lat_max` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `scope_coordinate_lon_min` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `scope_coordinate_lon_max` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `scope_map_center_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `scope_map_zoom` tinyint NOT NULL,
  `scope_contact_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `scope_sharing_content_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `scope_twitter` varchar(20) COLLATE utf8_bin NOT NULL,
  `scope_twitteraccountid` int NOT NULL,
  `scope_twittercontent` varchar(500) COLLATE utf8_bin NOT NULL,
  `scope_umap_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `scope_nominatim_urlbase` varchar(255) COLLATE utf8_bin DEFAULT 'https://nominatim.openstreetmap.org',
  PRIMARY KEY (`scope_id`),
  KEY `scope_id` (`scope_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs_scopes`
--

LOCK TABLES `obs_scopes` WRITE;
/*!40000 ALTER TABLE `obs_scopes` DISABLE KEYS */;
INSERT INTO `obs_scopes` VALUES (1,'56_lorient','Lorient',56,'47.73346328939367','47.7726819300873','-3.401451030101086','-3.341369548167492','47.74883374799631,-3.3683865898856458',15,'email@domaine.com','','',0,'','','https://nominatim.openstreetmap.org');
/*!40000 ALTER TABLE `obs_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obs_twitteraccounts`
--

DROP TABLE IF EXISTS `obs_twitteraccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obs_twitteraccounts` (
  `ta_id` int NOT NULL AUTO_INCREMENT,
  `ta_consumer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ta_consumersecret` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ta_accesstoken` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ta_accesstokensecret` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`ta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obs_twitteraccounts`
--

LOCK TABLES `obs_twitteraccounts` WRITE;
/*!40000 ALTER TABLE `obs_twitteraccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `obs_twitteraccounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-27 20:49:17
