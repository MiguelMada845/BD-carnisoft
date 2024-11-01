-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-11-2024 a las 18:02:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carnisoft`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad_comprada` int(11) NOT NULL,
  `fecha_compra` date DEFAULT NULL,
  `precio_compra` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `id_proveedor`, `id_producto`, `cantidad_comprada`, `fecha_compra`, `precio_compra`) VALUES
(1, 100, 21, 8, '2024-10-30', 45.00),
(2, 101, 25, 9, '2024-10-16', 35.00),
(3, 101, 26, 5, '2024-10-01', 45.75),
(4, 102, 30, 12, '2024-10-02', 80.00),
(40, 100, 20, 5, '2024-10-29', 50.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialmovimientos`
--

CREATE TABLE `historialmovimientos` (
  `id_movimiento` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `tipo_movimiento` enum('Entrada','Salida') NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historialmovimientos`
--

INSERT INTO `historialmovimientos` (`id_movimiento`, `id_producto`, `cantidad`, `tipo_movimiento`, `fecha`) VALUES
(1, 21, 8, 'Entrada', '2024-10-30'),
(2, 30, 12, 'Entrada', '2024-10-15'),
(3, 30, 7, 'Salida', '2024-11-01'),
(4, 25, 8, 'Entrada', '2024-11-01'),
(60, 20, 5, 'Entrada', '2024-10-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `cantidad`, `precio`, `fecha_ingreso`, `id_proveedor`) VALUES
(20, 'lomo', 'carne tierna y magra, ideal para filetes y medallones', 50, 10.00, '2024-09-04', 100),
(21, 'costilla', 'Carne con hueso y grasa, ideal para asados ​​y parrilladas', 20, 7.00, '2024-09-10', 101),
(22, 'Entrecocet', 'Corte con un equilibrio entre grasa y carne, excelente para parrilla', 15, 9.50, '2024-09-12', 100),
(23, 'Aguja', 'Carne jugosa y fibrosa, perfecta para guisos o estofados', 9, 8.70, '2024-10-01', 102),
(24, 'Cuadril', 'Corte magro con algo de grasa, ideal para asados', 22, 12.50, '2024-09-19', 103),
(25, 'Costilla de cerdo', 'Carne suave y jugosa con hueso, ideal para barbacoas', 15, 22.00, '2024-09-24', 103),
(26, 'Lomo de cerdo', 'Corte magro y tierno, perfecto para hornear o freír', 12, 14.00, '2024-09-16', 103),
(27, 'Panceta', 'Parte grasa del cerdo, popular para tocineta o panceta asada', 5, 9.00, '2024-10-03', 101),
(28, 'Pata de cerdo', 'Carne jugosa, ideal para asar o cocinar en estofados', 20, 7.50, '2024-09-21', 100),
(29, 'Paleta de cerdo', 'Corte jugoso y versátil, excelente para asados', 8, 11.00, '2024-09-16', 102),
(30, 'Pechuga', 'Carne magra y sin hueso, ideal para filetes y recetas bajas en grasa', 50, 8.00, '2024-10-01', 103),
(31, 'Muslo', 'Carne jugosa y suave, con hueso, excelente para asar o guisar', 30, 5.00, '2024-09-07', 103),
(32, 'Ala', 'Carne con hueso, ideal para freír o asar, popular en barbacoas', 50, 8.00, '2024-09-17', 102),
(33, 'Pernil', 'Parte baja del muslo, carne tierna y jugosa, ideal para asados', 50, 8.00, '2024-10-02', 101),
(34, 'Filete de pollo', 'Corte magro de la pechuga, perfecto para cocinar rápido', 15, 12.00, '2024-10-03', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `contacto`, `direccion`) VALUES
(100, 'carlos gomez', '3134567659', 'calle 40-sur'),
(101, 'sandra restrepo', '3224356759', 'av.0 #12-07'),
(102, 'Walter Mercado', '3124908769', 'Tv.48-Los Patios'),
(103, 'Dani Carvajal', '3028759305', 'Barrio Comuneros #23-6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `rol` enum('Administrador','Empleado') DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `rol`, `username`, `password`) VALUES
(2, 'miguel', 'Empleado', 'miguel845', 'yeisor845'),
(3, 'Dani', 'Empleado', 'Danicar', 'Dani1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `historialmovimientos`
--
ALTER TABLE `historialmovimientos`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `historialmovimientos`
--
ALTER TABLE `historialmovimientos`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `historialmovimientos`
--
ALTER TABLE `historialmovimientos`
  ADD CONSTRAINT `historialmovimientos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
