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
-- Table structure for table `conteudo`
--

DROP TABLE IF EXISTS `conteudo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conteudo` (
  `id_conteudo` int NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `ano_lancamento` int DEFAULT NULL,
  `classificacao_indicativa` varchar(10) DEFAULT NULL,
  `duracao` int DEFAULT NULL,
  PRIMARY KEY (`id_conteudo`),
  CONSTRAINT `conteudo_chk_1` CHECK ((`tipo` in (_utf8mb4'Filme',_utf8mb4'Serie',_utf8mb4'Documentario'))),
  CONSTRAINT `conteudo_chk_2` CHECK ((`duracao` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conteudo`
--

LOCK TABLES `conteudo` WRITE;
/*!40000 ALTER TABLE `conteudo` DISABLE KEYS */;
INSERT INTO `conteudo` VALUES (1,'Horizonte Final','Filme',2011,'12',90),(2,'Cidade das Sombras','Serie',2012,'16',90),(3,'Mistérios do Oceano','Documentario',2013,'L',90),(4,'Código Ômega','Filme',2014,'14',90),(5,'A Última Fronteira','Serie',2015,'12',90),(6,'Expresso Noturno','Filme',2016,'16',90),(7,'Entre Estrelas','Documentario',2017,'10',90),(8,'Legado Perdido','Serie',2018,'14',90),(9,'Projeto Atlas','Filme',2019,'12',90),(10,'No Limite do Tempo','Serie',2020,'18',90),(11,'Guardiões do Norte','Filme',2021,'14',90),(12,'A Ilha Esquecida','Documentario',2022,'L',90),(13,'Ecos do Passado','Serie',2023,'16',90),(14,'Operação Eclipse','Filme',2024,'18',90),(15,'Rota 51','Documentario',2025,'10',90);
/*!40000 ALTER TABLE `conteudo` ENABLE KEYS */;
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
