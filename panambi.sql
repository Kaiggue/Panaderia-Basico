-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2021 a las 03:42:35
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `panambi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_local`
--

CREATE TABLE `cliente_local` (
  `codcliente` int(30) NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `dirección` varchar(25) COLLATE utf8mb4_spanish_ci NOT NULL,
  `tel` varchar(53) COLLATE utf8mb4_spanish_ci NOT NULL,
  `dni` varchar(8) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_repartidor` int(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `cliente_local`
--

INSERT INTO `cliente_local` (`codcliente`, `nombre`, `dirección`, `tel`, `dni`, `id_repartidor`) VALUES
(12, 'Ramon R', 'Barrio J', '3765142015', '39502416', 54),
(15, 'Gonzalo Perez', 'Ayacucho 300', '37651230214', '42501230', 55),
(17, 'Carlos Benitez', 'Cabred 3703', '3764152098', '5748256', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `total_compra` double NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `id_proveedor`, `total_compra`, `fecha`) VALUES
(148, 15, 1640, '2021-11-04'),
(149, 16, 4950, '2021-11-05'),
(150, 15, 620, '2021-11-04'),
(151, 15, 16560, '2021-11-11'),
(152, 15, 20, '2021-11-18'),
(154, 15, 230, '2021-11-19'),
(155, 0, 0, '0000-00-00'),
(156, 15, 62, '2021-11-05'),
(162, 15, 3320, '2021-11-04'),
(163, 13, 3818, '2021-11-01'),
(164, 15, 115, '2021-11-12'),
(165, 0, 0, '0000-00-00'),
(168, 0, 0, '0000-00-00'),
(169, 15, 200, '2021-11-04'),
(170, 0, 0, '0000-00-00'),
(171, 22, 115, '2021-12-03'),
(172, 13, 240, '2021-11-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id_detalle_compra` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_productos` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id_detalle_compra`, `id_compra`, `id_productos`, `cantidad`, `subtotal`) VALUES
(71, 148, 17, 41, 820),
(72, 148, 17, 41, 820),
(73, 149, 19, 99, 4950),
(74, 150, 18, 5, 310),
(75, 150, 18, 5, 310),
(76, 151, 17, 414, 8280),
(77, 151, 17, 414, 8280),
(78, 152, 17, 1, 20),
(80, 154, 9, 5, 115),
(81, 154, 9, 5, 115),
(82, 156, 18, 1, 62),
(87, 162, 17, 166, 3320),
(88, 163, 9, 166, 3818),
(89, 164, 9, 5, 115),
(90, 169, 17, 5, 100),
(91, 169, 17, 5, 100),
(92, 171, 9, 5, 115),
(93, 172, 17, 3, 60),
(94, 172, 17, 3, 60),
(95, 172, 17, 3, 60),
(96, 172, 17, 3, 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id_detalle` int(11) NOT NULL,
  `cod_ventas` int(11) NOT NULL,
  `id_productos` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id_detalle`, `cod_ventas`, `id_productos`, `cantidad`, `subtotal`) VALUES
