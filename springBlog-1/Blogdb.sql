-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: blogdb
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `t_blog`
--

DROP TABLE IF EXISTS `t_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_blog` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `contents` text,
  `creator_id` varchar(45) NOT NULL,
  `created_dt` datetime NOT NULL,
  `updator_id` varchar(45) DEFAULT NULL,
  `updated_dt` varchar(45) DEFAULT NULL,
  `hit_cnt` int NOT NULL DEFAULT '0',
  `deleted_yn` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_blog`
--

LOCK TABLES `t_blog` WRITE;
/*!40000 ALTER TABLE `t_blog` DISABLE KEYS */;
INSERT INTO `t_blog` VALUES (1,'제목 수정','내용 수정','creatorId','2022-01-11 00:09:12','updatorId','2022-01-12 12:21:56',1,'N'),(2,'제목2','내용2','creatorId','2022-01-11 14:11:57','updatorId','2022-01-11 14:11:57',1,'N'),(3,'제목3','내용3','creatorId','2022-01-11 23:47:54','updatorId','2022-01-11 23:47:54',1,'N'),(4,'제목3','내용3','creatorId','2022-01-12 12:18:38',NULL,NULL,0,'N'),(5,'aa','aa','aa','2022-01-12 12:51:34',NULL,NULL,0,'N'),(6,'ㄴㄴ','ㄴㄴ','ㄴㄴ','2022-01-12 13:58:12',NULL,NULL,0,'N');
/*!40000 ALTER TABLE `t_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_guestbook`
--

DROP TABLE IF EXISTS `t_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_guestbook` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `guest_name` varchar(45) NOT NULL,
  `guest_pw` varchar(45) NOT NULL,
  `guest_contents` varchar(45) NOT NULL,
  `guest_created_dt` datetime NOT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='방명록 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_guestbook`
--

LOCK TABLES `t_guestbook` WRITE;
/*!40000 ALTER TABLE `t_guestbook` DISABLE KEYS */;
INSERT INTO `t_guestbook` VALUES (1,'게스트','비밀번호','내용','2022-01-11 00:13:08'),(2,'게스트1','1234','내용','2022-01-11 16:22:31');
/*!40000 ALTER TABLE `t_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_member`
--

DROP TABLE IF EXISTS `t_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_member` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `user_pw` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_level` int DEFAULT '0',
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_member`
--

LOCK TABLES `t_member` WRITE;
/*!40000 ALTER TABLE `t_member` DISABLE KEYS */;
INSERT INTO `t_member` VALUES (1,'user','1234','이름','이메일',0),(2,'user1','1234','유저','이메일',0);
/*!40000 ALTER TABLE `t_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'blogdb'
--

--
-- Dumping routines for database 'blogdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-12 15:20:08
