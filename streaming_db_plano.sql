-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: streaming_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `plano`
--

DROP TABLE IF EXISTS `plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plano` (
  `id_plano` int NOT NULL,
  `nome_plano` varchar(30) NOT NULL,
  `valor_mensal` decimal(8,2) NOT NULL,
  `qualidade_video` varchar(20) NOT NULL,
  `quantidade_telas` int NOT NULL,
  PRIMARY KEY (`id_plano`),
  UNIQUE KEY `nome_plano` (`nome_plano`),
  CONSTRAINT `plano_chk_1` CHECK ((`valor_mensal` > 0)),
  CONSTRAINT `plano_chk_2` CHECK ((`quantidade_telas` between 1 and 10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano`
--

LOCK TABLES `plano` WRITE;
/*!40000 ALTER TABLE `plano` DISABLE KEYS */;
INSERT INTO `plano` VALUES (1,'Plano1',10.90,'HD',2),(2,'Plano2',11.90,'HD',3),(3,'Plano3',12.90,'HD',4),(4,'Plano4',13.90,'HD',5),(5,'Plano5',14.90,'HD',1),(6,'Plano6',15.90,'HD',2),(7,'Plano7',16.90,'HD',3),(8,'Plano8',17.90,'HD',4),(9,'Plano9',18.90,'HD',5),(10,'Plano10',19.90,'HD',1),(11,'Plano11',20.90,'HD',2),(12,'Plano12',21.90,'HD',3),(13,'Plano13',22.90,'HD',4),(14,'Plano14',23.90,'HD',5),(15,'Plano15',24.90,'HD',1);
/*!40000 ALTER TABLE `plano` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-02 16:11:48
