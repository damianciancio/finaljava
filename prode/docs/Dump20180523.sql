-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: prode
-- ------------------------------------------------------
-- Server version	5.7.22

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
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leagues` (
  `id_league` int(11) NOT NULL AUTO_INCREMENT,
  `league_name` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_league`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` VALUES (1,'Superliga Argentina');
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_results`
--

DROP TABLE IF EXISTS `match_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_results` (
  `id_match` int(11) NOT NULL,
  `visitor_goals` int(11) DEFAULT NULL,
  `local_goals` int(11) DEFAULT NULL,
  `penalty_defined` tinyint(4) DEFAULT '0',
  `visitor_penalty_goals` int(11) DEFAULT '0',
  `local_penalty_goals` int(11) DEFAULT '0',
  PRIMARY KEY (`id_match`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_results`
--

LOCK TABLES `match_results` WRITE;
/*!40000 ALTER TABLE `match_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matches` (
  `id_match` int(11) NOT NULL AUTO_INCREMENT,
  `id_matchweek` int(11) NOT NULL,
  `date_time_match` datetime DEFAULT NULL,
  `id_local_team` int(11) DEFAULT NULL,
  `id_visitor_team` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_match`),
  KEY `fk_matchweek_idx` (`id_matchweek`),
  KEY `fk_local_team_idx` (`id_local_team`),
  KEY `fk_visitor_team_idx` (`id_visitor_team`),
  CONSTRAINT `fk_local_team` FOREIGN KEY (`id_local_team`) REFERENCES `teams` (`id_team`) ON UPDATE CASCADE,
  CONSTRAINT `fk_matchweek` FOREIGN KEY (`id_matchweek`) REFERENCES `matchweeks` (`id_matchweek`) ON UPDATE CASCADE,
  CONSTRAINT `fk_visitor_team` FOREIGN KEY (`id_visitor_team`) REFERENCES `teams` (`id_team`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (2,27,'2017-08-25 19:05:00',101,103),(3,27,'2017-08-25 21:05:00',79,80),(4,27,'2017-08-26 14:05:00',83,96),(5,27,'2017-08-26 16:15:00',99,90),(6,27,'2017-08-26 18:15:00',89,88),(7,27,'2017-08-26 20:05:00',98,93),(8,27,'2017-08-27 11:05:00',78,87),(9,27,'2017-08-27 16:05:00',97,94),(10,27,'2017-08-27 18:05:00',81,92),(11,27,'2017-08-27 20:05:00',100,95),(12,27,'2017-08-28 19:05:00',91,102),(13,27,'2017-08-28 21:05:00',85,77),(14,27,'2017-08-28 16:00:00',1,82);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchweeks`
--

DROP TABLE IF EXISTS `matchweeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchweeks` (
  `id_matchweek` int(11) NOT NULL AUTO_INCREMENT,
  `matchweek_number` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `id_league` int(11) DEFAULT NULL,
  `start_date_league` date DEFAULT NULL,
  PRIMARY KEY (`id_matchweek`),
  KEY `season_fk_idx` (`id_league`,`start_date_league`),
  CONSTRAINT `season_fk` FOREIGN KEY (`id_league`, `start_date_league`) REFERENCES `seasons` (`id_league`, `start_date`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchweeks`
--

LOCK TABLES `matchweeks` WRITE;
/*!40000 ALTER TABLE `matchweeks` DISABLE KEYS */;
INSERT INTO `matchweeks` VALUES (27,1,'2017-08-25','2017-08-28',1,'2017-08-25'),(28,2,NULL,NULL,1,'2017-08-25'),(29,3,NULL,NULL,1,'2017-08-25'),(30,4,NULL,NULL,1,'2017-08-25'),(31,5,NULL,NULL,1,'2017-08-25'),(32,6,NULL,NULL,1,'2017-08-25'),(33,7,NULL,NULL,1,'2017-08-25'),(34,8,NULL,NULL,1,'2017-08-25'),(35,9,NULL,NULL,1,'2017-08-25'),(36,10,NULL,NULL,1,'2017-08-25'),(37,11,NULL,NULL,1,'2017-08-25'),(38,12,NULL,NULL,1,'2017-08-25'),(39,13,NULL,NULL,1,'2017-08-25'),(40,14,NULL,NULL,1,'2017-08-25'),(41,15,NULL,NULL,1,'2017-08-25'),(42,16,NULL,NULL,1,'2017-08-25'),(43,17,NULL,NULL,1,'2017-08-25'),(44,18,NULL,NULL,1,'2017-08-25'),(45,19,NULL,NULL,1,'2017-08-25'),(46,20,NULL,NULL,1,'2017-08-25'),(47,21,NULL,NULL,1,'2017-08-25'),(48,22,NULL,NULL,1,'2017-08-25'),(49,23,NULL,NULL,1,'2017-08-25'),(50,24,NULL,NULL,1,'2017-08-25'),(51,25,NULL,NULL,1,'2017-08-25'),(52,26,NULL,NULL,1,'2017-08-25'),(53,27,NULL,NULL,1,'2017-08-25');
/*!40000 ALTER TABLE `matchweeks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants_matchweek`
--

DROP TABLE IF EXISTS `participants_matchweek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants_matchweek` (
  `id_user` int(11) NOT NULL,
  `id_edition` int(11) NOT NULL,
  `id_matchweek` int(11) NOT NULL,
  `points` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`,`id_edition`,`id_matchweek`),
  KEY `fk_matchweek_idx` (`id_matchweek`),
  CONSTRAINT `fk_matchweek_2` FOREIGN KEY (`id_matchweek`) REFERENCES `matchweeks` (`id_matchweek`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participants` FOREIGN KEY (`id_user`, `id_edition`) REFERENCES `prode_participants` (`id_user`, `id_edition`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants_matchweek`
--

LOCK TABLES `participants_matchweek` WRITE;
/*!40000 ALTER TABLE `participants_matchweek` DISABLE KEYS */;
/*!40000 ALTER TABLE `participants_matchweek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_roles`
--

DROP TABLE IF EXISTS `permission_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_roles` (
  `id_role` int(11) NOT NULL,
  `id_permission` int(11) NOT NULL,
  PRIMARY KEY (`id_role`),
  KEY `fk_permission_idx` (`id_permission`),
  CONSTRAINT `fk_permission` FOREIGN KEY (`id_permission`) REFERENCES `permissions` (`id_permission`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_roles` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_roles`
--

LOCK TABLES `permission_roles` WRITE;
/*!40000 ALTER TABLE `permission_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id_permission` int(11) NOT NULL AUTO_INCREMENT,
  `permission_description` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prode_edition`
--

DROP TABLE IF EXISTS `prode_edition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prode_edition` (
  `id_edition` int(11) NOT NULL AUTO_INCREMENT,
  `id_league` int(11) NOT NULL,
  `start_date_season` date NOT NULL,
  `id_organizer_user` int(11) NOT NULL,
  `edition_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_edition`),
  KEY `fk_season_idx` (`id_league`,`start_date_season`),
  KEY `fk_organizer_idx` (`id_organizer_user`),
  CONSTRAINT `fk_organizer` FOREIGN KEY (`id_organizer_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE,
  CONSTRAINT `fk_season` FOREIGN KEY (`id_league`, `start_date_season`) REFERENCES `seasons` (`id_league`, `start_date`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prode_edition`
--

LOCK TABLES `prode_edition` WRITE;
/*!40000 ALTER TABLE `prode_edition` DISABLE KEYS */;
/*!40000 ALTER TABLE `prode_edition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prode_participants`
--

DROP TABLE IF EXISTS `prode_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prode_participants` (
  `id_edition` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_edition`,`id_user`),
  KEY `fk_user_idx` (`id_user`),
  CONSTRAINT `fk_edition` FOREIGN KEY (`id_edition`) REFERENCES `prode_edition` (`id_edition`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prode_participants`
--

LOCK TABLES `prode_participants` WRITE;
/*!40000 ALTER TABLE `prode_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `prode_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `description_role` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `active_role` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seasons` (
  `id_league` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_league`,`start_date`),
  CONSTRAINT `league` FOREIGN KEY (`id_league`) REFERENCES `leagues` (`id_league`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (1,'2017-08-25','Temporada 2017-2018');
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id_team` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `short_team_name` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_team`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Asociación Atlética Argentinos Juniors','Argentinos Juniors'),(77,'Arsenal Fútbol Club','Arsenal'),(78,'Club Atlético Tucumán','Atlético Tucumán'),(79,'Club Atlético Banfield','Banfield'),(80,'Club Atlético Belgrano','Belgrano'),(81,'Club Atlético Boca Juniors','Boca Juniors'),(82,'Club Atlético Chacarita Juniors','Chacarita Juniors'),(83,'Club Atlético Colón','Colón'),(84,'Club Social y Deportivo Defensa y Justicia','Defensa y Justicia'),(85,'Club Estudiantes de La Plata','Estudiantes La Plata'),(86,'Club de Gimnasia y Esgrima La Plata','Gimnasia La Plata'),(87,'Club Deportivo Godoy Cruz Antonio Tomba','Godoy Cruz'),(88,'Club Atlético Huracán','Huracán'),(89,'Club Atlético Independiente','Independiente'),(90,'Club Atlético Lanús','Lanús'),(91,'Club Atlético Newell\'s Old Boys','Newell\'s Old Boys'),(92,'Club Olimpo','Olimpo'),(93,'Club Atlético Patronato de la Juventud Católica','Patronato'),(94,'Racing Club','Racing Club'),(95,'Club Atlético River Plate','River Plate'),(96,'Club Atlético Rosario Central','Rosario Central'),(97,'Club Atlético San Lorenzo de Almagro','San Lorenzo'),(98,'Club Atlético San Martín','San Martín'),(99,'Club Atlético Talleres','Talleres'),(100,'Club Atlético Temperley','Temperley'),(101,'Club Atlético Tigre','Tigre'),(102,'Club Atlético Unión','Unión'),(103,'Club Atlético Vélez Sarsfield','Vélez Sarsfield');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_seasons`
--

DROP TABLE IF EXISTS `teams_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_seasons` (
  `id_season` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  PRIMARY KEY (`id_season`,`id_team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_seasons`
--

LOCK TABLES `teams_seasons` WRITE;
/*!40000 ALTER TABLE `teams_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_results`
--

DROP TABLE IF EXISTS `user_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_results` (
  `id_user` int(11) NOT NULL,
  `id_match` int(11) NOT NULL,
  `id_edition` int(11) NOT NULL,
  `local_goals` int(11) NOT NULL,
  `visitor_goals` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_match`,`id_edition`),
  KEY `fk_match_idx` (`id_match`),
  KEY `fk_user_idx` (`id_edition`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_results`
--

LOCK TABLES `user_results` WRITE;
/*!40000 ALTER TABLE `user_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-23 20:45:45
