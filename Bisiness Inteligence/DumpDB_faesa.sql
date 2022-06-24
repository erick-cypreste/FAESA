CREATE DATABASE  IF NOT EXISTS `faesa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `faesa`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: faesa
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `dim_aluno`
--

DROP TABLE IF EXISTS `dim_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_aluno` (
  `id_aluno` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `matricula` int NOT NULL,
  `cpf` int NOT NULL,
  `endereco` varchar(500) DEFAULT NULL,
  `telefone` int DEFAULT NULL,
  `sexo` char(1) NOT NULL,
  `dt_nascimento` date NOT NULL,
  `estado_civil` varchar(45) DEFAULT NULL,
  `deficiencia` varchar(45) DEFAULT NULL,
  `dt_criacao` datetime NOT NULL,
  `dt_alteracao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_aluno`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_aluno`
--

LOCK TABLES `dim_aluno` WRITE;
/*!40000 ALTER TABLE `dim_aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_curso`
--

DROP TABLE IF EXISTS `dim_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_curso` (
  `id_curso` int NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `qtd_periodo` int DEFAULT NULL,
  `dt_criacao` datetime NOT NULL,
  `dt_alteracao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_curso`
--

LOCK TABLES `dim_curso` WRITE;
/*!40000 ALTER TABLE `dim_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_disciplina`
--

DROP TABLE IF EXISTS `dim_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_disciplina` (
  `id_disciplina` int NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `carga_horaria` int NOT NULL,
  `periodo` int DEFAULT NULL,
  `oferta` bit(1) NOT NULL DEFAULT b'0',
  `dt_oferta_ini` date DEFAULT NULL,
  `dt_oferta_fim` date DEFAULT NULL,
  `dt_criacao` datetime NOT NULL,
  `dt_alteracao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_disciplina`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_disciplina`
--

LOCK TABLES `dim_disciplina` WRITE;
/*!40000 ALTER TABLE `dim_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_hora_complementar`
--

DROP TABLE IF EXISTS `dim_hora_complementar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_hora_complementar` (
  `id_hora_complementar` int NOT NULL,
  `qtd_hora` int NOT NULL,
  `dt_criacao` datetime NOT NULL,
  `dt_alteracao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_hora_complementar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_hora_complementar`
--

LOCK TABLES `dim_hora_complementar` WRITE;
/*!40000 ALTER TABLE `dim_hora_complementar` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_hora_complementar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_hora_estagio`
--

DROP TABLE IF EXISTS `dim_hora_estagio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_hora_estagio` (
  `id_hora_estagio` int NOT NULL,
  `qtd_hora` int NOT NULL,
  `dt_criacao` datetime NOT NULL,
  `dt_alteracao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_hora_estagio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_hora_estagio`
--

LOCK TABLES `dim_hora_estagio` WRITE;
/*!40000 ALTER TABLE `dim_hora_estagio` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_hora_estagio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_nota`
--

DROP TABLE IF EXISTS `dim_nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_nota` (
  `id_nota` int NOT NULL,
  `conceito` varchar(10) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `dt_criacao` datetime NOT NULL,
  `dt_alteracao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_nota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_nota`
--

LOCK TABLES `dim_nota` WRITE;
/*!40000 ALTER TABLE `dim_nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_professor_orientador`
--

DROP TABLE IF EXISTS `dim_professor_orientador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_professor_orientador` (
  `id_professor_orientador` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `dt_criacao` datetime NOT NULL,
  `dt_alteracao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_professor_orientador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_professor_orientador`
--

LOCK TABLES `dim_professor_orientador` WRITE;
/*!40000 ALTER TABLE `dim_professor_orientador` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_professor_orientador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_tcc`
--

DROP TABLE IF EXISTS `dim_tcc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_tcc` (
  `id_tcc` int NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `nota` decimal(10,2) NOT NULL,
  `aprovacao` bit(1) NOT NULL,
  `dt_criacao` datetime NOT NULL,
  `dt_alteracao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tcc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_tcc`
--

LOCK TABLES `dim_tcc` WRITE;
/*!40000 ALTER TABLE `dim_tcc` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_tcc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fato_conclusao_curso`
--

DROP TABLE IF EXISTS `fato_conclusao_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fato_conclusao_curso` (
  `id_conclusao_curso` int NOT NULL,
  `id_aluno` int NOT NULL,
  `id_curso` int NOT NULL,
  `id_disciplina` int NOT NULL,
  `id_hora_complementar` int NOT NULL,
  `id_hora_estagio` int NOT NULL,
  `id_nota` int NOT NULL,
  `id_professor_orientador` int NOT NULL,
  `id_tcc` int NOT NULL,
  PRIMARY KEY (`id_conclusao_curso`),
  KEY `fk_aluno_idx` (`id_aluno`),
  KEY `fk_curso_idx` (`id_curso`),
  KEY `fk_hora_estagio_idx` (`id_hora_estagio`),
  KEY `fk_nota_idx` (`id_nota`),
  KEY `fk_professor_orientador_idx` (`id_professor_orientador`),
  KEY `fk_tcc_idx` (`id_tcc`),
  KEY `fk_disciplina` (`id_disciplina`),
  KEY `fk_hora_complementar` (`id_hora_complementar`),
  CONSTRAINT `fk_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `dim_aluno` (`id_aluno`),
  CONSTRAINT `fk_curso` FOREIGN KEY (`id_curso`) REFERENCES `dim_curso` (`id_curso`),
  CONSTRAINT `fk_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `dim_disciplina` (`id_disciplina`),
  CONSTRAINT `fk_hora_complementar` FOREIGN KEY (`id_hora_complementar`) REFERENCES `dim_hora_complementar` (`id_hora_complementar`),
  CONSTRAINT `fk_hora_estagio` FOREIGN KEY (`id_hora_estagio`) REFERENCES `dim_hora_estagio` (`id_hora_estagio`),
  CONSTRAINT `fk_nota` FOREIGN KEY (`id_nota`) REFERENCES `dim_nota` (`id_nota`),
  CONSTRAINT `fk_professor_orientador` FOREIGN KEY (`id_professor_orientador`) REFERENCES `dim_professor_orientador` (`id_professor_orientador`),
  CONSTRAINT `fk_tcc` FOREIGN KEY (`id_tcc`) REFERENCES `dim_tcc` (`id_tcc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fato_conclusao_curso`
--

LOCK TABLES `fato_conclusao_curso` WRITE;
/*!40000 ALTER TABLE `fato_conclusao_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `fato_conclusao_curso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-18 10:40:57
