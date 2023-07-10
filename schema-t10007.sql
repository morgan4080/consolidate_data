-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: localhost    Database: t10007
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `b_region`
--

DROP TABLE IF EXISTS `b_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_region` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` tinyint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_region_refId` (`refId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `b_branch`
--

DROP TABLE IF EXISTS `b_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_branch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refId` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  `isActive` varchar(45) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isHQ` tinyint DEFAULT NULL,
  `regionId` int DEFAULT NULL,
  `branchCode` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(10) DEFAULT NULL,
  `tenant_pid` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refId_UNIQUE` (`refId`),
  KEY `idx_branch_refid` (`refId`),
  KEY `fk_b_branch_1_idx` (`regionId`),
  CONSTRAINT `fk_b_branch_1` FOREIGN KEY (`regionId`) REFERENCES `b_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-10 15:47:30
