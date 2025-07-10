-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: database-2.cv2qhaayvgg6.ap-south-1.rds.amazonaws.com    Database: EHR
-- ------------------------------------------------------
-- Server version	8.0.16

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
-- SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

-- SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','$2a$12$KksIuA8ndFQqSjT1Btw.wuQrRf5db/43lNDxyHzLo6UCsd3J2YhOa','2020-06-08 18:08:08','2020-06-08 18:08:08');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Aaishwarya','$2a$12$LQOteN/sO4XzwS68IYd3b.szOCnuXpzn0WE3EAmFaTBYl7XZE/UmS','bhosaleaishwarya@gmail.com','Aaishwarya Shamrao Bhosale','female','1990-08-13','Maratha Colony, kolhapur','9115995134','','2020-06-08 17:11:59','2020-06-08 17:11:59'),(2,'Avinash','$2a$12$Qsd1C/CQmnTs0wS2bG6fBOW1iQisNqfyJ/Le7cFfg.JEkwnFSkH/6','Avinashkumbhar@gmail.com','Avinash Apurv Kumbhar','male','1989-03-19','Kalmba, kolhapur','7024444821','','2020-06-08 17:15:46','2020-06-08 17:15:46'),(3,'Rakesh','$2a$12$vXgv1a2cZvYq51afMAhyFOn1BGb.Njo0bZZo.R/nt3yRNbpc/MlV2','rakeshkoli673@gmail.com','Rakesh Baliram Koli','male','1970-07-18','Kasaba Bawada, kolhapur','7120364921','','2020-06-08 17:17:27','2020-06-08 17:17:27'),(4,'sidhesh','$2a$12$bluQ6IbMEkYp0MH/VesQ3.0d7cXjOQVI60qFN2DnMjgbokYt/CXc2','maghumsid99@gmail.com','Sidhesh Shashikant Magdhum','male','1975-02-27','Hanuman nagar, kolhapur','7796413544','','2020-06-08 17:17:47','2020-06-08 17:17:47'),(5,'sanket','$2a$12$piyrtAbtGqnweKgPs74DUe7JFpJ0TL64.o8nq0E/hdiJDUcF5DyC.','patilsanket@gmail.com','Sanket Shreyas Patil','male','1970-04-14','Shivaji Nagar, Sangli','7046132587','','2020-06-08 17:19:51','2020-06-08 17:19:51'),(6,'snehal','$2a$12$zvAcXosdOp88BEGkxJKate6DyZfN.uVbeqcCWaRaqxs4gQxj.gpMO','snehalshinde111@gmail.com','Snehal Shivaji Shinde','female','1982-09-12','Shinde Galli, kolhapur','8820014065','','2020-06-08 17:20:07','2020-06-08 17:20:07'),(7,'dhananjay','$2a$12$ylV5I1iyBhy5YcZfPxrfiOukJugaQeJtj3oKRfdg75RXLBMWSOuGi','dhananjaysawant@gmail.com','Dhananjay Shashikant Sawant','male','1978-03-30','katraj, Pune','7064319787','','2020-06-08 17:22:07','2020-06-08 17:22:07'),(8,'sujit','$2a$12$tt1n83PkBbaXPeO.oir8iO4CcQOsNQUAw030chG2NnC7Psq1KsN2q','patilsujit4422@gmail.com','Sujit Suresh Patil','male','1980-12-15','Shiyevadi, Kagal','8665527894','','2020-06-08 17:22:31','2020-06-08 17:22:31'),(9,'neeta','$2a$12$BGyvjpaDM7wVoFUj3OZ3XOqxlJlAa0JtHU1o2i9mI1f2jGiqNUdW2','neetashelke@gmail.com','Neeta Ganpati Shelke','female','1977-09-29','Budarvar Peth, Kolhapur','7045826177','','2020-06-08 17:24:46','2020-06-08 17:24:46'),(10,'rutuja','$2a$12$wAwj.k8hLJeVQnqLAIG9AucgoMBAcPFMiePaaxBLczZk4QdErNlgG','rutudesai@gmail.com','Rutuja Hemant Desai','female','1970-06-11','Nagala park, Kolhapur','8461300258','','2020-06-08 17:25:13','2020-06-08 17:25:13'),(11,'Rajiv','$2a$12$oUBYabKrntIU8gdPKPTlIuQNPfFr/0r01LL6K2W8D.pyvUXg.k9jq','rajiv@gmail.com','Rajiv Kulkarni','male','1965-09-09','Trade Wings, opp. to Dmart, Tarabai park, Kolhapur','9632587419','pathologist','2020-06-09 02:46:34','2020-06-09 02:46:34'),(12,'Suresh','$2a$12$axaV9tYHmVe6myohV6zGP.FhWU3CTpt78rYxD3ryIaDxOg2uaxKzy','suresh@gamil.com','suresh shetty','male','1965-10-21','Rajarampuri, Kolhapur','8654866241','Neurology','2020-06-09 04:28:59','2020-06-09 04:28:59'),(13,'IamDoctor','$2a$12$T7LL4IpVSvA14wFmrY1fw.Evzn4DEeF5zeSt8Nc/XmLqFn/0cR1Zy','xyz@gmail.com','Karan Kulkarni','Male','2020-06-10','Devkar Panand','8149167001','Neurologist','2020-06-10 07:53:12','2020-06-10 07:53:12');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `reportId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reportId` (`reportId`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`reportId`) REFERENCES `reports` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'1591639998297medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:13:18','2020-06-08 18:13:18',6),(2,'1591640056360medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:14:16','2020-06-08 18:14:16',7),(3,'1591640136009medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:15:36','2020-06-08 18:15:36',8),(4,'1591640287827medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:18:08','2020-06-08 18:18:08',9),(5,'1591640461752medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:21:02','2020-06-08 18:21:02',10),(6,'1591640785758medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:26:26','2020-06-08 18:26:26',11),(7,'1591640976503medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:29:36','2020-06-08 18:29:36',12),(8,'1591641095937medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:31:36','2020-06-08 18:31:36',13),(9,'1591641233864medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:33:54','2020-06-08 18:33:54',14),(10,'1591641434733medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:37:15','2020-06-08 18:37:15',15),(11,'1591641488213medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:38:08','2020-06-08 18:38:08',16),(12,'1591641601324medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:40:01','2020-06-08 18:40:01',17),(13,'1591641679287medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:41:19','2020-06-08 18:41:19',18),(14,'1591641872853medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:44:33','2020-06-08 18:44:33',19),(15,'1591641994812medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:46:35','2020-06-08 18:46:35',20),(16,'1591642087843medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:48:08','2020-06-08 18:48:08',21),(17,'1591642218233medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:50:18','2020-06-08 18:50:18',22),(18,'1591642242988medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:50:43','2020-06-08 18:50:43',23),(19,'1591642293892medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:51:34','2020-06-08 18:51:34',24),(20,'1591642333367medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:52:13','2020-06-08 18:52:13',25),(21,'1591642352492medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:52:33','2020-06-08 18:52:33',26),(22,'1591642488688medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:54:49','2020-06-08 18:54:49',27),(23,'1591642524884medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:55:25','2020-06-08 18:55:25',28),(24,'1591642546455medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:55:46','2020-06-08 18:55:46',29),(25,'1591642638840medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:57:19','2020-06-08 18:57:19',30),(26,'1591642662432medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:57:42','2020-06-08 18:57:42',31),(27,'1591642693992medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:58:14','2020-06-08 18:58:14',32),(28,'1591642717272medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:58:37','2020-06-08 18:58:37',33),(29,'1591642737818medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:58:58','2020-06-08 18:58:58',34),(30,'1591642793038medical-records-analyst-1509430606-pdf.jpg','2020-06-08 18:59:53','2020-06-08 18:59:53',35),(31,'1591642818422medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:00:18','2020-06-08 19:00:18',36),(32,'1591642936739medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:02:17','2020-06-08 19:02:17',37),(33,'1591642970702medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:02:51','2020-06-08 19:02:51',38),(34,'1591642997871medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:03:18','2020-06-08 19:03:18',39),(35,'1591643017198medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:03:37','2020-06-08 19:03:37',40),(36,'1591643037158medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:03:57','2020-06-08 19:03:57',41),(37,'1591643327400medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:08:55','2020-06-08 19:08:55',42),(38,'1591643368916medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:09:34','2020-06-08 19:09:34',43),(39,'1591643394328medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:09:59','2020-06-08 19:09:59',44),(40,'1591643410630medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:10:15','2020-06-08 19:10:15',45),(41,'1591643426413medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:10:32','2020-06-08 19:10:32',46),(42,'1591643554789medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:12:41','2020-06-08 19:12:41',47),(43,'1591643618068medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:13:47','2020-06-08 19:13:47',48),(44,'1591643636395medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:14:00','2020-06-08 19:14:00',49),(45,'1591643676130medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:14:42','2020-06-08 19:14:42',50),(46,'1591643795069medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:16:40','2020-06-08 19:16:40',51),(47,'1591643819088medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:17:04','2020-06-08 19:17:04',52),(48,'1591643845730medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:17:32','2020-06-08 19:17:32',53),(49,'1591643907408medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:18:32','2020-06-08 19:18:32',54),(50,'1591644023428medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:20:30','2020-06-08 19:20:30',55),(51,'1591644053817medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:20:54','2020-06-08 19:20:54',56),(52,'1591644074849medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:21:15','2020-06-08 19:21:15',57),(53,'1591644104718medical-records-analyst-1509430606-pdf.jpg','2020-06-08 19:21:44','2020-06-08 19:21:44',58),(54,'1591671050115Sunil Report.jpg','2020-06-09 02:50:50','2020-06-09 02:50:50',59),(55,'1591677020943Sunil Report.jpg','2020-06-09 04:30:21','2020-06-09 04:30:21',61),(56,'1591689573976final.jpg','2020-06-09 07:59:34','2020-06-09 07:59:34',62);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_doctors`
--

DROP TABLE IF EXISTS `hospital_doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospitalId` int(11) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_doctors`
--

