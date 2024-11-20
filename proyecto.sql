-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2024 at 11:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyecto`
--

-- --------------------------------------------------------

--
-- Table structure for table `ganador`
--

CREATE TABLE `ganador` (
  `ID_Ganador` int(11) NOT NULL,
  `ID_Particippante` int(11) DEFAULT NULL,
  `ID_Sorteo` int(11) DEFAULT NULL,
  `Fecha_Anuncio_Ganador` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ganador`
--

INSERT INTO `ganador` (`ID_Ganador`, `ID_Particippante`, `ID_Sorteo`, `Fecha_Anuncio_Ganador`) VALUES
(1, 1, 12, '2024-11-10');

-- --------------------------------------------------------

--
-- Table structure for table `organizacion`
--

CREATE TABLE `organizacion` (
  `ID_Organización` int(11) NOT NULL,
  `Nombre_Organización` varchar(255) DEFAULT NULL,
  `Número_Contacto` varchar(20) DEFAULT NULL,
  `Dirección` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizacion`
--

INSERT INTO `organizacion` (`ID_Organización`, `Nombre_Organización`, `Número_Contacto`, `Dirección`) VALUES
(1, 'Organizacion santa maria', '1234512335', 'Esquina santa maria');

-- --------------------------------------------------------

--
-- Table structure for table `participante`
--

CREATE TABLE `participante` (
  `ID_Particippante` int(11) NOT NULL,
  `Cédula_Identidad` int(11) DEFAULT NULL,
  `Nombre_Completo` varchar(255) DEFAULT NULL,
  `Correo_Electrónico` varchar(255) DEFAULT NULL,
  `Celular` int(11) DEFAULT NULL,
  `Fecha_Inscripción` date DEFAULT NULL,
  `ID_Sorteo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participante`
--

INSERT INTO `participante` (`ID_Particippante`, `Cédula_Identidad`, `Nombre_Completo`, `Correo_Electrónico`, `Celular`, `Fecha_Inscripción`, `ID_Sorteo`) VALUES
(1, 53134315, 'JUAN CARLOZ VODOQUE GONZALEZ', 'JUAN.VODOQUE@hotmail.com', 948574321, '2024-09-10', 12),
(2, 53134313, 'JORGE PEREZ RODRIGUEZ GONZALEZ', 'JORGE.GONZALEZ@GMAIL.COM', 948573452, '2024-09-11', 12),
(3, 53134314, 'RODRIGUEZ MARTIN VAZQUEZ PEREIRA', 'RODRI.VAZ@gmail.com', 948574323, '2024-09-09', 12),
(4, 53134311, 'PABLO VICTOR GARCIA MARTINEZ', 'Pablo.Martin@gmail.com', 948574303, '2024-09-09', 12);

-- --------------------------------------------------------

--
-- Table structure for table `premio`
--

CREATE TABLE `premio` (
  `ID_Premio` int(11) NOT NULL,
  `Nombre_Premio` varchar(255) DEFAULT NULL,
  `Valor_Monetario` decimal(10,2) DEFAULT NULL,
  `ID_Organización` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `premio`
--

INSERT INTO `premio` (`ID_Premio`, `Nombre_Premio`, `Valor_Monetario`, `ID_Organización`) VALUES
(1, 'KIT ELECTRONICO', 193.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sorteo`
--

CREATE TABLE `sorteo` (
  `ID_Sorteo` int(11) NOT NULL,
  `Fecha_Sorteo` date DEFAULT NULL,
  `ID_Organización` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sorteo`
--

INSERT INTO `sorteo` (`ID_Sorteo`, `Fecha_Sorteo`, `ID_Organización`) VALUES
(12, '2024-11-10', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ganador`
--
ALTER TABLE `ganador`
  ADD PRIMARY KEY (`ID_Ganador`),
  ADD KEY `ID_Particippante` (`ID_Particippante`),
  ADD KEY `ID_Sorteo` (`ID_Sorteo`);

--
-- Indexes for table `organizacion`
--
ALTER TABLE `organizacion`
  ADD PRIMARY KEY (`ID_Organización`);

--
-- Indexes for table `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`ID_Particippante`),
  ADD KEY `ID_Sorteo` (`ID_Sorteo`);

--
-- Indexes for table `premio`
--
ALTER TABLE `premio`
  ADD PRIMARY KEY (`ID_Premio`),
  ADD KEY `ID_Organización` (`ID_Organización`);

--
-- Indexes for table `sorteo`
--
ALTER TABLE `sorteo`
  ADD PRIMARY KEY (`ID_Sorteo`),
  ADD KEY `ID_Organización` (`ID_Organización`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ganador`
--
ALTER TABLE `ganador`
  ADD CONSTRAINT `ganador_ibfk_1` FOREIGN KEY (`ID_Particippante`) REFERENCES `participante` (`ID_Particippante`),
  ADD CONSTRAINT `ganador_ibfk_2` FOREIGN KEY (`ID_Sorteo`) REFERENCES `sorteo` (`ID_Sorteo`);

--
-- Constraints for table `participante`
--
ALTER TABLE `participante`
  ADD CONSTRAINT `participante_ibfk_1` FOREIGN KEY (`ID_Sorteo`) REFERENCES `sorteo` (`ID_Sorteo`);

--
-- Constraints for table `premio`
--
ALTER TABLE `premio`
  ADD CONSTRAINT `premio_ibfk_1` FOREIGN KEY (`ID_Organización`) REFERENCES `organizacion` (`ID_Organización`);

--
-- Constraints for table `sorteo`
--
ALTER TABLE `sorteo`
  ADD CONSTRAINT `sorteo_ibfk_1` FOREIGN KEY (`ID_Organización`) REFERENCES `organizacion` (`ID_Organización`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
