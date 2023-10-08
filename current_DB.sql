CREATE DATABASE  IF NOT EXISTS `transportationdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `transportationdb`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: transportationdb
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `id_driver` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `father` varchar(45) DEFAULT NULL,
  `experience` decimal(4,2) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id_driver`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (0,NULL,NULL,NULL,NULL),(1,'Sergii','Horoshko','Ivan',02.40),(2,'Oleksii','Smith','Grigoryi',01.07),(3,'Andrii','Cherevatyi','Oleksandr',03.80),(4,'Grigoryi','Sologub','Leonid',00.00),(5,'Konstantin','Selivanov','Yaroslav',05.20),(6,'Alex','Green','Max',04.10),(7,'Leonardo','Danchuk','Oleksii',00.60),(8,'Anastasiia','Berber','Igor',03.40),(9,'Oleg','Chubay','Taras',07.42),(10,'Oleksii','Kirillov','Taras',04.03),(12,'Name','Surname','Father',22.22);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `kyiv_routes`
--

DROP TABLE IF EXISTS `kyiv_routes`;
/*!50001 DROP VIEW IF EXISTS `kyiv_routes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `kyiv_routes` AS SELECT 
 1 AS `id_route`,
 1 AS `departure`,
 1 AS `destination`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `id_route` int NOT NULL AUTO_INCREMENT,
  `departure` varchar(45) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `default_payment` decimal(10,0) NOT NULL,
  `distance` int DEFAULT NULL,
  PRIMARY KEY (`id_route`),
  UNIQUE KEY `id_UNIQUE` (`id_route`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Kyiv','Zagreb',1400,750),(2,'Paris','Athens',2670,2100),(3,'Lisabon','Malmo',6030,4800),(4,'Odesa ','Kyiv',607,300),(5,'Vlora','Tirana',50,120),(6,'Tirana','Vlora',60,120),(7,'Munich','Berlin',90,160),(8,'Zagreb','Kyiv',1561,750),(9,'Beijing','Riga',12500,6512);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `to_pay`
--

DROP TABLE IF EXISTS `to_pay`;
/*!50001 DROP VIEW IF EXISTS `to_pay`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `to_pay` AS SELECT 
 1 AS `id_driver`,
 1 AS `name_driver`,
 1 AS `surname_driver`,
 1 AS `to_pay`,
 1 AS `extra_charge`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel` (
  `id_travel` int NOT NULL AUTO_INCREMENT,
  `id_route` int NOT NULL,
  `id_driver` int NOT NULL,
  `id_second_driver` int NOT NULL,
  `date_departure` datetime NOT NULL,
  `date_arrival` datetime NOT NULL,
  `payment` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_travel`),
  KEY `route_idx` (`id_route`),
  KEY `driver_idx` (`id_driver`) /*!80000 INVISIBLE */,
  KEY `driver_idx1` (`id_driver`,`id_second_driver`),
  KEY `driver2_idx` (`id_second_driver`),
  CONSTRAINT `driver` FOREIGN KEY (`id_driver`) REFERENCES `driver` (`id_driver`),
  CONSTRAINT `driver2` FOREIGN KEY (`id_second_driver`) REFERENCES `driver` (`id_driver`),
  CONSTRAINT `route` FOREIGN KEY (`id_route`) REFERENCES `route` (`id_route`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` VALUES (1,3,1,0,'2024-12-07 23:59:59','2024-12-11 19:20:00',2234),(2,8,2,3,'2023-05-27 00:00:00','2023-06-06 11:30:20',4234),(3,1,3,0,'2023-07-04 12:50:00','2023-07-12 17:20:00',8734),(4,6,6,8,'2023-11-05 17:00:00','2023-05-20 20:00:00',1334),(5,5,6,0,'2023-05-21 17:00:00','2023-05-21 20:00:00',1344),(6,9,9,6,'2023-06-01 10:00:00','2023-06-15 15:00:00',17984),(7,6,8,0,'2023-06-02 13:00:00','2023-06-02 16:00:00',2354),(8,7,7,0,'2023-06-03 16:00:00','2023-06-04 10:00:00',1434),(9,3,4,2,'2023-07-05 12:00:00','2023-07-10 12:00:00',9734),(10,4,3,8,'2023-05-25 00:33:00','2023-05-26 12:00:00',21537),(11,1,2,6,'2023-05-25 00:33:00','2023-05-26 12:00:00',124655);
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `kyiv_routes`
--

/*!50001 DROP VIEW IF EXISTS `kyiv_routes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kyiv_routes` AS select `route`.`id_route` AS `id_route`,`route`.`departure` AS `departure`,`route`.`destination` AS `destination` from `route` where ((`route`.`departure` = 'Kyiv') or (`route`.`destination` = 'Kyiv')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `to_pay`
--

/*!50001 DROP VIEW IF EXISTS `to_pay`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `to_pay` (`id_driver`,`name_driver`,`surname_driver`,`to_pay`,`extra_charge`) AS select `driver`.`id_driver` AS `id_driver`,`driver`.`name` AS `name`,`driver`.`surname` AS `surname`,`travel`.`payment` AS `payment`,(`travel`.`payment` - `route`.`default_payment`) AS `travel.payment - route.default_payment` from ((`travel` join `driver`) join `route`) where (((`driver`.`id_driver` = `travel`.`id_driver`) or (`driver`.`id_driver` = `travel`.`id_second_driver`)) and (`driver`.`id_driver` <> 0) and (`travel`.`id_route` = `route`.`id_route`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-08 12:14:19
