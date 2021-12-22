-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: testdb
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
-- Table structure for table `t_board`
--

DROP TABLE IF EXISTS `t_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_board` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `contents` text,
  `creator_id` varchar(45) NOT NULL,
  `created_date` datetime NOT NULL,
  `update_id` varchar(45) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `hit_cnt` int DEFAULT '0',
  `passwd` varchar(45) NOT NULL DEFAULT 'bitc1234',
  `deleted_yn` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_board`
--

LOCK TABLES `t_board` WRITE;
/*!40000 ALTER TABLE `t_board` DISABLE KEYS */;
INSERT INTO `t_board` VALUES (2,'제목 1','컨텐츠 1','tester01','2021-12-01 14:54:39',NULL,NULL,0,'bitc1234','Y'),(3,'수정된 제목 3','수정된 컨텐츠 3','tester01','2021-12-01 14:55:05','tester01','2021-12-02 14:37:45',0,'bitc1234','Y'),(4,'제목 4 수정했음','컨텐츠 4 수정...','tester02','2021-12-01 16:05:50','tester02','2021-12-02 16:07:31',2,'bitc1234','N'),(5,'추가로 수정된 제목 5','추가로 수정된 컨텐츠 5','tester03','2021-12-01 16:05:50','tester03','2021-12-02 14:38:52',4,'bitc1234','N'),(6,'제목 6','컨텐츠 6','tester01','2021-12-01 16:05:50',NULL,NULL,0,'bitc1234','N'),(7,'제목 7','컨텐츠 7','tester02','2021-12-02 09:36:54',NULL,NULL,0,'bitc1234','N'),(8,'직접 입력한 제목 8','직접 입력한 글내용 8','tester01','2021-12-02 10:09:55',NULL,NULL,0,'bitc1234','N');
/*!40000 ALTER TABLE `t_board` ENABLE KEYS */;
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
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  `user_addr` varchar(200) DEFAULT NULL,
  `user_gender` char(1) DEFAULT 'M',
  `deleted_yn` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`seq`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_member`
--

LOCK TABLES `t_member` WRITE;
/*!40000 ALTER TABLE `t_member` DISABLE KEYS */;
INSERT INTO `t_member` VALUES (1,'tester01','bitc1234','테스터유저01','tester01@bitc.co.kr','01012345678','부산광역시 부산진구 중앙대로 708','M','Y'),(2,'tester02','bitc1234','테스터유저02','tester02@bitc.co.kr','01098765432','부산광역시 부산진구 중앙대로 708','F','N'),(3,'tester03','bitc1234','테스트유저03','tester02@bitc.co.kr','01012897041','부산광역시 부산진구 중앙대로 708, 4층 404호','M','N');
/*!40000 ALTER TABLE `t_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testtable`
--

DROP TABLE IF EXISTS `testtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testtable` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `user_pw` varchar(45) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  `user_addr` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtable`
--

LOCK TABLES `testtable` WRITE;
/*!40000 ALTER TABLE `testtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `testtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'testdb'
--

--
-- Dumping routines for database 'testdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-20 16:59:56
