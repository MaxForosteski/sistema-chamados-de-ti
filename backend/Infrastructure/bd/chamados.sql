-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/11/2023 às 15:58
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `chamados`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `calls`
--

CREATE TABLE `calls` (
  `idCall` int(11) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `PriorityId` int(11) NOT NULL,
  `StatusId` int(11) NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `UpdatedBy` int(11) DEFAULT NULL,
  `CreatedAt` date NOT NULL,
  `UpdatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `departments`
--

CREATE TABLE `departments` (
  `idDepartment` int(11) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `UpdatedBy` int(11) DEFAULT NULL,
  `CreatedAt` date NOT NULL,
  `UpdatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `priority`
--

CREATE TABLE `priority` (
  `idPriority` int(11) NOT NULL,
  `Name` varchar(120) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `CreatedBy` int(11) NOT NULL,
  `UpdatedBy` int(11) DEFAULT NULL,
  `CreatedAt` date NOT NULL,
  `UpdatedAt` date DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `status`
--

CREATE TABLE `status` (
  `idStatus` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `CreatedBy` int(11) NOT NULL,
  `UpdatedBy` int(11) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `CreatedAt` date NOT NULL,
  `UpdatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `DepartmentId` int(11) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `CreatedAt` date NOT NULL,
  `UpdatedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `calls`
--
ALTER TABLE `calls`
  ADD PRIMARY KEY (`idCall`),
  ADD KEY `DepartmentId` (`DepartmentId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `CreatedBy` (`CreatedBy`),
  ADD KEY `UpdatedBy` (`UpdatedBy`),
  ADD KEY `PriorityId` (`PriorityId`),
  ADD KEY `StatusId` (`StatusId`);

--
-- Índices de tabela `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`idDepartment`),
  ADD KEY `CreatedBy` (`CreatedBy`),
  ADD KEY `UpdatedBy` (`UpdatedBy`);

--
-- Índices de tabela `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`idPriority`),
  ADD KEY `CreatedBy` (`CreatedBy`),
  ADD KEY `UpdatedBy` (`UpdatedBy`);

--
-- Índices de tabela `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`idStatus`),
  ADD KEY `CreatedBy` (`CreatedBy`),
  ADD KEY `UpdatedBy` (`UpdatedBy`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `DepartmentId` (`DepartmentId`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `calls`
--
ALTER TABLE `calls`
  MODIFY `idCall` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `departments`
--
ALTER TABLE `departments`
  MODIFY `idDepartment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `priority`
--
ALTER TABLE `priority`
  MODIFY `idPriority` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `status`
--
ALTER TABLE `status`
  MODIFY `idStatus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `calls`
--
ALTER TABLE `calls`
  ADD CONSTRAINT `calls_ibfk_1` FOREIGN KEY (`DepartmentId`) REFERENCES `departments` (`idDepartment`),
  ADD CONSTRAINT `calls_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `calls_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `calls_ibfk_4` FOREIGN KEY (`UpdatedBy`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `calls_ibfk_5` FOREIGN KEY (`PriorityId`) REFERENCES `priority` (`idPriority`),
  ADD CONSTRAINT `calls_ibfk_6` FOREIGN KEY (`StatusId`) REFERENCES `status` (`idStatus`);

--
-- Restrições para tabelas `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `departments_ibfk_2` FOREIGN KEY (`UpdatedBy`) REFERENCES `users` (`idUser`);

--
-- Restrições para tabelas `priority`
--
ALTER TABLE `priority`
  ADD CONSTRAINT `priority_ibfk_1` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `priority_ibfk_2` FOREIGN KEY (`UpdatedBy`) REFERENCES `users` (`idUser`);

--
-- Restrições para tabelas `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `status_ibfk_2` FOREIGN KEY (`UpdatedBy`) REFERENCES `users` (`idUser`);

--
-- Restrições para tabelas `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`DepartmentId`) REFERENCES `departments` (`idDepartment`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
