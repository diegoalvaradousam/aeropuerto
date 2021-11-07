-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2021 a las 03:14:37
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vuelos`
--
CREATE DATABASE IF NOT EXISTS `vuelos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vuelos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeropuerto`
--

CREATE TABLE `aeropuerto` (
  `Cod_aeropuerto` int(11) NOT NULL,
  `nombre_aeropuerto` varchar(150) NOT NULL,
  `localidad` varchar(150) NOT NULL,
  `pais` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aviones`
--

CREATE TABLE `aviones` (
  `Cod_avion` int(11) NOT NULL,
  `num_plazas` int(11) DEFAULT NULL,
  `Cod_aeropuerto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `DNI` int(11) NOT NULL,
  `tarjeta_embarque` int(10) UNSIGNED ZEROFILL NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(150) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` int(11) NOT NULL,
  `tarjeta_credito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `embarque`
--

CREATE TABLE `embarque` (
  `tarjeta_embarque` int(10) UNSIGNED ZEROFILL NOT NULL,
  `asiento` int(11) DEFAULT NULL,
  `columna` varchar(3) DEFAULT NULL,
  `planta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_vuelo`
--

CREATE TABLE `reserva_vuelo` (
  `Cod_reserva` int(11) NOT NULL,
  `fecha_salida` date DEFAULT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `aeropuerto_salida` int(11) DEFAULT NULL,
  `aeropuerto_llegada` int(11) DEFAULT NULL,
  `DNI_cliente` int(11) DEFAULT NULL,
  `cod_avion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aeropuerto`
--
ALTER TABLE `aeropuerto`
  ADD PRIMARY KEY (`Cod_aeropuerto`);

--
-- Indices de la tabla `aviones`
--
ALTER TABLE `aviones`
  ADD PRIMARY KEY (`Cod_avion`),
  ADD KEY `Cod_aeropuerto` (`Cod_aeropuerto`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`DNI`),
  ADD KEY `tarjeta_embarque` (`tarjeta_embarque`);

--
-- Indices de la tabla `embarque`
--
ALTER TABLE `embarque`
  ADD PRIMARY KEY (`tarjeta_embarque`);

--
-- Indices de la tabla `reserva_vuelo`
--
ALTER TABLE `reserva_vuelo`
  ADD PRIMARY KEY (`Cod_reserva`),
  ADD KEY `aeropuerto_salida` (`aeropuerto_salida`),
  ADD KEY `aeropuerto_llegada` (`aeropuerto_llegada`),
  ADD KEY `DNI_cliente` (`DNI_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `embarque`
--
ALTER TABLE `embarque`
  MODIFY `tarjeta_embarque` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aviones`
--
ALTER TABLE `aviones`
  ADD CONSTRAINT `aviones_ibfk_1` FOREIGN KEY (`Cod_aeropuerto`) REFERENCES `aeropuerto` (`Cod_aeropuerto`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`tarjeta_embarque`) REFERENCES `embarque` (`tarjeta_embarque`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reserva_vuelo`
--
ALTER TABLE `reserva_vuelo`
  ADD CONSTRAINT `reserva_vuelo_ibfk_1` FOREIGN KEY (`aeropuerto_salida`) REFERENCES `aeropuerto` (`Cod_aeropuerto`),
  ADD CONSTRAINT `reserva_vuelo_ibfk_2` FOREIGN KEY (`aeropuerto_llegada`) REFERENCES `aeropuerto` (`Cod_aeropuerto`),
  ADD CONSTRAINT `reserva_vuelo_ibfk_3` FOREIGN KEY (`DNI_cliente`) REFERENCES `clientes` (`DNI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