(3, 40, 18, 166, 10292),
(4, 40, 18, 166, 10292),
(5, 41, 9, 5, 115),
(6, 42, 9, 166, 3818),
(7, 43, 18, 21, 1302),
(8, 44, 18, 11, 682),
(9, 45, 17, 5, 100),
(10, 46, 17, 5, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_productos` int(25) NOT NULL,
  `descripción` varchar(25) COLLATE utf8mb4_spanish_ci NOT NULL,
  `stock` int(25) NOT NULL,
  `precio_compra` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio_ventas` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_productos`, `descripción`, `stock`, `precio_compra`, `precio_ventas`, `estado`) VALUES
(9, 'Panes.', 180, '160', '23', 1),
(17, 'Facturas.', 20, '30', '20', 1),
(18, 'Galleta', 173, '20', '62', 1),
(19, 'Medialunas', 34, '30', '50', 1),
(21, 'asd', 555, '13', '15', 1),
(22, 'Coca cola 150ml', 50, '150', '170', 1),
(23, 'Pepas', 100, '50', '80', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(23) NOT NULL,
  `nombre` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `direccion` varchar(40) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cuit` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `tipo_proveedor` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre`, `direccion`, `cuit`, `telefono`, `tipo_proveedor`) VALUES
(13, 'Ramon mejia', 'Malvinas', '241542152', '3764754812', 'Bebidas'),
(15, 'Carlos gauto', '  Mitre y Ayacuchi', '  151241562', '  3764874852', '  Lacteos'),
(22, 'Jeremias Alonzo', ' Barrio Progreso', ' 1452120855', ' 3765201212', 'Panificados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidor`
--

CREATE TABLE `repartidor` (
  `id_repartidor` int(20) NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `dirección` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `repartidor`
--

INSERT INTO `repartidor` (`id_repartidor`, `nombre`, `telefono`, `dirección`, `fecha_nacimiento`) VALUES
(15, 'Carlos', '376455555', 'Agua tonica', '2021-09-18'),
(16, 'Kenny', '47554124', 'Uruguay y mitre', '2021-09-25'),
(18, 'Raul gomez', '   3764152078', '   Mitre 8520', '1996-02-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuarios`
--

CREATE TABLE `tipo_usuarios` (
  `id` int(15) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuarios`
--

INSERT INTO `tipo_usuarios` (`id`, `descripcion`) VALUES
(1, 'administrador'),
(2, 'operario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno_empleado`
--

CREATE TABLE `turno_empleado` (
  `Id_usuario` int(23) NOT NULL,
  `id_ventas` int(23) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL,
  `total_ventas_cierre` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `total_ventas_apertura` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `id_recaudacion` int(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(15) NOT NULL,
  `usuario` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_tipo` varchar(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `clave`, `id_tipo`, `estado`) VALUES
(25, 'ale', '1234', '1', 1),
(69, 'juan', '1234', '2', 1),
(76, 'pepesito', '88', '2', 0),
(77, 'pepesito22', '123', '2', 0),
(78, 'ale', 'a', '1', 1),
(79, 'b', 'b', '1', 1),
(80, 'c', 'c', '1', 1),
(81, 'd', 'd', '2', 1),
(82, 'e', 'e', '1', 1),
(83, 'juanf', 'f', '1', 1),
(84, 'g', 'g', '2', 1),
(85, 'eeee', '2', '1', 1),
(86, '88', '88', '2', 1),
(87, 'Juan Carlos Raul', '3764522001', '2', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `cod_ventas` int(23) NOT NULL,
  `codcliente` int(25) NOT NULL,
  `total_ventas` int(23) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`cod_ventas`, `codcliente`, `total_ventas`, `fecha`) VALUES
(40, 12, 20584, '2021-12-22'),
(41, 12, 115, '2021-11-05'),
(42, 12, 3818, '2021-11-01'),
(43, 17, 1302, '2021-11-04'),
(44, 15, 682, '2021-11-05'),
(45, 17, 100, '2021-11-12'),
(46, 12, 100, '2021-11-05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente_local`
--
ALTER TABLE `cliente_local`
  ADD PRIMARY KEY (`codcliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id_detalle_compra`),
  ADD KEY `id_compra` (`id_compra`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_ventas` (`cod_ventas`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_productos`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD PRIMARY KEY (`id_repartidor`);

--
-- Indices de la tabla `tipo_usuarios`
--
ALTER TABLE `tipo_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`cod_ventas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente_local`
--
ALTER TABLE `cliente_local`
  MODIFY `codcliente` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_productos` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  MODIFY `id_repartidor` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipo_usuarios`
--
ALTER TABLE `tipo_usuarios`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `cod_ventas` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `id_compra` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`);

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `id_ventas` FOREIGN KEY (`cod_ventas`) REFERENCES `ventas` (`cod_ventas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
