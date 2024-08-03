CREATE DATABASE IF NOT EXISTS test;
USE test;

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `book_thickness` int(11) DEFAULT NULL,
  `book_color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


LOCK TABLES `books` WRITE;

INSERT INTO `books` VALUES (1,10,'red'),(2,20,'blue'),(3,15,'green');

UNLOCK TABLES;
