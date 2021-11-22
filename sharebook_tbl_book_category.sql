-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sharebook
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `tbl_book_category`
--

DROP TABLE IF EXISTS `tbl_book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_book_category` (
  `book_category_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `categoty_id` int DEFAULT NULL,
  PRIMARY KEY (`book_category_id`),
  KEY `id_bc_category_idx` (`categoty_id`),
  KEY `id_bc_book_idx` (`book_id`),
  CONSTRAINT `id_bc_book` FOREIGN KEY (`book_id`) REFERENCES `tbl_book` (`book_id`),
  CONSTRAINT `id_bc_category` FOREIGN KEY (`categoty_id`) REFERENCES `tbl_categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_category`
--

LOCK TABLES `tbl_book_category` WRITE;
/*!40000 ALTER TABLE `tbl_book_category` DISABLE KEYS */;
INSERT INTO `tbl_book_category` VALUES (2,2,2),(3,3,1),(4,26,1),(5,27,1),(6,28,1),(7,29,1),(8,30,1),(9,31,1),(10,32,1),(11,33,1),(12,34,1),(13,35,1),(14,36,1),(15,37,1),(16,38,1),(17,41,5);
/*!40000 ALTER TABLE `tbl_book_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-21 20:53:22
