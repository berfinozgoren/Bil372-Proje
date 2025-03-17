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

--
-- Table structure for table `hizmetler`
--

DROP TABLE IF EXISTS `hizmetler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hizmetler` (
  `hizmet_id` int NOT NULL,
  `hizmet_adi` varchar(50) DEFAULT NULL,
  `aciklama` varchar(255) DEFAULT NULL,
  `fiyat` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`hizmet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hizmetler`
--

LOCK TABLES `hizmetler` WRITE;
/*!40000 ALTER TABLE `hizmetler` DISABLE KEYS */;
INSERT INTO `hizmetler` VALUES (1,'Oda Servisi','24 Saat Oda Servisi',50.00),(2,'Kuru Temizleme','Giysi temizleme hizmeti',30.00),(3,'Transfer Hizmeti','Havaalanı transfer hizmeti',100.00),(4,'Spa','Masaj ve spa hizmetleri',200.00);
/*!40000 ALTER TABLE `hizmetler` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `kullanicilar`
--

DROP TABLE IF EXISTS `kullanicilar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanicilar` (
  `kullanici_id` int NOT NULL,
  `kullanici_adi` varchar(50) DEFAULT NULL,
  `sifre` varchar(100) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `olusturulma_tarihi` date DEFAULT NULL,
  PRIMARY KEY (`kullanici_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanicilar`
--

LOCK TABLES `kullanicilar` WRITE;
/*!40000 ALTER TABLE `kullanicilar` DISABLE KEYS */;
INSERT INTO `kullanicilar` VALUES (1,'admin','password123','Yönetici','2024-07-01'),(2,'user1','password456','Kullanıcı','2024-07-02'),(3,'user2','password789','Kullanıcı','2024-07-03'),(4,'user3','password012','Kullanıcı','2024-07-04');
/*!40000 ALTER TABLE `kullanicilar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musteriler`
--

DROP TABLE IF EXISTS `musteriler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musteriler` (
  `musteri_id` int NOT NULL,
  `ad` varchar(50) DEFAULT NULL,
  `soyad` varchar(50) DEFAULT NULL,
  `eposta` varchar(100) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `adres` varchar(255) DEFAULT NULL,
  `sehir` varchar(50) DEFAULT NULL,
  `ulke` varchar(50) DEFAULT NULL,
  `olusturulma_tarihi` date DEFAULT NULL,
  PRIMARY KEY (`musteri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musteriler`
--

LOCK TABLES `musteriler` WRITE;
/*!40000 ALTER TABLE `musteriler` DISABLE KEYS */;
INSERT INTO `musteriler` VALUES (1,'Ali','Veli','ali.veli@example.com','0123456789','123 Sokak','İstanbul','Türkiye','2024-07-01'),(2,'Ayşe','Yılmaz','ayse.yilmaz@example.com','0123456790','456 Cadde','Ankara','Türkiye','2024-07-02'),(3,'Mehmet','Kaya','mehmet.kaya@example.com','0123456791','789 Bulvar','İzmir','Türkiye','2024-07-03'),(4,'Fatma','Demir','fatma.demir@example.com','0123456792','1011 Sokak','Bursa','Türkiye','2024-07-04'),(5,'Jon','Doe','test@example.us','6019521325','1600 Amphitheatre Parkway','CA','Amerika Birleşik Devletleri',NULL),(6,'Jon','Doe','test@example.us','6019521325','1600 Amphitheatre Parkway','CA','Amerika Birleşik Devletleri',NULL),(7,'Gottfried','Leibniz','test@beispiel.de','030303986300','Erika-Mann-Straße 33','dusseldorf','Almanya',NULL),(8,'João','Souza Silva','teste@exemplo.us','3121286800','Av. dos Andradas, 3000','MG','Brezilya',NULL),(9,'berfin','özgören','basd@etu.edu.tr','05555515151','tobb etü yurt','ankara','turkiye',NULL),(10,'beyza','değirmenci','bdegirmenci@etu.edu.tr','0551515898','tobb etü yurt','ankara','türkiye',NULL),(11,'','','','','','','',NULL),(12,'ali','aksu','aaksu@hotmail.com','05053235547','eryaman ','ankara','türkiye',NULL);
/*!40000 ALTER TABLE `musteriler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odalar`
--

DROP TABLE IF EXISTS `odalar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odalar` (
  `oda_id` int NOT NULL,
  `oda_numarasi` int DEFAULT NULL,
  `oda_tipi` varchar(50) DEFAULT NULL,
  `durum` varchar(20) DEFAULT NULL,
  `gecelik_ucret` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`oda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odalar`
--

LOCK TABLES `odalar` WRITE;
/*!40000 ALTER TABLE `odalar` DISABLE KEYS */;
INSERT INTO `odalar` VALUES (1,101,'Tek Kişilik','Boş',100.00),(2,102,'Çift Kişilik','Dolu',150.00),(3,103,'Suit','Boş',300.00),(4,104,'Tek Kişilik','Dolu',100.00),(5,105,'çift kişilik','Boş',700.00);
/*!40000 ALTER TABLE `odalar` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `rezervasyonlar` VALUES (1,1,1,'2024-07-10','2024-07-15',500.00,'Onaylandı','2024-07-01'),(2,2,2,'2024-07-11','2024-07-16',750.00,'Onaylandı','2024-07-02'),(3,3,3,'2024-07-12','2024-07-17',1500.00,'Onaylandı','2024-07-03'),(4,4,4,'2024-07-13','2024-07-18',500.00,'Onaylandı','2024-07-04'),(5,5,3,'2024-07-09','2024-07-09',1200.00,NULL,NULL),(6,9,1,'2024-07-02','2024-07-28',1800.00,NULL,NULL),(7,10,5,'2024-08-07','2024-08-16',700.00,NULL,NULL),(8,10,2,'2024-08-07','2024-08-16',700.00,NULL,NULL),(9,12,3,'2024-08-23','2024-08-25',300.00,NULL,NULL),(10,7,5,'2024-08-09','2024-08-11',500.00,NULL,NULL),(11,8,5,'2024-08-10','2024-08-18',500.00,NULL,NULL),(12,6,5,'2024-08-17','2024-08-24',500.00,NULL,NULL);
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

-- Dump completed on 2024-08-09  1:15:02
