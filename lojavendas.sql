-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/11/2024 às 11:46
-- Versão do servidor: 8.0.33
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lojavendas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `detalhes_encomenda`
--

CREATE TABLE `detalhes_encomenda` (
  `id` int NOT NULL,
  `encomenda_id` int NOT NULL,
  `produto_nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `detalhes_encomenda`
--

INSERT INTO `detalhes_encomenda` (`id`, `encomenda_id`, `produto_nome`, `quantidade`, `preco_unitario`) VALUES
(1, 30, 'Escrivaninha', 2, 300.00),
(2, 31, 'Cadeira de Madeira', 1, 150.00),
(3, 31, 'Banco de Jardim', 1, 120.00),
(4, 32, 'Escrivaninha', 2, 300.00),
(5, 33, 'Banco de Jardim', 2, 120.00),
(6, 34, 'Mesa de Cabiceira', 2, 600.00),
(7, 35, 'Mesa de Cabiceira', 2, 600.00),
(8, 36, 'Porta de Madeira', 1, 1000.00),
(9, 37, 'Porta de Madeira', 1, 1000.00),
(10, 38, 'Porta de Madeira', 1, 1000.00),
(11, 39, 'Porta de Madeira', 18, 1000.00),
(12, 40, 'Mesa de Cabiceira', 1, 600.00),
(13, 41, 'Mesa de Cabiceira', 1, 600.00),
(14, 42, 'Vanilla Vodka', 1, 54.79),
(15, 43, 'Vanilla Vodka', 1, 54.79);

-- --------------------------------------------------------

--
-- Estrutura para tabela `encomendas`
--

CREATE TABLE `encomendas` (
  `id` int NOT NULL,
  `nome_cliente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `morada` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `produtos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantidade_total` int NOT NULL,
  `preco_total` decimal(10,2) NOT NULL,
  `data_encomenda` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `encomendas`
--

INSERT INTO `encomendas` (`id`, `nome_cliente`, `data_nascimento`, `morada`, `produtos`, `quantidade_total`, `preco_total`, `data_encomenda`) VALUES
(42, 'Matheus', '1994-02-01', 'Rua 3, Porto, Portugal', '[\"Vanilla Vodka (x1)\"]', 1, 54.00, '2024-11-30 00:06:02'),
(43, 'Matheus', '1994-02-01', 'Rua 3, Porto, Portugal', '[\"Vanilla Vodka (x1)\"]', 1, 54.00, '2024-11-30 00:11:24');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int NOT NULL,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantidade` int NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `quantidade`, `preco`) VALUES
(1, 'Absolut Vodka', 44, 35.00),
(2, 'Absinto', 0, 200.00),
(3, 'Absolut Frutas', 15, 38.98),
(4, 'Ballantines', 27, 43.59),
(5, 'Black Label', 10, 33.99),
(6, 'Blue Label', 13, 57.32),
(7, 'Bombay Gin', 79, 23.87),
(8, 'Cachaça 51', 5, 17.23),
(10, 'Chandon Extra Brut', 66, 66.03),
(11, 'Chandon Moet Rose', 32, 71.45),
(12, 'Coca Cola', 102, 2.15),
(13, 'Coca Cola Zero', 115, 2.01),
(14, 'Corote', 1001, 2.15),
(15, 'Fanta Laranja', 70, 1.97),
(16, 'Gin Tanqueray', 44, 17.49),
(17, 'Gold Label', 22, 54.99),
(18, 'Guarana', 108, 2.35),
(19, 'Jack Daniels', 55, 23.55),
(20, 'London Gin', 29, 12.51),
(21, 'Pack Corona', 200, 10.11),
(22, 'Pack Heineken', 200, 9.99),
(23, 'Pack Super Bock', 200, 8.47),
(24, 'Vinho Periquita', 98, 2.99),
(25, 'Smirnoff ', 73, 15.55),
(26, 'Vanilla Vodka', 31, 54.79),
(27, 'Vinho do Porto', 148, 12.99),
(28, 'Pack Stella Artois', 200, 13.77);

-- --------------------------------------------------------

--
-- Estrutura para tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `id` int NOT NULL,
  `nome_usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `senha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `utilizadores`
--

INSERT INTO `utilizadores` (`id`, `nome_usuario`, `senha`) VALUES
(1, 'admin', '1234');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `detalhes_encomenda`
--
ALTER TABLE `detalhes_encomenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `encomenda_id` (`encomenda_id`);

--
-- Índices de tabela `encomendas`
--
ALTER TABLE `encomendas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome_utilizador` (`nome_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `detalhes_encomenda`
--
ALTER TABLE `detalhes_encomenda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `encomendas`
--
ALTER TABLE `encomendas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
