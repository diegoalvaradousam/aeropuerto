-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2021 a las 02:01:37
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

--
-- Volcado de datos para la tabla `aeropuerto`
--

INSERT INTO `aeropuerto` (`Cod_aeropuerto`, `nombre_aeropuerto`, `localidad`, `pais`) VALUES
(1, '5555', '5555', '5555'),
(2, '55', '55', '55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aviones`
--

CREATE TABLE `aviones` (
  `Cod_avion` int(11) NOT NULL,
  `num_plazas` int(11) DEFAULT NULL,
  `Cod_aeropuerto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aviones`
--

INSERT INTO `aviones` (`Cod_avion`, `num_plazas`, `Cod_aeropuerto`) VALUES
(1, 7, 2),
(2, 7, 1);

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
  `telefono` varchar(15) NOT NULL,
  `tarjeta_credito` varchar(20) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`DNI`, `tarjeta_embarque`, `nombre`, `apellido`, `direccion`, `telefono`, `tarjeta_credito`, `usuario`, `clave`) VALUES
(1, 0000000002, 'hfghfgh', 'fghfghfgh', 'fghfghfg', '64', '456456', '', ''),
(2, 0000000001, 'tyrtyy', 'ytrtr', 'rrrr', '4564', '4', '', '');

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

--
-- Volcado de datos para la tabla `embarque`
--

INSERT INTO `embarque` (`tarjeta_embarque`, `asiento`, `columna`, `planta`) VALUES
(0000000001, 55, '55', 55),
(0000000002, 44, '44', 44),
(0000000003, 22, '3e', 1);

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
-- Volcado de datos para la tabla `reserva_vuelo`
--

INSERT INTO `reserva_vuelo` (`Cod_reserva`, `fecha_salida`, `fecha_llegada`, `aeropuerto_salida`, `aeropuerto_llegada`, `DNI_cliente`, `cod_avion`) VALUES
(1, '2021-10-08', '2021-10-23', 1, 2, 1, 1),
(2, '2021-10-13', '2021-10-16', 1, 2, 2, 2);

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
  ADD KEY `cod_avion` (`cod_avion`),
  ADD KEY `DNI_cliente` (`DNI_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aeropuerto`
--
ALTER TABLE `aeropuerto`
  MODIFY `Cod_aeropuerto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `aviones`
--
ALTER TABLE `aviones`
  MODIFY `Cod_avion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `DNI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `embarque`
--
ALTER TABLE `embarque`
  MODIFY `tarjeta_embarque` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reserva_vuelo`
--
ALTER TABLE `reserva_vuelo`
  MODIFY `Cod_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `reserva_vuelo_ibfk_3` FOREIGN KEY (`cod_avion`) REFERENCES `aviones` (`Cod_avion`),
  ADD CONSTRAINT `reserva_vuelo_ibfk_4` FOREIGN KEY (`DNI_cliente`) REFERENCES `clientes` (`DNI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