LOCK TABLES `hospital_doctors` WRITE;
/*!40000 ALTER TABLE `hospital_doctors` DISABLE KEYS */;
INSERT INTO `hospital_doctors` VALUES (1,1,1,'2020-06-08 17:11:59','2020-06-08 17:11:59'),(2,1,2,'2020-06-08 17:15:46','2020-06-08 17:15:46'),(3,2,3,'2020-06-08 17:17:27','2020-06-08 17:17:27'),(4,2,4,'2020-06-08 17:17:47','2020-06-08 17:17:47'),(5,4,5,'2020-06-08 17:19:51','2020-06-08 17:19:51'),(6,4,6,'2020-06-08 17:20:07','2020-06-08 17:20:07'),(7,5,7,'2020-06-08 17:22:07','2020-06-08 17:22:07'),(8,5,8,'2020-06-08 17:22:31','2020-06-08 17:22:31'),(9,6,9,'2020-06-08 17:24:46','2020-06-08 17:24:46'),(10,6,10,'2020-06-08 17:25:13','2020-06-08 17:25:13'),(11,7,11,'2020-06-09 02:46:34','2020-06-09 02:46:34'),(12,8,12,'2020-06-09 04:28:59','2020-06-09 04:28:59'),(13,10,13,'2020-06-10 07:53:12','2020-06-10 07:53:12');
/*!40000 ALTER TABLE `hospital_doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitals`
--

DROP TABLE IF EXISTS `hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospitals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitals`
--

LOCK TABLES `hospitals` WRITE;
/*!40000 ALTER TABLE `hospitals` DISABLE KEYS */;
INSERT INTO `hospitals` VALUES (1,'applehospital','$2a$12$eWhsjGoOBkVWoRPXgDrhMOHcfEf.SlsHq0H/cQfqN9QdBjMM1LNe.','saraswatihospital@gmail.com','Apple Saraswati Multispeciality Hospital','804/2, 805/2, E Ward, Circuit House To Kadamwadi Road, Bhosalewadi, Kolhapur, Maharashtra 416003','0231 268 8888','2020-06-08 17:03:37','2020-06-08 17:03:37'),(2,'cityhospital','$2a$12$Vmfkp..UPejt87ypMCdIteju/o66d5PQQHMQowQYrx726.Yk4/xDS','cityhospital@gmail.com','City Hospital Rajarampuri','8th Ln, near city hospital, Poorvarang, Mahalaxminagar, Rajarampuri, Kolhapur, Maharashtra 416008','0231 254 7654','2020-06-08 17:04:33','2020-06-08 17:04:33'),(3,'cityhospital1','$2a$12$GKI/GMtYdTbh2dGUYNR6MuSIJVhDZtYP7ThyCsFgIxXUQ2JcTfZsG','cityhospital@gmail.com','City Hospital Rajarampuri','8th Ln, near city hospital, Poorvarang, Mahalaxminagar, Rajarampuri, Kolhapur, Maharashtra 416008','0231 254 7654','2020-06-08 17:06:45','2020-06-08 17:06:45'),(4,'ShriHospital','$2a$12$uFJ3osil2mIGfZG0NR0SWOqJUcheXx6AkeyMtmEO22HtEup/GjlrS','shrihospital@gmail.com','Shri Hospital','Bus route, 1st Ln, Poorvarang, Mahalaxminagar, Rajarampuri, Kolhapur, Maharashtra 416001','0231 252 4249','2020-06-08 17:07:09','2020-06-08 17:07:09'),(5,'HiraiHospital','$2a$12$5l9EMV9RXPVBJkFWCtvFBOIPQXCyVbunME8LYsVNseeUMjgEb5C7q','hiraihospital@gmail.com','Hirai Hospital','Kasaba Bawada, Kolhapur, Maharashtra 416006','0231 260 1112','2020-06-08 17:07:42','2020-06-08 17:07:42'),(6,'SevaHospital','$2a$12$KH/FkbnLUmR.arJJgFEIZut4yllCNxYtV4UswusqURp5NKsnOJR7q','sevahospital@gmail.com','Seva Hospital','Indumati Road, Police Head Quarters, Kolhapur, Maharashtra 416006','0231 260 0185','2020-06-08 17:08:59','2020-06-08 17:08:59'),(7,'asteradhar','$2a$12$RYXKmk8STMxJV71fG07RZO9zXVGN0PHhYzJ98xlDh8LxdLwa1.85W','asteradhar@gmail.com','Adhar Hospital','Kadam wadi, Kolhapur','02312632807','2020-06-09 02:42:59','2020-06-09 02:42:59'),(8,'AdharHospital','$2a$12$pxCQcDwmgeiVV2L40tSTpesJMbR94zK7E5YCHPbQtxNhsAk8jCldG','adhar@gmail.com','AsterAdhar','Kadam wadi, Kolhapur','9963522589','2020-06-09 04:17:38','2020-06-09 04:17:38'),(9,'takecare','$2a$12$KX7u8wMiwwKU3NdWLT0Udub3DsIn5vZjgWNRdtALN401MKapRwYre','takecare@gmail.com','takecare','karad','09552910355','2020-06-09 05:17:44','2020-06-09 05:17:44'),(10,'karan','$2a$12$KRWUslZT/iMnlIrR06IiiONPGy59z7LxK6GKzuDtF0Q56oxyYOQGq','xyz@gmail.com','Karan Kulkarni','Devkar Panand, Kolhapur','8149167001','2020-06-10 07:51:18','2020-06-10 07:51:18');
/*!40000 ALTER TABLE `hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'ruturaj','$2a$12$yWkjJO7P5IaNgJkQzcOGpe.hx.TOkp/rU7ChbJ8oII0Jj9IpBzRZq','ruturajsawant5@gmail.com','Ruturaj Ravindra Sawant','male','1998-01-01','chikhali','8806463609','2020-06-08 16:41:30','2020-06-08 16:41:30'),(2,'rushikesh','$2a$12$EKyphFfEFlzZzKaBxqmKaeq2.hPjDb/wrBANRg5MTPhjSutQSNegq','mrushikesh750@gmail.com','Rushikesh Ravindra More','male','1999-04-10','kasaba bawada, kolhapur','8600888306','2020-06-08 16:43:43','2020-06-08 16:43:43'),(3,'ruturaj24','$2a$12$h3ZDPyeql1uhlq2OM2Cn2ul58n29x012329nodLTcXPGi/Vuokt76','ruturaj71098@gmail.com','Ruturaj Hemant Desai','male','1998-10-08','Mangalvar phet, kolhapur','9767577630','2020-06-08 16:44:26','2020-06-08 16:44:26'),(4,'siddhi','$2a$12$.KmA28.bOWu09JsRQ8pDze0u.48JPLA2WF77FVO7y/9lkjR97NIZW','sidjadhav989@gmail.com','Siddhi Ashok Jadhav','male','1998-11-07','Mukta sainik vasahat, kolhapur','7020564821','2020-06-08 16:46:07','2020-06-08 16:46:07'),(5,'karan','$2a$12$One93zxYxXvp3elgcFbXgeE2faVdWpE8eG0iEJSc68s9KHcMsmqM.','karankenjale@gmail.com','Karan Dattatray Kenjale','male','1998-09-05','kataraj, karad','9552910355','2020-06-08 16:47:11','2020-06-08 16:47:11'),(6,'shreyas','$2a$12$N/e/v/4dWSpPyNcnGm.kguYbaGyJFbGznSUbk2etVvwg11wQ9G3Ba','mhetreshreyas@gmail.com','Shreyas Yuvraj Mhetre','male','1999-05-21','uttar nagar, vita','9130433975','2020-06-08 16:47:48','2020-06-08 16:47:48'),(7,'akshay','$2a$12$TeMkzVyMlRR8DpbZ8.4TQetAuWwTUZ8KrRWsjmDhDtJ9sTwdGE8BK','patilakshay@gmail.com','Aksahy Shamrao Patil','male','1994-11-11','kasaba bawada, kolhapur','9235644465','2020-06-08 16:48:18','2020-06-08 16:48:18'),(8,'apurv','$2a$12$zhB.Zorp/Q/S5/OAj3ZrcuGHR6BrHltaAy4imFpZFrhRd9qnjXTye','kumbharapurv66@gmail.com','Apurv Avinash Kumbhar','male','1996-06-06','Mukta sainik vasahat, kolhapur','7025568466','2020-06-08 16:48:39','2020-06-08 16:48:39'),(9,'pruthviraj','$2a$12$L5mtCPzGb5IxGLg5/JE8..dCwQriZ9vu6z7JpLE9MRktLZProU2Mq','pruthvirajpatil@gmail.com','Pruthviraj Shantaram Patil','male','1995-02-20','kasaba bawada, kolhapur','9531254578','2020-06-08 16:48:59','2020-06-08 16:48:59'),(10,'nargis','$2a$12$dgWEu/IJvJnsLU7OfDYXh.z1UD6CbSesIZKdpvpikMkOhS9qNQ14q','patvardhannargis@gmail.com','Nargis Pankaj Patvardhan','female','1998-03-15','pachgav, kolhapur','9125663457','2020-06-08 16:49:20','2020-06-08 16:49:20'),(11,'rahul4422','$2a$12$obMC9TxSITHty2rSNH3ym.d6VHRbEWqNK4tDA3YA0I8OwS3SUIIs.','rahul4422@gmail.com','Rahul Shashikant Patil','male','1996-06-08','Khebawade, kagal','8622458165','2020-06-08 16:49:37','2020-06-08 16:49:37'),(12,'namrata','$2a$12$5hYbVuUgPpVt5nkQCCP/r.KCySLKFj1/Ngy9kz2PyXlPJ5dvhlhWO','namratakumbhar123@gmail.com','Namrata Shivaji Kumbhar','female','1992-01-23','maratha colony, kolhapur','9174859632','2020-06-08 16:49:57','2020-06-08 16:49:57'),(13,'pankaj','$2a$12$r851VMBrUJtH9shJxmP5deRv.CUCJ8XYKd0JuDN1xdlNuIGbzWfcC','patilpankaj10@gmail.com','Pankaj Ramdev Patil','male','1990-11-18','vinayak nagar, shiroli','7014785236','2020-06-08 16:50:21','2020-06-08 16:50:21'),(14,'pavan','$2a$12$DoDbBfg8pAKUKn.qVu9j1u5.K1KlDpUZmSPt8r0Gvv0OsIAbgmks6','pavanpowar@gmail.com','Pavan Ashok Powar','male','1993-01-27','kasaba bawada, kolhapur','9951651489','2020-06-08 16:51:09','2020-06-08 16:51:09'),(15,'prashant','$2a$12$/fOmddA0RaWW5L.PJQgINuhaZTz0k9Upo8fBcXDRHHm28uUQf5osC','prashantmane@gmail.com','Prashant Yuvraj Mane','male','1984-11-12','saregav, sangli','8625874125','2020-06-08 16:51:27','2020-06-08 16:51:27'),(16,'chandrakantpatil','$2a$12$OYnmQw.eWvV4IfuSdCODC.jEi.GB3nZ/uPOQuHwWS2HTEy0nMFc1.','patilchandrakant4422@gmail.com','Chandrakant Ganpati Patil','male','1980-12-07','tarabai park, kolhapur','7020564422','2020-06-08 16:51:42','2020-06-08 16:51:42'),(17,'pornima','$2a$12$N6DcETTAXIBI3WA1.0tzpeOHDIm.IhiDHvgKEg2Ef.FPLAkn60AWK','pornima.mohite989@gmail.com','Pornima Shivaji Mohite','female','1998-11-07','Sambhaji Nagar, kolhapur','9451602358','2020-06-08 16:51:58','2020-06-08 16:51:58'),(18,'savitri','$2a$12$J0tJkvomrulRKnrG4asU9.e6lFsNM3m9WyC7PO0LYpE.6u0VzF1Ki','savitribai@gmail.com','Savitribai Mahatma Fulle','female','1940-05-30','Mukta sainik vasahat, kolhapur','91200304058','2020-06-08 16:53:51','2020-06-08 16:53:51'),(19,'Aditya','$2a$12$yrZSwW..YM62sZXZN5LD8uzQCnvg.VV13eOaGcMBjWhPrnTEe48Zy','adityavadkar@gmail.com','Aditya Yashrao Vadkar','male','1998-01-10','golibar maidan, kolhapur','8762145827','2020-06-08 16:54:20','2020-06-08 16:54:20'),(20,'snehaljadhav','$2a$12$v8Kyxd3P/xgGan.8e9vGveBfOOzBpi0FM.wJYsuT9aN1BtBJw6S8e','snehaljadhav989@gmail.com','Snehal Suresh Jadhav','female','1989-04-07','Mukta sainik vasahat, kolhapur','7054814821','2020-06-08 16:56:37','2020-06-08 16:56:37'),(21,'rujuta','$2a$12$VCVFu09G/H1NCbh7XzXeMOrOe766e1zWaumKTxrMR/s3vANtXt.Gm','kolirujuta@gmail.com','Rujuta Sambhaji Koli','female','1967-06-13','tarabai park, kolhapur','7000567721','2020-06-08 16:56:56','2020-06-08 16:56:56'),(22,'om','$2a$12$1t6IXaT7lDKjtEJhcRaNJOKa1dOhK6IkhjZ3dXn/WWA2ZZWSdojeC','omvasvani@gmail.com','Om Ashok Vasvani','male','2000-11-07','Shipekar vasahat, kolhapur','7026428721','2020-06-08 16:57:12','2020-06-08 16:57:12'),(23,'robin','$2a$12$kskO5rcdBUo45Xn30v/Lz.iH0dvpKrSdaYI7pFweyR5lBYl680x/2','robinsharmaa@gmail.com','Robin Vivekanand Sharma','male','2005-11-07','Vivekand Colony, kolhapur','9127456120','2020-06-08 16:57:30','2020-06-08 16:57:30'),(24,'rohandivate','$2a$12$Ykqk20GBZG9GSbu6UN1hk.eC4DVrUKVUw4TCyrJNN2QR5631KFaQa','RohanDivate@gmail.com','Rohan Vikas Divate','male','2003-11-17','Echekar, Echalkarnji','7020888821','2020-06-08 16:57:51','2020-06-08 16:57:51'),(25,'Ganpati','$2a$12$UF1WYKEiv5k7m9WGxCkCtu9nFIqu3hRsOosiFQRQukr2j1dzmwbQ2','patilganpati@gmail.com','Ganpati Natha Patil','male','1950-05-20','Shahuvadi, kogal','9945777845','2020-06-08 16:58:13','2020-06-08 16:58:13'),(26,'Yuvraj','$2a$12$qQk.uOD1JWDELB4yWfwR.ejf4X93yoPzSSDD.gkyBNr3N7Bf1U9US','mhetress@gmail.com','Yuvraj Shreyas Mhetre','male','1978-11-24','vitevadi, kolhapur','9130545789','2020-06-08 16:58:30','2020-06-08 16:58:30'),(27,'viraj','$2a$12$ileRp0nserBzngL3CGs4j.WkfzruhakF8o6TifCRboQbTSQw3yWxa','virajchavhan5@gmail.com','Viraj Prakash Chavhan','male','1990-03-18','Ruyekar Colony, kolhapur','8806279409','2020-06-08 16:58:56','2020-06-08 16:58:56'),(28,'dnyaneshwar','$2a$12$XLRrw9rhWc7D.xd.2dSI5u9hxgtdhCxYAIBSA0OO.1byU7Lv/W7kK','dnyaneshwar7823@gmail.com','Dnyaneshwar Narayan Raut','male','2000-09-03','Kasaba Bawada, Kolhapur','9431649785','2020-06-08 16:59:19','2020-06-08 16:59:19'),(29,'sudarshan','$2a$12$91AiJ7FRI9bUZ/gLPVYUieSwpkpKc1mIXk1YMiHdJvvFqdPdqRo6W','biranjesudarshan@gmail.com','Sudarshan Narayan Biranje','male','1966-06-06','Biranje Panand, Kolhapur','9102334808','2020-06-08 17:00:35','2020-06-08 17:00:35'),(30,'rasika','$2a$12$IYnIlyn5.qR3JRZrqtUUBeI3cwSDdQNGLRA4.m6MRIVXBxi8UfANW','rasika4521@gmail.com','Rasika Krishnath Mardane','female','1999-12-22','Kasaba Bawada, Kolhapur','9088245621','2020-06-08 17:00:42','2020-06-08 17:00:42'),(31,'aarti','$2a$12$n3MQOMlLJ.UYy4uI2pTw3OJ.wUGhGxVONvE7hAFh4do22zIKwebO2','aartikoli772@gmail.com','Aarti Vinayak Koli','female','1970-07-20','Golibar Maidan, Kolhapur','9052011463','2020-06-08 17:01:02','2020-06-08 17:01:02'),(32,'samrat','$2a$12$sTx46NLXa/WbHvQyoVITbuFSNfwy8VK3PEdpBXbnFdAZZ71MvPopu','samrataakole642@gmail.com','Samrat Sambhaji Aakole','male','1982-11-23','Ambedkar Nagar, Kolhapur','9148652107','2020-06-08 17:01:20','2020-06-08 17:01:20'),(33,'shantanu','$2a$12$XbuZGS6fzJmc.dliVzMCc.VihAUEaKQ5jRi7pTqx6bTZeAz6w8ztO','moreshantanu96@gmail.com','Shantanu Shivaji More','male','1998-07-16','Nagala Park, Kolhapur','8850023145','2020-06-08 17:01:35','2020-06-08 17:01:35'),(34,'kiran','$2a$12$flpC1AsL0D0ZMzGhLfPo0eAUNaAiM76QjcdJOSr4JB2CKnOodObNS','kirankenjale@gmail.com','Kiran Dattatray Kenjale','female','1998-10-10','katarajvadi, karad','9557289355','2020-06-08 17:01:52','2020-06-08 17:01:52'),(35,'ugal','$2a$12$6SpiNbihJo5HGTiA.3.q/unle8FrGAGykVZzPrqer0IfOhYKkrSKq','ugalmanvani66@gmail.com','Ugal Shrikant Manvani','male','2003-11-17','Echekarvadi, Echalkarnji','7020225531','2020-06-08 17:02:11','2020-06-08 17:02:11'),(36,'nihal','$2a$12$5ZL8RC2/rw.krgzcwZ0WmeKaZzy83Ce48CLTjuNUlVt0mWqk7HWsG','sharmajinihal@gmail.com','Nihal Ugal Sharma','male','1980-05-31','maratha colony, sangli','9111258852','2020-06-08 17:02:48','2020-06-08 17:02:48'),(37,'Sunil','$2a$12$dOvN8AmuJMiPMODCUUaXXOrM5IIuy9LaaHSS6xeivh10uyxQZoM3O','sunilpatil@gmail.com','Sunil Patil','male','1985-01-09','Bhagwa Chowk, Kasaba Bawada','9963522589','2020-06-09 02:40:47','2020-06-09 02:40:47'),(38,'Ruturaj7','$2a$12$cOohhmeGzRR3.e4Yj3AevOvJ8sdcCqFUeUL06FY6udCcE6UzHHEDy','ruturaj@gmail.com','Ruturaj Desai','male','1998-10-07','Bward, Mangalvar Peth','09767577630','2020-06-09 04:19:52','2020-06-09 04:19:52'),(39,'kedar','$2a$12$/5cqO2kHalkQbfRWh9MmWub/225554TDJ.VObgoe4t/3zhVabW.MC','kedar@gmail.com','kedar','male','2020-10-10','Charegaon','9552910355','2020-06-09 05:15:47','2020-06-09 05:15:47'),(40,'Ruturaj_54','$2a$12$cBoxuHDEDLZJswJQVYlmKet8hYsePokLA6TJI7LvmChXxN2QDstBu','ruturajdesai@gmail.com','RuturajDesai','male','1998-11-07','Bawada','9881195566','2020-06-09 08:12:23','2020-06-09 08:12:23');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dieseases` varchar(255) DEFAULT NULL,
  `medicines` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `precautions` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `patientId` int(11) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `hospitalId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientId` (`patientId`),
  KEY `doctorId` (`doctorId`),
  KEY `hospitalId` (`hospitalId`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `doctors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `reports_ibfk_3` FOREIGN KEY (`hospitalId`) REFERENCES `hospitals` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,'Cold','Genexa Cold','Use Clean Hankerchip','Don\'t Smoke','Kolhapur','2020-06-08 17:38:52','2020-06-08 17:38:52',1,1,1),(2,'Fever','Paracetamol','Drink water','Dehydration','Satara','2020-06-08 17:41:45','2020-06-08 17:41:45',2,1,1),(3,'Corona','Chloroquine','Use mask and sanitizers','Keep disatance','Sangali','2020-06-08 17:44:07','2020-06-08 17:44:07',3,1,1),(4,'Maleria','Doxycycline','keep house clean','Prevent from mosquito bites','Karad','2020-06-08 17:46:52','2020-06-08 17:46:52',4,1,1),(5,'Corona','Chloroquine','use hand gloves and sanitizers','Keep distance','Karad','2020-06-08 17:49:42','2020-06-08 17:49:42',5,1,1),(6,'Corona','Chloroquine','use hand gloves and sanitizers','Keep distance','Karad','2020-06-08 18:13:18','2020-06-08 18:13:18',5,1,1),(7,'corona','Chloroquine','use hand gloves and sanitizers','Keep distance','kolhapur','2020-06-08 18:14:16','2020-06-08 18:14:16',1,1,1),(8,'diabetes ','Glycomate','stay helthy','work out regularly','kolhapur','2020-06-08 18:15:36','2020-06-08 18:15:36',2,1,1),(9,'corona','Chloroquine','Use gloves and sanitizers','Keep distance ','kolhapur','2020-06-08 18:18:08','2020-06-08 18:18:08',3,1,1),(10,'maleria','Doxycycline','Keep your house clean','Prevent from mosquito Bites','thane','2020-06-08 18:21:02','2020-06-08 18:21:02',4,1,1),(11,'cough','Guaifenesin','Drink warm milk','Drink water','tmumbai','2020-06-08 18:26:26','2020-06-08 18:26:26',6,2,1),(12,'fever','Paracetamol','keep cold towel on your head','Dehydration','mumbai','2020-06-08 18:29:36','2020-06-08 18:29:36',7,2,1),(13,'cold','Genexa cold','Use hankerchip','Don\'t Smoke','solapur','2020-06-08 18:31:36','2020-06-08 18:31:36',8,2,1),(14,'corona','Chloroquine','Use gloves, sanitizers and masks','Keep distance','satara','2020-06-08 18:33:54','2020-06-08 18:33:54',9,2,1),(15,'diabetes','Glycomate','Stay helthy and have fun','Work out regularly','pune','2020-06-08 18:37:15','2020-06-08 18:37:15',10,2,1),(16,'diabetes','Glycomate','Stay helthy and have fun','Work out regularly','kolhapur','2020-06-08 18:38:08','2020-06-08 18:38:08',11,2,1),(17,'corona','Chloroquine ','Use gloves, sanitizers and masks','Keep distance','karad','2020-06-08 18:40:01','2020-06-08 18:40:01',12,3,2),(18,'cold','Genexa cold','Use hankerchip','Don\'t Smoke ','sangli','2020-06-08 18:41:19','2020-06-08 18:41:19',13,3,2),(19,'maleria','Doxycycline','Keep your house clean','Prevent from mosquito Bites','satara','2020-06-08 18:44:33','2020-06-08 18:44:33',14,3,2),(20,'fever','Paracetamol','Keep cold towel on your head','Dehydration','thane','2020-06-08 18:46:35','2020-06-08 18:46:35',15,3,2),(21,'cough','Guaifenesin','Drink warm milk','Drink water','kolhapur','2020-06-08 18:48:08','2020-06-08 18:48:08',16,3,2),(22,'corona','Chloroquine','Use gloves, sanitizers and masks','Keep distance','kolhapur','2020-06-08 18:50:18','2020-06-08 18:50:18',17,4,2),(23,'corona','Chloroquine','Use gloves, sanitizers and masks','Keep distance','pune','2020-06-08 18:50:43','2020-06-08 18:50:43',18,4,2),(24,'corona','Chloroquine','Use gloves, sanitizers and masks','Keep distance','mumbai','2020-06-08 18:51:34','2020-06-08 18:51:34',19,4,2),(25,'corona','Chloroquine','Use gloves, sanitizers and masks','Keep distance','mumbai','2020-06-08 18:52:13','2020-06-08 18:52:13',20,4,2),(26,'corona','Chloroquine','Use gloves, sanitizers and masks','Keep distance','mumbai','2020-06-08 18:52:33','2020-06-08 18:52:33',21,4,2),(27,'maleria ','Guaifenesin',' Drink warm milk','Drink water  ','solapur','2020-06-08 18:54:49','2020-06-08 18:54:49',22,5,4),(28,'maleria ','Guaifenesin',' Drink warm milk','Drink water  ','sangali','2020-06-08 18:55:25','2020-06-08 18:55:25',23,5,4),(29,'maleria ','Guaifenesin',' Drink warm milk','Drink water  ','satara','2020-06-08 18:55:46','2020-06-08 18:55:46',24,5,4),(30,'corona','Guaifenesin',' Use gloves, sanitizers and masks','Keep distance   ','kolhapur','2020-06-08 18:57:19','2020-06-08 18:57:19',25,5,4),(31,'corona','Guaifenesin','Use gloves, sanitizers and masks','Keep distance   ','kolhapur','2020-06-08 18:57:42','2020-06-08 18:57:42',26,5,4),(32,'corona','Guaifenesin','Use gloves, sanitizers and masks','Keep distance   ','pune','2020-06-08 18:58:14','2020-06-08 18:58:14',27,5,4),(33,'corona','Guaifenesin','Use gloves, sanitizers and masks','Keep distance   ','solapur','2020-06-08 18:58:37','2020-06-08 18:58:37',28,5,4),(34,'corona','Guaifenesin','Use gloves, sanitizers and masks','Keep distance   ','mumbai','2020-06-08 18:58:58','2020-06-08 18:58:58',29,5,4),(35,'cold','Genexa cold','Use hankerchip','Don\'t Smoke ','satara','2020-06-08 18:59:53','2020-06-08 18:59:53',30,5,4),(36,'cold','Genexa cold','Use hankerchip','Don\'t Smoke ','sangali','2020-06-08 19:00:18','2020-06-08 19:00:18',31,5,4),(37,'maleria','Doxycycline','Keep your house clean','Prevent from mosquito Bites  ','kolhapur','2020-06-08 19:02:17','2020-06-08 19:02:17',32,6,4),(38,'maleria','Doxycycline','Keep your house clean','Prevent from mosquito Bites  ','karad','2020-06-08 19:02:51','2020-06-08 19:02:51',33,6,4),(39,'maleria','Doxycycline','Keep your house clean','Prevent from mosquito Bites  ','mumbai','2020-06-08 19:03:18','2020-06-08 19:03:18',34,6,4),(40,'maleria','Doxycycline','Keep your house clean','Prevent from mosquito Bites  ','thane','2020-06-08 19:03:37','2020-06-08 19:03:37',35,6,4),(41,'maleria','Doxycycline','Keep your house clean','Prevent from mosquito Bites  ','solapur','2020-06-08 19:03:57','2020-06-08 19:03:57',36,6,4),(42,'diabetes','Glycomate ',' Stay helthy and have fun','Work out regularly   ','kolhapur','2020-06-08 19:08:55','2020-06-08 19:08:55',4,7,5),(43,'diabetes','Glycomate ',' Stay helthy and have fun','Work out regularly   ','karad','2020-06-08 19:09:34','2020-06-08 19:09:34',5,7,5),(44,'diabetes','Glycomate ',' Stay helthy and have fun','Work out regularly   ','sangali','2020-06-08 19:09:59','2020-06-08 19:09:59',6,7,5),(45,'diabetes','Glycomate ',' Stay helthy and have fun','Work out regularly   ','solapur','2020-06-08 19:10:15','2020-06-08 19:10:15',7,7,5),(46,'diabetes','Glycomate ',' Stay helthy and have fun','Work out regularly   ','thane','2020-06-08 19:10:32','2020-06-08 19:10:32',8,7,5),(47,'fever','Paracetamol','Keep cold towel on your head','Dehydration  ','kolhapur','2020-06-08 19:12:41','2020-06-08 19:12:41',11,8,5),(48,'fever','Paracetamol','Keep cold towel on your head','Dehydration  ','satara','2020-06-08 19:13:47','2020-06-08 19:13:47',13,8,5),(49,'fever','Paracetamol','Keep cold towel on your head','Dehydration  ','satara','2020-06-08 19:14:00','2020-06-08 19:14:00',12,8,5),(50,'fever','Paracetamol','Keep cold towel on your head','Dehydration  ','pune','2020-06-08 19:14:42','2020-06-08 19:14:42',14,8,5),(51,'corona','Chloroquine  ','Use gloves, sanitizers and masks','Keep distance   ','pune','2020-06-08 19:16:40','2020-06-08 19:16:40',15,9,6),(52,'corona','Chloroquine  ','Use gloves, sanitizers and masks','Keep distance   ','mumbai','2020-06-08 19:17:04','2020-06-08 19:17:04',16,9,6),(53,'corona','Chloroquine  ','Use gloves, sanitizers and masks','Keep distance   ','thane','2020-06-08 19:17:32','2020-06-08 19:17:32',17,9,6),(54,'corona','Chloroquine  ','Use gloves, sanitizers and masks','Keep distance   ','karad','2020-06-08 19:18:32','2020-06-08 19:18:32',19,9,6),(55,'cold','Genexa cold ','Use hankerchip','Don\'t Smoke','karad','2020-06-08 19:20:30','2020-06-08 19:20:30',28,10,6),(56,'cold','Genexa cold ','Use hankerchip','Don\'t Smoke','karad','2020-06-08 19:20:54','2020-06-08 19:20:54',30,10,6),(57,'cold','Genexa cold ','Use hankerchip','Don\'t Smoke','sangali','2020-06-08 19:21:15','2020-06-08 19:21:15',31,10,6),(58,'cold','Genexa cold ','Use hankerchip','Don\'t Smoke','pune','2020-06-08 19:21:44','2020-06-08 19:21:44',32,10,6),(59,'diarrhoea','Loperamide','Nothing severe','Reduce food intake for few days.','kolhapur','2020-06-09 02:50:50','2020-06-09 02:50:50',37,11,7),(60,'malaria','Quinine sulfate','Water Infection','Drink boiled water and take bed rest.','kolhapur','2020-06-09 02:58:15','2020-06-09 02:58:15',37,11,7),(61,'Dizziness','No required','Restlessness','Bed rest','kolhapur','2020-06-09 04:30:21','2020-06-09 04:30:21',38,12,8),(62,'corona','paracitamol','no comments','not any','kolhapur','2020-06-09 07:59:34','2020-06-09 07:59:34',1,1,1);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;
-- SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-14 17:43:37
