-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: manipulation
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `bankaccounts`
--

DROP TABLE IF EXISTS `bankaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankaccounts` (
  `Id_account` int NOT NULL AUTO_INCREMENT,
  `Ag_num` int NOT NULL,
  `Ac_num` int NOT NULL,
  `Saldo` float DEFAULT NULL,
  `LimiteCredito` float NOT NULL DEFAULT '500',
  PRIMARY KEY (`Id_account`),
  UNIQUE KEY `identification_account_constraint` (`Ag_num`,`Ac_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankaccounts`
--

LOCK TABLES `bankaccounts` WRITE;
/*!40000 ALTER TABLE `bankaccounts` DISABLE KEYS */;
INSERT INTO `bankaccounts` VALUES (1,156,264358,0,500);
/*!40000 ALTER TABLE `bankaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankclient`
--

DROP TABLE IF EXISTS `bankclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankclient` (
  `Id_client` int NOT NULL AUTO_INCREMENT,
  `ClientAccount` int NOT NULL,
  `CPF` char(11) NOT NULL,
  `RG` char(9) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Endereço` varchar(100) NOT NULL,
  `Renda_mensal` float DEFAULT NULL,
  `UF` char(2) NOT NULL DEFAULT 'AL',
  PRIMARY KEY (`Id_client`,`ClientAccount`),
  KEY `fk_acconut_client` (`ClientAccount`),
  CONSTRAINT `fk_acconut_client` FOREIGN KEY (`ClientAccount`) REFERENCES `bankaccounts` (`Id_account`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankclient`
--

LOCK TABLES `bankclient` WRITE;
/*!40000 ALTER TABLE `bankclient` DISABLE KEYS */;
INSERT INTO `bankclient` VALUES (1,1,'12345678913','123456789','Fulano','Rua etc',5500.6,'PE');
/*!40000 ALTER TABLE `bankclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'manipulation'
--

--
-- Dumping routines for database 'manipulation'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 16:44:26
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_refinado_old
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `cliente_Email` varchar(30) NOT NULL,
  `Cliente_Celular` char(11) DEFAULT NULL,
  `Cliente_Telefone` char(10) DEFAULT NULL,
  `Cliente_CEP` char(8) NOT NULL,
  `Cliente_Logradouro` varchar(45) NOT NULL,
  `Cliente_Numero` varchar(5) DEFAULT NULL,
  `Cliente_Complemento` varchar(20) DEFAULT NULL,
  `Cliente_Bairro` varchar(15) NOT NULL,
  `Cliente_Municipio` varchar(20) NOT NULL,
  `Cliente_UF` char(2) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `unique_email_cliente` (`cliente_Email`),
  UNIQUE KEY `unique_celular_cliente` (`Cliente_Celular`),
  UNIQUE KEY `unique_telefone_cliente` (`Cliente_Telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'maria@msilva.com.br','82987417417',NULL,'57025458','rua silva de prata','29',NULL,'Carangola','Cidade das flores','RJ');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientepf`
--

DROP TABLE IF EXISTS `clientepf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientepf` (
  `idClientePF` int NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` int DEFAULT NULL,
  `ClientePF_CPF` char(11) NOT NULL,
  `ClientePF_Nome` varchar(10) NOT NULL,
  `ClientePF_Sobrenome` varchar(25) NOT NULL,
  `ClientePF_DataNascimento` date NOT NULL,
  PRIMARY KEY (`idClientePF`),
  UNIQUE KEY `unique_CPF_ClientePF` (`ClientePF_CPF`),
  KEY `fk_Cliente_ClientePF` (`Cliente_idCliente`),
  CONSTRAINT `fk_Cliente_ClientePF` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepf`
--

LOCK TABLES `clientepf` WRITE;
/*!40000 ALTER TABLE `clientepf` DISABLE KEYS */;
INSERT INTO `clientepf` VALUES (1,1,'12346789','Emanuel','M Carvalho','2002-07-05');
/*!40000 ALTER TABLE `clientepf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientepj`
--

DROP TABLE IF EXISTS `clientepj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientepj` (
  `idClientePJ` int NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` int DEFAULT NULL,
  `ClientePJ_CNPJ` char(15) NOT NULL,
  `ClientePJ_RazaoSocial` varchar(30) NOT NULL,
  `ClientePJ_NomeFantasia` varchar(30) NOT NULL,
  PRIMARY KEY (`idClientePJ`),
  UNIQUE KEY `unique_CNPJ_ClientePJ` (`ClientePJ_CNPJ`),
  UNIQUE KEY `unique_RazaoSocial_ClientePJ` (`ClientePJ_RazaoSocial`),
  KEY `fk_Cliente_ClientePJ` (`Cliente_idCliente`),
  CONSTRAINT `fk_Cliente_ClientePJ` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepj`
--

LOCK TABLES `clientepj` WRITE;
/*!40000 ALTER TABLE `clientepj` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientepj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `Estoque_Localizacao` varchar(45) NOT NULL,
  `Estoque_Quantidade` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoqueproduto`
--

DROP TABLE IF EXISTS `estoqueproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoqueproduto` (
  `Estoque_idEstoque` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `EstoqueProduto_UF` char(2) DEFAULT NULL,
  PRIMARY KEY (`Estoque_idEstoque`,`Produto_idProduto`),
  KEY `fk_idEstoqueProduto_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_idEstoqueProduto_Estoque` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `estoque` (`idEstoque`),
  CONSTRAINT `fk_idEstoqueProduto_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoqueproduto`
--

LOCK TABLES `estoqueproduto` WRITE;
/*!40000 ALTER TABLE `estoqueproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoqueproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `Fornecedor_CNPJ` char(14) NOT NULL,
  `Fornecedor_RazaoSocial` varchar(30) NOT NULL,
  `Fornecedor_NomeFantasia` varchar(30) NOT NULL,
  `Fornecedor_Email` varchar(30) NOT NULL,
  `Fornecedor_Celular` char(11) DEFAULT NULL,
  `Fornecedor_Telefone` char(10) DEFAULT NULL,
  `Fornecedor_CEP` char(8) NOT NULL,
  `Fornecedor_Logradouro` varchar(45) NOT NULL,
  `Fornecedor_Numero` varchar(5) DEFAULT NULL,
  `Fornecedor_Complemento` varchar(20) DEFAULT NULL,
  `Fornecedor_Bairro` varchar(15) NOT NULL,
  `Fornecedor_Municipio` varchar(30) NOT NULL,
  `Fornecedor_UF` char(2) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `unique_CNPJ_Fornecedor` (`Fornecedor_CNPJ`),
  UNIQUE KEY `unique_RazaoSocial_Fornecedor` (`Fornecedor_RazaoSocial`),
  UNIQUE KEY `unique_Email_Fornecedor` (`Fornecedor_Email`),
  UNIQUE KEY `unique_Celular_Fornecedor` (`Fornecedor_Celular`),
  UNIQUE KEY `unique_Telefone_Fornecedor` (`Fornecedor_Telefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedorproduto`
--

DROP TABLE IF EXISTS `fornecedorproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedorproduto` (
  `Fornecedor_idFornecedor` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `FornecedorProduto_Quantidade` int NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`,`Produto_idProduto`),
  KEY `fk_idFornecedorProduto_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_idFornecedor_Fornecedor` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_idFornecedorProduto_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedorproduto`
--

LOCK TABLES `fornecedorproduto` WRITE;
/*!40000 ALTER TABLE `fornecedorproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedorproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `idPagamento` int NOT NULL,
  `Cliente_idClientePF` int NOT NULL,
  `Cliente_idClientePJ` int NOT NULL,
  `Pedido_idPedido` int DEFAULT NULL,
  `Pagamento_TipoPagamento` enum('Cartão de crédito','Cartão de Débito','PIX','Dinheiro') NOT NULL,
  `Pagamento_CartaoNumero` char(12) DEFAULT NULL,
  `Pagamento_CartaoValidade` char(6) DEFAULT NULL,
  `Pagamento_CartaoCVV` char(3) DEFAULT NULL,
  `Pagamento_ValorTotal` float DEFAULT NULL,
  PRIMARY KEY (`idPagamento`,`Cliente_idClientePF`,`Cliente_idClientePJ`),
  KEY `fk_idPedido_Pedido` (`Pedido_idPedido`),
  CONSTRAINT `fk_idPedido_Pedido` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `ClientePF_idClientePF` int DEFAULT NULL,
  `ClientePJ_idClientePJ` int DEFAULT NULL,
  `Pedido_Status` enum('Cancelado','Confirmado','Em processamento') NOT NULL DEFAULT 'Em processamento',
  `Pedido_Descricao` varchar(255) DEFAULT NULL,
  `Pedido_CodRastreamento` int DEFAULT NULL,
  `Pedido_ValorFrete` float DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_idClientePF_ClientePF` (`ClientePF_idClientePF`),
  KEY `fk_idClientePJ_ClientePJ` (`ClientePJ_idClientePJ`),
  CONSTRAINT `fk_idClientePF_ClientePF` FOREIGN KEY (`ClientePF_idClientePF`) REFERENCES `clientepf` (`idClientePF`),
  CONSTRAINT `fk_idClientePJ_ClientePJ` FOREIGN KEY (`ClientePJ_idClientePJ`) REFERENCES `clientepj` (`idClientePJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoproduto`
--

DROP TABLE IF EXISTS `pedidoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidoproduto` (
  `Pedido_idPedido` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `PedidoProduto_Quantidade` int NOT NULL,
  `PedidoProduto_Status` enum('Disponível','Sem estoque') NOT NULL DEFAULT 'Disponível',
  `PedidoProduto_DataPedido` date NOT NULL,
  PRIMARY KEY (`Pedido_idPedido`,`Produto_idProduto`),
  KEY `fk_idPedidoProduto_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_idPedidoProduto_Pedido` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_idPedidoProduto_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoproduto`
--

LOCK TABLES `pedidoproduto` WRITE;
/*!40000 ALTER TABLE `pedidoproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `Produto_Nome` varchar(45) NOT NULL,
  `Produto_Categoria` enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') NOT NULL,
  `Produto_Descricao` varchar(255) DEFAULT NULL,
  `Produto_Marca` varchar(20) NOT NULL,
  `Produto_Modelo` varchar(20) NOT NULL,
  `Produto_Avaliacao` float DEFAULT NULL,
  `Produto_Valor` float NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `idVendedor` int NOT NULL AUTO_INCREMENT,
  `Vendedor_CNPJ` char(14) NOT NULL,
  `Vendedor_RazaoSocial` varchar(30) NOT NULL,
  `Vendedor_NomeFantasia` varchar(30) NOT NULL,
  `Vendedor_Email` varchar(30) NOT NULL,
  `Vendedor_Celular` char(11) DEFAULT NULL,
  `Vendedor_Telefone` char(10) DEFAULT NULL,
  `Vendedor_CEP` char(8) NOT NULL,
  `Vendedor_Logradouro` varchar(45) NOT NULL,
  `Vendedor_Numero` varchar(5) DEFAULT NULL,
  `Vendedor_Complemento` varchar(20) DEFAULT NULL,
  `Vendedor_Bairro` varchar(15) NOT NULL,
  `Vendedor_Municipio` varchar(30) NOT NULL,
  `Vendedor_UF` char(2) NOT NULL,
  PRIMARY KEY (`idVendedor`),
  UNIQUE KEY `unique_CNPJ_Vendedor` (`Vendedor_CNPJ`),
  UNIQUE KEY `unique_RazaoSocial_Vendedor` (`Vendedor_RazaoSocial`),
  UNIQUE KEY `unique_Email_Vendedor` (`Vendedor_Email`),
  UNIQUE KEY `unique_Celular_Vendedor` (`Vendedor_Celular`),
  UNIQUE KEY `unique_Telefone_Vendedor` (`Vendedor_Telefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedorproduto`
--

DROP TABLE IF EXISTS `vendedorproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedorproduto` (
  `Vendedor_idVendedor` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `VendendorProduto_Quantidade` int NOT NULL,
  PRIMARY KEY (`Vendedor_idVendedor`,`Produto_idProduto`),
  KEY `fk_idProduto_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_idProduto_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `fk_idVendedor_Vendedor` FOREIGN KEY (`Vendedor_idVendedor`) REFERENCES `vendedor` (`idVendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedorproduto`
--

LOCK TABLES `vendedorproduto` WRITE;
/*!40000 ALTER TABLE `vendedorproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedorproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce_refinado_old'
--

--
-- Dumping routines for database 'ecommerce_refinado_old'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 16:44:26
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: oficina
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Cliente_CPF` char(11) NOT NULL,
  `Cliente_Nome` varchar(10) NOT NULL,
  `Cliente_Sobrenome` varchar(25) NOT NULL,
  `Cliente_DataNascimento` date NOT NULL,
  `cliente_Email` varchar(30) NOT NULL,
  `Cliente_Celular` char(11) DEFAULT NULL,
  `Cliente_CEP` char(8) NOT NULL,
  `Cliente_Logradouro` varchar(45) NOT NULL,
  `Cliente_Numero` varchar(5) DEFAULT NULL,
  `Cliente_Complemento` varchar(20) DEFAULT NULL,
  `Cliente_Bairro` varchar(15) NOT NULL,
  `Cliente_Municipio` varchar(20) NOT NULL,
  `Cliente_UF` char(2) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `unique_CPF_ClienteCPF` (`Cliente_CPF`),
  UNIQUE KEY `unique_Email_ClienteEmail` (`cliente_Email`),
  UNIQUE KEY `unique_Celular_ClienteCeuluar` (`Cliente_Celular`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'77287406365','Alzira','de Barros Nogueira','1965-07-19','alzira.nogueira@alzira.com.br','86979154445','64007230','Rua Fagundes Varela','30',NULL,'Primavera','Teresina','PI'),(2,'86844477430','José ','Milton Figueredo Soriano','1948-12-25','jose.soriano@jose.com.br','84986821766','59064745','Alameda Marechal Sucupira','570',NULL,'Candelária','Natal','RN'),(3,'57143610402','Patrick','Coimbra Silveira','1960-01-28','patrick.coimbra@patrick.com.br','84971346457','59129470','Rua Luiz Gonzaga de Souza','47',NULL,'Lagoa Azul','Natal','RN'),(4,'92143049986','Herisomar','Auzier Matos','1982-10-05','herisomar.matos@heri.com.br','4621714451','86058302','Rua Josepha Montier Peres','740',NULL,'Esperança','Londrina','PR'),(5,'53397744733','Vera','Miranda Goncalves','1951-12-10','vera.goncalves@vera.com.br','22987933547','25570525','Travessa São Vicente','87',NULL,'Vila Dias Lopes','São João de Meriti','RJ'),(6,'11158042868','Francisco','Youssef Simoes','1980-02-12','francisco.simoes@simoes.com.br','17997531862','12286295','Travessa Antônio Luiz dos Santos','6547',NULL,'Vila Galvão','Caçapava','SP');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico` (
  `idMecanico` int NOT NULL AUTO_INCREMENT,
  `Mecanico_Matricula` char(7) NOT NULL,
  `Mecanico_Nome` varchar(50) NOT NULL,
  `Mecanico_CPF` char(11) NOT NULL,
  `Mecanico_Especialidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMecanico`),
  UNIQUE KEY `unique_Matricula_MecanicoMatricula` (`Mecanico_Matricula`),
  UNIQUE KEY `unique_CPF_MecanicoCPF` (`Mecanico_CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES (1,'5469852','Agenor Rangel Portela','93835735462','Nível I'),(2,'5423658','Aparecida Holanda da Sousa','78218650440','Nível I'),(3,'0598753','Aderbal Braz Mesquita','85634362440','Nível II'),(4,'7776542','Adso Holanda Campelo','25163347454','Nível II'),(5,'1325648','Ezeni Sá Norte','81430576405','Nível III');
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamento`
--

DROP TABLE IF EXISTS `orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orcamento` (
  `idOrcamento` int NOT NULL AUTO_INCREMENT,
  `Orcamento_Descricao` varchar(255) NOT NULL,
  `Orcamento_TipoServico` varchar(45) NOT NULL,
  `Orcamento_Data` date NOT NULL,
  PRIMARY KEY (`idOrcamento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamento`
--

LOCK TABLES `orcamento` WRITE;
/*!40000 ALTER TABLE `orcamento` DISABLE KEYS */;
INSERT INTO `orcamento` VALUES (1,'Troca da correia dentada','Mecanico','2023-05-15'),(2,'Troca de Oleo','Mecanico','2023-05-10'),(3,'Troca da embreagem','Mecanico','2023-06-02'),(4,'Troca dos Farois','Eletrico','2023-05-25'),(5,'Troca de Oleo','Mecanico','2023-06-02');
/*!40000 ALTER TABLE `orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamentomecanico`
--

DROP TABLE IF EXISTS `orcamentomecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orcamentomecanico` (
  `Orcamento_idOrcamento` int NOT NULL,
  `Mecanico_idMecanico` int NOT NULL,
  `OrcamentoMecanico_ValorMecanico` float NOT NULL,
  PRIMARY KEY (`Orcamento_idOrcamento`,`Mecanico_idMecanico`),
  KEY `fk_MecanicoidMecanico_idMecanico` (`Mecanico_idMecanico`),
  CONSTRAINT `fk_MecanicoidMecanico_idMecanico` FOREIGN KEY (`Mecanico_idMecanico`) REFERENCES `mecanico` (`idMecanico`),
  CONSTRAINT `fk_OMOrcamentoidCorcamento_idOrcamento` FOREIGN KEY (`Orcamento_idOrcamento`) REFERENCES `orcamento` (`idOrcamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamentomecanico`
--

LOCK TABLES `orcamentomecanico` WRITE;
/*!40000 ALTER TABLE `orcamentomecanico` DISABLE KEYS */;
INSERT INTO `orcamentomecanico` VALUES (1,3,80),(2,2,80),(3,5,300),(4,1,40),(5,2,80);
/*!40000 ALTER TABLE `orcamentomecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamentoveiculo`
--

DROP TABLE IF EXISTS `orcamentoveiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orcamentoveiculo` (
  `Orcamento_idOrcamento` int NOT NULL,
  `Veiculo_idVeiculo` int NOT NULL,
  `OrcamentoVeiculo_DataPrevistaEntrega` date NOT NULL,
  PRIMARY KEY (`Orcamento_idOrcamento`,`Veiculo_idVeiculo`),
  KEY `fk_OrcamentoVeiculoidVeiculo_idVeiculo` (`Veiculo_idVeiculo`),
  CONSTRAINT `fk_OrcamentoidOrcamento_idOrcamento` FOREIGN KEY (`Orcamento_idOrcamento`) REFERENCES `orcamento` (`idOrcamento`),
  CONSTRAINT `fk_OrcamentoVeiculoidVeiculo_idVeiculo` FOREIGN KEY (`Veiculo_idVeiculo`) REFERENCES `veiculo` (`idVeiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamentoveiculo`
--

LOCK TABLES `orcamentoveiculo` WRITE;
/*!40000 ALTER TABLE `orcamentoveiculo` DISABLE KEYS */;
INSERT INTO `orcamentoveiculo` VALUES (1,3,'2023-05-18'),(2,4,'2023-05-10'),(3,2,'2023-06-20'),(4,7,'2023-05-29'),(5,2,'2023-06-20');
/*!40000 ALTER TABLE `orcamentoveiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordemservico`
--

DROP TABLE IF EXISTS `ordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordemservico` (
  `idOrdemServico` int NOT NULL AUTO_INCREMENT,
  `OS_Protocolo` char(8) NOT NULL,
  `OS_DataEmissao` date NOT NULL,
  `OS_DataConclusao` date NOT NULL,
  `OS_ValorTotal` float NOT NULL,
  `OS_Garantia` date DEFAULT NULL,
  PRIMARY KEY (`idOrdemServico`),
  UNIQUE KEY `unique_protocolo_OSProtocolo` (`OS_Protocolo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordemservico`
--

LOCK TABLES `ordemservico` WRITE;
/*!40000 ALTER TABLE `ordemservico` DISABLE KEYS */;
INSERT INTO `ordemservico` VALUES (1,'12345678','2023-05-15','2023-05-18',380,'2025-05-18'),(2,'87654321','2023-05-10','2023-05-11',280,NULL),(3,'55442266','2023-06-05','2023-06-20',1500,'2028-06-20'),(4,'10235047','2023-05-29','2023-05-29',140,'2024-05-29'),(5,'10156841','2023-06-05','2023-06-20',280,NULL);
/*!40000 ALTER TABLE `ordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osorcamento`
--

DROP TABLE IF EXISTS `osorcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osorcamento` (
  `OS_idOrdemServico` int NOT NULL,
  `Orcamento_idOrcamento` int NOT NULL,
  `OSOrcamento_valor` float NOT NULL,
  PRIMARY KEY (`OS_idOrdemServico`,`Orcamento_idOrcamento`),
  KEY `fk_OSOOrcamento_idOrcamento` (`Orcamento_idOrcamento`),
  CONSTRAINT `fk_OSidOrdemServico_idOrdemServico` FOREIGN KEY (`OS_idOrdemServico`) REFERENCES `ordemservico` (`idOrdemServico`),
  CONSTRAINT `fk_OSOOrcamento_idOrcamento` FOREIGN KEY (`Orcamento_idOrcamento`) REFERENCES `orcamento` (`idOrcamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osorcamento`
--

LOCK TABLES `osorcamento` WRITE;
/*!40000 ALTER TABLE `osorcamento` DISABLE KEYS */;
INSERT INTO `osorcamento` VALUES (1,1,300),(2,2,200),(3,3,1200),(4,4,100),(5,5,200);
/*!40000 ALTER TABLE `osorcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osproduto`
--

DROP TABLE IF EXISTS `osproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osproduto` (
  `OS_idOrdemServico` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `OSProduto_Quantidade` int DEFAULT NULL,
  PRIMARY KEY (`OS_idOrdemServico`,`Produto_idProduto`),
  KEY `fk_ProdutoidProduto_idProduto` (`Produto_idProduto`),
  CONSTRAINT `fk_OSPidOrdemServico_idOrdemServico` FOREIGN KEY (`OS_idOrdemServico`) REFERENCES `ordemservico` (`idOrdemServico`),
  CONSTRAINT `fk_ProdutoidProduto_idProduto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osproduto`
--

LOCK TABLES `osproduto` WRITE;
/*!40000 ALTER TABLE `osproduto` DISABLE KEYS */;
INSERT INTO `osproduto` VALUES (1,1,1),(2,2,1),(3,3,4),(4,4,2),(5,2,1);
/*!40000 ALTER TABLE `osproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `Produto_Descricao` varchar(255) NOT NULL,
  `Produto_Valor` float NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Correia dentada',300),(2,'Oleo',200),(3,'Kit Embreagem',1200),(4,'Farol',120),(5,'Oleo',200);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `idVeiculo` int NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` int DEFAULT NULL,
  `Veiculo_Placa` char(7) NOT NULL,
  `Veiculo_Marca` varchar(30) NOT NULL,
  `Veiculo_Modelo` varchar(70) NOT NULL,
  `Veiculo_Ano` year NOT NULL,
  `Veiculo_Cor` varchar(15) NOT NULL,
  `Veiculo_Renavam` char(11) NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  UNIQUE KEY `unique_placa_VeiculoPlaca` (`Veiculo_Placa`),
  UNIQUE KEY `unique_chassi_VeiculoRenavam` (`Veiculo_Renavam`),
  KEY `fk_ClienteidCliente_idCliente` (`Cliente_idCliente`),
  CONSTRAINT `fk_ClienteidCliente_idCliente` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,1,'MUK9077','Mitsubishi','Pajero TR4 2.0/ 2.0 Flex 16V 4x4 Mec.',2003,'Branco','7555187435'),(2,4,'MUF3746','Troller','RF Esport T-4 4x4 2.0 Cap. R',1999,'Vermelho','29558463116'),(3,6,'MUL5057','Saturn','SL-2 1.9',1991,'Branco','94583538450'),(4,6,'MVI5432','HAFEI','Towner Jr. Pick-up 1.0 8V 48cv  CD 4p',2010,'Amarelo','90088022248'),(5,5,'MUY7792','Mercury','Sable LS 3.0 V6',1992,'Azul','9841585052'),(6,2,'MUY7150','Fiat','Strada 1.3 mpi Fire 8V 67cv CE',2003,'Azul','89664924524'),(7,3,'MVD8569','Fiat','Fiat Mille',2001,'Vermelho','76039098940');
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'oficina'
--

--
-- Dumping routines for database 'oficina'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 16:44:26
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Pnome` varchar(10) NOT NULL,
  `Sobrenome` varchar(30) DEFAULT NULL,
  `Endereco` varchar(255) DEFAULT NULL,
  `DataNascimento` date NOT NULL,
  `CPF` char(11) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Celular` char(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `unique_cpf_cliente` (`CPF`),
  UNIQUE KEY `unique_email_cliente` (`Email`),
  UNIQUE KEY `unique_celular_cliente` (`Celular`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Maria','M Silva','rua silva de prata 29, Carangola - Cidade das flores','2000-07-05','12346789','maria@msilva.com.br','82987417417'),(2,'Matheus','O Pimentel','rua alemeda 289, Centro - Cidade das flores','1990-04-04','987654321','matheus@opimentel.com.br','77945214741'),(3,'Ricardo','F Silva','avenida alemeda vinha 1009, Centro - Cidade das flores','1995-10-25','45678913','ricardo@fsilva.com.br','11947581354'),(4,'Julia','S França','rua lareijras 861, Centro - Cidade das flores','2001-01-25','789123456','julia@ffranca.com.br','31945789652'),(5,'Roberta','G Assis','avenidade koller 19, Centro - Cidade das flores','1999-03-01','98745631','roberta@gassis.com.br','81987432568'),(6,'Isabela','M Cruz','rua alemeda das flores 28, Centro - Cidade das flores','1995-05-20','654789123','isabela@mcruz.com.br','11998547567');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `Localizacao` varchar(255) NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Rio de Janeiro',1000),(2,'Rio de Janeiro',500),(3,'São Paulo',10),(4,'São Paulo',100),(5,'São Paulo',10),(6,'Brasília',60),(7,'Rio de Janeiro',1000),(8,'Rio de Janeiro',500),(9,'São Paulo',10),(10,'São Paulo',100),(11,'São Paulo',10),(12,'Brasília',60);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoqueproduto`
--

DROP TABLE IF EXISTS `estoqueproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoqueproduto` (
  `idLproduto` int NOT NULL,
  `idLestoque` int NOT NULL,
  `localizacao` varchar(255) NOT NULL,
  PRIMARY KEY (`idLproduto`,`idLestoque`),
  KEY `fk_estoqueProduto_estoque` (`idLestoque`),
  CONSTRAINT `fk_estoqueProduto_estoque` FOREIGN KEY (`idLestoque`) REFERENCES `estoque` (`idEstoque`),
  CONSTRAINT `fk_estoqueProduto_produto` FOREIGN KEY (`idLproduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoqueproduto`
--

LOCK TABLES `estoqueproduto` WRITE;
/*!40000 ALTER TABLE `estoqueproduto` DISABLE KEYS */;
INSERT INTO `estoqueproduto` VALUES (1,2,'RJ'),(2,6,'GO');
/*!40000 ALTER TABLE `estoqueproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `CNPJ` char(15) NOT NULL,
  `RazaoSocial` varchar(45) NOT NULL,
  `NomeFantasia` varchar(45) DEFAULT NULL,
  `Endereco` varchar(255) NOT NULL,
  `Contato` varchar(11) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `unique_cnpj_fornecedor` (`CNPJ`),
  UNIQUE KEY `unique_razaosocial_fornecedor` (`RazaoSocial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'123456789123456','Almeida e filhos','Marquinhos construções','Rua Americo Vasco, 215 - PE','21985474'),(2,'854519649143457','Eletrônicos Silva','Flavinho do eletrônico','Rua Trindade, 578 - AL','21985484'),(3,'934567893934695','Eletrônicos Valma','Emanuelsonzin eletro','Rua tambaú, 2878 - PB','21975474');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `idCliente` int NOT NULL,
  `idPagamento` int NOT NULL,
  `idPedidoPagamento` int DEFAULT NULL,
  `TipodePagamento` enum('Cartão de crédito','Cartão de débito','Boleto','Dinheiro','PIX') DEFAULT NULL,
  `CartaoNumero` char(16) DEFAULT NULL,
  `CartaoValidade` char(5) DEFAULT NULL,
  `CartaoCVV` char(3) DEFAULT NULL,
  `ValorTotal` float DEFAULT NULL,
  PRIMARY KEY (`idCliente`,`idPagamento`),
  KEY `fk_pagamento_pedido` (`idPedidoPagamento`),
  CONSTRAINT `fk_pagamento_pedido` FOREIGN KEY (`idPedidoPagamento`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `idPedidoCliente` int DEFAULT NULL,
  `PedidoStatus` enum('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
  `Descricao` varchar(255) DEFAULT NULL,
  `Frete` float DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_pedido_cliente` (`idPedidoCliente`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`idPedidoCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'Em processamento','compra via aplicativo',NULL),(2,2,'Em processamento','compra via aplicativo',50),(3,3,'Confirmado',NULL,NULL),(4,4,'Em processamento','compra via web site',150),(6,2,'Em processamento','Compra via Aplicativo',NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `ProdutoNome` varchar(50) NOT NULL,
  `ClassificadoCriancas` tinyint(1) DEFAULT '0',
  `Categoria` enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') NOT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  `Avaliacao` float DEFAULT NULL,
  `dimencao` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Fone de ouvido',0,'Eletrônico',NULL,4,NULL),(2,'Barbie Elsa',1,'Brinquedos',NULL,3,NULL),(3,'Body Carters',1,'Vestimenta',NULL,5,NULL),(4,'Microfone Vedo - Youtuber',0,'Eletrônico',NULL,4,NULL),(5,'Sofá retrátil',0,'Móveis',NULL,3,'3x57x80'),(6,'Farinha de arroz',0,'Alimentos',NULL,2,NULL),(7,'Fire Stick Amazon',0,'Eletrônico',NULL,3,NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtofornecedor`
--

DROP TABLE IF EXISTS `produtofornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtofornecedor` (
  `idPsFornecedor` int NOT NULL,
  `idpsProduto` int NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`idPsFornecedor`,`idpsProduto`),
  KEY `fk_produtoFornecedor_produto` (`idpsProduto`),
  CONSTRAINT `fk_produtoFornecedor_fornecedor` FOREIGN KEY (`idPsFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_produtoFornecedor_produto` FOREIGN KEY (`idpsProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtofornecedor`
--

LOCK TABLES `produtofornecedor` WRITE;
/*!40000 ALTER TABLE `produtofornecedor` DISABLE KEYS */;
INSERT INTO `produtofornecedor` VALUES (1,1,500),(1,2,400),(2,4,633),(2,5,10),(3,3,5);
/*!40000 ALTER TABLE `produtofornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtopedido`
--

DROP TABLE IF EXISTS `produtopedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtopedido` (
  `idProdutoProduto` int NOT NULL,
  `idProdutoPedido` int NOT NULL,
  `ProdutoQuantidade` int DEFAULT '1',
  `ProdutoPedidoStatus` enum('Disponível','Sem estoque') DEFAULT 'Disponível',
  PRIMARY KEY (`idProdutoProduto`,`idProdutoPedido`),
  KEY `fk_pedido_pedido` (`idProdutoPedido`),
  CONSTRAINT `fk_pedido_pedido` FOREIGN KEY (`idProdutoPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_produto_pedido` FOREIGN KEY (`idProdutoProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtopedido`
--

LOCK TABLES `produtopedido` WRITE;
/*!40000 ALTER TABLE `produtopedido` DISABLE KEYS */;
INSERT INTO `produtopedido` VALUES (1,1,2,'Disponível'),(2,1,1,'Disponível'),(3,2,1,'Disponível');
/*!40000 ALTER TABLE `produtopedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtovendedor`
--

DROP TABLE IF EXISTS `produtovendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtovendedor` (
  `idProdutoVendedor` int NOT NULL,
  `idProduto` int NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`idProdutoVendedor`,`idProduto`),
  KEY `fk_produto_produto` (`idProduto`),
  CONSTRAINT `fk_produto_produto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `fk_produto_vendedor` FOREIGN KEY (`idProdutoVendedor`) REFERENCES `vendedor` (`idVendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtovendedor`
--

LOCK TABLES `produtovendedor` WRITE;
/*!40000 ALTER TABLE `produtovendedor` DISABLE KEYS */;
INSERT INTO `produtovendedor` VALUES (1,6,80),(2,7,10);
/*!40000 ALTER TABLE `produtovendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `idVendedor` int NOT NULL AUTO_INCREMENT,
  `CNPJ` char(15) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `RazaoSocial` varchar(45) DEFAULT NULL,
  `NomeFantasia` varchar(45) DEFAULT NULL,
  `Nome` varchar(10) DEFAULT NULL,
  `Sobrenome` varchar(30) DEFAULT NULL,
  `Endereco` varchar(255) NOT NULL,
  `Contato` varchar(11) NOT NULL,
  PRIMARY KEY (`idVendedor`),
  UNIQUE KEY `unique_cnpj_vendedor` (`CNPJ`),
  UNIQUE KEY `unique_cpf_vendedor` (`CPF`),
  UNIQUE KEY `unique_razaosocial_vendedor` (`RazaoSocial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'123456789456321',NULL,'Tech eletronics',NULL,NULL,NULL,'Rio de Janeiro','219946287'),(2,NULL,'123456783','Botique Durgas',NULL,'Emanuel','M Carvalho','Rio de Janeiro','219567895'),(3,'456789123654485',NULL,'Kids World',NULL,NULL,NULL,'São Paulo','1198657484');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce'
--

--
-- Dumping routines for database 'ecommerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 16:44:26
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: customer_management
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `c_name` varchar(25) DEFAULT NULL,
  `c_email` varchar(40) DEFAULT NULL,
  `c_cpf` char(9) DEFAULT NULL,
  `c_credit_card` char(13) DEFAULT NULL,
  `c_contact` char(9) DEFAULT NULL,
  `c_address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `index_email` (`c_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'customer_management'
--

--
-- Dumping routines for database 'customer_management'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 16:44:26
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: company_constraints
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int NOT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  `dept_create_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `unique_name_dept` (`Dname`),
  KEY `fk_dept` (`Mgr_ssn`),
  CONSTRAINT `fk_dept` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON UPDATE CASCADE,
  CONSTRAINT `chk_date_dept` CHECK ((`dept_create_date` < `Mgr_start_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `fk_dept_locations` FOREIGN KEY (`Dnumber`) REFERENCES `department` (`Dnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `fk_employee` (`Super_ssn`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`Super_ssn`) REFERENCES `employee` (`Ssn`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_salary_employee` CHECK ((`Salary` > 2000.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employess_salary_27000_view`
--

DROP TABLE IF EXISTS `employess_salary_27000_view`;
/*!50001 DROP VIEW IF EXISTS `employess_salary_27000_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employess_salary_27000_view` AS SELECT 
 1 AS `Nome`,
 1 AS `Salary`,
 1 AS `Dept_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employess_salary_view`
--

DROP TABLE IF EXISTS `employess_salary_view`;
/*!50001 DROP VIEW IF EXISTS `employess_salary_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employess_salary_view` AS SELECT 
 1 AS `Nome`,
 1 AS `Salary`,
 1 AS `Dept_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `unique_project` (`Pname`),
  KEY `fk_project` (`Dnum`),
  CONSTRAINT `fk_project` FOREIGN KEY (`Dnum`) REFERENCES `department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_today`
--

DROP TABLE IF EXISTS `v_today`;
/*!50001 DROP VIEW IF EXISTS `v_today`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_today` AS SELECT 
 1 AS `today`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_project_works_on` (`Pno`),
  CONSTRAINT `fk_employee_works_on` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_project_works_on` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'company_constraints'
--

--
-- Dumping routines for database 'company_constraints'
--

--
-- Final view structure for view `employess_salary_27000_view`
--

/*!50001 DROP VIEW IF EXISTS `employess_salary_27000_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employess_salary_27000_view` AS select concat(`employee`.`Fname`,`employee`.`Minit`,`employee`.`Lname`) AS `Nome`,`employee`.`Salary` AS `Salary`,`employee`.`Dno` AS `Dept_number` from `employee` where (`employee`.`Salary` > 26999) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employess_salary_view`
--

/*!50001 DROP VIEW IF EXISTS `employess_salary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employess_salary_view` AS select concat(`employee`.`Fname`,`employee`.`Minit`,`employee`.`Lname`) AS `Nome`,`employee`.`Salary` AS `Salary`,`employee`.`Dno` AS `Dept_number` from `employee` where (`employee`.`Sex` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_today`
--

/*!50001 DROP VIEW IF EXISTS `v_today`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_today` (`today`) AS select curdate() AS `current_date()` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 16:44:26
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: company
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL,
  PRIMARY KEY (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int NOT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  `Dept_create_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `unique_name_dept` (`Dname`),
  KEY `fk_dept` (`Mgr_ssn`),
  CONSTRAINT `fk_dept` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON UPDATE CASCADE,
  CONSTRAINT `chk_date_dept` CHECK ((`Dept_create_date` < `Mgr_start_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES ('Headquarters',1,'888665555','1981-06-19','1980-06-19'),('Administration',4,'987654321','1995-01-01','1994-01-01'),('Research',5,'333445555','1988-05-22','1986-05-22');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `fk_dependent` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('123456789','Alice','F','1988-12-30','Daughter'),('123456789','Elizabeth','F','1967-05-05','Spouse'),('123456789','Michael','M','1988-01-04','Son'),('333445555','Alice','F','1986-04-05','Daughter'),('333445555','Joy','F','1958-05-03','Spouse'),('333445555','Theodore','M','1983-10-25','Son'),('987654321','Abner','M','1942-02-28','Spouse');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `fk_dept_locations` FOREIGN KEY (`Dnumber`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (1,'Houston'),(4,'Stafford'),(5,'Bellaire'),(5,'Houston'),(5,'Sugarland');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `fk_employee` (`Super_ssn`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`Super_ssn`) REFERENCES `employee` (`Ssn`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_salary_employee` CHECK ((`Salary` > 2000.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Roberta','H','Teixeira','123419824','1990-08-10','731-Fondren-Houston-TX','M',40000.00,'123456789',1),('João','B','Smith','123456759','1965-01-09','rua rua rua rua','M',32000.00,'987654321',5),('John','B','Smith','123456789','1965-01-09','731-Fondren-Houston-TX','M',32000.00,NULL,5),('Amanda','H','Teixeira','123769824','1990-08-10','731-Fondren-Houston-TX','M',40000.00,'123456789',1),('Cláudio','B','Teixeira','123859824','1990-08-10','731-Fondren-Houston-TX','M',40000.00,'123456789',4),('Maria','B','Smith','145754678','1965-08-10','731-Fondren-Houston-TX','F',3500.00,'123456789',5),('Franklin','T','Wong','333445555','1955-12-08','638-Voss-Houston-TX','M',42000.00,'123456789',5),('Joyce','A','English','453453453','1972-07-31','5631-Rice-Houston-TX','F',27000.00,'987654321',5),('Carlinhos','V','Chagas','554466229','1974-01-09',NULL,'M',29000.00,'333445555',1),('Ramesh','K','Narayan','666884444','1962-09-15','975-Fire-Oak-Humble-TX','M',40000.00,'987654321',5),('James','E','Borg','888665555','1937-11-10','450-Stone-Houston-TX','M',58000.00,NULL,1),('Jennifer','S','Wallace','987654321','1941-06-20','291-Berry-Bellaire-TX','F',44500.00,NULL,4),('Ahmad','V','Jabbar','987987987','1969-03-29','980-Dallas-Houston-TX','M',26500.00,'123456789',4),('Alicia','J','Zelaya','999887777','1968-01-19','3321-Castle-Spring-TX','F',26500.00,'333445555',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employess_dependent_view`
--

DROP TABLE IF EXISTS `employess_dependent_view`;
/*!50001 DROP VIEW IF EXISTS `employess_dependent_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employess_dependent_view` AS SELECT 
 1 AS `Nome`,
 1 AS `Dependent`,
 1 AS `Departament`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employess_salary_27000_view`
--

DROP TABLE IF EXISTS `employess_salary_27000_view`;
/*!50001 DROP VIEW IF EXISTS `employess_salary_27000_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employess_salary_27000_view` AS SELECT 
 1 AS `Nome`,
 1 AS `Salary`,
 1 AS `Dept_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employess_salary_view`
--

DROP TABLE IF EXISTS `employess_salary_view`;
/*!50001 DROP VIEW IF EXISTS `employess_salary_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employess_salary_view` AS SELECT 
 1 AS `Nome`,
 1 AS `Salary`,
 1 AS `Dept_number`,
 1 AS `Ssn`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employess_salary_view_dependent`
--

DROP TABLE IF EXISTS `employess_salary_view_dependent`;
/*!50001 DROP VIEW IF EXISTS `employess_salary_view_dependent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employess_salary_view_dependent` AS SELECT 
 1 AS `Nome`,
 1 AS `Dependent`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `unique_project` (`Pname`),
  KEY `fk_project` (`Dnum`),
  CONSTRAINT `fk_project` FOREIGN KEY (`Dnum`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ProductX',1,'Bellaire',5),('ProductY',2,'Sugarland',5),('ProductZ',3,'Houston',5),('Computerization',10,'Stafford',4),('Reorganization',20,'Houston',1),('Newbenefits',30,'Stafford',4);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_messages`
--

DROP TABLE IF EXISTS `users_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(100) DEFAULT NULL,
  `ssn` char(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ssn_messages` (`ssn`),
  CONSTRAINT `fk_ssn_messages` FOREIGN KEY (`ssn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_messages`
--

LOCK TABLES `users_messages` WRITE;
/*!40000 ALTER TABLE `users_messages` DISABLE KEYS */;
INSERT INTO `users_messages` VALUES (1,'Update your address, please!','554466229');
/*!40000 ALTER TABLE `users_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_today`
--

DROP TABLE IF EXISTS `v_today`;
/*!50001 DROP VIEW IF EXISTS `v_today`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_today` AS SELECT 
 1 AS `today`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_project_works_on` (`Pno`),
  CONSTRAINT `fk_employee_works_on` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_project_works_on` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('123456789',1,32.5),('123456789',2,7.5),('333445555',2,10.0),('333445555',3,10.0),('333445555',10,10.0),('333445555',20,10.0),('453453453',1,20.0),('453453453',2,20.0),('666884444',3,40.0),('888665555',20,0.0),('987654321',20,15.0),('987654321',30,20.0),('987987987',10,35.0),('987987987',30,5.0),('999887777',10,10.0),('999887777',30,30.0);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'company'
--

--
-- Dumping routines for database 'company'
--
/*!50003 DROP PROCEDURE IF EXISTS `info_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_employee`()
begin
	select * from employee inner join departament on dno = dnumber;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_into_employee_proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_into_employee_proc`(
	in Fname_p varchar(15), 
    in Minit_p varchar(1), 
    in Lname_p varchar(15), 
    in Ssn_p char(9), 
    in Bdate_p date, 
    in Address_p varchar(30), 
    in Sex_p char(1), 
    in Salary_p decimal(10,2), 
    in Super_ssn_p char(9), 
    in Dno_p int
)
begin
	insert into employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
	#values ('Maria', 'B', 'Smith', '145754678', '1965-08-10', '731-Fondren-Houston-TX', 'F', '3500.0', '123456789', '5');
	values (Fname_p, Minit_p, Lname_p, Ssn_p, Bdate_p, Address_p, Sex_p, Salary_p, Super_ssn_p, Dno_p);
	
    select 'Inserção bem sucedida' as Message, Fname, Ssn from employee where ssn = ssn_p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `employess_dependent_view`
--

/*!50001 DROP VIEW IF EXISTS `employess_dependent_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employess_dependent_view` AS select concat(`e`.`Fname`,`e`.`Minit`,`e`.`Lname`) AS `Nome`,`d`.`Dependent_name` AS `Dependent`,`e`.`Dno` AS `Departament` from (`employee` `e` join `dependent` `d` on((`e`.`Ssn` = `d`.`Essn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employess_salary_27000_view`
--

/*!50001 DROP VIEW IF EXISTS `employess_salary_27000_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employess_salary_27000_view` AS select concat(`employee`.`Fname`,`employee`.`Minit`,`employee`.`Lname`) AS `Nome`,`employee`.`Salary` AS `Salary`,`employee`.`Dno` AS `Dept_number` from `employee` where (`employee`.`Salary` > 26999) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employess_salary_view`
--

/*!50001 DROP VIEW IF EXISTS `employess_salary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employess_salary_view` AS select concat(`employee`.`Fname`,`employee`.`Minit`,`employee`.`Lname`) AS `Nome`,`employee`.`Salary` AS `Salary`,`employee`.`Dno` AS `Dept_number`,`employee`.`Ssn` AS `Ssn` from `employee` where (`employee`.`Sex` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employess_salary_view_dependent`
--

/*!50001 DROP VIEW IF EXISTS `employess_salary_view_dependent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employess_salary_view_dependent` AS select concat(`e`.`Fname`,`e`.`Minit`,`e`.`Lname`) AS `Nome`,`d`.`Dependent_name` AS `Dependent` from (`employee` `e` join `dependent` `d` on((`e`.`Ssn` = `d`.`Essn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_today`
--

/*!50001 DROP VIEW IF EXISTS `v_today`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_today` (`today`) AS select curdate() AS `current_date()` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 16:44:26
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: company_desafio
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int NOT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  `Dept_create_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `unique_name_dept` (`Dname`),
  KEY `fk_dept` (`Mgr_ssn`),
  CONSTRAINT `departament_ibfk_1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_dept` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON UPDATE CASCADE,
  CONSTRAINT `chk_date_dept` CHECK ((`Dept_create_date` < `Mgr_start_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES ('Headquarters',1,'888665555','1981-06-19','1980-06-19'),('Administration',4,'987654321','1995-01-01','1994-01-01'),('Research',5,'333445555','1988-05-22','1986-05-22');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `fk_dependent` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('123456789','Alice','F','1988-12-30','Daughter'),('123456789','Elizabeth','F','1967-05-05','Spouse'),('123456789','Michael','M','1988-01-04','Son'),('333445555','Alice','F','1986-04-05','Daughter'),('333445555','Joy','F','1958-05-03','Spouse'),('333445555','Theodore','M','1983-10-25','Son'),('987654321','Abner','M','1942-02-28','Spouse');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `fk_dept_locations` FOREIGN KEY (`Dnumber`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (1,'Houston'),(4,'Stafford'),(5,'Bellaire'),(5,'Houston'),(5,'Sugarland');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`Ssn`),
  KEY `fk_employee` (`Super_ssn`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`Super_ssn`) REFERENCES `employee` (`Ssn`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('John','B','Smith','123456789','1965-01-09','731-Fondren-Houston-TX','M',30000.00,'333445555',5),('Franklin','T','Wong','333445555','1955-12-08','638-Voss-Houston-TX','M',40000.00,'888665555',5),('Joyce','A','English','453453453','1972-07-31','5631-Rice-Houston-TX','F',25000.00,'333445555',5),('Ramesh','K','Narayan','666884444','1962-09-15','975-Fire-Oak-Humble-TX','M',38000.00,'333445555',5),('James','E','Borg','888665555','1937-11-10','450-Stone-Houston-TX','M',55000.00,NULL,1),('Jennifer','S','Wallace','987654321','1941-06-20','291-Berry-Bellaire-TX','F',43000.00,'888665555',4),('Ahmad','V','Jabbar','987987987','1969-03-29','980-Dallas-Houston-TX','M',25000.00,'987654321',4),('Alicia','J','Zelaya','999887777','1968-01-19','3321-Castle-Spring-TX','F',25000.00,'987654321',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `unique_project` (`Pname`),
  KEY `fk_project` (`Dnum`),
  CONSTRAINT `fk_project` FOREIGN KEY (`Dnum`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ProductX',1,'Bellaire',5),('ProductY',2,'Sugarland',5),('ProductZ',3,'Houston',5),('Computerization',10,'Stafford',4),('Reorganization',20,'Houston',1),('Newbenefits',30,'Stafford',4);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_project_works_on` (`Pno`),
  CONSTRAINT `fk_employee_works_on` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_project_works_on` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('123456789',1,32.5),('123456789',2,7.5),('333445555',2,10.0),('333445555',3,10.0),('333445555',10,10.0),('333445555',20,10.0),('453453453',1,20.0),('453453453',2,20.0),('666884444',3,40.0),('888665555',20,0.0),('987654321',20,15.0),('987654321',30,20.0),('987987987',10,35.0),('987987987',30,5.0),('999887777',10,10.0),('999887777',30,30.0);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'company_desafio'
--

--
-- Dumping routines for database 'company_desafio'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 16:44:27
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_refinado
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Cliente_idClientePF` int DEFAULT NULL,
  `Cliente_idClientePJ` int DEFAULT NULL,
  `cliente_Email` varchar(30) NOT NULL,
  `Cliente_Celular` char(11) DEFAULT NULL,
  `Cliente_Telefone` char(10) DEFAULT NULL,
  `Cliente_CEP` char(8) NOT NULL,
  `Cliente_Logradouro` varchar(45) NOT NULL,
  `Cliente_Numero` varchar(5) DEFAULT NULL,
  `Cliente_Complemento` varchar(20) DEFAULT NULL,
  `Cliente_Bairro` varchar(15) NOT NULL,
  `Cliente_Municipio` varchar(20) NOT NULL,
  `Cliente_UF` char(2) NOT NULL,
  `Cliente_Regiao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `unique_email_cliente` (`cliente_Email`),
  UNIQUE KEY `unique_celular_cliente` (`Cliente_Celular`),
  UNIQUE KEY `unique_telefone_cliente` (`Cliente_Telefone`),
  KEY `fk_idClientePF_ClientePF` (`Cliente_idClientePF`),
  KEY `fk_idClientePJ_ClientePJ` (`Cliente_idClientePJ`),
  CONSTRAINT `fk_idClientePF_ClientePF` FOREIGN KEY (`Cliente_idClientePF`) REFERENCES `clientepf` (`idClientePF`),
  CONSTRAINT `fk_idClientePJ_ClientePJ` FOREIGN KEY (`Cliente_idClientePJ`) REFERENCES `clientepj` (`idClientePJ`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,NULL,'Emano@emmc.com.br','83987417417',NULL,'57025458','rua silva de prata','29',NULL,'Carangola','Cidade das flores','PB','Nordeste'),(2,2,NULL,'saulo@sdc.com.br','82965452154','8233554411','88047596','Rua Manoel Soares DAzevedo Maia','255',NULL,'Carianos','Maceió','AL','Nordeste'),(3,3,NULL,'jorge@jtg.com.br',NULL,'6838485483','69919817','Rua N2','2',NULL,'Conjunto Tucumã','Rio Branco','AC','Norte'),(4,4,NULL,'ryan.vilar@geradornv.com.br','71993683614','7133230670','41950690','Travessa Professora Nilzete','54',NULL,'Rio Vermelho','Salvador','BA','Nordeste');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientepf`
--

DROP TABLE IF EXISTS `clientepf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientepf` (
  `idClientePF` int NOT NULL AUTO_INCREMENT,
  `ClientePF_CPF` char(11) NOT NULL,
  `ClientePF_Nome` varchar(10) NOT NULL,
  `ClientePF_Sobrenome` varchar(25) NOT NULL,
  `ClientePF_DataNascimento` date NOT NULL,
  PRIMARY KEY (`idClientePF`),
  UNIQUE KEY `unique_CPF_ClientePF` (`ClientePF_CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepf`
--

LOCK TABLES `clientepf` WRITE;
/*!40000 ALTER TABLE `clientepf` DISABLE KEYS */;
INSERT INTO `clientepf` VALUES (1,'12346789421','Emanuel','M Carvalho','2002-07-05'),(2,'65487465254','Saulo','D Carvalho','2000-12-02'),(3,'12332125125','Jorge','T Galhardo','1997-05-13'),(4,'22664456504','Ryan','F Vilar','1973-03-24');
/*!40000 ALTER TABLE `clientepf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientepj`
--

DROP TABLE IF EXISTS `clientepj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientepj` (
  `idClientePJ` int NOT NULL AUTO_INCREMENT,
  `ClientePJ_CNPJ` char(15) NOT NULL,
  `ClientePJ_RazaoSocial` varchar(30) NOT NULL,
  `ClientePJ_NomeFantasia` varchar(30) NOT NULL,
  PRIMARY KEY (`idClientePJ`),
  UNIQUE KEY `unique_CNPJ_ClientePJ` (`ClientePJ_CNPJ`),
  UNIQUE KEY `unique_RazaoSocial_ClientePJ` (`ClientePJ_RazaoSocial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepj`
--

LOCK TABLES `clientepj` WRITE;
/*!40000 ALTER TABLE `clientepj` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientepj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `Estoque_Cidade` varchar(45) NOT NULL,
  `Estoque_UF` char(2) NOT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Maceió','AL'),(2,'João Pessoa','PB'),(3,'Belo Horizonte','MG'),(4,'Manaus','AM'),(5,'São Paulo','SP'),(6,'Brasília','DF');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoqueproduto`
--

DROP TABLE IF EXISTS `estoqueproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoqueproduto` (
  `Estoque_idEstoque` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `EstoqueProduto_Quantidade` int NOT NULL,
  PRIMARY KEY (`Estoque_idEstoque`,`Produto_idProduto`),
  KEY `fk_idEstoqueProduto_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_idEstoqueProduto_Estoque` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `estoque` (`idEstoque`),
  CONSTRAINT `fk_idEstoqueProduto_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoqueproduto`
--

LOCK TABLES `estoqueproduto` WRITE;
/*!40000 ALTER TABLE `estoqueproduto` DISABLE KEYS */;
INSERT INTO `estoqueproduto` VALUES (1,3,100),(1,4,30),(1,5,15),(2,6,60),(3,3,200),(3,5,45),(4,6,300),(5,1,400),(5,2,300),(6,6,200);
/*!40000 ALTER TABLE `estoqueproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `Fornecedor_CNPJ` char(14) NOT NULL,
  `Fornecedor_RazaoSocial` varchar(30) NOT NULL,
  `Fornecedor_NomeFantasia` varchar(30) NOT NULL,
  `Fornecedor_Email` varchar(30) NOT NULL,
  `Fornecedor_Celular` char(11) DEFAULT NULL,
  `Fornecedor_Telefone` char(10) DEFAULT NULL,
  `Fornecedor_CEP` char(8) NOT NULL,
  `Fornecedor_Logradouro` varchar(45) NOT NULL,
  `Fornecedor_Numero` varchar(5) DEFAULT NULL,
  `Fornecedor_Complemento` varchar(20) DEFAULT NULL,
  `Fornecedor_Bairro` varchar(15) NOT NULL,
  `Fornecedor_Municipio` varchar(30) NOT NULL,
  `Fornecedor_UF` char(2) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `unique_CNPJ_Fornecedor` (`Fornecedor_CNPJ`),
  UNIQUE KEY `unique_RazaoSocial_Fornecedor` (`Fornecedor_RazaoSocial`),
  UNIQUE KEY `unique_Email_Fornecedor` (`Fornecedor_Email`),
  UNIQUE KEY `unique_Celular_Fornecedor` (`Fornecedor_Celular`),
  UNIQUE KEY `unique_Telefone_Fornecedor` (`Fornecedor_Telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'12345678912345','Almeida e filhos','Marquinhos construções','marquinhos@marquinhos.com.br','77955442232','7733150121','57435214','Rua abcs','542',NULL,'desconhecidos','Salvador','BA'),(2,'85419649143457','Eletrônicos Silva','Flavinho do eletrônico','flavinho@flavio.com.br',NULL,'6133998424','47895324','Rua Trindade','578',NULL,'Asa Norte','Ceilândia','DF'),(3,'93456789934695','Eletrônicos Emanoshow','Emanuelsonzin eletro','emanuelson@sonzin.com.br','83955554433',NULL,'69852457','Rua Ketchup','2878',NULL,'Tambaú','João Pessoa','PB');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedorproduto`
--

DROP TABLE IF EXISTS `fornecedorproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedorproduto` (
  `Fornecedor_idFornecedor` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `FornecedorProduto_Quantidade` int NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`,`Produto_idProduto`),
  KEY `fk_idFornecedorProduto_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_idFornecedor_Fornecedor` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_idFornecedorProduto_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedorproduto`
--

LOCK TABLES `fornecedorproduto` WRITE;
/*!40000 ALTER TABLE `fornecedorproduto` DISABLE KEYS */;
INSERT INTO `fornecedorproduto` VALUES (1,3,1300),(1,4,1154),(1,5,980),(2,6,800),(3,1,1540),(3,2,1354);
/*!40000 ALTER TABLE `fornecedorproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `idPagamento` int NOT NULL AUTO_INCREMENT,
  `Cliente_idClientePF` int DEFAULT NULL,
  `Cliente_idClientePJ` int DEFAULT NULL,
  `Pedido_idPedido` int DEFAULT NULL,
  `Pagamento_TipoPagamento` enum('Cartão de crédito','Cartão de Débito','PIX','Boleto') NOT NULL,
  `Pagamento_CartaoNumero` char(12) DEFAULT NULL,
  `Pagamento_CartaoValidade` char(6) DEFAULT NULL,
  `Pagamento_CartaoCVV` char(3) DEFAULT NULL,
  `Pagamento_ValorTotal` float DEFAULT NULL,
  `Pagamento_Aprovado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idPagamento`),
  KEY `fk_idPedido_Pedido` (`Pedido_idPedido`),
  KEY `fk_ClienteidClientePF_ClientePF` (`Cliente_idClientePF`),
  KEY `fk_ClienteidClientePJ_ClientePJ` (`Cliente_idClientePJ`),
  CONSTRAINT `fk_ClienteidClientePF_ClientePF` FOREIGN KEY (`Cliente_idClientePF`) REFERENCES `clientepf` (`idClientePF`),
  CONSTRAINT `fk_ClienteidClientePJ_ClientePJ` FOREIGN KEY (`Cliente_idClientePJ`) REFERENCES `clientepj` (`idClientePJ`),
  CONSTRAINT `fk_idPedido_Pedido` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,NULL,1,'Cartão de crédito','123456789102','72027','666',322.99,1),(2,1,NULL,2,'Cartão de crédito','534456200102','42030','412',1299.99,1),(3,2,NULL,3,'PIX',NULL,NULL,NULL,10549,1),(4,3,NULL,4,'Cartão de Débito','942255021347','1229','987',4049.1,0),(5,3,NULL,5,'Cartão de Débito','942255021347','1229','987',3540,1),(6,4,NULL,6,'Boleto',NULL,NULL,NULL,2430.99,1);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` int DEFAULT NULL,
  `Pedido_Status` enum('Cancelado','Confirmado','Em processamento') NOT NULL DEFAULT 'Em processamento',
  `Pedido_Descricao` varchar(255) DEFAULT NULL,
  `Pedido_CodRastreamento` char(6) DEFAULT NULL,
  `Pedido_ValorFrete` float DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  UNIQUE KEY `unique_CodRastreamento_Pedido` (`Pedido_CodRastreamento`),
  KEY `fk_idCliente_Cliente` (`Cliente_idCliente`),
  CONSTRAINT `fk_idCliente_Cliente` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'Em processamento','Compra via App','25648',150),(2,1,'Confirmado','Compra via Web Site','54845',100),(3,2,'Em processamento','Compra via App','54421',50),(4,3,'Cancelado','Com via Web Site',NULL,NULL),(5,3,'Em processamento','Compra via Web Site','54231',40),(6,4,'Confirmado','Compra via App','89541',120);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoproduto`
--

DROP TABLE IF EXISTS `pedidoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidoproduto` (
  `Pedido_idPedido` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `PedidoProduto_Quantidade` int NOT NULL,
  `PedidoProduto_Status` enum('Disponível','Sem estoque') NOT NULL DEFAULT 'Disponível',
  `PedidoProduto_DataPedido` date NOT NULL,
  PRIMARY KEY (`Pedido_idPedido`,`Produto_idProduto`),
  KEY `fk_idPedidoProduto_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_idPedidoProduto_Pedido` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_idPedidoProduto_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoproduto`
--

LOCK TABLES `pedidoproduto` WRITE;
/*!40000 ALTER TABLE `pedidoproduto` DISABLE KEYS */;
INSERT INTO `pedidoproduto` VALUES (1,3,2,'Disponível','2023-01-23'),(2,5,1,'Disponível','2023-01-17'),(3,2,1,'Disponível','2023-03-01'),(4,6,1,'Sem estoque','2023-04-14'),(5,1,1,'Disponível','2023-04-20'),(6,4,2,'Disponível','2023-04-24');
/*!40000 ALTER TABLE `pedidoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `Produto_Nome` varchar(45) NOT NULL,
  `Produto_Categoria` enum('Notebook','Desktop','Memória','Placa de Vídeo','Placa mãe') NOT NULL,
  `Produto_Descricao` varchar(255) DEFAULT NULL,
  `Produto_Marca` varchar(20) NOT NULL,
  `Produto_Modelo` varchar(40) NOT NULL,
  `Produto_Avaliacao` float DEFAULT NULL,
  `Produto_Valor` float NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Notebook Dell Vostro 3510','Notebook','11ª geração Intel® Core™ i5-1135G7 (4-core, cache de 8MB, até 4.2GHz)','Dell','Vostro 3510',4.8,3500),(2,'Desktop Dell XPS 8950','Desktop','12ª geração Intel® Core™ i7-12700 - NVIDIA® GeForce RTX™ 3060 12GB GDDR6 - Memória de 16GB DDR5 SSD de 256GB PCIe NVMe M.2 + HD de 1TB (7200RPM)','Dell','XPS 8950',5,10449),(3,'Memória Kingston Fury Beast','Memória','Memória Kingston Fury Beast, 8GB, 3200MHz, DDR4, CL16, Preto - KF432C16BB/8','Kingston','Fury Beast',4.9,172.99),(4,'PNY NVIDIA Geforce RTX 3060','Placa de Vídeo','Placa de Video PNY NVIDIA Geforce RTX 3060, 12 GB GDDR6, DLSS, Ray Tracing - VCG306012DFBPB1','PNY','RTX 3060',4,2310.99),(5,'Asus TUF Gaming','Placa mãe','Placa Mãe Asus TUF Gaming B660M-PLUS D4, Intel LGA 1700, mATX, DDR4, RGB','Asus','B660M-PLUS D4',5,1199.99),(6,'Notebook ASUS VivoBook X513EA','Notebook','Intel® Core™ i5 - 11ª Geração - Intel® Iris® Xe - 16GB - 256GB SSD','Asus','X513EA-BQ3400W',4.7,4049.1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `idVendedor` int NOT NULL AUTO_INCREMENT,
  `Vendedor_CNPJ` char(14) NOT NULL,
  `Vendedor_RazaoSocial` varchar(30) NOT NULL,
  `Vendedor_NomeFantasia` varchar(30) NOT NULL,
  `Vendedor_Email` varchar(30) NOT NULL,
  `Vendedor_Celular` char(11) DEFAULT NULL,
  `Vendedor_Telefone` char(10) DEFAULT NULL,
  `Vendedor_CEP` char(8) NOT NULL,
  `Vendedor_Logradouro` varchar(45) NOT NULL,
  `Vendedor_Numero` varchar(5) DEFAULT NULL,
  `Vendedor_Complemento` varchar(20) DEFAULT NULL,
  `Vendedor_Bairro` varchar(15) NOT NULL,
  `Vendedor_Municipio` varchar(30) NOT NULL,
  `Vendedor_UF` char(2) NOT NULL,
  PRIMARY KEY (`idVendedor`),
  UNIQUE KEY `unique_CNPJ_Vendedor` (`Vendedor_CNPJ`),
  UNIQUE KEY `unique_RazaoSocial_Vendedor` (`Vendedor_RazaoSocial`),
  UNIQUE KEY `unique_Email_Vendedor` (`Vendedor_Email`),
  UNIQUE KEY `unique_Celular_Vendedor` (`Vendedor_Celular`),
  UNIQUE KEY `unique_Telefone_Vendedor` (`Vendedor_Telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'23456789456321','Tech eletronics','Technology','tech@tech.com.br','21988547414',NULL,'12354684','Rua Rio blue','5487',NULL,'Tambaú','João Pessoa','PB'),(2,'12345678374541','Botique Durgas','Durgas','durgas@durgas.com.br',NULL,'3855446622','98754214','Rua Minas','74',NULL,'Jaboatão','Belo Horizonte','MG'),(3,'45678912365448','Kids World','KW','kw@kidsworld.com.br','11988552288','1166554477','77798542','Rua da Liberdade','777',NULL,'Liberdade','São Paulo','SP'),(4,'13167385000128','Camille & Moraes Tecnologia','CMT','camille.moraes@cmoraes.com.br','82998552142',NULL,'57040509','5ª Travessa Santo Antonio','25',NULL,'Jatiúca','Maceió','AL'),(5,'47271766000174','Regufe Tech','Regufe ','brunna@regufe.com.br',NULL,'9235650744','69036070','Beco Lobo Soropita','823',NULL,'Compensa','Manaus','AM');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedorproduto`
--

DROP TABLE IF EXISTS `vendedorproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedorproduto` (
  `Vendedor_idVendedor` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  `VendendorProduto_Quantidade` int NOT NULL,
  PRIMARY KEY (`Vendedor_idVendedor`,`Produto_idProduto`),
  KEY `fk_idProduto_Produto` (`Produto_idProduto`),
  CONSTRAINT `fk_idProduto_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `fk_idVendedor_Vendedor` FOREIGN KEY (`Vendedor_idVendedor`) REFERENCES `vendedor` (`idVendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedorproduto`
--

LOCK TABLES `vendedorproduto` WRITE;
/*!40000 ALTER TABLE `vendedorproduto` DISABLE KEYS */;
INSERT INTO `vendedorproduto` VALUES (1,1,3),(1,2,1),(1,3,8),(1,4,12),(1,5,7),(1,6,5),(2,1,10),(2,2,7),(2,3,25),(2,4,14),(2,5,11),(2,6,5),(3,1,30),(3,2,35),(3,3,40),(3,4,50),(3,5,15),(3,6,22),(4,1,15),(4,2,12),(4,3,30),(4,4,8),(4,5,3),(4,6,0),(5,1,0),(5,2,0),(5,3,15),(5,4,8),(5,5,4),(5,6,30);
/*!40000 ALTER TABLE `vendedorproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce_refinado'
--

--
-- Dumping routines for database 'ecommerce_refinado'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 16:44:27
