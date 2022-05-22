-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2022 a las 14:05:08
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
-- Base de datos: `biofarmacia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `dni` int(45) DEFAULT NULL,
  `edad` date NOT NULL,
  `telefono` int(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) NOT NULL,
  `adicional` varchar(500) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellidos`, `dni`, `edad`, `telefono`, `correo`, `sexo`, `adicional`, `avatar`, `estado`) VALUES
(1, 'Ahmed', '.', 1, '2001-01-01', 1, '', 'H', 'aa', 'avatar.png', 'A'),
(2, 'Cliente', '1', 777777777, '1999-01-04', 0, 'cliente1@gmail.com', 'Masculino', 'Cliente 1', 'avatar.png', 'A'),
(3, 'Cliente ', '2', 888888888, '2000-01-01', 600000000, 'cliente2@gmail.com', 'H', 'Cliente 2', 'avatar.png', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `fecha_compra` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `total` float NOT NULL,
  `id_estado_pago` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `codigo`, `fecha_compra`, `fecha_entrega`, `total`, `id_estado_pago`, `id_proveedor`) VALUES
(1, '1', '2022-05-10', '2022-05-12', 5, 2, 4),
(2, '47474', '2022-05-20', '2022-05-20', 1, 2, 1),
(3, '8', '2022-05-21', '2022-05-21', 1, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle` int(11) NOT NULL,
  `det_cantidad` int(11) NOT NULL,
  `det_vencimiento` date NOT NULL,
  `id__det_lote` int(11) NOT NULL,
  `id__det_prod` int(11) NOT NULL,
  `lote_id_prov` int(255) NOT NULL,
  `id_det_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_detalle`, `det_cantidad`, `det_vencimiento`, `id__det_lote`, `id__det_prod`, `lote_id_prov`, `id_det_venta`) VALUES
(16, 1, '2025-02-06', 1, 945, 4, 12),
(17, 1, '2026-07-10', 2, 948, 4, 12),
(18, 1, '2022-07-09', 3, 950, 4, 12),
(19, 1, '2027-07-07', 5, 949, 4, 12),
(20, 1, '2025-02-06', 1, 945, 4, 13),
(21, 1, '2026-07-10', 2, 948, 4, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pago`
--

CREATE TABLE `estado_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_pago`
--

INSERT INTO `estado_pago` (`id`, `nombre`) VALUES
(1, 'Cancelado'),
(2, 'No cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `id_laboratorio` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `laboratorio`
--

INSERT INTO `laboratorio` (`id_laboratorio`, `nombre`, `avatar`, `estado`) VALUES
(377, 'BOEHRINGER INGELHEIM ESPAÑA, S.A.', '627a8ba3db1d5-boehringer_ingelheim.png', 'A'),
(378, 'BAYER HISPANIA, S.L.', '627a8c45c57f8-BAYER-logo.png', 'A'),
(379, 'KERN PHARMA, S.L.', '627a8da82564b-KERNPHARMA (2).jpg', 'A'),
(380, 'LABORATORIOS MENARINI S.A', '627a90b712ac9-LABORATORIOS MENARINI S.A.jpg', 'A'),
(381, 'LABORATORIOS CINFA, S.A.', '627a91a38c551-Logotipo-Cinfa.jpg', 'A'),
(382, 'MERCK S.L.', '627a929bbf2dd-logo-rb-mm.png', 'A'),
(383, 'GLAXOSMITHKLINE, S.A.', '627a93893082e-Glaxosmithkline-4x3.jpg', 'A'),
(384, 'PFIZER S.L.', '627a94b2921f0-pfizer.jpg', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `id` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `cantidad_lote` int(11) NOT NULL,
  `vencimiento` date NOT NULL,
  `precio_compra` float NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`id`, `codigo`, `cantidad`, `cantidad_lote`, `vencimiento`, `precio_compra`, `estado`, `id_compra`, `id_producto`) VALUES
(1, '1', 5000, 4998, '2025-02-06', 1, 'A', 1, 945),
(2, '2', 5000, 4998, '2026-07-10', 2.5, 'A', 1, 948),
(3, '3', 5000, 4999, '2022-07-09', 3, 'A', 1, 950),
(4, '4', 5000, 5000, '2023-03-15', 0.99, 'A', 1, 944),
(5, '5', 10000, 9999, '2027-07-07', 0.5, 'A', 1, 949),
(6, '6', 10000, 10000, '2028-08-05', 0.3, 'A', 1, 947),
(7, '85848', 1505, 2585, '2025-11-06', 125, 'A', 2, 945),
(8, '8', 100, 100, '2022-05-28', 1200, 'A', 3, 951);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `id_presentacion` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `presentacion`
--

INSERT INTO `presentacion` (`id_presentacion`, `nombre`, `estado`) VALUES
(5, 'AEROSOL', 'I'),
(6, 'ANILLO', 'I'),
(7, 'CAPSULA', 'A'),
(8, 'CHAMPU', 'A'),
(9, 'CREMA', 'A'),
(10, 'EMULSION', 'A'),
(11, 'ENEMA', 'I'),
(12, 'ESPUMA', 'A'),
(13, 'GEL', 'A'),
(14, 'GRANULOS', 'A'),
(15, 'IMPLANTE', 'I'),
(16, 'INYECTABLE', 'A'),
(17, 'JABON', 'A'),
(18, 'JALEA', 'I'),
(19, 'LOCION', 'I'),
(20, 'OVULO', 'I'),
(21, 'PARCHE', 'I'),
(22, 'POLVO', 'A'),
(23, 'SISTEMA', 'I'),
(24, 'SOLUCION OFTALMICA', 'A'),
(25, 'SOLUCION OTICA', 'I'),
(26, 'SUPOSITORIO', 'I'),
(27, 'SUSPENSION', 'A'),
(28, 'SUSPENSION NASAL', 'A'),
(29, 'SUSPENSION OFTALMICA', 'A'),
(30, 'TABLETA', 'A'),
(31, 'POMADAS', 'A'),
(32, 'POMADAS OFTALMICO', 'A'),
(33, 'UNGUENTO VAGINAL', 'I'),
(34, 'SOLUCION', 'A'),
(35, 'prueba', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `concentracion` varchar(255) DEFAULT NULL,
  `adicional` varchar(255) DEFAULT NULL,
  `precio` float NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A',
  `prod_lab` int(11) NOT NULL,
  `prod_tip_prod` int(11) NOT NULL,
  `prod_present` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `concentracion`, `adicional`, `precio`, `avatar`, `estado`, `prod_lab`, `prod_tip_prod`, `prod_present`) VALUES
(944, 'NOLOTIL ', '575 mg', 'CAPSULAS DURAS', 1.56, '627a89f09de4a-47633_materialas.jpg', 'A', 377, 2, 7),
(945, 'ADIRO', '100 mg', 'COMPRIMIDOS GASTRORRESISTENTES EFG', 1.45, '627a8cf97e91a-62825_materialas.jpg', 'A', 378, 2, 7),
(946, 'PARACETAMOL', '1 g', '20 COMPRIMIDOS EFG', 1.9, '627a8e573bf1a-paracetamol-kern-1g-20.jpeg', 'A', 379, 2, 7),
(947, 'PARACETAMOL', '650 mg', '40 COMPRIMIDOS EFG', 1.31, '627a8fe990181-paracetamol-kern-650mg-40.jpeg', 'A', 379, 2, 7),
(948, 'ENANTYUM ', '25 mg', '20 COMPRIMIDOS', 3.99, '627a915405732-enantyum-25-mg-comprimidos-20.jpg', 'A', 380, 2, 7),
(949, 'PARACETAMOL ', '1 g', '20 COMPRIMIDOS EFG', 1.9, '627a920f6ca39-70310_materialas.jpg', 'A', 381, 2, 7),
(950, 'EUTIROX ', '100 microgramos', '100 COMPRIMIDOS', 4.93, '627a931fe23bf-64014_materialas.jpg', 'A', 382, 2, 7),
(951, 'VENTOLIN ', '100 microgramos', 'INHALACIÓN SUSPENSIÓN PARA INHALACIÓN EN ENVASE A PRESIÓN', 2.5, '627a940b3db88-53010_materialas.jpg', 'A', 383, 2, 27),
(952, 'ORFIDAL ', ' 1 mg', '50 COMPRIMIDOS', 1.72, '627a950153652-49796_materialas.jpg', 'A', 384, 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre`, `telefono`, `correo`, `direccion`, `avatar`, `estado`) VALUES
(1, 'Cofares S.c.', 917408700, 'atencionalcliente@cofares.es', 'C/ Santa Engracia 31 28010 Madrid España', '627a9d3bc2395-logo-cofares.jpg', 'A'),
(2, 'Bida Farma S. Coop. And', 952248900, '', 'Polígono Industrial El Pino, Calle Pino Centr', '627a9ddfd56e4-Bida-Farma.png', 'A'),
(3, 'Werfen España Sau', 934010101, 'customerservice-es@werfen.com', 'Plaza Europa, 21-23 08908 L\'Hospitalet de Llo', '6289211ba5026-627a9e5255813-werfen.png', 'A'),
(4, 'FedeFarma', 937060372, '', 'C/Coneixement, 7-13 Illa A3.1 Centre de negoc', '62892133d2618-6289210cb9506-627a9ebfd07bf-logo-fedefarma.png', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id_tip_prod` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id_tip_prod`, `nombre`, `estado`) VALUES
(2, 'Comercial', 'A'),
(3, 'Generico', 'A'),
(13, 'Regalos', 'I'),
(14, 'Joyeria', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_us`
--

CREATE TABLE `tipo_us` (
  `id_tipo_us` int(11) NOT NULL,
  `nombre_tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_us`
--

INSERT INTO `tipo_us` (`id_tipo_us`, `nombre_tipo`) VALUES
(1, 'Administrador'),
(2, 'Tecnico'),
(3, 'Root');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_us` varchar(45) NOT NULL,
  `apellidos_us` varchar(45) NOT NULL,
  `edad` date NOT NULL,
  `dni_us` varchar(45) NOT NULL,
  `contrasena_us` varchar(255) NOT NULL,
  `telefono_us` int(11) DEFAULT NULL,
  `residencia_us` varchar(45) DEFAULT NULL,
  `correo_us` varchar(50) DEFAULT NULL,
  `sexo_us` varchar(25) DEFAULT NULL,
  `adicional_us` varchar(500) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `us_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_us`, `apellidos_us`, `edad`, `dni_us`, `contrasena_us`, `telefono_us`, `residencia_us`, `correo_us`, `sexo_us`, `adicional_us`, `avatar`, `us_tipo`) VALUES
(1, 'Ruben', 'Martinez', '2005-07-12', '39521686', 'ruben', 601206953, 'Barcelona', 'rmartbernabe@gmail.com', 'Masculino', 'Programador/ADMIN', 'default.jpg', 3),
(2, 'Ahmed', 'Aref', '0000-00-00', '99999999', 'ahmed', 602165582, 'Barcelona', 'aaref@ilg.cat', 'Masculino', 'Programador/ADMIN', '627aa84aea89a-default.jpg', 3),
(3, 'Jawad', 'Ahmed', '0000-00-00', '0206266', 'jawad', 632036836, 'Barcelona', 'jahmed@ilg.cat', 'Masculino', 'Programador/ADMIN', 'default.jpg', 3),
(4, 'Sargun', 'Chawla', '0000-00-00', '30377998', 'sargun', 632971358, 'Barcelona', 'schawla@ilg.cat', 'Masculino', 'Programador/ADMIN', 'default.jpg', 3),
(5, 'Tecnico', '1', '1994-06-01', '11111111', 'tecnico1', NULL, NULL, NULL, NULL, NULL, 'default.jpg', 2),
(6, 'Administrador', '1', '1998-02-14', '22222222', 'admin1', NULL, NULL, NULL, NULL, NULL, 'default.jpg', 1),
(7, 'Tecnico', '2', '1999-05-25', '33333333', 'tecnico2', NULL, NULL, NULL, NULL, NULL, 'default.jpg', 2),
(8, 'Administrador', '2', '1998-07-04', '44444444', 'admin2', NULL, NULL, NULL, NULL, NULL, 'default.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `cliente` varchar(45) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `vendedor` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `fecha`, `cliente`, `dni`, `total`, `vendedor`, `id_cliente`) VALUES
(12, '2022-05-20 18:55:28', NULL, NULL, 12.27, 2, 1),
(13, '2022-05-21 19:15:04', NULL, NULL, 5.44, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_producto`
--

CREATE TABLE `venta_producto` (
  `id_ventaproducto` int(11) NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` float NOT NULL,
  `producto_id_producto` int(11) NOT NULL,
  `venta_id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta_producto`
--

INSERT INTO `venta_producto` (`id_ventaproducto`, `precio`, `cantidad`, `subtotal`, `producto_id_producto`, `venta_id_venta`) VALUES
(16, 1.45, 1, 1.45, 945, 12),
(17, 3.99, 1, 3.99, 948, 12),
(18, 4.93, 1, 4.93, 950, 12),
(19, 1.9, 1, 1.9, 949, 12),
(20, 1.45, 1, 1.45, 945, 13),
(21, 3.99, 1, 3.99, 948, 13);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estado_pago` (`id_estado_pago`,`id_proveedor`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_det_venta_idx` (`id_det_venta`);

--
-- Indices de la tabla `estado_pago`
--
ALTER TABLE `estado_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`id_laboratorio`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_compra` (`id_compra`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  ADD PRIMARY KEY (`id_presentacion`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `prod_lab_idx` (`prod_lab`),
  ADD KEY `prod_tip_prod_idx` (`prod_tip_prod`),
  ADD KEY `prod_present_idx` (`prod_present`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id_tip_prod`);

--
-- Indices de la tabla `tipo_us`
--
ALTER TABLE `tipo_us`
  ADD PRIMARY KEY (`id_tipo_us`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `us_tipo_idx` (`us_tipo`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `vendedor` (`vendedor`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD PRIMARY KEY (`id_ventaproducto`),
  ADD KEY `fk_venta_has_producto_producto1_idx` (`producto_id_producto`),
  ADD KEY `fk_venta_has_producto_venta1_idx` (`venta_id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `estado_pago`
--
ALTER TABLE `estado_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `id_laboratorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=385;

--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  MODIFY `id_presentacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=958;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id_tip_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tipo_us`
--
ALTER TABLE `tipo_us`
  MODIFY `id_tipo_us` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  MODIFY `id_ventaproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_estado_pago`) REFERENCES `estado_pago` (`id`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `id_det_venta` FOREIGN KEY (`id_det_venta`) REFERENCES `venta` (`id_venta`);

--
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id`),
  ADD CONSTRAINT `lote_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `prod_lab` FOREIGN KEY (`prod_lab`) REFERENCES `laboratorio` (`id_laboratorio`),
  ADD CONSTRAINT `prod_present` FOREIGN KEY (`prod_present`) REFERENCES `presentacion` (`id_presentacion`),
  ADD CONSTRAINT `prod_tip_prod` FOREIGN KEY (`prod_tip_prod`) REFERENCES `tipo_producto` (`id_tip_prod`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `us_tipo` FOREIGN KEY (`us_tipo`) REFERENCES `tipo_us` (`id_tipo_us`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`vendedor`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD CONSTRAINT `fk_venta_has_producto_producto1` FOREIGN KEY (`producto_id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `fk_venta_has_producto_venta1` FOREIGN KEY (`venta_id_venta`) REFERENCES `venta` (`id_venta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
