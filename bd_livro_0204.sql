-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_livro
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `tb_editora`
--

DROP TABLE IF EXISTS `tb_editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_editora` (
  `cd_editora` int NOT NULL,
  `editora` char(30) DEFAULT NULL,
  PRIMARY KEY (`cd_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_editora`
--

LOCK TABLES `tb_editora` WRITE;
/*!40000 ALTER TABLE `tb_editora` DISABLE KEYS */;
INSERT INTO `tb_editora` VALUES (1,'novatec'),(2,'amazon'),(3,'coopmed'),(4,'livraria florence'),(5,'blucher'),(6,'Mundial'),(7,'saraiva'),(8,'Editora Forum'),(9,'Dickens');
/*!40000 ALTER TABLE `tb_editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_genero`
--

DROP TABLE IF EXISTS `tb_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_genero` (
  `cd_genero` int NOT NULL,
  `genero` char(30) DEFAULT NULL,
  PRIMARY KEY (`cd_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_genero`
--

LOCK TABLES `tb_genero` WRITE;
/*!40000 ALTER TABLE `tb_genero` DISABLE KEYS */;
INSERT INTO `tb_genero` VALUES (1,'Computacao'),(2,'Medicina'),(3,'Engenharia'),(4,'Juridico'),(5,'Arquitetura'),(6,'Biologia'),(7,'Mecatronica');
/*!40000 ALTER TABLE `tb_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_livro`
--

DROP TABLE IF EXISTS `tb_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_livro` (
  `isbn` int NOT NULL,
  `titulo` char(50) DEFAULT NULL,
  `cd_editora` int DEFAULT NULL,
  `cd_genero` int DEFAULT NULL,
  `preco` decimal(12,2) DEFAULT NULL,
  `dt_livro` date DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  KEY `fk_genero` (`cd_genero`),
  KEY `fk_editora` (`cd_editora`),
  CONSTRAINT `fk_editora` FOREIGN KEY (`cd_editora`) REFERENCES `tb_editora` (`cd_editora`),
  CONSTRAINT `fk_genero` FOREIGN KEY (`cd_genero`) REFERENCES `tb_genero` (`cd_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_livro`
--

LOCK TABLES `tb_livro` WRITE;
/*!40000 ALTER TABLE `tb_livro` DISABLE KEYS */;
INSERT INTO `tb_livro` VALUES (1,'banco de dados',1,1,300.00,'2022-10-02'),(2,'Engenharia de Software',1,1,350.00,'2023-09-02'),(3,'Ortopedia',3,2,310.00,'2024-07-02'),(4,'Cardiologia',4,2,320.00,'2022-10-02'),(5,'Estrutura Predial',5,3,200.00,'2023-10-02'),(6,'Estrutura Hidraulica',6,3,300.00,'2024-06-02'),(7,'Direito Penal',7,4,150.00,'2022-07-02'),(8,'Direito Civil',8,4,200.00,'2023-06-02'),(9,'Cores',7,5,200.00,'2024-08-02'),(10,'Paisagismo',8,5,250.00,'2022-09-02'),(11,'Virus',9,6,300.00,'2023-10-02'),(12,'Bacteria',9,6,300.00,'2024-03-02');
/*!40000 ALTER TABLE `tb_livro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-03 18:11:50

use bd_livro_0301;

-- 1	Lista titulo, editora quando o preco maior que R$200,00
select titulo, editora, preco 
from tb_livro
inner join tb_editora
where preco >= 200;


-- 2	Lista titulo, gênero quando o preco entre R$200,00 e R$300,00

SELECT L.titulo, G.genero
FROM tb_livro L
INNER JOIN tb_genero G
on L.cd_genero = G.cd_genero
where preco between 200 and 300;


-- 3	lista titulo, editora, preco e preco com mais 20%

select L.titulo, E.editora, L.preco, 
       L.preco * 1.2 as vinte
from tb_livro L 
inner join tb_editora E
on L.cd_editora = E.cd_editora;

create view vw_01 as

select isbn, titulo, preco,
	   preco * 1.1 as dez
from tb_livro;

select * from vw_01 order by titulo desc;
