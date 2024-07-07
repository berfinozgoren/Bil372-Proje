/* https://www.youtube.com/watch?v=zCG4cCebrQc */


CREATE DATABASE  IF NOT EXISTS `201101075` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `201101075`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: 201101075
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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL,
  `SSN` int DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PasswordHash` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,11,'tugberk','aksu','tugberkaksu@etu.edu.tr','hash1','yenimahalle','555-111'),(2,22,'ali ','citak','alicitak@etu.edu.tr','hash2','eryaman','555-222'),(3,33,'deniz','gunduz','denizgunduz@etu.edu.tr','hash3','kızılay','555-333'),(4,44,'cemal','bayraktar','cemalbayraktar@etu.edu.tr','hash4','bahçelievler','555-444');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerplan`
--

DROP TABLE IF EXISTS `customerplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerplan` (
  `customerPlanID` int NOT NULL,
  `PlannerCustomerID` int DEFAULT NULL,
  `PlannedPlanID` int DEFAULT NULL,
  PRIMARY KEY (`customerPlanID`),
  KEY `PlannerCustomerID` (`PlannerCustomerID`),
  KEY `PlannedPlanID` (`PlannedPlanID`),
  CONSTRAINT `PlannedPlanID` FOREIGN KEY (`PlannedPlanID`) REFERENCES `plan` (`PlanID`),
  CONSTRAINT `PlannerCustomerID` FOREIGN KEY (`PlannerCustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerplan`
--

LOCK TABLES `customerplan` WRITE;
/*!40000 ALTER TABLE `customerplan` DISABLE KEYS */;
INSERT INTO `customerplan` VALUES (1,1,3),(2,2,1),(3,3,2);
/*!40000 ALTER TABLE `customerplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpu`
--

DROP TABLE IF EXISTS `gpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gpu` (
  `GPUID` int NOT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `Manufacturer` varchar(255) DEFAULT NULL,
  `MemorySize` int DEFAULT NULL,
  `AvailabilityStatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`GPUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpu`
--

LOCK TABLES `gpu` WRITE;
/*!40000 ALTER TABLE `gpu` DISABLE KEYS */;
INSERT INTO `gpu` VALUES (1,'H100','NVIDIA',80,1),(2,'GTX1660TI','NVIDIA',16,0),(3,'AMD FX500','AMD',22,1);
/*!40000 ALTER TABLE `gpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `PlanID` int NOT NULL,
  `PlanName` varchar(255) DEFAULT NULL,
  `MonthlyRate` double DEFAULT NULL,
  `MaxGPUs` int DEFAULT NULL,
  PRIMARY KEY (`PlanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,'Basic Plan',9.99,1),(2,'Standart Plan',29.99,2),(3,'Premium Plan',59.99,4);
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `RentalID` int NOT NULL,
  `RentalDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  `Cost` int DEFAULT NULL,
  `RenterCustomerID` int DEFAULT NULL,
  `RentedGPUID` int DEFAULT NULL,
  PRIMARY KEY (`RentalID`),
  KEY `RenterCustomerID` (`RenterCustomerID`),
  KEY `RentedGPUID` (`RentedGPUID`),
  CONSTRAINT `RentedGPUID` FOREIGN KEY (`RentedGPUID`) REFERENCES `gpu` (`GPUID`),
  CONSTRAINT `RenterCustomerID` FOREIGN KEY (`RenterCustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1,'2024-05-01','2024-06-02',100,1,1),(2,'2024-01-01',NULL,200,2,2);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usageusage`
--

DROP TABLE IF EXISTS `usageusage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usageusage` (
  `UsageID` int NOT NULL,
  `GPUID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `UsageHours` double DEFAULT NULL,
  PRIMARY KEY (`UsageID`),
  KEY `GPUID` (`GPUID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `GPUID` FOREIGN KEY (`GPUID`) REFERENCES `gpu` (`GPUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usageusage`
--

LOCK TABLES `usageusage` WRITE;
/*!40000 ALTER TABLE `usageusage` DISABLE KEYS */;
INSERT INTO `usageusage` VALUES (1,3,1,5.5),(2,2,2,12),(3,1,3,7.8);
/*!40000 ALTER TABLE `usageusage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-04 15:48:53
