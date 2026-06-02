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
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `id_avaliacao` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_conteudo` int NOT NULL,
  `nota` int DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `data_avaliacao` date DEFAULT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_conteudo` (`id_conteudo`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`id_conteudo`) REFERENCES `conteudo` (`id_conteudo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `avaliacao_chk_1` CHECK ((`nota` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (1,1,1,2,'Excelente produção.','2025-04-01'),(2,2,2,3,'Roteiro muito envolvente.','2025-04-02'),(3,3,3,4,'Fotografia impressionante.','2025-04-03'),(4,4,4,5,'Gostei da atuação principal.','2025-04-04'),(5,5,5,1,'Documentário muito informativo.','2025-04-05'),(6,6,6,2,'Final surpreendente.','2025-04-06'),(7,7,7,3,'Boa opção para maratonar.','2025-04-07'),(8,8,8,4,'Trilha sonora marcante.','2025-04-08'),(9,9,9,5,'Personagens bem construídos.','2025-04-09'),(10,10,10,1,'Narrativa criativa.','2025-04-10'),(11,11,11,2,'Muito divertido.','2025-04-11'),(12,12,12,3,'Poderia ser mais curto.','2025-04-12'),(13,13,13,4,'Ótima direção.','2025-04-13'),(14,14,14,5,'Vale a recomendação.','2025-04-14'),(15,15,15,1,'Assisti novamente e gostei mais.','2025-04-15');
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
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
