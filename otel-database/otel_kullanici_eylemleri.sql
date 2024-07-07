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
-- Table structure for table `kullanici_eylemleri`
--

DROP TABLE IF EXISTS `kullanici_eylemleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanici_eylemleri` (
  `eylem_id` int NOT NULL,
  `kullanici_id` int DEFAULT NULL,
  `eylem_tipi` varchar(50) DEFAULT NULL,
  `eylem_aciklamasi` varchar(255) DEFAULT NULL,
  `eylem_tarihi` date DEFAULT NULL,
  PRIMARY KEY (`eylem_id`),
  KEY `kullanici_id` (`kullanici_id`),
  CONSTRAINT `kullanici_eylemleri_ibfk_1` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanici_eylemleri`
--

LOCK TABLES `kullanici_eylemleri` WRITE;
/*!40000 ALTER TABLE `kullanici_eylemleri` DISABLE KEYS */;
INSERT INTO `kullanici_eylemleri` VALUES (1,1,'Giriş','Sisteme giriş yapıldı','2024-07-01'),(2,2,'Rezervasyon','Yeni rezervasyon yapıldı','2024-07-02'),(3,3,'Hizmet Talebi','Hizmet talebi oluşturuldu','2024-07-03'),(4,4,'Çıkış','Sistemden çıkış yapıldı','2024-07-04');
/*!40000 ALTER TABLE `kullanici_eylemleri` ENABLE KEYS */;
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
