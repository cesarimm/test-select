-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2023 a las 03:30:12
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fortest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `idCategory` int(11) NOT NULL,
  `categoryName` varchar(264) COLLATE utf8_bin NOT NULL,
  `idCategoryRelated` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`idCategory`, `categoryName`, `idCategoryRelated`) VALUES
(7, 'Categoría 1', NULL),
(8, 'Categoría 2', NULL),
(9, 'Categoría 3', NULL),
(10, 'Categoría 1.1', 7),
(11, 'Categoría 1.2', 7),
(12, 'Categoría 1.3', 7),
(13, 'Categoría 1.4', 7),
(14, 'Categoría 2.1', 8),
(16, 'Categoría 2.1.1', 14),
(17, 'Categoría 2.1.2', 14),
(18, 'Categoría 1.2.1', 11),
(19, 'Categoría 3.1', 9),
(20, 'Categoría 3.1.1', 19),
(21, 'Categoría 3.1.1.1', 20),
(22, 'Categoría 3.1.1.1.1', 21);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idCategory`),
  ADD KEY `FK_idCategoryRelated` (`idCategoryRelated`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_idCategoryRelated` FOREIGN KEY (`idCategoryRelated`) REFERENCES `categories` (`idCategory`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
