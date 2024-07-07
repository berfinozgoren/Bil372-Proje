-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: otel
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `hizmet_talepleri`
--

DROP TABLE IF EXISTS `hizmet_talepleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hizmet_talepleri` (
  `talep_id` int NOT NULL,
  `rezervasyon_id` int DEFAULT NULL,
  `hizmet_id` int DEFAULT NULL,
  `talep_tarihi` date DEFAULT NULL,
  `durum` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`talep_id`),
  KEY `rezervasyon_id` (`rezervasyon_id`),
  KEY `hizmet_id` (`hizmet_id`),
  CONSTRAINT `hizmet_talepleri_ibfk_1` FOREIGN KEY (`rezervasyon_id`) REFERENCES `rezervasyonlar` (`rezervasyon_id`),
  CONSTRAINT `hizmet_talepleri_ibfk_2` FOREIGN KEY (`hizmet_id`) REFERENCES `hizmetler` (`hizmet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hizmet_talepleri`
--

LOCK TABLES `hizmet_talepleri` WRITE;
/*!40000 ALTER TABLE `hizmet_talepleri` DISABLE KEYS */;
INSERT INTO `hizmet_talepleri` VALUES (1,1,1,'2024-07-11','Tamamlandı'),(2,2,2,'2024-07-12','Tamamlandı'),(3,3,3,'2024-07-13','Tamamlandı'),(4,4,4,'2024-07-14','Tamamlandı');
/*!40000 ALTER TABLE `hizmet_talepleri` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-07 20:26:33
