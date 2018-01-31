-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 16, 2018 at 07:12 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `powersales`
--

-- --------------------------------------------------------

--
-- Table structure for table `contactos`
--

CREATE TABLE `contactos` (
  `idContacto` int(11) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellido1` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `apellido2` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cp` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contactos`
--

INSERT INTO `contactos` (`idContacto`, `nombre`, `apellido1`, `apellido2`, `telefono`, `cp`, `email`) VALUES
(1, 'Luis', 'Lopez', 'Blanco', '678091145', '28922', 'luislopez@powersales.com'),
(2, 'Francisco', 'Hernández', 'Rodriguez', '918887755', '28005', 'hernandezfco@gmail.com'),
(3, 'Álvaro', 'Mollá', 'Torró', '969998877', '46008', 'mollatorro@gmail.com'),
(4, 'Isabel', 'Canchón', 'Martín', '935558895', '08001', 'isacm@gmail.com'),
(5, 'Sara', 'Lopez', 'Molla', '912645638', '28922', 'sara@gmail.com'),
(6, 'Vicente', 'Ventura', 'Pacheca', '607253505', '28001', 'ventpache@ono.es');

-- --------------------------------------------------------

--
-- Table structure for table `ofertas`
--

CREATE TABLE `ofertas` (
  `idOferta` int(11) NOT NULL,
  `contactoId` int(11) NOT NULL,
  `vehiculoId` int(11) NOT NULL,
  `precioFinal` int(11) NOT NULL,
  `comentario` text CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ofertas`
--

INSERT INTO `ofertas` (`idOferta`, `contactoId`, `vehiculoId`, `precioFinal`, `comentario`, `fecha`) VALUES
(21, 1, 2, 9000, 'Comentarios', '2018-01-12');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `user` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `user`, `pass`) VALUES
(1, 'luislopez@powersales.com', '4321');

-- --------------------------------------------------------

--
-- Table structure for table `vehiculos`
--

CREATE TABLE `vehiculos` (
  `idVehiculo` int(11) NOT NULL,
  `matricula` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `version` varchar(45) NOT NULL,
  `motor` varchar(45) NOT NULL,
  `potencia` varchar(45) NOT NULL,
  `combustible` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `fechamatricula` date NOT NULL,
  `kilometraje` varchar(45) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehiculos`
--

INSERT INTO `vehiculos` (`idVehiculo`, `matricula`, `marca`, `modelo`, `version`, `motor`, `potencia`, `combustible`, `color`, `fechamatricula`, `kilometraje`, `precio`) VALUES
(1, '5315HYR', 'KIA', 'CARENS', 'DRIVE', '1.7 CRDI', '115', 'DIESEL', 'BLANCO', '2014-07-30', '53000', 13200),
(2, '0975GNP', 'RENAULT', 'MEGANE', 'DYNAMIQUE', '1.5DCI', '105', 'DIESEL', 'AZUL', '2009-01-15', '130000', 6500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`idContacto`);

--
-- Indexes for table `ofertas`
--
ALTER TABLE `ofertas`
  ADD PRIMARY KEY (`idOferta`),
  ADD UNIQUE KEY `contactoId` (`contactoId`),
  ADD UNIQUE KEY `vehiculoId` (`vehiculoId`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `user_UNIQUE` (`user`);

--
-- Indexes for table `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`idVehiculo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contactos`
--
ALTER TABLE `contactos`
  MODIFY `idContacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ofertas`
--
ALTER TABLE `ofertas`
  MODIFY `idOferta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `idVehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ofertas`
--
ALTER TABLE `ofertas`
  ADD CONSTRAINT `oferta-contacto` FOREIGN KEY (`contactoId`) REFERENCES `contactos` (`idContacto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `oferta-vehiculo` FOREIGN KEY (`vehiculoId`) REFERENCES `vehiculos` (`idVehiculo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
