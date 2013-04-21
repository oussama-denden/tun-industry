CREATE DATABASE  IF NOT EXISTS `tun_industry` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tun_industry`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: tun_industry
-- ------------------------------------------------------
-- Server version	5.5.24-log

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
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sector` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sector_name` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sector_name` (`sector_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (1,'Industries agro-alimentaires',0),(2,'Industries des matériaux de construction céramique et verre',0);
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_branch_activity_products`
--

DROP TABLE IF EXISTS `activity_branch_activity_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_branch_activity_products` (
  `activity_branch` bigint(20) NOT NULL,
  `activity_products` bigint(20) NOT NULL,
  PRIMARY KEY (`activity_branch`,`activity_products`),
  UNIQUE KEY `activity_products` (`activity_products`),
  KEY `FKBFFC9A67420BC9A4` (`activity_branch`),
  KEY `FKBFFC9A67ACB4C1F9` (`activity_products`),
  CONSTRAINT `FKBFFC9A67ACB4C1F9` FOREIGN KEY (`activity_products`) REFERENCES `products` (`id`),
  CONSTRAINT `FKBFFC9A67420BC9A4` FOREIGN KEY (`activity_branch`) REFERENCES `activity_branch` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_branch_activity_products`
--

LOCK TABLES `activity_branch_activity_products` WRITE;
/*!40000 ALTER TABLE `activity_branch_activity_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_branch_activity_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `capital` double NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `denomination` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `factory_address` varchar(255) DEFAULT NULL,
  `faxes` varchar(255) DEFAULT NULL,
  `governorate` varchar(255) DEFAULT NULL,
  `into_production` datetime DEFAULT NULL,
  `phones` varchar(255) DEFAULT NULL,
  `ppe` varchar(255) DEFAULT NULL,
  `regime` varchar(255) DEFAULT NULL,
  `responsible` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `workers_num` bigint(20) NOT NULL,
  `products` bigint(20) DEFAULT NULL,
  `responsable` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK38A73C7D798C82C9` (`products`),
  CONSTRAINT `FK38A73C7D798C82C9` FOREIGN KEY (`products`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,2500000,'C.H.O COMPANY (KAIROUAN)','CHO (KAIROUAN)','cho@olivolio.com ','EL AWAYED KM 74 - 3116 - CHRARDA','(216) - 74 831 067 / 77 259 006','Kairouan','2013-05-21 00:00:00','(216) - 74 831 672 / 77 259 004','Italie','Totalement exportatrice','Abdelaziz Makhloufi','http://www.olivolio.com',1,70,1,NULL),(2,958000,'STE ECOIL','ECOIL','','RTE DE SOUSSE - 3100 - KAIROUAN','(216) - 71 949 142 / 77 221 064','Kairouan','2010-01-14 00:00:00','(216) - 71 949 138 / 77 221 065','','Totalement exportatrice','Mohamed Aymen Yaakoub','',1,45,1,NULL),(3,750000,'HERBES DE TUNISIE','HERBES DE TUNISIE','info@herbesdetunisie.com ','EL MANSOURA KESRA - 6131 - EL MANSOURA SILIAN','(216) - 78 820 051','Siliana','2002-12-02 00:00:00','(216) - 78 820 050','','Totalement exportatrice','Abdelhamid El Ayachi Zammel','	http://www.herbesdetunisie.com',0,310,2,NULL),(4,255000,'STE HUILERIE EL BARAKA D\'HUILE SUPER','BARAKA HUILE SUPER','guedouarmoez@gmail.com ','AIN EL BIDHA - 3130 - HAFFOUZ','(216) - 77 224 435','Kairouan','2003-12-04 00:00:00','(216) - 98 214 473 / 77 224 436','Non totalement exportatrice','','Moez Guedaouar','',0,24,2,NULL),(5,1175000,'STE ZNAIDI INDUSTRIES ALIMENTAIRES','ZINA','conserveriezina@planet.tn ','OUED EL HAJAR, RTE DE TUNIS KM 4 - 8090 - KELIBIA','(216) - 72 273 134','Nabeul','1997-08-01 00:00:00','(216) - 72 273 133','Non totalement exportatrice','','Jameleddine Znaidi','',0,110,3,NULL),(6,3390000,'STE DE CONSERVE ALIMENTAIRE DES PRODUCTEURS','SCAPCB','info@scapcb.com ','HENCHIR TURKI BP 198 - 8030 - GROMBALIA','(216) - 72 340 547 / 72 215 606','Nabeul','1946-01-01 00:00:00','(216) - 72 215 500 / 72 340 546','','Non totalement exportatrice','Sofiene Gastli','http://www.scapcb.com',1,279,4,NULL);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user_favorites`
--

DROP TABLE IF EXISTS `app_user_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user_favorites` (
  `app_user` bigint(20) NOT NULL,
  `favorites` bigint(20) NOT NULL,
  PRIMARY KEY (`app_user`,`favorites`),
  UNIQUE KEY `favorites` (`favorites`),
  KEY `FKC0D49CC130DD42B3` (`favorites`),
  KEY `FKC0D49CC178E8D494` (`app_user`),
  CONSTRAINT `FKC0D49CC178E8D494` FOREIGN KEY (`app_user`) REFERENCES `app_user` (`id`),
  CONSTRAINT `FKC0D49CC130DD42B3` FOREIGN KEY (`favorites`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user_favorites`
--

LOCK TABLES `app_user_favorites` WRITE;
/*!40000 ALTER TABLE `app_user_favorites` DISABLE KEYS */;
INSERT INTO `app_user_favorites` VALUES (1,1);
/*!40000 ALTER TABLE `app_user_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_branch`
--

DROP TABLE IF EXISTS `activity_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_branch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `sector` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activity_name` (`activity_name`),
  KEY `FKB3D70D2D9359B0D` (`sector`),
  CONSTRAINT `FKB3D70D2D9359B0D` FOREIGN KEY (`sector`) REFERENCES `sector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_branch`
--

LOCK TABLES `activity_branch` WRITE;
/*!40000 ALTER TABLE `activity_branch` DISABLE KEYS */;
INSERT INTO `activity_branch` VALUES (1,'Industries des huiles et corps gras',0,1),(2,'Industries des fruits et légumes',0,1),(3,'Ciment, chaux et plâtre',0,2),(4,'Tuiles et briques en terre cuite',0,2);
/*!40000 ALTER TABLE `activity_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `products_name` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `activity_branch` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_name` (`products_name`),
  KEY `FKC42BD164420BC9A4` (`activity_branch`),
  CONSTRAINT `FKC42BD164420BC9A4` FOREIGN KEY (`activity_branch`) REFERENCES `activity_branch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Grignons épuisés conditionnés',0,1),(2,'Huiles  d\'olive',0,1),(3,'Concentré de tomates',0,2),(4,'Concentré d\'harissa',0,2),(5,'Chaux hydraulique artificielle',0,3),(6,'Chaux hydraulique naturelle',0,3),(7,'Briques creuses ou perforées',0,4),(8,'Hourdis',0,4);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_companies`
--

DROP TABLE IF EXISTS `products_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_companies` (
  `products` bigint(20) NOT NULL,
  `companies` bigint(20) NOT NULL,
  PRIMARY KEY (`products`,`companies`),
  UNIQUE KEY `companies` (`companies`),
  KEY `FKFCBB40C0798C82C9` (`products`),
  KEY `FKFCBB40C0470FBA37` (`companies`),
  CONSTRAINT `FKFCBB40C0470FBA37` FOREIGN KEY (`companies`) REFERENCES `company` (`id`),
  CONSTRAINT `FKFCBB40C0798C82C9` FOREIGN KEY (`products`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_companies`
--

LOCK TABLES `products_companies` WRITE;
/*!40000 ALTER TABLE `products_companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector_sector_branches`
--

DROP TABLE IF EXISTS `sector_sector_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sector_sector_branches` (
  `sector` bigint(20) NOT NULL,
  `sector_branches` bigint(20) NOT NULL,
  PRIMARY KEY (`sector`,`sector_branches`),
  UNIQUE KEY `sector_branches` (`sector_branches`),
  KEY `FK96383FB0C5C9775B` (`sector_branches`),
  KEY `FK96383FB0D9359B0D` (`sector`),
  CONSTRAINT `FK96383FB0D9359B0D` FOREIGN KEY (`sector`) REFERENCES `sector` (`id`),
  CONSTRAINT `FK96383FB0C5C9775B` FOREIGN KEY (`sector_branches`) REFERENCES `activity_branch` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector_sector_branches`
--

LOCK TABLES `sector_sector_branches` WRITE;
/*!40000 ALTER TABLE `sector_sector_branches` DISABLE KEYS */;
/*!40000 ALTER TABLE `sector_sector_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (1,'test@test.com','test','test',1);
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-21 15:19:23
