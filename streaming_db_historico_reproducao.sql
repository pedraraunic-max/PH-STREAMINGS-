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
-- Table structure for table `historico_reproducao`
--

DROP TABLE IF EXISTS `historico_reproducao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_reproducao` (
  `id_historico` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_conteudo` int NOT NULL,
  `data_reproducao` datetime NOT NULL,
  `progresso_percentual` decimal(5,2) DEFAULT NULL,
  `tempo_assistido` int NOT NULL,
  PRIMARY KEY (`id_historico`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_conteudo` (`id_conteudo`),
  CONSTRAINT `historico_reproducao_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `historico_reproducao_ibfk_2` FOREIGN KEY (`id_conteudo`) REFERENCES `conteudo` (`id_conteudo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `historico_reproducao_chk_1` CHECK ((`progresso_percentual` between 0 and 100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_reproducao`
--

LOCK TABLES `historico_reproducao` WRITE;
/*!40000 ALTER TABLE `historico_reproducao` DISABLE KEYS */;
INSERT INTO `historico_reproducao` VALUES (1,1,1,'2025-03-01 20:00:00',51.00,31),(2,2,2,'2025-03-02 20:00:00',52.00,32),(3,3,3,'2025-03-03 20:00:00',53.00,33),(4,4,4,'2025-03-04 20:00:00',54.00,34),(5,5,5,'2025-03-05 20:00:00',55.00,35),(6,6,6,'2025-03-06 20:00:00',56.00,36),(7,7,7,'2025-03-07 20:00:00',57.00,37),(8,8,8,'2025-03-08 20:00:00',58.00,38),(9,9,9,'2025-03-09 20:00:00',59.00,39),(10,10,10,'2025-03-10 20:00:00',60.00,40),(11,11,11,'2025-03-11 20:00:00',61.00,41),(12,12,12,'2025-03-12 20:00:00',62.00,42),(13,13,13,'2025-03-13 20:00:00',63.00,43),(14,14,14,'2025-03-14 20:00:00',64.00,44),(15,15,15,'2025-03-15 20:00:00',65.00,45);
/*!40000 ALTER TABLE `historico_reproducao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-02 16:11:49
