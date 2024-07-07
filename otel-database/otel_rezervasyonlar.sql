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
-- Table structure for table `rezervasyonlar`
--

DROP TABLE IF EXISTS `rezervasyonlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezervasyonlar` (
  `rezervasyon_id` int NOT NULL,
  `musteri_id` int DEFAULT NULL,
  `oda_id` int DEFAULT NULL,
  `giris_tarihi` date DEFAULT NULL,
  `cikis_tarihi` date DEFAULT NULL,
  `toplam_ucret` decimal(10,2) DEFAULT NULL,
  `durum` varchar(20) DEFAULT NULL,
  `olusturulma_tarihi` date DEFAULT NULL,
  PRIMARY KEY (`rezervasyon_id`),
  KEY `musteri_id` (`musteri_id`),
  KEY `oda_id` (`oda_id`),
  CONSTRAINT `rezervasyonlar_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `musteriler` (`musteri_id`),
  CONSTRAINT `rezervasyonlar_ibfk_2` FOREIGN KEY (`oda_id`) REFERENCES `odalar` (`oda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezervasyonlar`
--

LOCK TABLES `rezervasyonlar` WRITE;
/*!40000 ALTER TABLE `rezervasyonlar` DISABLE KEYS */;
INSERT INTO `rezervasyonlar` VALUES (1,1,1,'2024-07-10','2024-07-15',500.00,'Onaylandı','2024-07-01'),(2,2,2,'2024-07-11','2024-07-16',750.00,'Onaylandı','2024-07-02'),(3,3,3,'2024-07-12','2024-07-17',1500.00,'Onaylandı','2024-07-03'),(4,4,4,'2024-07-13','2024-07-18',500.00,'Onaylandı','2024-07-04');
/*!40000 ALTER TABLE `rezervasyonlar` ENABLE KEYS */;
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
