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
-- Table structure for table `tbl_book`
--

DROP TABLE IF EXISTS `tbl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `id_book_user_idx` (`user_id`),
  CONSTRAINT `id_book_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book`
--

LOCK TABLES `tbl_book` WRITE;
/*!40000 ALTER TABLE `tbl_book` DISABLE KEYS */;
INSERT INTO `tbl_book` VALUES (1,1,'dsdsd','23232','Images/kiem_tra_gk.pdf','3232323','2011-12-17 17:00:00','2011-12-17 17:00:00'),(2,2,'2sdsd','2323','2323','2323','2011-12-16 17:00:00','2011-12-16 17:00:00'),(3,3,'231asdas','232323','2323','2323232','2011-12-18 17:00:00','2011-12-18 17:00:00'),(16,4,'asdasdsa','Images/123.png','Images/kiem_tra_gk.pdf','Images/Asg3-Functional-Demonstration.pdf','2021-11-14 11:54:21',NULL),(17,4,'21321321','Images/','Images/','213123','2021-11-14 13:31:03',NULL),(18,4,'21321321','Images/','Images/','213123','2021-11-14 13:36:02',NULL),(19,4,'21321321','Images/','Images/','213123','2021-11-14 13:37:56',NULL),(20,4,'ddsdsd','Images/','Images/','sdsddsdsdsd','2021-11-14 13:53:01',NULL),(21,4,'sadsad','Images/','Images/','sadsdsd','2021-11-14 13:57:31',NULL),(22,4,'sadsad','Images/','Images/','sadsdsd','2021-11-14 13:57:47',NULL),(23,4,'bbb','Images/','Images/','bbb','2021-11-14 13:57:58',NULL),(24,4,'dsd','Images/','Images/','sdsdsd','2021-11-14 14:19:57',NULL),(25,4,'dsds','Images/123.png','Images/LTWNC.01.pdf','dsdsdsd','2021-11-14 14:40:31',NULL),(26,4,'dsds','Images/123.png','Images/LTWNC.01.pdf','dsdsdsd','2021-11-14 14:41:49',NULL),(27,4,'11','Images/1.png','Images/Asg3.pdf','23','2021-11-18 14:00:28',NULL),(28,4,'test','Images/123.png','Images/Asg3.pdf','123123','2021-11-18 14:06:54',NULL),(29,4,'123123','Images/processed.jpeg','Images/Asg3.pdf','213123','2021-11-19 09:26:16',NULL),(30,4,'111111','Images/123.png','Images/Asg3.pdf','1111','2021-11-19 09:36:09',NULL),(31,4,'123','Images/123.png','Images/Asg3.pdf','123','2021-11-19 09:37:27',NULL),(32,4,'vvcvcv','Images/123.png','Images/Asg3-Functional-Demonstration.pdf','asdasd','2021-11-19 09:42:05',NULL),(33,4,'123','Images/A3F9273A-9A8B-4F9B-8651-37CC58BB55DA.jpg','Images/RESTful_API_Design_Best_Practices_v1.0_en.pdf','123123213213','2021-11-19 10:21:06',NULL),(34,4,'dsdsd','Images/A3F9273A-9A8B-4F9B-8651-37CC58BB55DA.jpg','Images/RESTful_API_Design_Best_Practices_v1.0_en.pdf','323312','2021-11-19 10:22:38',NULL),(35,4,'dsdsd','Images/','Images/','323312','2021-11-19 10:24:00',NULL),(36,4,'dsdsd','Images/','Images/','323312','2021-11-19 10:25:51',NULL),(37,4,'dsdsd','Images/','Images/','323312','2021-11-19 10:26:01',NULL),(38,4,'213213123','Images/123.png','Images/RESTful_API_Design_Best_Practices_v1.0_en.pdf','1231231232','2021-11-19 10:34:13',NULL),(39,4,'qweqwe','Images/','Images/','eeqwe','2021-11-19 10:40:39',NULL),(40,4,'123','Images/','Images/','123123','2021-11-19 16:19:49',NULL),(41,4,'123213213','Images/123.png','Images/RESTful_API_Design_Best_Practices_v1.0_en.pdf','12321321','2021-11-21 09:26:54',NULL);
/*!40000 ALTER TABLE `tbl_book` ENABLE KEYS */;
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
