-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 05-05-2022 a las 10:41:53
-- Versión del servidor: 5.7.37-cll-lve
-- Versión de PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `syscopy`
--

DELIMITER $$
--
-- Procedimientos
--
$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canal`
--

CREATE TABLE `canal` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `canal`
--

INSERT INTO `canal` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'TIENDA FISICA', 'COMERCIO REALIZADO EN LA MISMA TIENDA INDICADA', 1),
(2, 'CALL CENTER', 'REALIZADO POR MEDIO TELEFONICO', 1),
(3, 'PAGINA WEB', 'TRANSACCION REALIZADA EN LA PAGINA WEB', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `estado` tinyint(1) NOT NULL,
  `orden` int(2) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `slug` varchar(60) NOT NULL,
  `padre` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `estado`, `orden`, `categoria_id`, `slug`, `padre`) VALUES
(3, 'Fotocopiadoras', 'son todo las maquinas', 1, 3, NULL, 'fotocopiadoras', 'S'),
(4, 'Toners', 'son todos los toners', 1, 4, NULL, 'toners', 'S'),
(6, 'Articulos e insumos de oficina', 'articulos e insumos en general', 1, 5, NULL, 'articulos-e-insumos-de-oficina', 'S'),
(7, 'Nuevas', 'fotocopiadoras-nuevas', 1, 1, 3, 'nuevas', 'S'),
(8, 'Seminuevas', 'fotocopiadoras-semi-nuevas', 1, 2, 3, 'seminuevas', 'S'),
(9, 'Ricoh', 'fotocopiadoras-nuevas', 1, 3, 7, 'ricoh', 'S'),
(10, 'Konica Minolta', 'fotocopiadoras-seminuevas', 1, 2, 8, 'konica-minolta', 'S'),
(11, 'Kyocera', 'fotocopiadoras-seminuevas', 1, 3, 8, 'kyocera', 'S'),
(12, 'Ricoh', 'fotocopiadoras-seminuevas', 1, 1, 8, 'ricoh', 'S'),
(13, 'Blanco y negro', 'fotocopiadoras-nuevas-ricoh', 1, 1, 9, 'blanco-y-negro', 'N'),
(14, 'Color', 'fotocopiadoras-nuevas-ricoh', 1, 2, 9, 'color', 'N'),
(15, 'Blanco y negro', 'fotocopiadoras-seminuevas-km', 1, 1, 10, 'blanco-y-negro', 'N'),
(16, 'Color', 'fotocopiadoras-seminuevas-km', 1, 2, 10, 'color', 'N'),
(17, 'Blanco y negro', 'fotocopiadoras-seminuevas-ky', 1, 1, 11, 'blanco-y-negro', 'N'),
(18, 'Blanco y negro', 'fotocopiadoras-seminuevas-ricoh', 1, 1, 12, 'blanco-y-negro', 'N'),
(19, 'Color', 'fotocopiadoras-seminuevas-ricoh', 1, 2, 12, 'color', 'N'),
(20, 'Cartuchos', 'toners', 1, 1, 4, 'cartuchos', 'S'),
(21, 'Recargas', 'toners', 1, 2, 4, 'recargas', 'S'),
(22, 'Canon', 'toners-cartuchos', 1, 1, 20, 'canon', 'S'),
(23, 'Konica Minolta', 'toners-cartuchos', 1, 2, 20, 'konica-minolta', 'S'),
(24, 'Kyocera', 'toners-cartuchos', 1, 3, 20, 'kyocera', 'S'),
(25, 'Ricoh', 'toners-cartuchos', 1, 4, 20, 'ricoh', 'S'),
(26, 'Color', 'toners-cartuchos-canon', 1, 1, 22, 'color', 'N'),
(27, 'Blanco y negro', 'toners-cartuchos-km', 1, 1, 23, 'blanco-y-negro', 'N'),
(28, 'Color', 'toners-cartuchos-km', 1, 2, 23, 'color', 'N'),
(29, 'Blanco y negro', 'toners-cartuchos-ky', 1, 1, 24, 'blanco-y-negro', 'N'),
(30, 'Blanco y negro', 'toners-cartuchos-ricoh', 1, 1, 25, 'blanco-y-negro', 'N'),
(31, 'Color', 'toners-cartuchos-ricoh', 1, 2, 25, 'color', 'N'),
(32, 'Kyocera', 'toners-recargas', 1, 1, 21, 'kyocera', 'S'),
(33, 'Blanco y negro', 'toners-recargas-kyocera', 1, 1, 32, 'blanco-y-negro', 'N'),
(34, 'Guillotinas', 'articulos', 1, 1, 6, 'guillotinas', 'N'),
(35, 'Espiraladoras', 'articulos', 1, 2, 6, 'espiraladoras', 'N'),
(36, 'Anilladoras', 'articulos', 1, 3, 6, 'anilladoras', 'N'),
(38, 'Enmicadoras', 'articulos', 1, 5, 6, 'enmicadoras', 'N'),
(40, 'Perforadoras', 'articulos', 1, 7, 6, 'perforadoras', 'N'),
(41, 'Espirales', 'articulos', 1, 8, 6, 'espirales', 'N'),
(42, 'Tapas plastificadas', 'articulos', 1, 9, 6, 'tapas-plastificadas', 'N'),
(43, 'Micas para enmicado', 'articulos', 1, 10, 6, 'micas-para-enmicado', 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

CREATE TABLE `concepto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `tipo` varchar(1) NOT NULL,
  `descripcion` text,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `concepto`
--

INSERT INTO `concepto` (`id`, `nombre`, `tipo`, `descripcion`, `estado`) VALUES
(1, 'OTROS', 'Q', 'QUEJA EN GENERAL', 1),
(2, 'OTROS', 'R', 'RECLAMOS OTROS', 1),
(3, 'PRODUCTO ERRADO Y/O CARACTERISTICAS DISTINTAS', 'R', 'PRODUCTO NO COINCIDE CON LO OFRECIDO', 1),
(4, 'PEDIDO NO ENTREGADO O CON RETRASO', 'R', 'CUANDO EL PEDIDO POR X RAZONES NO LLEGO HACER ENTREGADO AL CLIENTE', 1),
(5, 'ERROR DE PRECIO', 'R', 'ERROR EN EL PRECIO POR EQUIS MOTIVOS', 1),
(6, 'PRODUCTO CON DAÑO FISICO', 'R', 'PRODUCTO CON AVERIA POR AVERIGUAR ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ubigeo` varchar(2) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`, `ubigeo`, `estado`) VALUES
(1, 'AMAZONAS', '01', 1),
(2, 'ANCASH', '02', 1),
(3, 'APURIMAC', '03', 1),
(4, 'AREQUIPA', '04', 1),
(5, 'AYACUCHO', '05', 1),
(6, 'CAJAMARCA', '06', 1),
(7, 'CALLAO', '07', 1),
(8, 'CUSCO', '08', 1),
(9, 'HUANCAVELICA', '09', 1),
(10, 'HUANUCO', '10', 1),
(11, 'ICA', '11', 1),
(12, 'JUNIN', '12', 1),
(13, 'LA LIBERTAD', '13', 1),
(14, 'LAMBAYEQUE', '14', 1),
(15, 'LIMA', '15', 1),
(16, 'LORETO', '16', 1),
(17, 'MADRE DE DIOS', '17', 1),
(18, 'MOQUEGUA', '18', 1),
(19, 'PASCO', '19', 1),
(20, 'PIURA', '20', 1),
(21, 'PUNO', '21', 1),
(22, 'SAN MARTIN', '22', 1),
(23, 'TACNA', '23', 1),
(24, 'TUMBES', '24', 1),
(25, 'UCAYALI', '25', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ubigeo` varchar(2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `provincia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`id`, `nombre`, `ubigeo`, `estado`, `provincia_id`) VALUES
(1, 'CHACHAPOYAS', '01', 1, 1),
(2, 'ASUNCIÓN', '02', 1, 1),
(3, 'BALSAS', '03', 1, 1),
(4, 'CHETO', '04', 1, 1),
(5, 'CHILIQUIN', '05', 1, 1),
(6, 'CHUQUIBAMBA', '06', 1, 1),
(7, 'GRANADA', '07', 1, 1),
(8, 'HUANCAS', '08', 1, 1),
(9, 'LA JALCA', '09', 1, 1),
(10, 'LEIMEBAMBA', '10', 1, 1),
(11, 'LEVANTO', '11', 1, 1),
(12, 'MAGDALENA', '12', 1, 1),
(13, 'MARISCAL CASTILLA', '13', 1, 1),
(14, 'MOLINOPAMPA', '14', 1, 1),
(15, 'MONTEVIDEO', '15', 1, 1),
(16, 'OLLEROS', '16', 1, 1),
(17, 'QUINJALCA', '17', 1, 1),
(18, 'SAN FRANCISCO DE DAGUAS', '18', 1, 1),
(19, 'SAN ISIDRO DE MAINO', '19', 1, 1),
(20, 'SOLOCO', '20', 1, 1),
(21, 'SONCHE', '21', 1, 1),
(22, 'BAGUA', '01', 1, 2),
(23, 'ARAMANGO', '02', 1, 2),
(24, 'COPALLIN', '03', 1, 2),
(25, 'EL PARCO', '04', 1, 2),
(26, 'IMAZA', '05', 1, 2),
(27, 'LA PECA', '06', 1, 2),
(28, 'JUMBILLA', '01', 1, 3),
(29, 'CHISQUILLA', '02', 1, 3),
(30, 'CHURUJA', '03', 1, 3),
(31, 'COROSHA', '04', 1, 3),
(32, 'CUISPES', '05', 1, 3),
(33, 'FLORIDA', '06', 1, 3),
(34, 'JAZAN', '07', 1, 3),
(35, 'RECTA', '08', 1, 3),
(36, 'SAN CARLOS', '09', 1, 3),
(37, 'SHIPASBAMBA', '10', 1, 3),
(38, 'VALERA', '11', 1, 3),
(39, 'YAMBRASBAMBA', '12', 1, 3),
(40, 'NIEVA', '01', 1, 4),
(41, 'EL CENEPA', '02', 1, 4),
(42, 'RÍO SANTIAGO', '03', 1, 4),
(43, 'LAMUD', '01', 1, 5),
(44, 'CAMPORREDONDO', '02', 1, 5),
(45, 'COCABAMBA', '03', 1, 5),
(46, 'COLCAMAR', '04', 1, 5),
(47, 'CONILA', '05', 1, 5),
(48, 'INGUILPATA', '06', 1, 5),
(49, 'LONGUITA', '07', 1, 5),
(50, 'LONYA CHICO', '08', 1, 5),
(51, 'LUYA', '09', 1, 5),
(52, 'LUYA VIEJO', '10', 1, 5),
(53, 'MARÍA', '11', 1, 5),
(54, 'OCALLI', '12', 1, 5),
(55, 'OCUMAL', '13', 1, 5),
(56, 'PISUQUIA', '14', 1, 5),
(57, 'PROVIDENCIA', '15', 1, 5),
(58, 'SAN CRISTÓBAL', '16', 1, 5),
(59, 'SAN FRANCISCO DE YESO', '17', 1, 5),
(60, 'SAN JERÓNIMO', '18', 1, 5),
(61, 'SAN JUAN DE LOPECANCHA', '19', 1, 5),
(62, 'SANTA CATALINA', '20', 1, 5),
(63, 'SANTO TOMAS', '21', 1, 5),
(64, 'TINGO', '22', 1, 5),
(65, 'TRITA', '23', 1, 5),
(66, 'SAN NICOLÁS', '01', 1, 6),
(67, 'CHIRIMOTO', '02', 1, 6),
(68, 'COCHAMAL', '03', 1, 6),
(69, 'HUAMBO', '04', 1, 6),
(70, 'LIMABAMBA', '05', 1, 6),
(71, 'LONGAR', '06', 1, 6),
(72, 'MARISCAL BENAVIDES', '07', 1, 6),
(73, 'MILPUC', '08', 1, 6),
(74, 'OMIA', '09', 1, 6),
(75, 'SANTA ROSA', '10', 1, 6),
(76, 'TOTORA', '11', 1, 6),
(77, 'VISTA ALEGRE', '12', 1, 6),
(78, 'BAGUA GRANDE', '01', 1, 7),
(79, 'CAJARURO', '02', 1, 7),
(80, 'CUMBA', '03', 1, 7),
(81, 'EL MILAGRO', '04', 1, 7),
(82, 'JAMALCA', '05', 1, 7),
(83, 'LONYA GRANDE', '06', 1, 7),
(84, 'YAMON', '07', 1, 7),
(85, 'HUARAZ', '01', 1, 8),
(86, 'COCHABAMBA', '02', 1, 8),
(87, 'COLCABAMBA', '03', 1, 8),
(88, 'HUANCHAY', '04', 1, 8),
(89, 'INDEPENDENCIA', '05', 1, 8),
(90, 'JANGAS', '06', 1, 8),
(91, 'LA LIBERTAD', '07', 1, 8),
(92, 'OLLEROS', '08', 1, 8),
(93, 'PAMPAS GRANDE', '09', 1, 8),
(94, 'PARIACOTO', '10', 1, 8),
(95, 'PIRA', '11', 1, 8),
(96, 'TARICA', '12', 1, 8),
(97, 'AIJA', '01', 1, 9),
(98, 'CORIS', '02', 1, 9),
(99, 'HUACLLAN', '03', 1, 9),
(100, 'LA MERCED', '04', 1, 9),
(101, 'SUCCHA', '05', 1, 9),
(102, 'LLAMELLIN', '01', 1, 10),
(103, 'ACZO', '02', 1, 10),
(104, 'CHACCHO', '03', 1, 10),
(105, 'CHINGAS', '04', 1, 10),
(106, 'MIRGAS', '05', 1, 10),
(107, 'SAN JUAN DE RONTOY', '06', 1, 10),
(108, 'CHACAS', '01', 1, 11),
(109, 'ACOCHACA', '02', 1, 11),
(110, 'CHIQUIAN', '01', 1, 12),
(111, 'ABELARDO PARDO LEZAMETA', '02', 1, 12),
(112, 'ANTONIO RAYMONDI', '03', 1, 12),
(113, 'AQUIA', '04', 1, 12),
(114, 'CAJACAY', '05', 1, 12),
(115, 'CANIS', '06', 1, 12),
(116, 'COLQUIOC', '07', 1, 12),
(117, 'HUALLANCA', '08', 1, 12),
(118, 'HUASTA', '09', 1, 12),
(119, 'HUAYLLACAYAN', '10', 1, 12),
(120, 'LA PRIMAVERA', '11', 1, 12),
(121, 'MANGAS', '12', 1, 12),
(122, 'PACLLON', '13', 1, 12),
(123, 'SAN MIGUEL DE CORPANQUI', '14', 1, 12),
(124, 'TICLLOS', '15', 1, 12),
(125, 'CARHUAZ', '01', 1, 13),
(126, 'ACOPAMPA', '02', 1, 13),
(127, 'AMASHCA', '03', 1, 13),
(128, 'ANTA', '04', 1, 13),
(129, 'ATAQUERO', '05', 1, 13),
(130, 'MARCARA', '06', 1, 13),
(131, 'PARIAHUANCA', '07', 1, 13),
(132, 'SAN MIGUEL DE ACO', '08', 1, 13),
(133, 'SHILLA', '09', 1, 13),
(134, 'TINCO', '10', 1, 13),
(135, 'YUNGAR', '11', 1, 13),
(136, 'SAN LUIS', '01', 1, 14),
(137, 'SAN NICOLÁS', '02', 1, 14),
(138, 'YAUYA', '03', 1, 14),
(139, 'CASMA', '01', 1, 15),
(140, 'BUENA VISTA ALTA', '02', 1, 15),
(141, 'COMANDANTE NOEL', '03', 1, 15),
(142, 'YAUTAN', '04', 1, 15),
(143, 'CORONGO', '01', 1, 16),
(144, 'ACO', '02', 1, 16),
(145, 'BAMBAS', '03', 1, 16),
(146, 'CUSCA', '04', 1, 16),
(147, 'LA PAMPA', '05', 1, 16),
(148, 'YANAC', '06', 1, 16),
(149, 'YUPAN', '07', 1, 16),
(150, 'HUARI', '01', 1, 17),
(151, 'ANRA', '02', 1, 17),
(152, 'CAJAY', '03', 1, 17),
(153, 'CHAVIN DE HUANTAR', '04', 1, 17),
(154, 'HUACACHI', '05', 1, 17),
(155, 'HUACCHIS', '06', 1, 17),
(156, 'HUACHIS', '07', 1, 17),
(157, 'HUANTAR', '08', 1, 17),
(158, 'MASIN', '09', 1, 17),
(159, 'PAUCAS', '10', 1, 17),
(160, 'PONTO', '11', 1, 17),
(161, 'RAHUAPAMPA', '12', 1, 17),
(162, 'RAPAYAN', '13', 1, 17),
(163, 'SAN MARCOS', '14', 1, 17),
(164, 'SAN PEDRO DE CHANA', '15', 1, 17),
(165, 'UCO', '16', 1, 17),
(166, 'HUARMEY', '01', 1, 18),
(167, 'COCHAPETI', '02', 1, 18),
(168, 'CULEBRAS', '03', 1, 18),
(169, 'HUAYAN', '04', 1, 18),
(170, 'MALVAS', '05', 1, 18),
(171, 'CARAZ', '01', 1, 19),
(172, 'HUALLANCA', '02', 1, 19),
(173, 'HUATA', '03', 1, 19),
(174, 'HUAYLAS', '04', 1, 19),
(175, 'MATO', '05', 1, 19),
(176, 'PAMPAROMAS', '06', 1, 19),
(177, 'PUEBLO LIBRE', '07', 1, 19),
(178, 'SANTA CRUZ', '08', 1, 19),
(179, 'SANTO TORIBIO', '09', 1, 19),
(180, 'YURACMARCA', '10', 1, 19),
(181, 'PISCOBAMBA', '01', 1, 20),
(182, 'CASCA', '02', 1, 20),
(183, 'ELEAZAR GUZMÁN BARRON', '03', 1, 20),
(184, 'FIDEL OLIVAS ESCUDERO', '04', 1, 20),
(185, 'LLAMA', '05', 1, 20),
(186, 'LLUMPA', '06', 1, 20),
(187, 'LUCMA', '07', 1, 20),
(188, 'MUSGA', '08', 1, 20),
(189, 'OCROS', '01', 1, 21),
(190, 'ACAS', '02', 1, 21),
(191, 'CAJAMARQUILLA', '03', 1, 21),
(192, 'CARHUAPAMPA', '04', 1, 21),
(193, 'COCHAS', '05', 1, 21),
(194, 'CONGAS', '06', 1, 21),
(195, 'LLIPA', '07', 1, 21),
(196, 'SAN CRISTÓBAL DE RAJAN', '08', 1, 21),
(197, 'SAN PEDRO', '09', 1, 21),
(198, 'SANTIAGO DE CHILCAS', '10', 1, 21),
(199, 'CABANA', '01', 1, 22),
(200, 'BOLOGNESI', '02', 1, 22),
(201, 'CONCHUCOS', '03', 1, 22),
(202, 'HUACASCHUQUE', '04', 1, 22),
(203, 'HUANDOVAL', '05', 1, 22),
(204, 'LACABAMBA', '06', 1, 22),
(205, 'LLAPO', '07', 1, 22),
(206, 'PALLASCA', '08', 1, 22),
(207, 'PAMPAS', '09', 1, 22),
(208, 'SANTA ROSA', '10', 1, 22),
(209, 'TAUCA', '11', 1, 22),
(210, 'POMABAMBA', '01', 1, 23),
(211, 'HUAYLLAN', '02', 1, 23),
(212, 'PAROBAMBA', '03', 1, 23),
(213, 'QUINUABAMBA', '04', 1, 23),
(214, 'RECUAY', '01', 1, 24),
(215, 'CATAC', '02', 1, 24),
(216, 'COTAPARACO', '03', 1, 24),
(217, 'HUAYLLAPAMPA', '04', 1, 24),
(218, 'LLACLLIN', '05', 1, 24),
(219, 'MARCA', '06', 1, 24),
(220, 'PAMPAS CHICO', '07', 1, 24),
(221, 'PARARIN', '08', 1, 24),
(222, 'TAPACOCHA', '09', 1, 24),
(223, 'TICAPAMPA', '10', 1, 24),
(224, 'CHIMBOTE', '01', 1, 25),
(225, 'CÁCERES DEL PERÚ', '02', 1, 25),
(226, 'COISHCO', '03', 1, 25),
(227, 'MACATE', '04', 1, 25),
(228, 'MORO', '05', 1, 25),
(229, 'NEPEÑA', '06', 1, 25),
(230, 'SAMANCO', '07', 1, 25),
(231, 'SANTA', '08', 1, 25),
(232, 'NUEVO CHIMBOTE', '09', 1, 25),
(233, 'SIHUAS', '01', 1, 26),
(234, 'ACOBAMBA', '02', 1, 26),
(235, 'ALFONSO UGARTE', '03', 1, 26),
(236, 'CASHAPAMPA', '04', 1, 26),
(237, 'CHINGALPO', '05', 1, 26),
(238, 'HUAYLLABAMBA', '06', 1, 26),
(239, 'QUICHES', '07', 1, 26),
(240, 'RAGASH', '08', 1, 26),
(241, 'SAN JUAN', '09', 1, 26),
(242, 'SICSIBAMBA', '10', 1, 26),
(243, 'YUNGAY', '01', 1, 27),
(244, 'CASCAPARA', '02', 1, 27),
(245, 'MANCOS', '03', 1, 27),
(246, 'MATACOTO', '04', 1, 27),
(247, 'QUILLO', '05', 1, 27),
(248, 'RANRAHIRCA', '06', 1, 27),
(249, 'SHUPLUY', '07', 1, 27),
(250, 'YANAMA', '08', 1, 27),
(251, 'ABANCAY', '01', 1, 28),
(252, 'CHACOCHE', '02', 1, 28),
(253, 'CIRCA', '03', 1, 28),
(254, 'CURAHUASI', '04', 1, 28),
(255, 'HUANIPACA', '05', 1, 28),
(256, 'LAMBRAMA', '06', 1, 28),
(257, 'PICHIRHUA', '07', 1, 28),
(258, 'SAN PEDRO DE CACHORA', '08', 1, 28),
(259, 'TAMBURCO', '09', 1, 28),
(260, 'ANDAHUAYLAS', '01', 1, 29),
(261, 'ANDARAPA', '02', 1, 29),
(262, 'CHIARA', '03', 1, 29),
(263, 'HUANCARAMA', '04', 1, 29),
(264, 'HUANCARAY', '05', 1, 29),
(265, 'HUAYANA', '06', 1, 29),
(266, 'KISHUARA', '07', 1, 29),
(267, 'PACOBAMBA', '08', 1, 29),
(268, 'PACUCHA', '09', 1, 29),
(269, 'PAMPACHIRI', '10', 1, 29),
(270, 'POMACOCHA', '11', 1, 29),
(271, 'SAN ANTONIO DE CACHI', '12', 1, 29),
(272, 'SAN JERÓNIMO', '13', 1, 29),
(273, 'SAN MIGUEL DE CHACCRAMPA', '14', 1, 29),
(274, 'SANTA MARÍA DE CHICMO', '15', 1, 29),
(275, 'TALAVERA', '16', 1, 29),
(276, 'TUMAY HUARACA', '17', 1, 29),
(277, 'TURPO', '18', 1, 29),
(278, 'KAQUIABAMBA', '19', 1, 29),
(279, 'JOSÉ MARÍA ARGUEDAS', '20', 1, 29),
(280, 'ANTABAMBA', '01', 1, 30),
(281, 'EL ORO', '02', 1, 30),
(282, 'HUAQUIRCA', '03', 1, 30),
(283, 'JUAN ESPINOZA MEDRANO', '04', 1, 30),
(284, 'OROPESA', '05', 1, 30),
(285, 'PACHACONAS', '06', 1, 30),
(286, 'SABAINO', '07', 1, 30),
(287, 'CHALHUANCA', '01', 1, 31),
(288, 'CAPAYA', '02', 1, 31),
(289, 'CARAYBAMBA', '03', 1, 31),
(290, 'CHAPIMARCA', '04', 1, 31),
(291, 'COLCABAMBA', '05', 1, 31),
(292, 'COTARUSE', '06', 1, 31),
(293, 'HUAYLLO', '07', 1, 31),
(294, 'JUSTO APU SAHUARAURA', '08', 1, 31),
(295, 'LUCRE', '09', 1, 31),
(296, 'POCOHUANCA', '10', 1, 31),
(297, 'SAN JUAN DE CHACÑA', '11', 1, 31),
(298, 'SAÑAYCA', '12', 1, 31),
(299, 'SORAYA', '13', 1, 31),
(300, 'TAPAIRIHUA', '14', 1, 31),
(301, 'TINTAY', '15', 1, 31),
(302, 'TORAYA', '16', 1, 31),
(303, 'YANACA', '17', 1, 31),
(304, 'TAMBOBAMBA', '01', 1, 32),
(305, 'COTABAMBAS', '02', 1, 32),
(306, 'COYLLURQUI', '03', 1, 32),
(307, 'HAQUIRA', '04', 1, 32),
(308, 'MARA', '05', 1, 32),
(309, 'CHALLHUAHUACHO', '06', 1, 32),
(310, 'CHINCHEROS', '01', 1, 33),
(311, 'ANCO_HUALLO', '02', 1, 33),
(312, 'COCHARCAS', '03', 1, 33),
(313, 'HUACCANA', '04', 1, 33),
(314, 'OCOBAMBA', '05', 1, 33),
(315, 'ONGOY', '06', 1, 33),
(316, 'URANMARCA', '07', 1, 33),
(317, 'RANRACANCHA', '08', 1, 33),
(318, 'CHUQUIBAMBILLA', '01', 1, 34),
(319, 'CURPAHUASI', '02', 1, 34),
(320, 'GAMARRA', '03', 1, 34),
(321, 'HUAYLLATI', '04', 1, 34),
(322, 'MAMARA', '05', 1, 34),
(323, 'MICAELA BASTIDAS', '06', 1, 34),
(324, 'PATAYPAMPA', '07', 1, 34),
(325, 'PROGRESO', '08', 1, 34),
(326, 'SAN ANTONIO', '09', 1, 34),
(327, 'SANTA ROSA', '10', 1, 34),
(328, 'TURPAY', '11', 1, 34),
(329, 'VILCABAMBA', '12', 1, 34),
(330, 'VIRUNDO', '13', 1, 34),
(331, 'CURASCO', '14', 1, 34),
(332, 'AREQUIPA', '01', 1, 35),
(333, 'ALTO SELVA ALEGRE', '02', 1, 35),
(334, 'CAYMA', '03', 1, 35),
(335, 'CERRO COLORADO', '04', 1, 35),
(336, 'CHARACATO', '05', 1, 35),
(337, 'CHIGUATA', '06', 1, 35),
(338, 'JACOBO HUNTER', '07', 1, 35),
(339, 'LA JOYA', '08', 1, 35),
(340, 'MARIANO MELGAR', '09', 1, 35),
(341, 'MIRAFLORES', '10', 1, 35),
(342, 'MOLLEBAYA', '11', 1, 35),
(343, 'PAUCARPATA', '12', 1, 35),
(344, 'POCSI', '13', 1, 35),
(345, 'POLOBAYA', '14', 1, 35),
(346, 'QUEQUEÑA', '15', 1, 35),
(347, 'SABANDIA', '16', 1, 35),
(348, 'SACHACA', '17', 1, 35),
(349, 'SAN JUAN DE SIGUAS', '18', 1, 35),
(350, 'SAN JUAN DE TARUCANI', '19', 1, 35),
(351, 'SANTA ISABEL DE SIGUAS', '20', 1, 35),
(352, 'SANTA RITA DE SIGUAS', '21', 1, 35),
(353, 'SOCABAYA', '22', 1, 35),
(354, 'TIABAYA', '23', 1, 35),
(355, 'UCHUMAYO', '24', 1, 35),
(356, 'VITOR', '25', 1, 35),
(357, 'YANAHUARA', '26', 1, 35),
(358, 'YARABAMBA', '27', 1, 35),
(359, 'YURA', '28', 1, 35),
(360, 'JOSÉ LUIS BUSTAMANTE Y RIVERO', '29', 1, 35),
(361, 'CAMANÁ', '01', 1, 36),
(362, 'JOSÉ MARÍA QUIMPER', '02', 1, 36),
(363, 'MARIANO NICOLÁS VALCÁRCEL', '03', 1, 36),
(364, 'MARISCAL CÁCERES', '04', 1, 36),
(365, 'NICOLÁS DE PIEROLA', '05', 1, 36),
(366, 'OCOÑA', '06', 1, 36),
(367, 'QUILCA', '07', 1, 36),
(368, 'SAMUEL PASTOR', '08', 1, 36),
(369, 'CARAVELÍ', '01', 1, 37),
(370, 'ACARÍ', '02', 1, 37),
(371, 'ATICO', '03', 1, 37),
(372, 'ATIQUIPA', '04', 1, 37),
(373, 'BELLA UNIÓN', '05', 1, 37),
(374, 'CAHUACHO', '06', 1, 37),
(375, 'CHALA', '07', 1, 37),
(376, 'CHAPARRA', '08', 1, 37),
(377, 'HUANUHUANU', '09', 1, 37),
(378, 'JAQUI', '10', 1, 37),
(379, 'LOMAS', '11', 1, 37),
(380, 'QUICACHA', '12', 1, 37),
(381, 'YAUCA', '13', 1, 37),
(382, 'APLAO', '01', 1, 38),
(383, 'ANDAGUA', '02', 1, 38),
(384, 'AYO', '03', 1, 38),
(385, 'CHACHAS', '04', 1, 38),
(386, 'CHILCAYMARCA', '05', 1, 38),
(387, 'CHOCO', '06', 1, 38),
(388, 'HUANCARQUI', '07', 1, 38),
(389, 'MACHAGUAY', '08', 1, 38),
(390, 'ORCOPAMPA', '09', 1, 38),
(391, 'PAMPACOLCA', '10', 1, 38),
(392, 'TIPAN', '11', 1, 38),
(393, 'UÑON', '12', 1, 38),
(394, 'URACA', '13', 1, 38),
(395, 'VIRACO', '14', 1, 38),
(396, 'CHIVAY', '01', 1, 39),
(397, 'ACHOMA', '02', 1, 39),
(398, 'CABANACONDE', '03', 1, 39),
(399, 'CALLALLI', '04', 1, 39),
(400, 'CAYLLOMA', '05', 1, 39),
(401, 'COPORAQUE', '06', 1, 39),
(402, 'HUAMBO', '07', 1, 39),
(403, 'HUANCA', '08', 1, 39),
(404, 'ICHUPAMPA', '09', 1, 39),
(405, 'LARI', '10', 1, 39),
(406, 'LLUTA', '11', 1, 39),
(407, 'MACA', '12', 1, 39),
(408, 'MADRIGAL', '13', 1, 39),
(409, 'SAN ANTONIO DE CHUCA', '14', 1, 39),
(410, 'SIBAYO', '15', 1, 39),
(411, 'TAPAY', '16', 1, 39),
(412, 'TISCO', '17', 1, 39),
(413, 'TUTI', '18', 1, 39),
(414, 'YANQUE', '19', 1, 39),
(415, 'MAJES', '20', 1, 39),
(416, 'CHUQUIBAMBA', '01', 1, 40),
(417, 'ANDARAY', '02', 1, 40),
(418, 'CAYARANI', '03', 1, 40),
(419, 'CHICHAS', '04', 1, 40),
(420, 'IRAY', '05', 1, 40),
(421, 'RÍO GRANDE', '06', 1, 40),
(422, 'SALAMANCA', '07', 1, 40),
(423, 'YANAQUIHUA', '08', 1, 40),
(424, 'MOLLENDO', '01', 1, 41),
(425, 'COCACHACRA', '02', 1, 41),
(426, 'DEAN VALDIVIA', '03', 1, 41),
(427, 'ISLAY', '04', 1, 41),
(428, 'MEJIA', '05', 1, 41),
(429, 'PUNTA DE BOMBÓN', '06', 1, 41),
(430, 'COTAHUASI', '01', 1, 42),
(431, 'ALCA', '02', 1, 42),
(432, 'CHARCANA', '03', 1, 42),
(433, 'HUAYNACOTAS', '04', 1, 42),
(434, 'PAMPAMARCA', '05', 1, 42),
(435, 'PUYCA', '06', 1, 42),
(436, 'QUECHUALLA', '07', 1, 42),
(437, 'SAYLA', '08', 1, 42),
(438, 'TAURIA', '09', 1, 42),
(439, 'TOMEPAMPA', '10', 1, 42),
(440, 'TORO', '11', 1, 42),
(441, 'AYACUCHO', '01', 1, 43),
(442, 'ACOCRO', '02', 1, 43),
(443, 'ACOS VINCHOS', '03', 1, 43),
(444, 'CARMEN ALTO', '04', 1, 43),
(445, 'CHIARA', '05', 1, 43),
(446, 'OCROS', '06', 1, 43),
(447, 'PACAYCASA', '07', 1, 43),
(448, 'QUINUA', '08', 1, 43),
(449, 'SAN JOSÉ DE TICLLAS', '09', 1, 43),
(450, 'SAN JUAN BAUTISTA', '10', 1, 43),
(451, 'SANTIAGO DE PISCHA', '11', 1, 43),
(452, 'SOCOS', '12', 1, 43),
(453, 'TAMBILLO', '13', 1, 43),
(454, 'VINCHOS', '14', 1, 43),
(455, 'JESÚS NAZARENO', '15', 1, 43),
(456, 'ANDRÉS AVELINO CÁCERES DORREGARAY', '16', 1, 43),
(457, 'CANGALLO', '01', 1, 44),
(458, 'CHUSCHI', '02', 1, 44),
(459, 'LOS MOROCHUCOS', '03', 1, 44),
(460, 'MARÍA PARADO DE BELLIDO', '04', 1, 44),
(461, 'PARAS', '05', 1, 44),
(462, 'TOTOS', '06', 1, 44),
(463, 'SANCOS', '01', 1, 45),
(464, 'CARAPO', '02', 1, 45),
(465, 'SACSAMARCA', '03', 1, 45),
(466, 'SANTIAGO DE LUCANAMARCA', '04', 1, 45),
(467, 'HUANTA', '01', 1, 46),
(468, 'AYAHUANCO', '02', 1, 46),
(469, 'HUAMANGUILLA', '03', 1, 46),
(470, 'IGUAIN', '04', 1, 46),
(471, 'LURICOCHA', '05', 1, 46),
(472, 'SANTILLANA', '06', 1, 46),
(473, 'SIVIA', '07', 1, 46),
(474, 'LLOCHEGUA', '08', 1, 46),
(475, 'CANAYRE', '09', 1, 46),
(476, 'UCHURACCAY', '10', 1, 46),
(477, 'PUCACOLPA', '11', 1, 46),
(478, 'SAN MIGUEL', '01', 1, 47),
(479, 'ANCO', '02', 1, 47),
(480, 'AYNA', '03', 1, 47),
(481, 'CHILCAS', '04', 1, 47),
(482, 'CHUNGUI', '05', 1, 47),
(483, 'LUIS CARRANZA', '06', 1, 47),
(484, 'SANTA ROSA', '07', 1, 47),
(485, 'TAMBO', '08', 1, 47),
(486, 'SAMUGARI', '09', 1, 47),
(487, 'ANCHIHUAY', '10', 1, 47),
(488, 'PUQUIO', '01', 1, 48),
(489, 'AUCARA', '02', 1, 48),
(490, 'CABANA', '03', 1, 48),
(491, 'CARMEN SALCEDO', '04', 1, 48),
(492, 'CHAVIÑA', '05', 1, 48),
(493, 'CHIPAO', '06', 1, 48),
(494, 'HUAC-HUAS', '07', 1, 48),
(495, 'LARAMATE', '08', 1, 48),
(496, 'LEONCIO PRADO', '09', 1, 48),
(497, 'LLAUTA', '10', 1, 48),
(498, 'LUCANAS', '11', 1, 48),
(499, 'OCAÑA', '12', 1, 48),
(500, 'OTOCA', '13', 1, 48),
(501, 'SAISA', '14', 1, 48),
(502, 'SAN CRISTÓBAL', '15', 1, 48),
(503, 'SAN JUAN', '16', 1, 48),
(504, 'SAN PEDRO', '17', 1, 48),
(505, 'SAN PEDRO DE PALCO', '18', 1, 48),
(506, 'SANCOS', '19', 1, 48),
(507, 'SANTA ANA DE HUAYCAHUACHO', '20', 1, 48),
(508, 'SANTA LUCIA', '21', 1, 48),
(509, 'CORACORA', '01', 1, 49),
(510, 'CHUMPI', '02', 1, 49),
(511, 'CORONEL CASTAÑEDA', '03', 1, 49),
(512, 'PACAPAUSA', '04', 1, 49),
(513, 'PULLO', '05', 1, 49),
(514, 'PUYUSCA', '06', 1, 49),
(515, 'SAN FRANCISCO DE RAVACAYCO', '07', 1, 49),
(516, 'UPAHUACHO', '08', 1, 49),
(517, 'PAUSA', '01', 1, 50),
(518, 'COLTA', '02', 1, 50),
(519, 'CORCULLA', '03', 1, 50),
(520, 'LAMPA', '04', 1, 50),
(521, 'MARCABAMBA', '05', 1, 50),
(522, 'OYOLO', '06', 1, 50),
(523, 'PARARCA', '07', 1, 50),
(524, 'SAN JAVIER DE ALPABAMBA', '08', 1, 50),
(525, 'SAN JOSÉ DE USHUA', '09', 1, 50),
(526, 'SARA SARA', '10', 1, 50),
(527, 'QUEROBAMBA', '01', 1, 51),
(528, 'BELÉN', '02', 1, 51),
(529, 'CHALCOS', '03', 1, 51),
(530, 'CHILCAYOC', '04', 1, 51),
(531, 'HUACAÑA', '05', 1, 51),
(532, 'MORCOLLA', '06', 1, 51),
(533, 'PAICO', '07', 1, 51),
(534, 'SAN PEDRO DE LARCAY', '08', 1, 51),
(535, 'SAN SALVADOR DE QUIJE', '09', 1, 51),
(536, 'SANTIAGO DE PAUCARAY', '10', 1, 51),
(537, 'SORAS', '11', 1, 51),
(538, 'HUANCAPI', '01', 1, 52),
(539, 'ALCAMENCA', '02', 1, 52),
(540, 'APONGO', '03', 1, 52),
(541, 'ASQUIPATA', '04', 1, 52),
(542, 'CANARIA', '05', 1, 52),
(543, 'CAYARA', '06', 1, 52),
(544, 'COLCA', '07', 1, 52),
(545, 'HUAMANQUIQUIA', '08', 1, 52),
(546, 'HUANCARAYLLA', '09', 1, 52),
(547, 'HUAYA', '10', 1, 52),
(548, 'SARHUA', '11', 1, 52),
(549, 'VILCANCHOS', '12', 1, 52),
(550, 'VILCAS HUAMAN', '01', 1, 53),
(551, 'ACCOMARCA', '02', 1, 53),
(552, 'CARHUANCA', '03', 1, 53),
(553, 'CONCEPCIÓN', '04', 1, 53),
(554, 'HUAMBALPA', '05', 1, 53),
(555, 'INDEPENDENCIA', '06', 1, 53),
(556, 'SAURAMA', '07', 1, 53),
(557, 'VISCHONGO', '08', 1, 53),
(558, 'CAJAMARCA', '01', 1, 54),
(559, 'ASUNCIÓN', '02', 1, 54),
(560, 'CHETILLA', '03', 1, 54),
(561, 'COSPAN', '04', 1, 54),
(562, 'ENCAÑADA', '05', 1, 54),
(563, 'JESÚS', '06', 1, 54),
(564, 'LLACANORA', '07', 1, 54),
(565, 'LOS BAÑOS DEL INCA', '08', 1, 54),
(566, 'MAGDALENA', '09', 1, 54),
(567, 'MATARA', '10', 1, 54),
(568, 'NAMORA', '11', 1, 54),
(569, 'SAN JUAN', '12', 1, 54),
(570, 'CAJABAMBA', '01', 1, 55),
(571, 'CACHACHI', '02', 1, 55),
(572, 'CONDEBAMBA', '03', 1, 55),
(573, 'SITACOCHA', '04', 1, 55),
(574, 'CELENDÍN', '01', 1, 56),
(575, 'CHUMUCH', '02', 1, 56),
(576, 'CORTEGANA', '03', 1, 56),
(577, 'HUASMIN', '04', 1, 56),
(578, 'JORGE CHÁVEZ', '05', 1, 56),
(579, 'JOSÉ GÁLVEZ', '06', 1, 56),
(580, 'MIGUEL IGLESIAS', '07', 1, 56),
(581, 'OXAMARCA', '08', 1, 56),
(582, 'SOROCHUCO', '09', 1, 56),
(583, 'SUCRE', '10', 1, 56),
(584, 'UTCO', '11', 1, 56),
(585, 'LA LIBERTAD DE PALLAN', '12', 1, 56),
(586, 'CHOTA', '01', 1, 57),
(587, 'ANGUIA', '02', 1, 57),
(588, 'CHADIN', '03', 1, 57),
(589, 'CHIGUIRIP', '04', 1, 57),
(590, 'CHIMBAN', '05', 1, 57),
(591, 'CHOROPAMPA', '06', 1, 57),
(592, 'COCHABAMBA', '07', 1, 57),
(593, 'CONCHAN', '08', 1, 57),
(594, 'HUAMBOS', '09', 1, 57),
(595, 'LAJAS', '10', 1, 57),
(596, 'LLAMA', '11', 1, 57),
(597, 'MIRACOSTA', '12', 1, 57),
(598, 'PACCHA', '13', 1, 57),
(599, 'PION', '14', 1, 57),
(600, 'QUEROCOTO', '15', 1, 57),
(601, 'SAN JUAN DE LICUPIS', '16', 1, 57),
(602, 'TACABAMBA', '17', 1, 57),
(603, 'TOCMOCHE', '18', 1, 57),
(604, 'CHALAMARCA', '19', 1, 57),
(605, 'CONTUMAZA', '01', 1, 58),
(606, 'CHILETE', '02', 1, 58),
(607, 'CUPISNIQUE', '03', 1, 58),
(608, 'GUZMANGO', '04', 1, 58),
(609, 'SAN BENITO', '05', 1, 58),
(610, 'SANTA CRUZ DE TOLEDO', '06', 1, 58),
(611, 'TANTARICA', '07', 1, 58),
(612, 'YONAN', '08', 1, 58),
(613, 'CUTERVO', '01', 1, 59),
(614, 'CALLAYUC', '02', 1, 59),
(615, 'CHOROS', '03', 1, 59),
(616, 'CUJILLO', '04', 1, 59),
(617, 'LA RAMADA', '05', 1, 59),
(618, 'PIMPINGOS', '06', 1, 59),
(619, 'QUEROCOTILLO', '07', 1, 59),
(620, 'SAN ANDRÉS DE CUTERVO', '08', 1, 59),
(621, 'SAN JUAN DE CUTERVO', '09', 1, 59),
(622, 'SAN LUIS DE LUCMA', '10', 1, 59),
(623, 'SANTA CRUZ', '11', 1, 59),
(624, 'SANTO DOMINGO DE LA CAPILLA', '12', 1, 59),
(625, 'SANTO TOMAS', '13', 1, 59),
(626, 'SOCOTA', '14', 1, 59),
(627, 'TORIBIO CASANOVA', '15', 1, 59),
(628, 'BAMBAMARCA', '01', 1, 60),
(629, 'CHUGUR', '02', 1, 60),
(630, 'HUALGAYOC', '03', 1, 60),
(631, 'JAÉN', '01', 1, 61),
(632, 'BELLAVISTA', '02', 1, 61),
(633, 'CHONTALI', '03', 1, 61),
(634, 'COLASAY', '04', 1, 61),
(635, 'HUABAL', '05', 1, 61),
(636, 'LAS PIRIAS', '06', 1, 61),
(637, 'POMAHUACA', '07', 1, 61),
(638, 'PUCARA', '08', 1, 61),
(639, 'SALLIQUE', '09', 1, 61),
(640, 'SAN FELIPE', '10', 1, 61),
(641, 'SAN JOSÉ DEL ALTO', '11', 1, 61),
(642, 'SANTA ROSA', '12', 1, 61),
(643, 'SAN IGNACIO', '01', 1, 62),
(644, 'CHIRINOS', '02', 1, 62),
(645, 'HUARANGO', '03', 1, 62),
(646, 'LA COIPA', '04', 1, 62),
(647, 'NAMBALLE', '05', 1, 62),
(648, 'SAN JOSÉ DE LOURDES', '06', 1, 62),
(649, 'TABACONAS', '07', 1, 62),
(650, 'PEDRO GÁLVEZ', '01', 1, 63),
(651, 'CHANCAY', '02', 1, 63),
(652, 'EDUARDO VILLANUEVA', '03', 1, 63),
(653, 'GREGORIO PITA', '04', 1, 63),
(654, 'ICHOCAN', '05', 1, 63),
(655, 'JOSÉ MANUEL QUIROZ', '06', 1, 63),
(656, 'JOSÉ SABOGAL', '07', 1, 63),
(657, 'SAN MIGUEL', '01', 1, 64),
(658, 'BOLÍVAR', '02', 1, 64),
(659, 'CALQUIS', '03', 1, 64),
(660, 'CATILLUC', '04', 1, 64),
(661, 'EL PRADO', '05', 1, 64),
(662, 'LA FLORIDA', '06', 1, 64),
(663, 'LLAPA', '07', 1, 64),
(664, 'NANCHOC', '08', 1, 64),
(665, 'NIEPOS', '09', 1, 64),
(666, 'SAN GREGORIO', '10', 1, 64),
(667, 'SAN SILVESTRE DE COCHAN', '11', 1, 64),
(668, 'TONGOD', '12', 1, 64),
(669, 'UNIÓN AGUA BLANCA', '13', 1, 64),
(670, 'SAN PABLO', '01', 1, 65),
(671, 'SAN BERNARDINO', '02', 1, 65),
(672, 'SAN LUIS', '03', 1, 65),
(673, 'TUMBADEN', '04', 1, 65),
(674, 'SANTA CRUZ', '01', 1, 66),
(675, 'ANDABAMBA', '02', 1, 66),
(676, 'CATACHE', '03', 1, 66),
(677, 'CHANCAYBAÑOS', '04', 1, 66),
(678, 'LA ESPERANZA', '05', 1, 66),
(679, 'NINABAMBA', '06', 1, 66),
(680, 'PULAN', '07', 1, 66),
(681, 'SAUCEPAMPA', '08', 1, 66),
(682, 'SEXI', '09', 1, 66),
(683, 'UTICYACU', '10', 1, 66),
(684, 'YAUYUCAN', '11', 1, 66),
(685, 'CALLAO', '01', 1, 67),
(686, 'BELLAVISTA', '02', 1, 67),
(687, 'CARMEN DE LA LEGUA REYNOSO', '03', 1, 67),
(688, 'LA PERLA', '04', 1, 67),
(689, 'LA PUNTA', '05', 1, 67),
(690, 'VENTANILLA', '06', 1, 67),
(691, 'MI PERÚ', '07', 1, 67),
(692, 'CUSCO', '01', 1, 68),
(693, 'CCORCA', '02', 1, 68),
(694, 'POROY', '03', 1, 68),
(695, 'SAN JERÓNIMO', '04', 1, 68),
(696, 'SAN SEBASTIAN', '05', 1, 68),
(697, 'SANTIAGO', '06', 1, 68),
(698, 'SAYLLA', '07', 1, 68),
(699, 'WANCHAQ', '08', 1, 68),
(700, 'ACOMAYO', '01', 1, 69),
(701, 'ACOPIA', '02', 1, 69),
(702, 'ACOS', '03', 1, 69),
(703, 'MOSOC LLACTA', '04', 1, 69),
(704, 'POMACANCHI', '05', 1, 69),
(705, 'RONDOCAN', '06', 1, 69),
(706, 'SANGARARA', '07', 1, 69),
(707, 'ANTA', '01', 1, 70),
(708, 'ANCAHUASI', '02', 1, 70),
(709, 'CACHIMAYO', '03', 1, 70),
(710, 'CHINCHAYPUJIO', '04', 1, 70),
(711, 'HUAROCONDO', '05', 1, 70),
(712, 'LIMATAMBO', '06', 1, 70),
(713, 'MOLLEPATA', '07', 1, 70),
(714, 'PUCYURA', '08', 1, 70),
(715, 'ZURITE', '09', 1, 70),
(716, 'CALCA', '01', 1, 71),
(717, 'COYA', '02', 1, 71),
(718, 'LAMAY', '03', 1, 71),
(719, 'LARES', '04', 1, 71),
(720, 'PISAC', '05', 1, 71),
(721, 'SAN SALVADOR', '06', 1, 71),
(722, 'TARAY', '07', 1, 71),
(723, 'YANATILE', '08', 1, 71),
(724, 'YANAOCA', '01', 1, 72),
(725, 'CHECCA', '02', 1, 72),
(726, 'KUNTURKANKI', '03', 1, 72),
(727, 'LANGUI', '04', 1, 72),
(728, 'LAYO', '05', 1, 72),
(729, 'PAMPAMARCA', '06', 1, 72),
(730, 'QUEHUE', '07', 1, 72),
(731, 'TUPAC AMARU', '08', 1, 72),
(732, 'SICUANI', '01', 1, 73),
(733, 'CHECACUPE', '02', 1, 73),
(734, 'COMBAPATA', '03', 1, 73),
(735, 'MARANGANI', '04', 1, 73),
(736, 'PITUMARCA', '05', 1, 73),
(737, 'SAN PABLO', '06', 1, 73),
(738, 'SAN PEDRO', '07', 1, 73),
(739, 'TINTA', '08', 1, 73),
(740, 'SANTO TOMAS', '01', 1, 74),
(741, 'CAPACMARCA', '02', 1, 74),
(742, 'CHAMACA', '03', 1, 74),
(743, 'COLQUEMARCA', '04', 1, 74),
(744, 'LIVITACA', '05', 1, 74),
(745, 'LLUSCO', '06', 1, 74),
(746, 'QUIÑOTA', '07', 1, 74),
(747, 'VELILLE', '08', 1, 74),
(748, 'ESPINAR', '01', 1, 75),
(749, 'CONDOROMA', '02', 1, 75),
(750, 'COPORAQUE', '03', 1, 75),
(751, 'OCORURO', '04', 1, 75),
(752, 'PALLPATA', '05', 1, 75),
(753, 'PICHIGUA', '06', 1, 75),
(754, 'SUYCKUTAMBO', '07', 1, 75),
(755, 'ALTO PICHIGUA', '08', 1, 75),
(756, 'SANTA ANA', '01', 1, 76),
(757, 'ECHARATE', '02', 1, 76),
(758, 'HUAYOPATA', '03', 1, 76),
(759, 'MARANURA', '04', 1, 76),
(760, 'OCOBAMBA', '05', 1, 76),
(761, 'QUELLOUNO', '06', 1, 76),
(762, 'KIMBIRI', '07', 1, 76),
(763, 'SANTA TERESA', '08', 1, 76),
(764, 'VILCABAMBA', '09', 1, 76),
(765, 'PICHARI', '10', 1, 76),
(766, 'INKAWASI', '11', 1, 76),
(767, 'VILLA VIRGEN', '12', 1, 76),
(768, 'VILLA KINTIARINA', '13', 1, 76),
(769, 'PARURO', '01', 1, 77),
(770, 'ACCHA', '02', 1, 77),
(771, 'CCAPI', '03', 1, 77),
(772, 'COLCHA', '04', 1, 77),
(773, 'HUANOQUITE', '05', 1, 77),
(774, 'OMACHA', '06', 1, 77),
(775, 'PACCARITAMBO', '07', 1, 77),
(776, 'PILLPINTO', '08', 1, 77),
(777, 'YAURISQUE', '09', 1, 77),
(778, 'PAUCARTAMBO', '01', 1, 78),
(779, 'CAICAY', '02', 1, 78),
(780, 'CHALLABAMBA', '03', 1, 78),
(781, 'COLQUEPATA', '04', 1, 78),
(782, 'HUANCARANI', '05', 1, 78),
(783, 'KOSÑIPATA', '06', 1, 78),
(784, 'URCOS', '01', 1, 79),
(785, 'ANDAHUAYLILLAS', '02', 1, 79),
(786, 'CAMANTI', '03', 1, 79),
(787, 'CCARHUAYO', '04', 1, 79),
(788, 'CCATCA', '05', 1, 79),
(789, 'CUSIPATA', '06', 1, 79),
(790, 'HUARO', '07', 1, 79),
(791, 'LUCRE', '08', 1, 79),
(792, 'MARCAPATA', '09', 1, 79),
(793, 'OCONGATE', '10', 1, 79),
(794, 'OROPESA', '11', 1, 79),
(795, 'QUIQUIJANA', '12', 1, 79),
(796, 'URUBAMBA', '01', 1, 80),
(797, 'CHINCHERO', '02', 1, 80),
(798, 'HUAYLLABAMBA', '03', 1, 80),
(799, 'MACHUPICCHU', '04', 1, 80),
(800, 'MARAS', '05', 1, 80),
(801, 'OLLANTAYTAMBO', '06', 1, 80),
(802, 'YUCAY', '07', 1, 80),
(803, 'HUANCAVELICA', '01', 1, 81),
(804, 'ACOBAMBILLA', '02', 1, 81),
(805, 'ACORIA', '03', 1, 81),
(806, 'CONAYCA', '04', 1, 81),
(807, 'CUENCA', '05', 1, 81),
(808, 'HUACHOCOLPA', '06', 1, 81),
(809, 'HUAYLLAHUARA', '07', 1, 81),
(810, 'IZCUCHACA', '08', 1, 81),
(811, 'LARIA', '09', 1, 81),
(812, 'MANTA', '10', 1, 81),
(813, 'MARISCAL CÁCERES', '11', 1, 81),
(814, 'MOYA', '12', 1, 81),
(815, 'NUEVO OCCORO', '13', 1, 81),
(816, 'PALCA', '14', 1, 81),
(817, 'PILCHACA', '15', 1, 81),
(818, 'VILCA', '16', 1, 81),
(819, 'YAULI', '17', 1, 81),
(820, 'ASCENSIÓN', '18', 1, 81),
(821, 'HUANDO', '19', 1, 81),
(822, 'ACOBAMBA', '01', 1, 82),
(823, 'ANDABAMBA', '02', 1, 82),
(824, 'ANTA', '03', 1, 82),
(825, 'CAJA', '04', 1, 82),
(826, 'MARCAS', '05', 1, 82),
(827, 'PAUCARA', '06', 1, 82),
(828, 'POMACOCHA', '07', 1, 82),
(829, 'ROSARIO', '08', 1, 82),
(830, 'LIRCAY', '01', 1, 83),
(831, 'ANCHONGA', '02', 1, 83),
(832, 'CALLANMARCA', '03', 1, 83),
(833, 'CCOCHACCASA', '04', 1, 83),
(834, 'CHINCHO', '05', 1, 83),
(835, 'CONGALLA', '06', 1, 83),
(836, 'HUANCA-HUANCA', '07', 1, 83),
(837, 'HUAYLLAY GRANDE', '08', 1, 83),
(838, 'JULCAMARCA', '09', 1, 83),
(839, 'SAN ANTONIO DE ANTAPARCO', '10', 1, 83),
(840, 'SANTO TOMAS DE PATA', '11', 1, 83),
(841, 'SECCLLA', '12', 1, 83),
(842, 'CASTROVIRREYNA', '01', 1, 84),
(843, 'ARMA', '02', 1, 84),
(844, 'AURAHUA', '03', 1, 84),
(845, 'CAPILLAS', '04', 1, 84),
(846, 'CHUPAMARCA', '05', 1, 84),
(847, 'COCAS', '06', 1, 84),
(848, 'HUACHOS', '07', 1, 84),
(849, 'HUAMATAMBO', '08', 1, 84),
(850, 'MOLLEPAMPA', '09', 1, 84),
(851, 'SAN JUAN', '10', 1, 84),
(852, 'SANTA ANA', '11', 1, 84),
(853, 'TANTARA', '12', 1, 84),
(854, 'TICRAPO', '13', 1, 84),
(855, 'CHURCAMPA', '01', 1, 85),
(856, 'ANCO', '02', 1, 85),
(857, 'CHINCHIHUASI', '03', 1, 85),
(858, 'EL CARMEN', '04', 1, 85),
(859, 'LA MERCED', '05', 1, 85),
(860, 'LOCROJA', '06', 1, 85),
(861, 'PAUCARBAMBA', '07', 1, 85),
(862, 'SAN MIGUEL DE MAYOCC', '08', 1, 85),
(863, 'SAN PEDRO DE CORIS', '09', 1, 85),
(864, 'PACHAMARCA', '10', 1, 85),
(865, 'COSME', '11', 1, 85),
(866, 'HUAYTARA', '01', 1, 86),
(867, 'AYAVI', '02', 1, 86),
(868, 'CÓRDOVA', '03', 1, 86),
(869, 'HUAYACUNDO ARMA', '04', 1, 86),
(870, 'LARAMARCA', '05', 1, 86),
(871, 'OCOYO', '06', 1, 86),
(872, 'PILPICHACA', '07', 1, 86),
(873, 'QUERCO', '08', 1, 86),
(874, 'QUITO-ARMA', '09', 1, 86),
(875, 'SAN ANTONIO DE CUSICANCHA', '10', 1, 86),
(876, 'SAN FRANCISCO DE SANGAYAICO', '11', 1, 86),
(877, 'SAN ISIDRO', '12', 1, 86),
(878, 'SANTIAGO DE CHOCORVOS', '13', 1, 86),
(879, 'SANTIAGO DE QUIRAHUARA', '14', 1, 86),
(880, 'SANTO DOMINGO DE CAPILLAS', '15', 1, 86),
(881, 'TAMBO', '16', 1, 86),
(882, 'PAMPAS', '01', 1, 87),
(883, 'ACOSTAMBO', '02', 1, 87),
(884, 'ACRAQUIA', '03', 1, 87),
(885, 'AHUAYCHA', '04', 1, 87),
(886, 'COLCABAMBA', '05', 1, 87),
(887, 'DANIEL HERNÁNDEZ', '06', 1, 87),
(888, 'HUACHOCOLPA', '07', 1, 87),
(889, 'HUARIBAMBA', '09', 1, 87),
(890, 'ÑAHUIMPUQUIO', '10', 1, 87),
(891, 'PAZOS', '11', 1, 87),
(892, 'QUISHUAR', '13', 1, 87),
(893, 'SALCABAMBA', '14', 1, 87),
(894, 'SALCAHUASI', '15', 1, 87),
(895, 'SAN MARCOS DE ROCCHAC', '16', 1, 87),
(896, 'SURCUBAMBA', '17', 1, 87),
(897, 'TINTAY PUNCU', '18', 1, 87),
(898, 'QUICHUAS', '19', 1, 87),
(899, 'ANDAYMARCA', '20', 1, 87),
(900, 'HUANUCO', '01', 1, 88),
(901, 'AMARILIS', '02', 1, 88),
(902, 'CHINCHAO', '03', 1, 88),
(903, 'CHURUBAMBA', '04', 1, 88),
(904, 'MARGOS', '05', 1, 88),
(905, 'QUISQUI (KICHKI)', '06', 1, 88),
(906, 'SAN FRANCISCO DE CAYRAN', '07', 1, 88),
(907, 'SAN PEDRO DE CHAULAN', '08', 1, 88),
(908, 'SANTA MARÍA DEL VALLE', '09', 1, 88),
(909, 'YARUMAYO', '10', 1, 88),
(910, 'PILLCO MARCA', '11', 1, 88),
(911, 'YACUS', '12', 1, 88),
(912, 'AMBO', '01', 1, 89),
(913, 'CAYNA', '02', 1, 89),
(914, 'COLPAS', '03', 1, 89),
(915, 'CONCHAMARCA', '04', 1, 89),
(916, 'HUACAR', '05', 1, 89),
(917, 'SAN FRANCISCO', '06', 1, 89),
(918, 'SAN RAFAEL', '07', 1, 89),
(919, 'TOMAY KICHWA', '08', 1, 89),
(920, 'LA UNIÓN', '01', 1, 90),
(921, 'CHUQUIS', '07', 1, 90),
(922, 'MARÍAS', '11', 1, 90),
(923, 'PACHAS', '13', 1, 90),
(924, 'QUIVILLA', '16', 1, 90),
(925, 'RIPAN', '17', 1, 90),
(926, 'SHUNQUI', '21', 1, 90),
(927, 'SILLAPATA', '22', 1, 90),
(928, 'YANAS', '23', 1, 90),
(929, 'HUACAYBAMBA', '01', 1, 91),
(930, 'CANCHABAMBA', '02', 1, 91),
(931, 'COCHABAMBA', '03', 1, 91),
(932, 'PINRA', '04', 1, 91),
(933, 'LLATA', '01', 1, 92),
(934, 'ARANCAY', '02', 1, 92),
(935, 'CHAVÍN DE PARIARCA', '03', 1, 92),
(936, 'JACAS GRANDE', '04', 1, 92),
(937, 'JIRCAN', '05', 1, 92),
(938, 'MIRAFLORES', '06', 1, 92),
(939, 'MONZÓN', '07', 1, 92),
(940, 'PUNCHAO', '08', 1, 92),
(941, 'PUÑOS', '09', 1, 92),
(942, 'SINGA', '10', 1, 92),
(943, 'TANTAMAYO', '11', 1, 92),
(944, 'RUPA-RUPA', '01', 1, 93),
(945, 'DANIEL ALOMÍA ROBLES', '02', 1, 93),
(946, 'HERMÍLIO VALDIZAN', '03', 1, 93),
(947, 'JOSÉ CRESPO Y CASTILLO', '04', 1, 93),
(948, 'LUYANDO', '05', 1, 93),
(949, 'MARIANO DAMASO BERAUN', '06', 1, 93),
(950, 'HUACRACHUCO', '01', 1, 94),
(951, 'CHOLON', '02', 1, 94),
(952, 'SAN BUENAVENTURA', '03', 1, 94),
(953, 'PANAO', '01', 1, 95),
(954, 'CHAGLLA', '02', 1, 95),
(955, 'MOLINO', '03', 1, 95),
(956, 'UMARI', '04', 1, 95),
(957, 'PUERTO INCA', '01', 1, 96),
(958, 'CODO DEL POZUZO', '02', 1, 96),
(959, 'HONORIA', '03', 1, 96),
(960, 'TOURNAVISTA', '04', 1, 96),
(961, 'YUYAPICHIS', '05', 1, 96),
(962, 'JESÚS', '01', 1, 97),
(963, 'BAÑOS', '02', 1, 97),
(964, 'JIVIA', '03', 1, 97),
(965, 'QUEROPALCA', '04', 1, 97),
(966, 'RONDOS', '05', 1, 97),
(967, 'SAN FRANCISCO DE ASÍS', '06', 1, 97),
(968, 'SAN MIGUEL DE CAURI', '07', 1, 97),
(969, 'CHAVINILLO', '01', 1, 98),
(970, 'CAHUAC', '02', 1, 98),
(971, 'CHACABAMBA', '03', 1, 98),
(972, 'APARICIO POMARES', '04', 1, 98),
(973, 'JACAS CHICO', '05', 1, 98),
(974, 'OBAS', '06', 1, 98),
(975, 'PAMPAMARCA', '07', 1, 98),
(976, 'CHORAS', '08', 1, 98),
(977, 'ICA', '01', 1, 99),
(978, 'LA TINGUIÑA', '02', 1, 99),
(979, 'LOS AQUIJES', '03', 1, 99),
(980, 'OCUCAJE', '04', 1, 99),
(981, 'PACHACUTEC', '05', 1, 99),
(982, 'PARCONA', '06', 1, 99),
(983, 'PUEBLO NUEVO', '07', 1, 99),
(984, 'SALAS', '08', 1, 99),
(985, 'SAN JOSÉ DE LOS MOLINOS', '09', 1, 99),
(986, 'SAN JUAN BAUTISTA', '10', 1, 99),
(987, 'SANTIAGO', '11', 1, 99),
(988, 'SUBTANJALLA', '12', 1, 99),
(989, 'TATE', '13', 1, 99),
(990, 'YAUCA DEL ROSARIO', '14', 1, 99),
(991, 'CHINCHA ALTA', '01', 1, 100),
(992, 'ALTO LARAN', '02', 1, 100),
(993, 'CHAVIN', '03', 1, 100),
(994, 'CHINCHA BAJA', '04', 1, 100),
(995, 'EL CARMEN', '05', 1, 100),
(996, 'GROCIO PRADO', '06', 1, 100),
(997, 'PUEBLO NUEVO', '07', 1, 100),
(998, 'SAN JUAN DE YANAC', '08', 1, 100),
(999, 'SAN PEDRO DE HUACARPANA', '09', 1, 100),
(1000, 'SUNAMPE', '10', 1, 100),
(1001, 'TAMBO DE MORA', '11', 1, 100),
(1002, 'NASCA', '01', 1, 101),
(1003, 'CHANGUILLO', '02', 1, 101),
(1004, 'EL INGENIO', '03', 1, 101),
(1005, 'MARCONA', '04', 1, 101),
(1006, 'VISTA ALEGRE', '05', 1, 101),
(1007, 'PALPA', '01', 1, 102),
(1008, 'LLIPATA', '02', 1, 102),
(1009, 'RÍO GRANDE', '03', 1, 102),
(1010, 'SANTA CRUZ', '04', 1, 102),
(1011, 'TIBILLO', '05', 1, 102),
(1012, 'PISCO', '01', 1, 103),
(1013, 'HUANCANO', '02', 1, 103),
(1014, 'HUMAY', '03', 1, 103),
(1015, 'INDEPENDENCIA', '04', 1, 103),
(1016, 'PARACAS', '05', 1, 103),
(1017, 'SAN ANDRÉS', '06', 1, 103),
(1018, 'SAN CLEMENTE', '07', 1, 103),
(1019, 'TUPAC AMARU INCA', '08', 1, 103),
(1020, 'HUANCAYO', '01', 1, 104),
(1021, 'CARHUACALLANGA', '04', 1, 104),
(1022, 'CHACAPAMPA', '05', 1, 104),
(1023, 'CHICCHE', '06', 1, 104),
(1024, 'CHILCA', '07', 1, 104),
(1025, 'CHONGOS ALTO', '08', 1, 104),
(1026, 'CHUPURO', '11', 1, 104),
(1027, 'COLCA', '12', 1, 104),
(1028, 'CULLHUAS', '13', 1, 104),
(1029, 'EL TAMBO', '14', 1, 104),
(1030, 'HUACRAPUQUIO', '16', 1, 104),
(1031, 'HUALHUAS', '17', 1, 104),
(1032, 'HUANCAN', '19', 1, 104),
(1033, 'HUASICANCHA', '20', 1, 104),
(1034, 'HUAYUCACHI', '21', 1, 104),
(1035, 'INGENIO', '22', 1, 104),
(1036, 'PARIAHUANCA', '24', 1, 104),
(1037, 'PILCOMAYO', '25', 1, 104),
(1038, 'PUCARA', '26', 1, 104),
(1039, 'QUICHUAY', '27', 1, 104),
(1040, 'QUILCAS', '28', 1, 104),
(1041, 'SAN AGUSTÍN', '29', 1, 104),
(1042, 'SAN JERÓNIMO DE TUNAN', '30', 1, 104),
(1043, 'SAÑO', '32', 1, 104),
(1044, 'SAPALLANGA', '33', 1, 104),
(1045, 'SICAYA', '34', 1, 104),
(1046, 'SANTO DOMINGO DE ACOBAMBA', '35', 1, 104),
(1047, 'VIQUES', '36', 1, 104),
(1048, 'CONCEPCIÓN', '01', 1, 105),
(1049, 'ACO', '02', 1, 105),
(1050, 'ANDAMARCA', '03', 1, 105),
(1051, 'CHAMBARA', '04', 1, 105),
(1052, 'COCHAS', '05', 1, 105),
(1053, 'COMAS', '06', 1, 105),
(1054, 'HEROÍNAS TOLEDO', '07', 1, 105),
(1055, 'MANZANARES', '08', 1, 105),
(1056, 'MARISCAL CASTILLA', '09', 1, 105),
(1057, 'MATAHUASI', '10', 1, 105),
(1058, 'MITO', '11', 1, 105),
(1059, 'NUEVE DE JULIO', '12', 1, 105),
(1060, 'ORCOTUNA', '13', 1, 105),
(1061, 'SAN JOSÉ DE QUERO', '14', 1, 105),
(1062, 'SANTA ROSA DE OCOPA', '15', 1, 105),
(1063, 'CHANCHAMAYO', '01', 1, 106),
(1064, 'PERENE', '02', 1, 106),
(1065, 'PICHANAQUI', '03', 1, 106),
(1066, 'SAN LUIS DE SHUARO', '04', 1, 106),
(1067, 'SAN RAMÓN', '05', 1, 106),
(1068, 'VITOC', '06', 1, 106),
(1069, 'JAUJA', '01', 1, 107),
(1070, 'ACOLLA', '02', 1, 107),
(1071, 'APATA', '03', 1, 107),
(1072, 'ATAURA', '04', 1, 107),
(1073, 'CANCHAYLLO', '05', 1, 107),
(1074, 'CURICACA', '06', 1, 107),
(1075, 'EL MANTARO', '07', 1, 107),
(1076, 'HUAMALI', '08', 1, 107),
(1077, 'HUARIPAMPA', '09', 1, 107),
(1078, 'HUERTAS', '10', 1, 107),
(1079, 'JANJAILLO', '11', 1, 107),
(1080, 'JULCÁN', '12', 1, 107),
(1081, 'LEONOR ORDÓÑEZ', '13', 1, 107),
(1082, 'LLOCLLAPAMPA', '14', 1, 107),
(1083, 'MARCO', '15', 1, 107),
(1084, 'MASMA', '16', 1, 107),
(1085, 'MASMA CHICCHE', '17', 1, 107),
(1086, 'MOLINOS', '18', 1, 107),
(1087, 'MONOBAMBA', '19', 1, 107),
(1088, 'MUQUI', '20', 1, 107),
(1089, 'MUQUIYAUYO', '21', 1, 107),
(1090, 'PACA', '22', 1, 107),
(1091, 'PACCHA', '23', 1, 107),
(1092, 'PANCAN', '24', 1, 107),
(1093, 'PARCO', '25', 1, 107),
(1094, 'POMACANCHA', '26', 1, 107),
(1095, 'RICRAN', '27', 1, 107),
(1096, 'SAN LORENZO', '28', 1, 107),
(1097, 'SAN PEDRO DE CHUNAN', '29', 1, 107),
(1098, 'SAUSA', '30', 1, 107),
(1099, 'SINCOS', '31', 1, 107),
(1100, 'TUNAN MARCA', '32', 1, 107),
(1101, 'YAULI', '33', 1, 107),
(1102, 'YAUYOS', '34', 1, 107),
(1103, 'JUNIN', '01', 1, 108),
(1104, 'CARHUAMAYO', '02', 1, 108),
(1105, 'ONDORES', '03', 1, 108),
(1106, 'ULCUMAYO', '04', 1, 108),
(1107, 'SATIPO', '01', 1, 109),
(1108, 'COVIRIALI', '02', 1, 109),
(1109, 'LLAYLLA', '03', 1, 109),
(1110, 'MAZAMARI', '04', 1, 109),
(1111, 'PAMPA HERMOSA', '05', 1, 109),
(1112, 'PANGOA', '06', 1, 109),
(1113, 'RÍO NEGRO', '07', 1, 109),
(1114, 'RÍO TAMBO', '08', 1, 109),
(1115, 'VIZCATAN DEL ENE', '09', 1, 109),
(1116, 'TARMA', '01', 1, 110),
(1117, 'ACOBAMBA', '02', 1, 110),
(1118, 'HUARICOLCA', '03', 1, 110),
(1119, 'HUASAHUASI', '04', 1, 110),
(1120, 'LA UNIÓN', '05', 1, 110),
(1121, 'PALCA', '06', 1, 110),
(1122, 'PALCAMAYO', '07', 1, 110),
(1123, 'SAN PEDRO DE CAJAS', '08', 1, 110),
(1124, 'TAPO', '09', 1, 110),
(1125, 'LA OROYA', '01', 1, 111),
(1126, 'CHACAPALPA', '02', 1, 111),
(1127, 'HUAY-HUAY', '03', 1, 111),
(1128, 'MARCAPOMACOCHA', '04', 1, 111),
(1129, 'MOROCOCHA', '05', 1, 111),
(1130, 'PACCHA', '06', 1, 111),
(1131, 'SANTA BÁRBARA DE CARHUACAYAN', '07', 1, 111),
(1132, 'SANTA ROSA DE SACCO', '08', 1, 111),
(1133, 'SUITUCANCHA', '09', 1, 111),
(1134, 'YAULI', '10', 1, 111),
(1135, 'CHUPACA', '01', 1, 112),
(1136, 'AHUAC', '02', 1, 112),
(1137, 'CHONGOS BAJO', '03', 1, 112),
(1138, 'HUACHAC', '04', 1, 112),
(1139, 'HUAMANCACA CHICO', '05', 1, 112),
(1140, 'SAN JUAN DE ISCOS', '06', 1, 112),
(1141, 'SAN JUAN DE JARPA', '07', 1, 112),
(1142, 'TRES DE DICIEMBRE', '08', 1, 112),
(1143, 'YANACANCHA', '09', 1, 112),
(1144, 'TRUJILLO', '01', 1, 113),
(1145, 'EL PORVENIR', '02', 1, 113),
(1146, 'FLORENCIA DE MORA', '03', 1, 113),
(1147, 'HUANCHACO', '04', 1, 113),
(1148, 'LA ESPERANZA', '05', 1, 113),
(1149, 'LAREDO', '06', 1, 113),
(1150, 'MOCHE', '07', 1, 113),
(1151, 'POROTO', '08', 1, 113),
(1152, 'SALAVERRY', '09', 1, 113),
(1153, 'SIMBAL', '10', 1, 113),
(1154, 'VICTOR LARCO HERRERA', '11', 1, 113),
(1155, 'ASCOPE', '01', 1, 114),
(1156, 'CHICAMA', '02', 1, 114),
(1157, 'CHOCOPE', '03', 1, 114),
(1158, 'MAGDALENA DE CAO', '04', 1, 114),
(1159, 'PAIJAN', '05', 1, 114),
(1160, 'RÁZURI', '06', 1, 114),
(1161, 'SANTIAGO DE CAO', '07', 1, 114),
(1162, 'CASA GRANDE', '08', 1, 114),
(1163, 'BOLÍVAR', '01', 1, 115),
(1164, 'BAMBAMARCA', '02', 1, 115),
(1165, 'CONDORMARCA', '03', 1, 115),
(1166, 'LONGOTEA', '04', 1, 115),
(1167, 'UCHUMARCA', '05', 1, 115),
(1168, 'UCUNCHA', '06', 1, 115),
(1169, 'CHEPEN', '01', 1, 116),
(1170, 'PACANGA', '02', 1, 116),
(1171, 'PUEBLO NUEVO', '03', 1, 116),
(1172, 'JULCAN', '01', 1, 117),
(1173, 'CALAMARCA', '02', 1, 117),
(1174, 'CARABAMBA', '03', 1, 117),
(1175, 'HUASO', '04', 1, 117),
(1176, 'OTUZCO', '01', 1, 118),
(1177, 'AGALLPAMPA', '02', 1, 118),
(1178, 'CHARAT', '04', 1, 118),
(1179, 'HUARANCHAL', '05', 1, 118),
(1180, 'LA CUESTA', '06', 1, 118),
(1181, 'MACHE', '08', 1, 118),
(1182, 'PARANDAY', '10', 1, 118),
(1183, 'SALPO', '11', 1, 118),
(1184, 'SINSICAP', '13', 1, 118),
(1185, 'USQUIL', '14', 1, 118),
(1186, 'SAN PEDRO DE LLOC', '01', 1, 119),
(1187, 'GUADALUPE', '02', 1, 119),
(1188, 'JEQUETEPEQUE', '03', 1, 119),
(1189, 'PACASMAYO', '04', 1, 119),
(1190, 'SAN JOSÉ', '05', 1, 119),
(1191, 'TAYABAMBA', '01', 1, 120),
(1192, 'BULDIBUYO', '02', 1, 120),
(1193, 'CHILLIA', '03', 1, 120),
(1194, 'HUANCASPATA', '04', 1, 120),
(1195, 'HUAYLILLAS', '05', 1, 120),
(1196, 'HUAYO', '06', 1, 120),
(1197, 'ONGON', '07', 1, 120),
(1198, 'PARCOY', '08', 1, 120),
(1199, 'PATAZ', '09', 1, 120),
(1200, 'PIAS', '10', 1, 120),
(1201, 'SANTIAGO DE CHALLAS', '11', 1, 120),
(1202, 'TAURIJA', '12', 1, 120),
(1203, 'URPAY', '13', 1, 120),
(1204, 'HUAMACHUCO', '01', 1, 121),
(1205, 'CHUGAY', '02', 1, 121),
(1206, 'COCHORCO', '03', 1, 121),
(1207, 'CURGOS', '04', 1, 121),
(1208, 'MARCABAL', '05', 1, 121),
(1209, 'SANAGORAN', '06', 1, 121),
(1210, 'SARIN', '07', 1, 121),
(1211, 'SARTIMBAMBA', '08', 1, 121),
(1212, 'SANTIAGO DE CHUCO', '01', 1, 122),
(1213, 'ANGASMARCA', '02', 1, 122),
(1214, 'CACHICADAN', '03', 1, 122),
(1215, 'MOLLEBAMBA', '04', 1, 122),
(1216, 'MOLLEPATA', '05', 1, 122),
(1217, 'QUIRUVILCA', '06', 1, 122),
(1218, 'SANTA CRUZ DE CHUCA', '07', 1, 122),
(1219, 'SITABAMBA', '08', 1, 122),
(1220, 'CASCAS', '01', 1, 123),
(1221, 'LUCMA', '02', 1, 123),
(1222, 'MARMOT', '03', 1, 123),
(1223, 'SAYAPULLO', '04', 1, 123),
(1224, 'VIRU', '01', 1, 124),
(1225, 'CHAO', '02', 1, 124),
(1226, 'GUADALUPITO', '03', 1, 124),
(1227, 'CHICLAYO', '01', 1, 125),
(1228, 'CHONGOYAPE', '02', 1, 125),
(1229, 'ETEN', '03', 1, 125),
(1230, 'ETEN PUERTO', '04', 1, 125),
(1231, 'JOSÉ LEONARDO ORTIZ', '05', 1, 125),
(1232, 'LA VICTORIA', '06', 1, 125),
(1233, 'LAGUNAS', '07', 1, 125),
(1234, 'MONSEFU', '08', 1, 125),
(1235, 'NUEVA ARICA', '09', 1, 125),
(1236, 'OYOTUN', '10', 1, 125),
(1237, 'PICSI', '11', 1, 125),
(1238, 'PIMENTEL', '12', 1, 125),
(1239, 'REQUE', '13', 1, 125),
(1240, 'SANTA ROSA', '14', 1, 125),
(1241, 'SAÑA', '15', 1, 125),
(1242, 'CAYALTI', '16', 1, 125),
(1243, 'PATAPO', '17', 1, 125),
(1244, 'POMALCA', '18', 1, 125),
(1245, 'PUCALA', '19', 1, 125),
(1246, 'TUMAN', '20', 1, 125),
(1247, 'FERREÑAFE', '01', 1, 126),
(1248, 'CAÑARIS', '02', 1, 126),
(1249, 'INCAHUASI', '03', 1, 126),
(1250, 'MANUEL ANTONIO MESONES MURO', '04', 1, 126),
(1251, 'PITIPO', '05', 1, 126),
(1252, 'PUEBLO NUEVO', '06', 1, 126),
(1253, 'LAMBAYEQUE', '01', 1, 127),
(1254, 'CHOCHOPE', '02', 1, 127),
(1255, 'ILLIMO', '03', 1, 127),
(1256, 'JAYANCA', '04', 1, 127),
(1257, 'MOCHUMI', '05', 1, 127),
(1258, 'MORROPE', '06', 1, 127),
(1259, 'MOTUPE', '07', 1, 127),
(1260, 'OLMOS', '08', 1, 127),
(1261, 'PACORA', '09', 1, 127),
(1262, 'SALAS', '10', 1, 127),
(1263, 'SAN JOSÉ', '11', 1, 127),
(1264, 'TUCUME', '12', 1, 127),
(1265, 'LIMA', '01', 1, 128),
(1266, 'ANCÓN', '02', 1, 128),
(1267, 'ATE', '03', 1, 128),
(1268, 'BARRANCO', '04', 1, 128),
(1269, 'BREÑA', '05', 1, 128),
(1270, 'CARABAYLLO', '06', 1, 128),
(1271, 'CHACLACAYO', '07', 1, 128),
(1272, 'CHORRILLOS', '08', 1, 128),
(1273, 'CIENEGUILLA', '09', 1, 128),
(1274, 'COMAS', '10', 1, 128),
(1275, 'EL AGUSTINO', '11', 1, 128),
(1276, 'INDEPENDENCIA', '12', 1, 128),
(1277, 'JESÚS MARÍA', '13', 1, 128),
(1278, 'LA MOLINA', '14', 1, 128),
(1279, 'LA VICTORIA', '15', 1, 128),
(1280, 'LINCE', '16', 1, 128),
(1281, 'LOS OLIVOS', '17', 1, 128),
(1282, 'LURIGANCHO', '18', 1, 128),
(1283, 'LURIN', '19', 1, 128),
(1284, 'MAGDALENA DEL MAR', '20', 1, 128),
(1285, 'PUEBLO LIBRE', '21', 1, 128),
(1286, 'MIRAFLORES', '22', 1, 128),
(1287, 'PACHACAMAC', '23', 1, 128),
(1288, 'PUCUSANA', '24', 1, 128),
(1289, 'PUENTE PIEDRA', '25', 1, 128),
(1290, 'PUNTA HERMOSA', '26', 1, 128),
(1291, 'PUNTA NEGRA', '27', 1, 128),
(1292, 'RÍMAC', '28', 1, 128),
(1293, 'SAN BARTOLO', '29', 1, 128),
(1294, 'SAN BORJA', '30', 1, 128),
(1295, 'SAN ISIDRO', '31', 1, 128),
(1296, 'SAN JUAN DE LURIGANCHO', '32', 1, 128),
(1297, 'SAN JUAN DE MIRAFLORES', '33', 1, 128),
(1298, 'SAN LUIS', '34', 1, 128),
(1299, 'SAN MARTÍN DE PORRES', '35', 1, 128),
(1300, 'SAN MIGUEL', '36', 1, 128),
(1301, 'SANTA ANITA', '37', 1, 128),
(1302, 'SANTA MARÍA DEL MAR', '38', 1, 128),
(1303, 'SANTA ROSA', '39', 1, 128),
(1304, 'SANTIAGO DE SURCO', '40', 1, 128),
(1305, 'SURQUILLO', '41', 1, 128),
(1306, 'VILLA EL SALVADOR', '42', 1, 128),
(1307, 'VILLA MARÍA DEL TRIUNFO', '43', 1, 128),
(1308, 'BARRANCA', '01', 1, 129),
(1309, 'PARAMONGA', '02', 1, 129),
(1310, 'PATIVILCA', '03', 1, 129),
(1311, 'SUPE', '04', 1, 129),
(1312, 'SUPE PUERTO', '05', 1, 129),
(1313, 'CAJATAMBO', '01', 1, 130),
(1314, 'COPA', '02', 1, 130),
(1315, 'GORGOR', '03', 1, 130),
(1316, 'HUANCAPON', '04', 1, 130),
(1317, 'MANAS', '05', 1, 130),
(1318, 'CANTA', '01', 1, 131),
(1319, 'ARAHUAY', '02', 1, 131),
(1320, 'HUAMANTANGA', '03', 1, 131),
(1321, 'HUAROS', '04', 1, 131),
(1322, 'LACHAQUI', '05', 1, 131),
(1323, 'SAN BUENAVENTURA', '06', 1, 131),
(1324, 'SANTA ROSA DE QUIVES', '07', 1, 131),
(1325, 'SAN VICENTE DE CAÑETE', '01', 1, 132),
(1326, 'ASIA', '02', 1, 132),
(1327, 'CALANGO', '03', 1, 132),
(1328, 'CERRO AZUL', '04', 1, 132),
(1329, 'CHILCA', '05', 1, 132),
(1330, 'COAYLLO', '06', 1, 132),
(1331, 'IMPERIAL', '07', 1, 132),
(1332, 'LUNAHUANA', '08', 1, 132),
(1333, 'MALA', '09', 1, 132),
(1334, 'NUEVO IMPERIAL', '10', 1, 132),
(1335, 'PACARAN', '11', 1, 132),
(1336, 'QUILMANA', '12', 1, 132),
(1337, 'SAN ANTONIO', '13', 1, 132),
(1338, 'SAN LUIS', '14', 1, 132),
(1339, 'SANTA CRUZ DE FLORES', '15', 1, 132),
(1340, 'ZÚÑIGA', '16', 1, 132),
(1341, 'HUARAL', '01', 1, 133),
(1342, 'ATAVILLOS ALTO', '02', 1, 133),
(1343, 'ATAVILLOS BAJO', '03', 1, 133),
(1344, 'AUCALLAMA', '04', 1, 133),
(1345, 'CHANCAY', '05', 1, 133),
(1346, 'IHUARI', '06', 1, 133),
(1347, 'LAMPIAN', '07', 1, 133),
(1348, 'PACARAOS', '08', 1, 133),
(1349, 'SAN MIGUEL DE ACOS', '09', 1, 133),
(1350, 'SANTA CRUZ DE ANDAMARCA', '10', 1, 133),
(1351, 'SUMBILCA', '11', 1, 133),
(1352, 'VEINTISIETE DE NOVIEMBRE', '12', 1, 133),
(1353, 'MATUCANA', '01', 1, 134),
(1354, 'ANTIOQUIA', '02', 1, 134),
(1355, 'CALLAHUANCA', '03', 1, 134),
(1356, 'CARAMPOMA', '04', 1, 134),
(1357, 'CHICLA', '05', 1, 134),
(1358, 'CUENCA', '06', 1, 134),
(1359, 'HUACHUPAMPA', '07', 1, 134),
(1360, 'HUANZA', '08', 1, 134),
(1361, 'HUAROCHIRI', '09', 1, 134),
(1362, 'LAHUAYTAMBO', '10', 1, 134),
(1363, 'LANGA', '11', 1, 134),
(1364, 'LARAOS', '12', 1, 134),
(1365, 'MARIATANA', '13', 1, 134),
(1366, 'RICARDO PALMA', '14', 1, 134),
(1367, 'SAN ANDRÉS DE TUPICOCHA', '15', 1, 134),
(1368, 'SAN ANTONIO', '16', 1, 134),
(1369, 'SAN BARTOLOMÉ', '17', 1, 134),
(1370, 'SAN DAMIAN', '18', 1, 134),
(1371, 'SAN JUAN DE IRIS', '19', 1, 134),
(1372, 'SAN JUAN DE TANTARANCHE', '20', 1, 134),
(1373, 'SAN LORENZO DE QUINTI', '21', 1, 134),
(1374, 'SAN MATEO', '22', 1, 134),
(1375, 'SAN MATEO DE OTAO', '23', 1, 134),
(1376, 'SAN PEDRO DE CASTA', '24', 1, 134),
(1377, 'SAN PEDRO DE HUANCAYRE', '25', 1, 134),
(1378, 'SANGALLAYA', '26', 1, 134),
(1379, 'SANTA CRUZ DE COCACHACRA', '27', 1, 134),
(1380, 'SANTA EULALIA', '28', 1, 134),
(1381, 'SANTIAGO DE ANCHUCAYA', '29', 1, 134),
(1382, 'SANTIAGO DE TUNA', '30', 1, 134),
(1383, 'SANTO DOMINGO DE LOS OLLEROS', '31', 1, 134),
(1384, 'SURCO', '32', 1, 134),
(1385, 'HUACHO', '01', 1, 135),
(1386, 'AMBAR', '02', 1, 135),
(1387, 'CALETA DE CARQUIN', '03', 1, 135),
(1388, 'CHECRAS', '04', 1, 135),
(1389, 'HUALMAY', '05', 1, 135),
(1390, 'HUAURA', '06', 1, 135),
(1391, 'LEONCIO PRADO', '07', 1, 135),
(1392, 'PACCHO', '08', 1, 135),
(1393, 'SANTA LEONOR', '09', 1, 135),
(1394, 'SANTA MARÍA', '10', 1, 135),
(1395, 'SAYAN', '11', 1, 135),
(1396, 'VEGUETA', '12', 1, 135),
(1397, 'OYON', '01', 1, 136),
(1398, 'ANDAJES', '02', 1, 136),
(1399, 'CAUJUL', '03', 1, 136),
(1400, 'COCHAMARCA', '04', 1, 136),
(1401, 'NAVAN', '05', 1, 136),
(1402, 'PACHANGARA', '06', 1, 136),
(1403, 'YAUYOS', '01', 1, 137),
(1404, 'ALIS', '02', 1, 137),
(1405, 'ALLAUCA', '03', 1, 137),
(1406, 'AYAVIRI', '04', 1, 137),
(1407, 'AZÁNGARO', '05', 1, 137),
(1408, 'CACRA', '06', 1, 137),
(1409, 'CARANIA', '07', 1, 137),
(1410, 'CATAHUASI', '08', 1, 137),
(1411, 'CHOCOS', '09', 1, 137),
(1412, 'COCHAS', '10', 1, 137),
(1413, 'COLONIA', '11', 1, 137),
(1414, 'HONGOS', '12', 1, 137),
(1415, 'HUAMPARA', '13', 1, 137),
(1416, 'HUANCAYA', '14', 1, 137),
(1417, 'HUANGASCAR', '15', 1, 137),
(1418, 'HUANTAN', '16', 1, 137),
(1419, 'HUAÑEC', '17', 1, 137),
(1420, 'LARAOS', '18', 1, 137),
(1421, 'LINCHA', '19', 1, 137),
(1422, 'MADEAN', '20', 1, 137),
(1423, 'MIRAFLORES', '21', 1, 137),
(1424, 'OMAS', '22', 1, 137),
(1425, 'PUTINZA', '23', 1, 137),
(1426, 'QUINCHES', '24', 1, 137),
(1427, 'QUINOCAY', '25', 1, 137),
(1428, 'SAN JOAQUÍN', '26', 1, 137),
(1429, 'SAN PEDRO DE PILAS', '27', 1, 137),
(1430, 'TANTA', '28', 1, 137),
(1431, 'TAURIPAMPA', '29', 1, 137),
(1432, 'TOMAS', '30', 1, 137),
(1433, 'TUPE', '31', 1, 137),
(1434, 'VIÑAC', '32', 1, 137),
(1435, 'VITIS', '33', 1, 137),
(1436, 'IQUITOS', '01', 1, 138),
(1437, 'ALTO NANAY', '02', 1, 138),
(1438, 'FERNANDO LORES', '03', 1, 138),
(1439, 'INDIANA', '04', 1, 138),
(1440, 'LAS AMAZONAS', '05', 1, 138),
(1441, 'MAZAN', '06', 1, 138),
(1442, 'NAPO', '07', 1, 138),
(1443, 'PUNCHANA', '08', 1, 138),
(1444, 'TORRES CAUSANA', '10', 1, 138),
(1445, 'BELÉN', '12', 1, 138),
(1446, 'SAN JUAN BAUTISTA', '13', 1, 138),
(1447, 'YURIMAGUAS', '01', 1, 139),
(1448, 'BALSAPUERTO', '02', 1, 139),
(1449, 'JEBEROS', '05', 1, 139),
(1450, 'LAGUNAS', '06', 1, 139),
(1451, 'SANTA CRUZ', '10', 1, 139),
(1452, 'TENIENTE CESAR LÓPEZ ROJAS', '11', 1, 139),
(1453, 'NAUTA', '01', 1, 140),
(1454, 'PARINARI', '02', 1, 140),
(1455, 'TIGRE', '03', 1, 140),
(1456, 'TROMPETEROS', '04', 1, 140),
(1457, 'URARINAS', '05', 1, 140),
(1458, 'RAMÓN CASTILLA', '01', 1, 141),
(1459, 'PEBAS', '02', 1, 141),
(1460, 'YAVARI', '03', 1, 141),
(1461, 'SAN PABLO', '04', 1, 141),
(1462, 'REQUENA', '01', 1, 142),
(1463, 'ALTO TAPICHE', '02', 1, 142),
(1464, 'CAPELO', '03', 1, 142),
(1465, 'EMILIO SAN MARTÍN', '04', 1, 142),
(1466, 'MAQUIA', '05', 1, 142),
(1467, 'PUINAHUA', '06', 1, 142),
(1468, 'SAQUENA', '07', 1, 142),
(1469, 'SOPLIN', '08', 1, 142),
(1470, 'TAPICHE', '09', 1, 142),
(1471, 'JENARO HERRERA', '10', 1, 142),
(1472, 'YAQUERANA', '11', 1, 142),
(1473, 'CONTAMANA', '01', 1, 143),
(1474, 'INAHUAYA', '02', 1, 143),
(1475, 'PADRE MÁRQUEZ', '03', 1, 143),
(1476, 'PAMPA HERMOSA', '04', 1, 143),
(1477, 'SARAYACU', '05', 1, 143),
(1478, 'VARGAS GUERRA', '06', 1, 143),
(1479, 'BARRANCA', '01', 1, 144),
(1480, 'CAHUAPANAS', '02', 1, 144),
(1481, 'MANSERICHE', '03', 1, 144),
(1482, 'MORONA', '04', 1, 144),
(1483, 'PASTAZA', '05', 1, 144),
(1484, 'ANDOAS', '06', 1, 144),
(1485, 'PUTUMAYO', '01', 1, 145),
(1486, 'ROSA PANDURO', '02', 1, 145),
(1487, 'TENIENTE MANUEL CLAVERO', '03', 1, 145),
(1488, 'YAGUAS', '04', 1, 145),
(1489, 'TAMBOPATA', '01', 1, 146),
(1490, 'INAMBARI', '02', 1, 146),
(1491, 'LAS PIEDRAS', '03', 1, 146),
(1492, 'LABERINTO', '04', 1, 146),
(1493, 'MANU', '01', 1, 147),
(1494, 'FITZCARRALD', '02', 1, 147),
(1495, 'MADRE DE DIOS', '03', 1, 147),
(1496, 'HUEPETUHE', '04', 1, 147),
(1497, 'IÑAPARI', '01', 1, 148),
(1498, 'IBERIA', '02', 1, 148),
(1499, 'TAHUAMANU', '03', 1, 148),
(1500, 'MOQUEGUA', '01', 1, 149),
(1501, 'CARUMAS', '02', 1, 149),
(1502, 'CUCHUMBAYA', '03', 1, 149),
(1503, 'SAMEGUA', '04', 1, 149),
(1504, 'SAN CRISTÓBAL', '05', 1, 149),
(1505, 'TORATA', '06', 1, 149),
(1506, 'OMATE', '01', 1, 150),
(1507, 'CHOJATA', '02', 1, 150),
(1508, 'COALAQUE', '03', 1, 150),
(1509, 'ICHUÑA', '04', 1, 150),
(1510, 'LA CAPILLA', '05', 1, 150),
(1511, 'LLOQUE', '06', 1, 150),
(1512, 'MATALAQUE', '07', 1, 150),
(1513, 'PUQUINA', '08', 1, 150),
(1514, 'QUINISTAQUILLAS', '09', 1, 150),
(1515, 'UBINAS', '10', 1, 150),
(1516, 'YUNGA', '11', 1, 150),
(1517, 'ILO', '01', 1, 151),
(1518, 'EL ALGARROBAL', '02', 1, 151),
(1519, 'PACOCHA', '03', 1, 151),
(1520, 'CHAUPIMARCA', '01', 1, 152),
(1521, 'HUACHON', '02', 1, 152),
(1522, 'HUARIACA', '03', 1, 152),
(1523, 'HUAYLLAY', '04', 1, 152),
(1524, 'NINACACA', '05', 1, 152),
(1525, 'PALLANCHACRA', '06', 1, 152),
(1526, 'PAUCARTAMBO', '07', 1, 152),
(1527, 'SAN FRANCISCO DE ASÍS DE YARUSYACAN', '08', 1, 152),
(1528, 'SIMON BOLÍVAR', '09', 1, 152),
(1529, 'TICLACAYAN', '10', 1, 152),
(1530, 'TINYAHUARCO', '11', 1, 152),
(1531, 'VICCO', '12', 1, 152),
(1532, 'YANACANCHA', '13', 1, 152),
(1533, 'YANAHUANCA', '01', 1, 153),
(1534, 'CHACAYAN', '02', 1, 153),
(1535, 'GOYLLARISQUIZGA', '03', 1, 153),
(1536, 'PAUCAR', '04', 1, 153),
(1537, 'SAN PEDRO DE PILLAO', '05', 1, 153),
(1538, 'SANTA ANA DE TUSI', '06', 1, 153),
(1539, 'TAPUC', '07', 1, 153),
(1540, 'VILCABAMBA', '08', 1, 153),
(1541, 'OXAPAMPA', '01', 1, 154),
(1542, 'CHONTABAMBA', '02', 1, 154),
(1543, 'HUANCABAMBA', '03', 1, 154),
(1544, 'PALCAZU', '04', 1, 154),
(1545, 'POZUZO', '05', 1, 154),
(1546, 'PUERTO BERMÚDEZ', '06', 1, 154),
(1547, 'VILLA RICA', '07', 1, 154),
(1548, 'CONSTITUCIÓN', '08', 1, 154),
(1549, 'PIURA', '01', 1, 155),
(1550, 'CASTILLA', '04', 1, 155),
(1551, 'ATACAOS', '05', 1, 155),
(1552, 'CURA MORI', '07', 1, 155),
(1553, 'EL TALLAN', '08', 1, 155),
(1554, 'LA ARENA', '09', 1, 155),
(1555, 'LA UNIÓN', '10', 1, 155),
(1556, 'LAS LOMAS', '11', 1, 155),
(1557, 'TAMBO GRANDE', '14', 1, 155),
(1558, 'VEINTISEIS DE OCTUBRE', '15', 1, 155),
(1559, 'AYABACA', '01', 1, 156),
(1560, 'FRIAS', '02', 1, 156),
(1561, 'JILILI', '03', 1, 156),
(1562, 'LAGUNAS', '04', 1, 156),
(1563, 'MONTERO', '05', 1, 156),
(1564, 'PACAIPAMPA', '06', 1, 156),
(1565, 'PAIMAS', '07', 1, 156),
(1566, 'SAPILLICA', '08', 1, 156);
INSERT INTO `distrito` (`id`, `nombre`, `ubigeo`, `estado`, `provincia_id`) VALUES
(1567, 'SICCHEZ', '09', 1, 156),
(1568, 'SUYO', '10', 1, 156),
(1569, 'HUANCABAMBA', '01', 1, 157),
(1570, 'CANCHAQUE', '02', 1, 157),
(1571, 'EL CARMEN DE LA FRONTERA', '03', 1, 157),
(1572, 'HUARMACA', '04', 1, 157),
(1573, 'LALAQUIZ', '05', 1, 157),
(1574, 'SAN MIGUEL DE EL FAIQUE', '06', 1, 157),
(1575, 'SONDOR', '07', 1, 157),
(1576, 'SONDORILLO', '08', 1, 157),
(1577, 'CHULUCANAS', '01', 1, 158),
(1578, 'BUENOS AIRES', '02', 1, 158),
(1579, 'CHALACO', '03', 1, 158),
(1580, 'LA MATANZA', '04', 1, 158),
(1581, 'MORROPON', '05', 1, 158),
(1582, 'SALITRAL', '06', 1, 158),
(1583, 'SAN JUAN DE BIGOTE', '07', 1, 158),
(1584, 'SANTA CATALINA DE MOSSA', '08', 1, 158),
(1585, 'SANTO DOMINGO', '09', 1, 158),
(1586, 'YAMANGO', '10', 1, 158),
(1587, 'PAITA', '01', 1, 159),
(1588, 'AMOTAPE', '02', 1, 159),
(1589, 'ARENAL', '03', 1, 159),
(1590, 'COLAN', '04', 1, 159),
(1591, 'LA HUACA', '05', 1, 159),
(1592, 'TAMARINDO', '06', 1, 159),
(1593, 'VICHAYAL', '07', 1, 159),
(1594, 'SULLANA', '01', 1, 160),
(1595, 'BELLAVISTA', '02', 1, 160),
(1596, 'IGNACIO ESCUDERO', '03', 1, 160),
(1597, 'LANCONES', '04', 1, 160),
(1598, 'MARCAVELICA', '05', 1, 160),
(1599, 'MIGUEL CHECA', '06', 1, 160),
(1600, 'QUERECOTILLO', '07', 1, 160),
(1601, 'SALITRAL', '08', 1, 160),
(1602, 'PARIÑAS', '01', 1, 161),
(1603, 'EL ALTO', '02', 1, 161),
(1604, 'LA BREA', '03', 1, 161),
(1605, 'LOBITOS', '04', 1, 161),
(1606, 'LOS ORGANOS', '05', 1, 161),
(1607, 'MANCORA', '06', 1, 161),
(1608, 'SECHURA', '01', 1, 162),
(1609, 'BELLAVISTA DE LA UNIÓN', '02', 1, 162),
(1610, 'BERNAL', '03', 1, 162),
(1611, 'CRISTO NOS VALGA', '04', 1, 162),
(1612, 'VICE', '05', 1, 162),
(1613, 'RINCONADA LLICUAR', '06', 1, 162),
(1614, 'PUNO', '01', 1, 163),
(1615, 'ACORA', '02', 1, 163),
(1616, 'AMANTANI', '03', 1, 163),
(1617, 'ATUNCOLLA', '04', 1, 163),
(1618, 'CAPACHICA', '05', 1, 163),
(1619, 'CHUCUITO', '06', 1, 163),
(1620, 'COATA', '07', 1, 163),
(1621, 'HUATA', '08', 1, 163),
(1622, 'MAÑAZO', '09', 1, 163),
(1623, 'PAUCARCOLLA', '10', 1, 163),
(1624, 'PICHACANI', '11', 1, 163),
(1625, 'PLATERIA', '12', 1, 163),
(1626, 'SAN ANTONIO', '13', 1, 163),
(1627, 'TIQUILLACA', '14', 1, 163),
(1628, 'VILQUE', '15', 1, 163),
(1629, 'AZÁNGARO', '01', 1, 164),
(1630, 'ACHAYA', '02', 1, 164),
(1631, 'ARAPA', '03', 1, 164),
(1632, 'ASILLO', '04', 1, 164),
(1633, 'CAMINACA', '05', 1, 164),
(1634, 'CHUPA', '06', 1, 164),
(1635, 'JOSÉ DOMINGO CHOQUEHUANCA', '07', 1, 164),
(1636, 'MUÑANI', '08', 1, 164),
(1637, 'POTONI', '09', 1, 164),
(1638, 'SAMAN', '10', 1, 164),
(1639, 'SAN ANTON', '11', 1, 164),
(1640, 'SAN JOSÉ', '12', 1, 164),
(1641, 'SAN JUAN DE SALINAS', '13', 1, 164),
(1642, 'SANTIAGO DE PUPUJA', '14', 1, 164),
(1643, 'TIRAPATA', '15', 1, 164),
(1644, 'MACUSANI', '01', 1, 165),
(1645, 'AJOYANI', '02', 1, 165),
(1646, 'AYAPATA', '03', 1, 165),
(1647, 'COASA', '04', 1, 165),
(1648, 'CORANI', '05', 1, 165),
(1649, 'CRUCERO', '06', 1, 165),
(1650, 'ITUATA', '07', 1, 165),
(1651, 'OLLACHEA', '08', 1, 165),
(1652, 'SAN GABAN', '09', 1, 165),
(1653, 'USICAYOS', '10', 1, 165),
(1654, 'JULI', '01', 1, 166),
(1655, 'DESAGUADERO', '02', 1, 166),
(1656, 'HUACULLANI', '03', 1, 166),
(1657, 'KELLUYO', '04', 1, 166),
(1658, 'PISACOMA', '05', 1, 166),
(1659, 'POMATA', '06', 1, 166),
(1660, 'ZEPITA', '07', 1, 166),
(1661, 'ILAVE', '01', 1, 167),
(1662, 'CAPAZO', '02', 1, 167),
(1663, 'PILCUYO', '03', 1, 167),
(1664, 'SANTA ROSA', '04', 1, 167),
(1665, 'CONDURIRI', '05', 1, 167),
(1666, 'HUANCANE', '01', 1, 168),
(1667, 'COJATA', '02', 1, 168),
(1668, 'HUATASANI', '03', 1, 168),
(1669, 'INCHUPALLA', '04', 1, 168),
(1670, 'PUSI', '05', 1, 168),
(1671, 'ROSASPATA', '06', 1, 168),
(1672, 'TARACO', '07', 1, 168),
(1673, 'VILQUE CHICO', '08', 1, 168),
(1674, 'LAMPA', '01', 1, 169),
(1675, 'CABANILLA', '02', 1, 169),
(1676, 'CALAPUJA', '03', 1, 169),
(1677, 'NICASIO', '04', 1, 169),
(1678, 'OCUVIRI', '05', 1, 169),
(1679, 'PALCA', '06', 1, 169),
(1680, 'PARATIA', '07', 1, 169),
(1681, 'PUCARA', '08', 1, 169),
(1682, 'SANTA LUCIA', '09', 1, 169),
(1683, 'VILAVILA', '10', 1, 169),
(1684, 'AYAVIRI', '01', 1, 170),
(1685, 'ANTAUTA', '02', 1, 170),
(1686, 'CUPI', '03', 1, 170),
(1687, 'LLALLI', '04', 1, 170),
(1688, 'MACARI', '05', 1, 170),
(1689, 'NUÑOA', '06', 1, 170),
(1690, 'ORURILLO', '07', 1, 170),
(1691, 'SANTA ROSA', '08', 1, 170),
(1692, 'UMACHIRI', '09', 1, 170),
(1693, 'MOHO', '01', 1, 171),
(1694, 'CONIMA', '02', 1, 171),
(1695, 'HUAYRAPATA', '03', 1, 171),
(1696, 'TILALI', '04', 1, 171),
(1697, 'PUTINA', '01', 1, 172),
(1698, 'ANANEA', '02', 1, 172),
(1699, 'PEDRO VILCA APAZA', '03', 1, 172),
(1700, 'QUILCAPUNCU', '04', 1, 172),
(1701, 'SINA', '05', 1, 172),
(1702, 'JULIACA', '01', 1, 173),
(1703, 'CABANA', '02', 1, 173),
(1704, 'CABANILLAS', '03', 1, 173),
(1705, 'CARACOTO', '04', 1, 173),
(1706, 'SANDIA', '01', 1, 174),
(1707, 'CUYOCUYO', '02', 1, 174),
(1708, 'LIMBANI', '03', 1, 174),
(1709, 'PATAMBUCO', '04', 1, 174),
(1710, 'PHARA', '05', 1, 174),
(1711, 'QUIACA', '06', 1, 174),
(1712, 'SAN JUAN DEL ORO', '07', 1, 174),
(1713, 'YANAHUAYA', '08', 1, 174),
(1714, 'ALTO INAMBARI', '09', 1, 174),
(1715, 'SAN PEDRO DE PUTINA PUNCO', '10', 1, 174),
(1716, 'YUNGUYO', '01', 1, 175),
(1717, 'ANAPIA', '02', 1, 175),
(1718, 'COPANI', '03', 1, 175),
(1719, 'CUTURAPI', '04', 1, 175),
(1720, 'OLLARAYA', '05', 1, 175),
(1721, 'TINICACHI', '06', 1, 175),
(1722, 'UNICACHI', '07', 1, 175),
(1723, 'MOYOBAMBA', '01', 1, 176),
(1724, 'CALZADA', '02', 1, 176),
(1725, 'HABANA', '03', 1, 176),
(1726, 'JEPELACIO', '04', 1, 176),
(1727, 'SORITOR', '05', 1, 176),
(1728, 'YANTALO', '06', 1, 176),
(1729, 'BELLAVISTA', '01', 1, 177),
(1730, 'ALTO BIAVO', '02', 1, 177),
(1731, 'BAJO BIAVO', '03', 1, 177),
(1732, 'HUALLAGA', '04', 1, 177),
(1733, 'SAN PABLO', '05', 1, 177),
(1734, 'SAN RAFAEL', '06', 1, 177),
(1735, 'SAN JOSÉ DE SISA', '01', 1, 178),
(1736, 'AGUA BLANCA', '02', 1, 178),
(1737, 'SAN MARTÍN', '03', 1, 178),
(1738, 'SANTA ROSA', '04', 1, 178),
(1739, 'SHATOJA', '05', 1, 178),
(1740, 'SAPOSOA', '01', 1, 179),
(1741, 'ALTO SAPOSOA', '02', 1, 179),
(1742, 'EL ESLABÓN', '03', 1, 179),
(1743, 'PISCOYACU', '04', 1, 179),
(1744, 'SACANCHE', '05', 1, 179),
(1745, 'TINGO DE SAPOSOA', '06', 1, 179),
(1746, 'LAMAS', '01', 1, 180),
(1747, 'ALONSO DE ALVARADO', '02', 1, 180),
(1748, 'BARRANQUITA', '03', 1, 180),
(1749, 'CAYNARACHI', '04', 1, 180),
(1750, 'CUÑUMBUQUI', '05', 1, 180),
(1751, 'PINTO RECODO', '06', 1, 180),
(1752, 'RUMISAPA', '07', 1, 180),
(1753, 'SAN ROQUE DE CUMBAZA', '08', 1, 180),
(1754, 'SHANAO', '09', 1, 180),
(1755, 'TABALOSOS', '10', 1, 180),
(1756, 'ZAPATERO', '11', 1, 180),
(1757, 'JUANJUÍ', '01', 1, 181),
(1758, 'CAMPANILLA', '02', 1, 181),
(1759, 'HUICUNGO', '03', 1, 181),
(1760, 'PACHIZA', '04', 1, 181),
(1761, 'PAJARILLO', '05', 1, 181),
(1762, 'PICOTA', '01', 1, 182),
(1763, 'BUENOS AIRES', '02', 1, 182),
(1764, 'CASPISAPA', '03', 1, 182),
(1765, 'PILLUANA', '04', 1, 182),
(1766, 'PUCACACA', '05', 1, 182),
(1767, 'SAN CRISTÓBAL', '06', 1, 182),
(1768, 'SAN HILARIÓN', '07', 1, 182),
(1769, 'SHAMBOYACU', '08', 1, 182),
(1770, 'TINGO DE PONASA', '09', 1, 182),
(1771, 'TRES UNIDOS', '10', 1, 182),
(1772, 'RIOJA', '01', 1, 183),
(1773, 'AWAJUN', '02', 1, 183),
(1774, 'ELÍAS SOPLIN VARGAS', '03', 1, 183),
(1775, 'NUEVA CAJAMARCA', '04', 1, 183),
(1776, 'PARDO MIGUEL', '05', 1, 183),
(1777, 'POSIC', '06', 1, 183),
(1778, 'SAN FERNANDO', '07', 1, 183),
(1779, 'YORONGOS', '08', 1, 183),
(1780, 'YURACYACU', '09', 1, 183),
(1781, 'TARAPOTO', '01', 1, 184),
(1782, 'ALBERTO LEVEAU', '02', 1, 184),
(1783, 'CACATACHI', '03', 1, 184),
(1784, 'CHAZUTA', '04', 1, 184),
(1785, 'CHIPURANA', '05', 1, 184),
(1786, 'EL PORVENIR', '06', 1, 184),
(1787, 'HUIMBAYOC', '07', 1, 184),
(1788, 'JUAN GUERRA', '08', 1, 184),
(1789, 'LA BANDA DE SHILCAYO', '09', 1, 184),
(1790, 'MORALES', '10', 1, 184),
(1791, 'PAPAPLAYA', '11', 1, 184),
(1792, 'SAN ANTONIO', '12', 1, 184),
(1793, 'SAUCE', '13', 1, 184),
(1794, 'SHAPAJA', '14', 1, 184),
(1795, 'TOCACHE', '01', 1, 185),
(1796, 'NUEVO PROGRESO', '02', 1, 185),
(1797, 'POLVORA', '03', 1, 185),
(1798, 'SHUNTE', '04', 1, 185),
(1799, 'UCHIZA', '05', 1, 185),
(1800, 'TACNA', '01', 1, 186),
(1801, 'ALTO DE LA ALIANZA', '02', 1, 186),
(1802, 'CALANA', '03', 1, 186),
(1803, 'CIUDAD NUEVA', '04', 1, 186),
(1804, 'INCLAN', '05', 1, 186),
(1805, 'PACHIA', '06', 1, 186),
(1806, 'PALCA', '07', 1, 186),
(1807, 'POCOLLAY', '08', 1, 186),
(1808, 'SAMA', '09', 1, 186),
(1809, 'CORONEL GREGORIO ALBARRACÍN LANCHIPA', '10', 1, 186),
(1810, 'CANDARAVE', '01', 1, 187),
(1811, 'CAIRANI', '02', 1, 187),
(1812, 'CAMILACA', '03', 1, 187),
(1813, 'CURIBAYA', '04', 1, 187),
(1814, 'HUANUARA', '05', 1, 187),
(1815, 'QUILAHUANI', '06', 1, 187),
(1816, 'LOCUMBA', '01', 1, 188),
(1817, 'ILABAYA', '02', 1, 188),
(1818, 'ITE', '03', 1, 188),
(1819, 'TARATA', '01', 1, 189),
(1820, 'HÉROES ALBARRACÍN', '02', 1, 189),
(1821, 'ESTIQUE', '03', 1, 189),
(1822, 'ESTIQUE-PAMPA', '04', 1, 189),
(1823, 'SITAJARA', '05', 1, 189),
(1824, 'SUSAPAYA', '06', 1, 189),
(1825, 'TARUCACHI', '07', 1, 189),
(1826, 'TICACO', '08', 1, 189),
(1827, 'TUMBES', '01', 1, 190),
(1828, 'CORRALES', '02', 1, 190),
(1829, 'LA CRUZ', '03', 1, 190),
(1830, 'PAMPAS DE HOSPITAL', '04', 1, 190),
(1831, 'SAN JACINTO', '05', 1, 190),
(1832, 'SAN JUAN DE LA VIRGEN', '06', 1, 190),
(1833, 'ZORRITOS', '01', 1, 191),
(1834, 'CASITAS', '02', 1, 191),
(1835, 'CANOAS DE PUNTA SAL', '03', 1, 191),
(1836, 'ZARUMILLA', '01', 1, 192),
(1837, 'AGUAS VERDES', '02', 1, 192),
(1838, 'MATAPALO', '03', 1, 192),
(1839, 'PAPAYAL', '04', 1, 192),
(1840, 'CALLERIA', '01', 1, 193),
(1841, 'CAMPOVERDE', '02', 1, 193),
(1842, 'IPARIA', '03', 1, 193),
(1843, 'MASISEA', '04', 1, 193),
(1844, 'YARINACOCHA', '05', 1, 193),
(1845, 'NUEVA REQUENA', '06', 1, 193),
(1846, 'MANANTAY', '07', 1, 193),
(1847, 'RAYMONDI', '01', 1, 194),
(1848, 'SEPAHUA', '02', 1, 194),
(1849, 'TAHUANIA', '03', 1, 194),
(1850, 'YURUA', '04', 1, 194),
(1851, 'PADRE ABAD', '01', 1, 195),
(1852, 'IRAZOLA', '02', 1, 195),
(1853, 'CURIMANA', '03', 1, 195),
(1854, 'NESHUYA', '04', 1, 195),
(1855, 'ALEXANDER VON HUMBOLDT', '05', 1, 195),
(1856, 'PURUS', '01', 1, 196);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id` varchar(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id`, `nombre`, `estado`) VALUES
('1', 'DNI', 1),
('4', 'CARNET DE EXTRANJERIA', 1),
('7', 'PASAPORTE', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `documento` varchar(12) NOT NULL,
  `cliente` varchar(150) NOT NULL,
  `domicilio` text NOT NULL,
  `email` varchar(150) NOT NULL,
  `celular` varchar(12) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `menor` tinyint(1) NOT NULL,
  `docpadre` varchar(1) DEFAULT NULL,
  `numpadre` varchar(12) DEFAULT NULL,
  `padre` varchar(150) DEFAULT NULL,
  `emailpadre` varchar(150) DEFAULT NULL,
  `telefonopadre` varchar(12) DEFAULT NULL,
  `bien` varchar(1) NOT NULL COMMENT 'tipo de bien:\np = producto\ns = servicio',
  `fechapedido` date NOT NULL,
  `detalle` text NOT NULL,
  `importe` float(10,2) NOT NULL,
  `pedido` text NOT NULL COMMENT 'pedido de cliente',
  `estado` varchar(1) NOT NULL COMMENT 'i = iniciado\na = atendido\nc = cerrado',
  `responsable` varchar(150) DEFAULT NULL,
  `fecharspta` date DEFAULT NULL,
  `distrito_id` int(11) NOT NULL,
  `canal_id` int(11) NOT NULL,
  `concepto_id` int(11) NOT NULL,
  `tienda_id` int(11) NOT NULL,
  `documento_id` varchar(2) NOT NULL,
  `ano` varchar(4) NOT NULL,
  `resolucion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id`, `fecha`, `hora`, `documento`, `cliente`, `domicilio`, `email`, `celular`, `telefono`, `menor`, `docpadre`, `numpadre`, `padre`, `emailpadre`, `telefonopadre`, `bien`, `fechapedido`, `detalle`, `importe`, `pedido`, `estado`, `responsable`, `fecharspta`, `distrito_id`, `canal_id`, `concepto_id`, `tienda_id`, `documento_id`, `ano`, `resolucion`) VALUES
(1, '2021-09-09', '11:54:52', '40773415', 'Nilton Rivera', 'Callao', 'nrivera.web@gmail.com', '975305779', '975305779', 0, NULL, NULL, NULL, NULL, NULL, 'P', '2021-09-09', 'xxx', 100.00, 'xxx', 'I', NULL, NULL, 686, 1, 3, 1, '1', '2021', NULL),
(2, '2021-09-09', '12:06:35', '40773415', 'marcial', 'callao', 'nrivera.web@gmail.com', '975305779', '975305779', 0, NULL, NULL, NULL, NULL, NULL, 'P', '2021-09-09', 'xxx', 100.00, 'xxx', 'I', NULL, NULL, 685, 1, 1, 1, '1', '2021', NULL),
(3, '2021-09-09', '12:12:03', '40773415', 'marcial', 'callao', 'nrivera.web@gmail.com', '975305779', '975305779', 0, NULL, NULL, NULL, NULL, NULL, 'P', '2021-09-09', 'xxxx', 100.00, 'xxxxxxx', 'I', NULL, NULL, 685, 1, 3, 1, '1', '2021', NULL),
(4, '2021-09-09', '12:12:19', '10874789', 'Humberto Medina Gonzales', 'calle 23 mz s lote 28 san antonio de carapongo', 'hmedinahm@hotmail.com', '934790536', '3561072', 0, NULL, NULL, NULL, NULL, NULL, 'S', '2021-09-09', 'Prueba por Implementacion Prueba por Implementacion Prueba por Implementacion Prueba por Implementacion Prueba por Implementacion Prueba por Implementacion Prueba por Implementacion', 1000.00, 'Prueba por Implementacion', 'I', NULL, NULL, 1282, 2, 2, 1, '1', '2021', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `descripcion` text,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Ricoh', 'marca de fotocopiadoras y toners', 1),
(2, 'Konica', 'Konica Minulta', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_05_10_234725_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('hmedinahm@hotmail.com', '$2y$10$/TfgxzzbPo4RMbpriENchOJPiTW0Cu3TJ9EX77wSjaXpdp7iiNEsS', '2021-09-09 20:55:00'),
('ilinareshugar@gmail.com', '$2y$10$rsyizFept71vCGq69R8BIOGHtDZtQmHMv4ARCXeRmt.46Fw9DAwBO', '2021-09-11 16:12:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` text NOT NULL,
  `detalles` text,
  `estado` tinyint(1) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `facebook` text,
  `compartir` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `detalles`, `estado`, `imagen`, `categoria_id`, `facebook`, `compartir`) VALUES
(39, 'Ricoh IM 350F', '<p>La fotocopiadora multifuncional <strong>Ricoh IM 350F</strong> es el equipo perfecto<br />\r\npara aquellos que desean eficiencia, conectividad smart y<br />\r\npracticidad compactada para su centro de trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Marzo de 2019</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 35 ppm</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 476 x 442 x 510 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A4 / B6 - B5</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,100 hojas / 250 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 256 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>14,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen:</strong> 70,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 10,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa IM, Serie 0. Blanco y negro. Nuevas.<br />\r\nRicoh IM 350F / IM 430F</p>', 1, 'productos/1 IM 350F.png', 13, NULL, NULL),
(40, 'Ricoh IM 430F', '<p>La fotocopiadora multifuncional <strong>Ricoh IM 430F</strong> es el equipo perfecto<br />\r\npara aquellos que desean eficiencia, conectividad smart y<br />\r\npracticidad compactada para su centro de trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Marzo de 2019</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 43 ppm</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 476 x 442 x 510 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A4 / B6 - B5</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,100 hojas / 250 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 256 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 17,400 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen:</strong> 70,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 10,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa IM, Serie 0. Blanco y negro. Nuevas.<br />\r\nRicoh IM 350F / IM 430F</p>', 1, 'productos/2 IM 430F.png', 13, NULL, NULL),
(41, 'Ricoh IM 550F', '<p>La fotocopiadora multifuncional <strong>Ricoh IM 550F</strong> es el equipo perfecto<br />\r\npara aquellos que desean eficiencia, conectividad smart y<br />\r\npracticidad compactada para su centro de trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Septiembre de 2019</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 55 ppm</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 480 x 539 x 644 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A4 / B6 - B5</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,600 hojas / 500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 60 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 25,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen:</strong> 500,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 250,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa IM, Serie 0. Blanco y negro. Nuevas.<br />\r\nRicoh IM 550F / IM 600F</p>', 1, 'productos/3 IM 550F.png', 13, NULL, NULL),
(42, 'Ricoh IM 600F', '<p>La fotocopiadora multifuncional <strong>Ricoh IM 600F</strong> es el equipo perfecto<br />\r\npara aquellos que desean eficiencia, conectividad smart y<br />\r\npracticidad compactada para su centro de trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Septiembre de 2019</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 60 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 480 x 539 x 644 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A4 / B6 - B5</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>2,600 hojas / 500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 60 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 25,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen:</strong> 500,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 275,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa IM, Serie 0. Blanco y negro. Nuevas.<br />\r\nRicoh IM 550F / IM 600F</p>', 1, 'productos/4 IM 600F.png', 13, NULL, NULL),
(43, 'Ricoh MP 2555', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 2555</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 25 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF / SPDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Capacidad del SPDF: </strong>220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 684 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 120,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 15,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 5. Blanco y negro. Nuevas.<br />\r\nRicoh MP 2555 / MP 3055 / MP 3555</p>', 1, 'productos/5 MP 2555.png', 13, NULL, NULL),
(44, 'Ricoh MP 3055', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 3055</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 30 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF / SPDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 684 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 120,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 5. Blanco y negro. Nuevas.<br />\r\nRicoh MP 2555 / MP 3055 / MP 3555</p>', 1, 'productos/6 MP 3055.png', 13, NULL, NULL),
(45, 'Ricoh MP 3555', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 3555</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 35 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF / SPDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 684 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 120,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>30,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a><br />\r\n&nbsp;</p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 5. Blanco y negro. Nuevas.<br />\r\nRicoh MP 2555 / MP 3055 / MP 3555</p>', 1, 'productos/7 MP 3555.png', 13, NULL, NULL),
(46, 'Ricoh MP 4055', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 4055</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 40 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 684 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>160,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>160,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 5. Blanco y negro. Nuevas.<br />\r\nRicoh MP 4055 / MP 5055 / MP 6055</p>', 1, 'productos/8 MP 4055.png', 13, NULL, NULL),
(47, 'Ricoh MP 5055', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 5055</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 50 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 684 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 160,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 160,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 5. Blanco y negro. Nuevas.<br />\r\nRicoh MP 4055 / MP 5055 / MP 6055</p>', 1, 'productos/9 MP 5055.png', 13, NULL, NULL),
(49, 'Ricoh MP 6055', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 6055</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 60 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 684 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 160,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 160,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 5. Blanco y negro. Nuevas.<br />\r\nRicoh MP 4055 / MP 5055 / MP 6055</p>', 1, 'productos/10 MP 6055.png', 13, NULL, NULL),
(50, 'Ricoh MP 6503', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 6503</strong> es la soluci&oacute;n que&nbsp;<br />\r\nnecesitas para generar altas cantidades de copias e impresiones.&nbsp;<br />\r\nAumenta tu producci&oacute;n al l&iacute;mite con estos modelos Ricoh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Junio de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>65 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>200 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>690 x 803 x 1161 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 8,300 hojas / 3,500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 43,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>350,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>1,200,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador opcional.<br />\r\nL&iacute;nea de pie MP, Serie 3. Blanco y negro. Nuevas.<br />\r\nRicoh MP 6503 / MP 7503 / MP 9003</p>', 1, 'productos/11 MP 6503.png', 13, NULL, NULL),
(51, 'Ricoh MP 7503', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 7503</strong> es la soluci&oacute;n que&nbsp;<br />\r\nnecesitas para generar altas cantidades de copias e impresiones.&nbsp;<br />\r\nAumenta tu producci&oacute;n al l&iacute;mite con estos modelos Ricoh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Junio de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 75 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 200 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 690 x 803 x 1161 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 8,300 hojas / 3,500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 43,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 350,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>1,200,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador opcional.<br />\r\nL&iacute;nea de pie MP, Serie 3. Blanco y negro. Nuevas.<br />\r\nRicoh MP 6503 / MP 7503 / MP 9003</p>', 1, 'productos/12 MP 7503.png', 13, NULL, NULL),
(52, 'Ricoh MP 9003', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 9003 </strong>es la soluci&oacute;n que&nbsp;<br />\r\nnecesitas para generar altas cantidades de copias e impresiones.&nbsp;<br />\r\nAumenta tu producci&oacute;n al l&iacute;mite con estos modelos Ricoh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Junio de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 90 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 200 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 690 x 803 x 1161 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 8,300 hojas / 3,500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 43,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>350,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 1,200,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador opcional.<br />\r\nL&iacute;nea de pie MP, Serie 3. Blanco y negro. Nuevas.<br />\r\nRicoh MP 6503 / MP 7503 / MP 9003</p>', 1, 'productos/13 MP 9003.png', 13, NULL, NULL),
(53, 'Ricoh IM 7000', '<p>La fotocopiadora multifuncional <strong>Ricoh IM 7000</strong> es la soluci&oacute;n que&nbsp;<br />\r\nnecesitas para generar altas cantidades de copias e impresiones.&nbsp;<br />\r\nAumenta tu producci&oacute;n al l&iacute;mite con estos modelos Ricoh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2021</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 70 ppm</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>690 x 883 x 1161 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 8,700 hojas / 3,500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 43,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen:</strong> 350,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie IM, Serie 0. Blanco y negro. Nuevas.<br />\r\nRicoh IM 7000 / IM 8000 / IM 9000</p>', 1, 'productos/14 IM 7000.png', 13, NULL, NULL),
(54, 'Ricoh IM 8000', '<p>La fotocopiadora multifuncional <strong>Ricoh IM 8000</strong> es la soluci&oacute;n que&nbsp;<br />\r\nnecesitas para generar altas cantidades de copias e impresiones.&nbsp;<br />\r\nAumenta tu producci&oacute;n al l&iacute;mite con estos modelos Ricoh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Diciembre de 2020</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>80 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>690 x 883 x 1161 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 8,700 hojas / 3,500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>43,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen:</strong> 350,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie IM, Serie 0. Blanco y negro. Nuevas.<br />\r\nRicoh IM 7000 / IM 8000 / IM 9000</p>', 1, 'productos/15 IM 8000.png', 13, NULL, NULL),
(55, 'Ricoh IM 9000', '<p>La fotocopiadora multifuncional <strong>Ricoh IM 9000</strong> es la soluci&oacute;n que&nbsp;<br />\r\nnecesitas para generar altas cantidades de copias e impresiones.&nbsp;<br />\r\nAumenta tu producci&oacute;n al l&iacute;mite con estos modelos Ricoh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Diciembre de 2020</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 90 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 690 x 883 x 1161 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 8,700 hojas / 3,500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 43,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen: </strong>350,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie IM, Serie 0. Blanco y negro. Nuevas.<br />\r\nRicoh IM 7000 / IM 8000 / IM 9000</p>', 1, 'productos/16 IM 9000.png', 13, NULL, NULL),
(56, 'Ricoh IM C400F', '<p>La fotocopiadora multifuncional <strong>Ricoh IM C400F</strong> es el equipo perfecto<br />\r\npara aquellos que desean eficiencia, conectividad smart y<br />\r\npracticidad compactada para su centro de trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Febrero de 2020</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 43 ppm</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 498 x 561 x 590 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A5 - A4 / B5</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,300 hojas / 200 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 17,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>6,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen CMYK: </strong>60,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 7,500 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa IM, Serie 0. Color. Nuevas.<br />\r\nRicoh IM C300 / IM C400F</p>', 1, 'productos/2 IM C400F.png', 14, NULL, NULL),
(57, 'Ricoh IM C530F', '<p>La fotocopiadora multifuncional <strong>Ricoh IM C530F</strong> es el equipo perfecto<br />\r\npara aquellos que desean eficiencia, conectividad smart y<br />\r\npracticidad compactada para su centro de trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Agosto de 2020</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 53 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 32GB eMMC</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 470 x 502.8 x 843.7 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A4 / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 3,250 hojas / 500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 20,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 18,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen CMYK: </strong>60,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>10,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa IM, Serie 0. Color. Nuevas.<br />\r\nRicoh IM C530F</p>', 1, 'productos/3 IM C530F.png', 14, NULL, NULL),
(58, 'Ricoh IM C2000', '<p>La fotocopiadora multifuncional <strong>Ricoh IM C2000</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Enero de 2019</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 20 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 685 x 913 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / SRA3 - SRA3+ / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,300 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 16,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 10,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK / CMY:</strong> 180,000 / 120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro CMYK:</strong> 48,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 10,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie IM, Serie 0. Color. Nuevas.<br />\r\nRicoh IM C2000 / IM C2500</p>', 1, 'productos/4 IM C2000.png', 14, NULL, NULL),
(59, 'Ricoh IM C2500', '<p>La fotocopiadora multifuncional <strong>Ricoh IM C2500</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Enero de 2019</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>25 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 685 x 913 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / SRA3 - SRA3+ / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>2,300 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 16,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>10,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK / CMY: </strong>180,000 / 120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro CMYK:</strong> 48,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 10,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie IM, Serie 0. Color. Nuevas.<br />\r\nRicoh IM C2000 / IM C2500</p>', 1, 'productos/5 IM C2500.png', 14, NULL, NULL),
(60, 'Ricoh IM C3000', '<p>La fotocopiadora multifuncional <strong>Ricoh IM C3000</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Enero de 2019</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 30 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 685 x 913 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / SRA3 - SRA3+ / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,300 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 31,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 19,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK / CMY:</strong> 600,000 / 270,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK / CMY:</strong> 400,000 / 160,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>L&iacute;nea de pie IM, Serie 0. Color. Nuevas.<br />\r\nRicoh IM C3000 / IM C3500</p>', 1, 'productos/6 IM C3000.png', 14, NULL, NULL),
(61, 'Ricoh IM C3500', '<p>La fotocopiadora multifuncional <strong>Ricoh IM C3500</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Enero de 2019</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>35 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 685 x 913 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / SRA3 - SRA3+ / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,300 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>31,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>19,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK / CMY: </strong>600,000 / 270,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK / CMY:</strong> 400,000 / 160,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie IM, Serie 0. Color. Nuevas.<br />\r\nRicoh IM C3000 / IM C3500</p>', 1, 'productos/7 IM C3500.png', 14, NULL, NULL),
(62, 'Ricoh IM C4500', '<p>La fotocopiadora multifuncional <strong>Ricoh IM C4500</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Enero de 2019&nbsp;</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 45 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 686 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / SRA3 / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>33,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>22,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK / CMY:</strong> 600,000 / 270,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro CMYK: </strong>270,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie IM, Serie 0. Color. Nuevas.<br />\r\nRicoh IM C4500 / IM C6000</p>', 1, 'productos/8 IM C4500.png', 14, NULL, NULL),
(63, 'Ricoh IM C6000', '<p>La fotocopiadora multifuncional <strong>Ricoh IM C6000</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Enero de 2019&nbsp;</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 60 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 686 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / SRA3 / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 33,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 22,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK / CMY:</strong> 600,000 / 270,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro CMYK: </strong>270,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie IM, Serie 0. Color. Nuevas.<br />\r\nRicoh IM C4500 / IM C6000</p>', 1, 'productos/9 IM C6000.png', 14, NULL, NULL),
(64, 'Ricoh IM C6500', '<p>La fotocopiadora multifuncional Ricoh <strong>IM C6500</strong> es la soluci&oacute;n que&nbsp;<br />\r\nnecesitas para generar altas cantidades de copias e impresiones.&nbsp;<br />\r\nAumenta tu producci&oacute;n al m&aacute;ximo con estos modelos Ricoh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Octubre de 2020</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 65 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 640GB HDD</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 750 x 880 x 1225 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / SRA3 - SRA3+ / B6 - B4&nbsp;</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>8,100 hojas / 3,500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52.3 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 47,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro CMYK:</strong> 1,000,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie IM, Serie 0. Color. Nuevas.<br />\r\nRicoh IM C6500 / IM C8000</p>', 1, 'productos/10 IM C6500.png', 14, NULL, NULL),
(65, 'Ricoh IM C8000', '<p>La fotocopiadora multifuncional <strong>Ricoh IM C8000</strong> es la soluci&oacute;n que&nbsp;<br />\r\nnecesitas para generar altas cantidades de copias e impresiones.&nbsp;<br />\r\nAumenta tu producci&oacute;n al m&aacute;ximo con estos modelos Ricoh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Octubre de 2020</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 80 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 640GB HDD</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 750 x 880 x 1225 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / SRA3 - SRA3+ / B6 - B4&nbsp;</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 8,100 hojas / 3,500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52.3 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>47,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro CMYK:</strong> 1,000,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie IM, Serie 0. Color. Nuevas.<br />\r\nRicoh IM C6500 / IM C8000</p>', 1, 'productos/11 IM C8000.png', 14, NULL, NULL),
(67, 'Ricoh MP 301', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 301</strong> es parte de una gran<br />\r\ngama de aliados de oficina compactos, que garantizan calidad al<br />\r\ncumplir con las necesidades de tu emprendimiento, negocio o empresa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Junio de 2012</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 31 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 1GB RAM, 128GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 476 x 450 x 451 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 1,350 hojas / 250 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 60 - 157 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>8,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen:</strong> 45,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 5,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa MP, Serie 1. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 301</p>', 1, 'productos/1 MP 301.png', 18, NULL, NULL);
INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `detalles`, `estado`, `imagen`, `categoria_id`, `facebook`, `compartir`) VALUES
(68, 'Ricoh MP 305', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 305</strong> es parte de una gran<br />\r\ngama de aliados de oficina compactos, que garantizan calidad al<br />\r\ncumplir con las necesidades de tu emprendimiento, negocio o empresa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Mayo de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 30 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>350 x 493 x 505 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>760 hojas / 100 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 163 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 9,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen:</strong> 60,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 7,500 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa MP, Serie 1. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 305</p>', 1, 'productos/2 MP 305.png', 18, NULL, NULL),
(69, 'Ricoh MP 402', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 402</strong> es parte de una gran<br />\r\ngama de aliados de oficina compactos, que garantizan calidad al<br />\r\ncumplir con las necesidades de tu emprendimiento, negocio o empresa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Septiembre de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>42 ppm</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>476 x 483 x 510 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A4 / B6 - B5</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 1,600 hojas / 250 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 162 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>10,400 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen:</strong> 40,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 10,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa MP, Serie 2. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 402</p>', 1, 'productos/3 MP 402.png', 18, NULL, NULL),
(70, 'Ricoh MP 501', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 501</strong> es parte de una gran<br />\r\ngama de aliados de oficina compactos, que garantizan calidad al<br />\r\ncumplir con las necesidades de tu emprendimiento, negocio o empresa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Julio de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 52 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 75 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 475 x 504 x 645 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A4 / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,600 hojas / 500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 60 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 25,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen:</strong> 500,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 16,600 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa MP, Serie 1. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 501 / MP 601</p>', 1, 'productos/4 MP 501.png', 18, NULL, NULL),
(71, 'Ricoh MP 601', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 601</strong> es parte de una gran<br />\r\ngama de aliados de oficina compactos, que garantizan calidad al<br />\r\ncumplir con las necesidades de tu emprendimiento, negocio o empresa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Julio de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 62 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 75 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 475 x 504 x 645 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A4 / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,600 hojas / 500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 60 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>25,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen: </strong>500,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 16,600 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa MP, Serie 1. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 501 / MP 601</p>', 1, 'productos/5 MP 601.png', 18, NULL, NULL),
(72, 'Ricoh MP 4002', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 4002</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Marzo de 2012</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 40 ppm</li>\r\n	<li><strong>Memoria:</strong> 1GB RAM, 128GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 670 x 682 x 895 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A5 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,400 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 30,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 320,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 160,000 p&aacute;ginas</li>\r\n	<li><strong>Costo mensual de trabajo:</strong> 200,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 2. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 4002 / MP 5002</p>', 1, 'productos/6 MP 4002.png', 18, NULL, NULL),
(73, 'Ricoh MP 5002', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 5002</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Marzo de 2012</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 50 ppm</li>\r\n	<li><strong>Memoria:</strong> 1GB RAM, 128GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 670 x 682 x 895 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A5 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,400 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 30,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>320,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>160,000 p&aacute;ginas</li>\r\n	<li><strong>Costo mensual de trabajo:</strong> 200,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 2. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 4002 / MP 5002</p>', 1, 'productos/7 MP 5002.png', 18, NULL, NULL),
(74, 'Ricoh MP 6002', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 6002</strong> es tu gran aliado en<br />\r\nproducci&oacute;n de alta gama. Cuando adquieras estos equipos, notar&aacute;s el<br />\r\ngran cambio en la rapidez al generar documentos sin perder calidad.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Agosto de 2012</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 60 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 1.5GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 150 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 690 x 799 x 1171 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 8,300 hojas / 3,500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 216 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>43,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>350,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 1,200,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>300,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador.<br />\r\nL&iacute;nea de pie MP, Serie 2. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 6002 / MP 7502 / MP 9002</p>', 1, 'productos/8 MP 6002.png', 18, NULL, NULL),
(75, 'Ricoh MP 7502', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 7502</strong> es tu gran aliado en<br />\r\nproducci&oacute;n de alta gama. Cuando adquieras estos equipos, notar&aacute;s el<br />\r\ngran cambio en la rapidez al generar documentos sin perder calidad.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Agosto de 2012</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 75 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>1.5GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>150 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 690 x 799 x 1171 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 8,300 hojas / 3,500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 216 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>43,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>350,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 1,200,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>300,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador.<br />\r\nL&iacute;nea de pie MP, Serie 2. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 6002 / MP 7502 / MP 9002</p>', 1, 'productos/9 MP 7502.png', 18, NULL, NULL),
(76, 'Ricoh MP 9002', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 9002</strong> es tu gran aliado en<br />\r\nproducci&oacute;n de alta gama. Cuando adquieras estos equipos, notar&aacute;s el<br />\r\ngran cambio en la rapidez al generar documentos sin perder calidad.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Agosto de 2012</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>90 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 1.5GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 150 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>690 x 799 x 1171 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 8,300 hojas / 3,500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 216 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 43,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>350,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 1,200,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>300,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador.<br />\r\nL&iacute;nea de pie MP, Serie 2. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 6002 / MP 7502 / MP 9002</p>', 1, 'productos/10 MP 9002.png', 18, NULL, NULL),
(77, 'Ricoh MP 2553', '<p>La fotocopiadora multifuncional<strong> Ricoh MP 2553</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Diciembre de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 25 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 1.5GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 653 x 835 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 3,150 hojas / 1,600 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 157 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 11,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 60,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 60,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 15,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 3. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 2553 / MP 3053 / MP 3353</p>', 1, 'productos/11 MP 2553.png', 18, NULL, NULL),
(78, 'Ricoh MP 3053', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 3053</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Diciembre de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>30 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 1.5GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 653 x 835 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 3,150 hojas / 1,600 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 157 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 11,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 60,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 60,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 3. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 2553 / MP 3053 / MP 3353</p>', 1, 'productos/12 MP 3053.png', 18, NULL, NULL),
(79, 'Ricoh MP 3353', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 3353</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Diciembre de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 33 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>1.5GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 653 x 835 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 3,150 hojas / 1,600 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 157 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 11,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 60,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 60,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>30,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 3. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 2553 / MP 3053 / MP 3353</p>', 1, 'productos/13 MP 3353.png', 18, NULL, NULL),
(80, 'Ricoh MP 6503 (Seminuevo)', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 6503</strong> es tu gran aliado en<br />\r\nproducci&oacute;n de alta gama. Cuando adquieras estos equipos, notar&aacute;s el<br />\r\ngran cambio en la rapidez al generar documentos sin perder calidad.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Junio de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>65 ppm</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 690 x 803 x 1161 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>Media Carta - Doble Carta</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>8,300 hojas / 1,600 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 43,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 350,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>1,200,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador.<br />\r\nL&iacute;nea de pie MP, Serie 3. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 6503 / MP 7503 / MP 9003</p>', 1, 'productos/14 MP 6503.png', 18, NULL, NULL),
(81, 'Ricoh MP 7503 (Seminuevo)', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 7503</strong> es tu gran aliado en<br />\r\nproducci&oacute;n de alta gama. Cuando adquieras estos equipos, notar&aacute;s el<br />\r\ngran cambio en la rapidez al generar documentos sin perder calidad.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Junio de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 75 ppm</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 690 x 803 x 1161 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> Media Carta - Doble Carta</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 8,300 hojas / 1,600 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 43,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 350,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 1,200,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador.<br />\r\nL&iacute;nea de pie MP, Serie 3. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 6503 / MP 7503 / MP 9003</p>', 1, 'productos/15 MP 7503.png', 18, NULL, NULL),
(82, 'Ricoh MP 9003 (Seminuevo)', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 9003</strong> es tu gran aliado en<br />\r\nproducci&oacute;n de alta gama. Cuando adquieras estos equipos, notar&aacute;s el<br />\r\ngran cambio en la rapidez al generar documentos sin perder calidad.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Junio de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>65 ppm</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>690 x 803 x 1161 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> Media Carta - Doble Carta</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 8,300 hojas / 1,600 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>43,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 350,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 1,200,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador.<br />\r\nL&iacute;nea de pie MP, Serie 3. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 6503 / MP 7503 / MP 9003</p>', 1, 'productos/16 MP 9003.png', 18, NULL, NULL),
(83, 'Ricoh MP 2554', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 2554</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Noviembre de 2014</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 25 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 680 x 913 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,700 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>120,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 15,000 p&aacute;ginas</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador opcional.<br />\r\nL&iacute;nea de pie MP, Serie 4. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 2554 / MP 3054 / MP 3554</p>', 1, 'productos/17 MP 2554.png', 18, NULL, NULL),
(84, 'Ricoh MP 3054', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 3054</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Noviembre de 2014</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 30 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 680 x 913 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 120,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 20,000 p&aacute;ginas</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador opcional.<br />\r\nL&iacute;nea de pie MP, Serie 4. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 2554 / MP 3054 / MP 3554</p>', 1, 'productos/18 MP 3054.png', 18, NULL, NULL),
(85, 'Ricoh MP 3554', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 3554</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Noviembre de 2014</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>35 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 680 x 913 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 120,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 30,000 p&aacute;ginas</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador opcional.<br />\r\nL&iacute;nea de pie MP, Serie 4. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 2554 / MP 3054 / MP 3554</p>', 1, 'productos/19 MP 3554.png', 18, NULL, NULL),
(86, 'Ricoh MP 4054', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 4054</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Febrero de 2015</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>40 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 680 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>160,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 160,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador opcional.<br />\r\nL&iacute;nea de pie MP, Serie 4. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 4054 / MP 5054 / MP 6054</p>', 1, 'productos/20 MP 4054.png', 18, NULL, NULL),
(87, 'Ricoh MP 5054', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 5054</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2015</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 50 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 680 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>160,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 160,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador opcional.<br />\r\nL&iacute;nea de pie MP, Serie 4. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 4054 / MP 5054 / MP 6054</p>', 1, 'productos/21 MP 5054.png', 18, NULL, NULL),
(88, 'Ricoh MP 6054', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 6054</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Febrero de 2015</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 60 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 680 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 160,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>160,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador opcional.<br />\r\nL&iacute;nea de pie MP, Serie 4. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 4054 / MP 5054 / MP 6054</p>', 1, 'productos/22 MP 6054.png', 18, NULL, NULL),
(89, 'Ricoh MP 2555 (Seminuevo)', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 2555</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Febrero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 25 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF / SPDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 684 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>120,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 15,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 5. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 2555 / MP 3055 / MP 3555</p>', 1, 'productos/23 MP 2555.png', 18, NULL, NULL),
(90, 'Ricoh MP 3055 (Seminuevo)', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 3055</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 30 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF / SPDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 684 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,700 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>120,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 5. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 2555 / MP 3055 / MP 3555</p>', 1, 'productos/24 MP 3055.png', 18, NULL, NULL),
(91, 'Ricoh MP 3555 (Seminuevo)', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 3555 </strong>es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Febrero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>35 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF / SPDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Capacidad del SPDF: </strong>220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 684 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,700 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>120,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 30,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 5. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 2555 / MP 3055 / MP 3555</p>', 1, 'productos/25 MP 3555.png', 18, NULL, NULL),
(92, 'Ricoh MP 4055 (Seminuevo)', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 4055</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>40 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 684 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>160,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 160,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 5. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 4055 / MP 5055 / MP 6055</p>', 1, 'productos/26 MP 4055.png', 18, NULL, NULL),
(93, 'Ricoh MP 5055 (Seminuevo)', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 5055</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 50 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 684 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>160,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 160,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 5. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 4055 / MP 5055 / MP 6055</p>', 1, 'productos/27 MP 5055.png', 18, NULL, NULL),
(94, 'Ricoh MP 6055 (Seminuevo)', '<p>La fotocopiadora multifuncional <strong>Ricoh MP 6055</strong> es la soluci&oacute;n ideal&nbsp;<br />\r\na tus problemas de conectividad, productividad, tiempo y consumo,&nbsp;<br />\r\ncon atributos que agilizar&aacute;n su funci&oacute;n y tu trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>60 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 684 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 37,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>160,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 160,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 5. Blanco y negro. Seminuevas.<br />\r\nRicoh MP 4055 / MP 5055 / MP 6055</p>', 1, 'productos/28 MP 6055.png', 18, NULL, NULL);
INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `detalles`, `estado`, `imagen`, `categoria_id`, `facebook`, `compartir`) VALUES
(95, 'Ricoh MP C300', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C300</strong> es parte de una gran<br />\r\ngama de aliados de oficina compactos, que garantizan calidad al<br />\r\ncumplir con las necesidades de tu emprendimiento, negocio o empresa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Enero de 2011</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>32 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>1.5GB RAM, 160GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>551 x 569 x 711 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A4 / Carta / Oficio</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>2,300 hojas / 500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 256 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>10,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>10,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen CMYK:</strong> 60,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 5,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa MP, Serie 0. Color. Seminuevas.<br />\r\nRicoh MP C300</p>', 1, 'productos/1 MP C300.png', 19, NULL, NULL),
(96, 'Ricoh MP C305', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C305</strong> es parte de una gran<br />\r\ngama de aliados de oficina compactos, que garantizan calidad al<br />\r\ncumplir con las necesidades de tu emprendimiento, negocio o empresa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Mayo de 2012</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>31 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>1GB RAM, 128GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 498 x 532 x 505 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600ppp</li>\r\n	<li><strong>Formatos:</strong> A4 - A6</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>1,350 hojas / 300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 12,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>4,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen BK/CMY: </strong>60,000 / 24,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>5,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa MP, Serie 5. Color. Seminuevas.<br />\r\nRicoh MP C305</p>', 1, 'productos/2 MP C305.png', 19, NULL, NULL),
(97, 'Ricoh MP C306', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C306</strong> es parte de una gran<br />\r\ngama de aliados de oficina compactos, que garantizan calidad al<br />\r\ncumplir con las necesidades de tu emprendimiento, negocio o empresa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Octubre de 2015</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 31 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 510 x 588 x 505 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formato est&aacute;ndar: </strong>A4 - A6 / B5 - B6</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>1,350 hojas / 200 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 60 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 17,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 8,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen BK/CMY: </strong>60,000 / 36,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 5,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa MP, Serie 6. Color. Seminuevas.<br />\r\nRicoh MP C306</p>', 1, 'productos/3 MP C306.png', 19, NULL, NULL),
(98, 'Ricoh MP C406', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C406</strong> es parte de una gran<br />\r\ngama de aliados de oficina compactos, que garantizan calidad al<br />\r\ncumplir con las necesidades de tu emprendimiento, negocio o empresa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Enero de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 42 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>510 x 588 x 505 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formato est&aacute;ndar:</strong> A4 - A6 / B5 - B6</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 1,350 hojas / 200 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>17,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>8,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen BK/CMY:</strong> 60,000 / 36,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 5,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa MP, Serie 6. Color. Seminuevas.<br />\r\nRicoh MP C406</p>', 1, 'productos/4 MP C406.png', 19, NULL, NULL),
(99, 'Ricoh MP C307', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C307 </strong>es parte de una gran<br />\r\ngama de aliados de oficina compactos, que garantizan calidad al<br />\r\ncumplir con las necesidades de tu emprendimiento, negocio o empresa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Enero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 31 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 498 x 585 x 510 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formato: </strong>A4 - A6 / B5 - B6</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>1,350 hojas / 200 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>17,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>8,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen BK/CMY: </strong>60,000 / 36,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>5,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa MP, Serie 7. Color. Seminuevas.<br />\r\nRicoh MP C307</p>', 1, 'productos/5 MP C307.png', 19, NULL, NULL),
(100, 'Ricoh MP C407', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C407</strong> es parte de una gran<br />\r\ngama de aliados de oficina compactos, que garantizan calidad al<br />\r\ncumplir con las necesidades de tu emprendimiento, negocio o empresa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Enero de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 42 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>498 x 585 x 510 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formato: </strong>A4 - A6 / B5 - B6</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 1,350 hojas / 200 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 17,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>8,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen BK/CMY: </strong>60,000 / 36,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>5,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa MP, Serie 7. Color. Seminuevas.<br />\r\nRicoh MP C407</p>', 1, 'productos/6 MP C407.png', 19, NULL, NULL),
(101, 'Ricoh MP C2050', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C2050</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Diciembre de 2008</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 20 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 1GB RAM, 60GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 655 x 845 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 1,600 hojas / 550 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 256 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>10,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 9,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>240,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro CMYK: </strong>80,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 15,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 0. Color. Seminuevas.<br />\r\nRicoh MP C2050 / MP C2550</p>', 1, 'productos/7 MP C2050.png', 19, NULL, NULL),
(102, 'Ricoh MP C2550', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C2550</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Diciembre de 2008</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 25 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 1GB RAM, 60GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 655 x 845 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 1,600 hojas / 550 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 256 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 10,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 9,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>240,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro CMYK:</strong> 80,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 0. Color. Seminuevas.<br />\r\nRicoh MP C2050 / MP C2550</p>', 1, 'productos/8 MP C2550.png', 19, NULL, NULL),
(103, 'Ricoh MP C2051', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C2051</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2011</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>20 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 1.5GB RAM, 160GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 676 x 845 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>1,600 hojas / 650 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 256 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 10,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>9,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 240,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro CMYK:</strong> 80,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>15,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 1. Color. Seminuevas.<br />\r\nRicoh MP C2051 / MP C2551</p>', 1, 'productos/9 MP C2051.png', 19, NULL, NULL),
(104, 'Ricoh MP C2551', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C2551</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2011</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 25 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 1.5GB RAM, 160GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 676 x 845 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 1,600 hojas / 650 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 256 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 10,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 9,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>240,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro CMYK:</strong> 80,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 1. Color. Seminuevas.<br />\r\nRicoh MP C2051 / MP C2551</p>', 1, 'productos/10 MP C2551.png', 19, NULL, NULL),
(105, 'Ricoh MP C3002', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C3002</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2012</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 30 ppm</li>\r\n	<li><strong>Memoria:</strong> 1.5GB RAM, 190GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>670 x 682 x 880 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / B5 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,400 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 28,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 18,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK/CMY: </strong>300,000 / 240,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY:</strong> 300,000 / 150,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 15,000 / 20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 2. Color. Seminuevas.<br />\r\nRicoh MP C3002 / MP C3502</p>', 1, 'productos/11 MP C3002.png', 19, NULL, NULL),
(106, 'Ricoh MP C3502', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C3502</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2012</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>35 ppm</li>\r\n	<li><strong>Memoria:</strong> 1.5GB RAM, 190GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>670 x 682 x 880 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / B5 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,400 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>28,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>18,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK/CMY: </strong>300,000 / 240,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>300,000 / 150,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 15,000 / 20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 2. Color. Seminuevas.<br />\r\nRicoh MP C3002 / MP C3502</p>', 1, 'productos/12 MP C3502.png', 19, NULL, NULL),
(107, 'Ricoh MP C4502', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C4502</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Febrero de 2012</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>45 ppm</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 190GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>670 x 682 x 895 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A4 / Ejecutivo / Doble carta / Sobre</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,400 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 31,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>22,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK/CMY:</strong> 300,000 / 240,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY:</strong>300,000 / 150,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>45,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 2. Color. Seminuevas.<br />\r\nRicoh MP C4502 / MP C5502</p>', 1, 'productos/13 MP C4502.png', 19, NULL, NULL),
(108, 'Ricoh MP C5502', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C5502</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2012</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 55 ppm</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 190GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 670 x 682 x 895 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A4 / Ejecutivo / Doble carta / Sobre</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,400 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 31,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 22,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK/CMY: </strong>300,000 / 240,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY:&nbsp;</strong>300,000 / 150,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 2. Color. Seminuevas.<br />\r\nRicoh MP C4502 / MP C5502</p>', 1, 'productos/14 MP C5502.png', 19, NULL, NULL),
(109, 'Ricoh MP C2003', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C2003</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2014</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 20 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 685 x 913 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A5 - A3 / Sobres</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,300 hojas / 625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 15,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 9,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 126,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY:</strong> 60,000 / 48,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 15,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 3. Color. Seminuevas.<br />\r\nRicoh MP C2003 / MP C2503</p>', 1, 'productos/15 MP C2003.png', 19, NULL, NULL),
(110, 'Ricoh MP C2503', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C2503</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Febrero de 2014</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 25 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 685 x 913 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A5 - A3 / Sobres</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,300 hojas / 625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>15,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 9,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>126,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>60,000 / 48,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 3. Color. Seminuevas.<br />\r\nRicoh MP C2003 / MP C2503</p>', 1, 'productos/16 MP C2503.png', 19, NULL, NULL),
(111, 'Ricoh MP C3003', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C3003</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Julio de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 30 ppm</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 685 x 912 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A5 - A3 / Media Carta - Doble Carta</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 40 - 128 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 29,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>18,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>400,000 / 270,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 3. Color. Seminuevas.<br />\r\nRicoh MP C3003 / MP C3503</p>', 1, 'productos/17 MP C3003.png', 19, NULL, NULL),
(112, 'Ricoh MP C3503', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C3503</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Julio de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>35 ppm</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 685 x 912 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A5 - A3 / Media Carta - Doble Carta</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 40 - 128 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>29,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 18,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>400,000 / 270,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 3. Color. Seminuevas.<br />\r\nRicoh MP C3003 / MP C3503</p>', 1, 'productos/18 MP C3503.png', 19, NULL, NULL),
(113, 'Ricoh MP C4503', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C4503</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Julio de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 45 ppm</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 685 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A5 - A3 / Media Carta - Doble Carta</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 33,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 22,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>400,000 / 270,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 3. Color. Seminuevas.<br />\r\nRicoh MP C4503 / MP C5503 / MP C6003</p>', 1, 'productos/19 MP C4503.png', 19, NULL, NULL),
(114, 'Ricoh MP C5503', '<p>La fotocopiadora multifuncional<strong> Ricoh MP C5503</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Julio de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 55 ppm</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 685 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A5 - A3 / Media Carta - Doble Carta</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 33,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 22,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>400,000 / 270,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 3. Color. Seminuevas.<br />\r\nRicoh MP C4503 / MP C5503 / MP C6003</p>', 1, 'productos/20 MP C5503.png', 19, NULL, NULL),
(115, 'Ricoh MP C6003', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C6003</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Julio de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 60 ppm</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 685 x 963 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A5 - A3 / Media Carta - Doble Carta</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 33,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 22,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY:</strong> 400,000 / 270,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 3. Color. Seminuevas.<br />\r\nRicoh MP C4503 / MP C5503 / MP C6003</p>', 1, 'productos/21 MP C6003.png', 19, NULL, NULL),
(116, 'Ricoh MP C6503', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C6503 </strong>es tu gran aliado en<br />\r\nproducci&oacute;n de alta gama. Cuando adquieras estos equipos, notar&aacute;s el<br />\r\ngran cambio en la rapidez al generar documentos sin perder calidad.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Diciembre de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 65 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 640GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>750 x 880 x 1225 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> SRA3 / A6 - A3 / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>8,100 hojas / 3,500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 47,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro CMYK:</strong> 1,000,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador.<br />\r\nL&iacute;nea de pie MP, Serie 3. Color. Seminuevas.<br />\r\nRicoh MP C6503 / MP C8003</p>', 1, 'productos/22 MP C6503.png', 19, NULL, NULL),
(117, 'Ricoh MP C8003', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C8003</strong> es tu gran aliado en<br />\r\nproducci&oacute;n de alta gama. Cuando adquieras estos equipos, notar&aacute;s el<br />\r\ngran cambio en la rapidez al generar documentos sin perder calidad.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Diciembre de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 80 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 640GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 750 x 880 x 1225 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>SRA3 / A6 - A3 / B6 - B4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 8,100 hojas / 3,500 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 47,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro CMYK: </strong>1,000,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador.<br />\r\nL&iacute;nea de pie MP, Serie 3. Color. Seminuevas.<br />\r\nRicoh MP C6503 / MP C8003</p>', 1, 'productos/23 MP C8003.png', 19, NULL, NULL),
(118, 'Ricoh MP C2004', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C2004</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Agosto de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 20 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>587 x 685 x 913 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,300 hojas / 625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>15,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>9,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK/CMY: </strong>180,000 / 120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY:</strong> 60,000 / 48,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 15,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 4. Color. Seminuevas.<br />\r\nRicoh MP C2004 / MP C2504</p>', 1, 'productos/24 MP C2004.png', 19, NULL, NULL),
(119, 'Ricoh MP C2504', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C2504</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Agosto de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 25 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 587 x 685 x 913 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,300 hojas / 625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>15,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>9,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK/CMY: </strong>180,000 / 120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>60,000 / 48,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie MP, Serie 4. Color. Seminuevas.<br />\r\nRicoh MP C2004 / MP C2504</p>', 1, 'productos/25 MP C2504.png', 19, NULL, NULL),
(120, 'Ricoh MP C3004', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C3004</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Mayo de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>30 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>668 x 738 x 1205 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,700 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 29,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 18,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK/CMY: </strong>600,000 / 160,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>400,000 / 175,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nDisponible tambi&eacute;n como fotocopiadora remanufacturada.<br />\r\nL&iacute;nea de pie MP, Serie 4. Color. Seminuevas.<br />\r\nRicoh MP C3004 / MP C3504</p>', 1, 'productos/26 MP C3004.png', 19, NULL, NULL);
INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `detalles`, `estado`, `imagen`, `categoria_id`, `facebook`, `compartir`) VALUES
(121, 'Ricoh MP C3504', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C3504</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Mayo de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 35 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 668 x 738 x 1205 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 1,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 29,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 18,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK/CMY: </strong>600,000 / 160,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>400,000 / 175,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nDisponible tambi&eacute;n como fotocopiadora remanufacturada.<br />\r\nL&iacute;nea de pie MP, Serie 4. Color. Seminuevas.<br />\r\nRicoh MP C3004 / MP C3504</p>', 1, 'productos/27 MP C3504.png', 19, NULL, NULL),
(122, 'Ricoh MP C4504', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C4504</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Mayo de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 45 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>668 x 738 x 1205 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>33,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>22,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK/CMY: </strong>600,000 / 270,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>400,000 / 270,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nDisponible tambi&eacute;n como fotocopiadora remanufacturada.<br />\r\nL&iacute;nea de pie MP, Serie 4. Color. Seminuevas.<br />\r\nRicoh MP C4504 / MP C6004</p>', 1, 'productos/28 MP C4504.png', 19, NULL, NULL),
(123, 'Ricoh MP C6004', '<p>La fotocopiadora multifuncional <strong>Ricoh MP C6004</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Mayo de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 60 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>668 x 738 x 1205 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 ppp / 1,200 ppp (TWAIN)</li>\r\n	<li><strong>Formatos:</strong> A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 4,700 hojas / 3,625 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>33,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 22,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK/CMY: </strong>600,000 / 270,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY:</strong> 400,000 / 270,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nDisponible tambi&eacute;n como fotocopiadora remanufacturada.<br />\r\nL&iacute;nea de pie MP, Serie 4. Color. Seminuevas.<br />\r\nRicoh MP C4504 / MP C6004</p>', 1, 'productos/29 MP C6004.png', 19, NULL, NULL),
(124, 'Ricoh PRO C5100S', '<p>La fotocopiadora multifuncional<strong> Ricoh PRO C5100S </strong>es tu gran aliado en<br />\r\nproducci&oacute;n de alta gama. Cuando adquieras estos equipos, notar&aacute;s el<br />\r\ngran cambio en la rapidez al generar documentos sin perder calidad.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Junio de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>65 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 1TB HDD</li>\r\n	<li>Alimentador de documentos aut&oacute;matico (ADF)</li>\r\n	<li><strong>Capacidad del ADF:</strong> 220 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>835 x 880 x 1230 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 4,800 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> Carta / Media Carta - 330 x 488 mm</li>\r\n	<li><strong>Entrada de papel (m&aacute;x.):</strong> 8,250 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>30,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>30,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro CMYK:</strong> 900,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora + finalizador + LCT + Fiery.<br />\r\nDisponible tambi&eacute;n como fotocopiadora remanufacturada.<br />\r\nL&iacute;nea de pie PRO, Serie 1. Color. Seminuevas.<br />\r\nRicoh PRO C5100S</p>', 1, 'productos/30 PRO C5100S.png', 19, NULL, NULL),
(125, 'Konica Minolta BH 223', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH 223</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Junio de 2010</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 22 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador autom&aacute;tico de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 623 x 794 x 700 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 3,650 hojas / 3,200 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 60 - 210 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 25,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>80,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 80,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 19,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 223 / BH 283</p>', 1, 'productos/1 BH 223.png', 15, NULL, NULL),
(126, 'Konica Minolta BH 283', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH 283</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Junio de 2010</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 28 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador autom&aacute;tico de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>623 x 794 x 700 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,650 hojas / 3,200 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 210 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 25,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>100,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>100,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 28,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 223 / BH 283</p>', 1, 'productos/2 BH 283.png', 15, NULL, NULL),
(127, 'Konica Minolta BH 363', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH 363</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Junio de 2010</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>36 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador autom&aacute;tico de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 623 x 799 x 816 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,650 hojas / 3,200 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 210 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>25,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>110,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 110,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 48,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 363 / BH 423</p>', 1, 'productos/3 BH 363.png', 15, NULL, NULL),
(128, 'Konica Minolta BH 423', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH 423</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Junio de 2010</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>42 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 623 x 799 x 816 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,650 hojas / 3,200 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 210 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 25,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>120,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>120,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 60,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 363 / BH 423</p>', 1, 'productos/4 BH 423.png', 15, NULL, NULL),
(129, 'Konica Minolta BH 224e', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH 224e</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Noviembre de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 22 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF / SPDF)</li>\r\n	<li><strong>Capacidad del ARDF y SPDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>615 x 685 x 922 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 3,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 50 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>27,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>70,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>19,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 224e / BH 284e / BH 364e</p>', 1, 'productos/5 BH 224e.png', 15, NULL, NULL),
(130, 'Konica Minolta BH 284e', '<p>La fotocopiadora multifuncional<strong> Konica Minolta BH 284e</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Noviembre de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>28 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF / SPDF)</li>\r\n	<li><strong>Capacidad del ARDF y SPDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>615 x 685 x 922 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>50 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>27,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 120,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 28,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 224e / BH 284e / BH 364e</p>', 1, 'productos/6 BH 284e.png', 15, NULL, NULL),
(131, 'Konica Minolta BH 364e', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH 364e</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Noviembre de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>36 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF / SPDF)</li>\r\n	<li><strong>Capacidad del ARDF y SPDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>615 x 685 x 922 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 3,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 50 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>27,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 120,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>48,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 224e / BH 284e / BH 364e</p>', 1, 'productos/7 BH 364e.png', 15, NULL, NULL),
(133, 'Konica Minolta BH 454e', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH 454e</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Noviembre de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 45 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>615 x 686 x 922 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 6,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 50 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>28,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 130,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 454e / BH 554e</p>', 1, 'productos/8 BH 454.png', 15, NULL, NULL),
(134, 'Konica Minolta BH 554e', '<p>La fotocopiadora multifuncional<strong> Konica Minolta BH 554e</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Noviembre de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 55 ppm</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 615 x 686 x 922 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>6,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 50 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 28,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>135,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>60,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 454e / BH 554e</p>', 1, 'productos/9 BH 554.png', 15, NULL, NULL),
(135, 'Konica Minolta BH 654', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH 654</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 65 ppm</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>150 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>650 x 799 x 1155 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>6,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>47,200 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>1,200,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>300,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 654 / BH 754</p>', 1, 'productos/10 BH 654.png', 15, NULL, NULL),
(136, 'Konica Minolta BH 754', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH 754</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Abril de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 75 ppm</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>150 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 650 x 799 x 1155 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>6,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>47,200 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 1,200,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>300,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 654 / BH 754</p>', 1, 'productos/11 BH 754.png', 15, NULL, NULL),
(137, 'Konica Minolta BH 227', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH 227</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Julio de 2015</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 22 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador autom&aacute;tico de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 585 x 660 x 735 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6S / A5 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,600 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 256 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>23,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 80,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 19,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 227 / BH 287</p>', 1, 'productos/12 BH 227.png', 15, NULL, NULL),
(138, 'Konica Minolta BH 287', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH 287</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Julio de 2015</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>28 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador autom&aacute;tico de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>585 x 660 x 735 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6S / A5 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,600 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 256 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>23,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro: </strong>100,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 28,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 227 / BH 287</p>', 1, 'productos/13 BH 287.png', 15, NULL, NULL),
(139, 'Konica Minolta BH 367', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH 367</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Julio de 2015</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 36 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador autom&aacute;tico de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>585 x 660 x 735 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6S / A5 - A3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,600 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 23,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro:</strong> 110,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 48,000 p&aacute;ginas</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Blanco y negro. Seminuevas.<br />\r\nRicoh BH 367</p>', 1, 'productos/14 BH 367.png', 15, NULL, NULL),
(142, 'Konica Minolta BH C3851', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C3851</strong> es parte de una gran<br />\r\ngama de aliados de oficina compactos, que garantizan calidad al<br />\r\ncumplir con las necesidades de tu emprendimiento, negocio o empresa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Marzo de 2017</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 38 ppm</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador autom&aacute;tico de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 555 x 584 x 603 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A4</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 1,650 hojas / 250 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 60 - 210 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 13,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>12,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen BK/CMY: </strong>70,000 / 60,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>5,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa Bizhub. Color. Seminuevas.<br />\r\nKonica Minolta BH C3851</p>', 1, 'productos/2 BH C3851.png', 16, NULL, NULL),
(143, 'Konica Minolta BH C220', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C220</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Septiembre de 2009</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>22 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador autom&aacute;tico de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 643 x 848 x 770 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A5 - A3+</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 3,650 hojas / 3,200 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 64 - 271 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>29,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK/CMY: </strong>570,000 / 115,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>70,000 / 55,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 35,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C220</p>', 1, 'productos/3 BH C220.png', 16, NULL, NULL),
(144, 'Konica Minolta BH C280', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C280</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Septiembre de 2009</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 28 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador autom&aacute;tico de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 643 x 848 x 770 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A5 - A3+</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,650 hojas / 3,200 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 64 - 271 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 29,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK/CMY: </strong>570,000 / 115,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY:</strong> 100,000 / 75,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 45,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C280 / C360</p>', 1, 'productos/4 BH C280.png', 16, NULL, NULL),
(145, 'Konica Minolta BH C360', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C360</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Septiembre de 2009</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>36 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador autom&aacute;tico de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 643 x 848 x 770 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A5 - A3+</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,650 hojas / 3,200 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>64 - 271 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 29,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador BK/CMY:</strong> 570,000 / 115,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>120,000 / 90,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C280 / C360</p>', 1, 'productos/5 BH C360.png', 16, NULL, NULL),
(146, 'Konica Minolta BH C224e', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C224e</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Abril de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>22 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>2GB RAM, 250GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF/SPDF)</li>\r\n	<li><strong>Capacidad del ARDF / SPDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>615 x 685 x 779 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 60 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 27,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 25,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>70,000 / 55,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>15,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C224e / BH C284e / BH C364e</p>', 1, 'productos/9 BH C224e.png', 16, NULL, NULL),
(147, 'Konica Minolta BH C284e', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C284e</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Abril de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 28 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF/SPDF)</li>\r\n	<li><strong>Capacidad del ARDF / SPDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 615 x 685 x 779 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 60 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 27,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>25,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>70,000 / 55,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C224e / BH C284e / BH C364e</p>', 1, 'productos/10 BH C284e.png', 16, NULL, NULL),
(148, 'Konica Minolta BH C364e', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C364e</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Marzo de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>36 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF/SPDF)</li>\r\n	<li><strong>Capacidad del ARDF / SPDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 615 x 685 x 779 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 27,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 25,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>70,000 / 55,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>25,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C224e / BH C284e / BH C364e</p>', 1, 'productos/11 BH C364e.png', 16, NULL, NULL),
(149, 'Konica Minolta BH C454e', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C454e</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Abril de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n: </strong>45 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>615 x 685 x 921 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 60 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 28,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 590,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>130,000 / 95,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C454e / BH C554e</p>', 1, 'productos/12 BH C454e.png', 16, NULL, NULL);
INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `detalles`, `estado`, `imagen`, `categoria_id`, `facebook`, `compartir`) VALUES
(150, 'Konica Minolta BH C554e', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C554e</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Abril de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 55 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>615 x 685 x 921 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 28,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>590,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>135,000 / 95,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 60,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C454e / BH C554e</p>', 1, 'productos/13 BH C554e.png', 16, NULL, NULL),
(151, 'Konica Minolta BH C654e', '<p>La fotocopiadora multifuncional<strong> Konica Minolta BH C654e</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Julio de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 65 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>150 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>650 x 799 x 1155 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>6,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 47,200 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>31,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 1,200,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>300,000 / 155,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C654e / BH C754e</p>', 1, 'productos/14 BH C654e.png', 16, NULL, NULL),
(152, 'Konica Minolta BH C754e', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C754e</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Julio de 2013</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 75 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 150 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 650 x 799 x 1155 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>6,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>52 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>47,200 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 31,500 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>1,200,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>300,000 / 155,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C654e / BH C754e</p>', 1, 'productos/15 BH C754e.png', 16, NULL, NULL),
(153, 'Konica Minolta BH C227', '<p>La fotocopiadora multifuncional<strong> Konica Minolta BH C227</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Febrero de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 22 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador autom&aacute;tico de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 585 x 660 x 787 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A5 - A3 / A6S</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,600 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 60 - 256 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>27,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>25,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>80,000 / 70,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>19,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C227 / BH C287</p>', 1, 'productos/16 BH C227.png', 16, NULL, NULL),
(154, 'Konica Minolta BH C287', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C287</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 28 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador autom&aacute;tico de documentos reversible (ARDF)</li>\r\n	<li><strong>Capacidad del ARDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 585 x 660 x 787 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A5 - A3 / A6S</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>3,600 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 256 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>27,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>25,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY:</strong> 105,000 / 90,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>28,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C227 / BH C287</p>', 1, 'productos/17 BH C287.png', 16, NULL, NULL),
(155, 'Konica Minolta BH C258', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C258</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Febrero de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 25 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF / SPDF)</li>\r\n	<li><strong>Capacidad del ARDF / SPDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 615 x 686 x 787 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> SRA3 / A6 - A3 / B6</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>6,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 50 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 28,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>120,000 / 55,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 15,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nDisponible tambi&eacute;n como fotocopiadora remanufacturada.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C258 / BH C308 / BH C368</p>', 1, 'productos/18 BH C258.png', 16, NULL, NULL),
(156, 'Konica Minolta BH C308', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C308</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Agosto de 2015</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 30 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF / SPDF)</li>\r\n	<li><strong>Capacidad del ARDF / SPDF:</strong> 100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>615 x 686 x 787 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo: </strong>600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> SRA3 / A6 - A3 / B6</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>6,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.):</strong> 50 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK: </strong>28,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>120,000 / 75,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>20,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nDisponible tambi&eacute;n como fotocopiadora remanufacturada.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C258 / BH C308 / BH C368</p>', 1, 'productos/19 BH C308.png', 16, NULL, NULL),
(157, 'Konica Minolta BH C368', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C368</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Agosto de 2015</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 36 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador reversible y de una sola pasada (ARDF / SPDF)</li>\r\n	<li><strong>Capacidad del ARDF / SPDF: </strong>100 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 615 x 686 x 787 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> SRA3 / A6 - A3 / B6</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 6,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>50 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 28,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>120,000 / 90,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 25,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nDisponible tambi&eacute;n como fotocopiadora remanufacturada.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C258 / BH C308 / BH C368</p>', 1, 'productos/20 BH C368.png', 16, NULL, NULL),
(158, 'Konica Minolta BH C458', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C458 </strong>es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Julio de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 45 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>300 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>615 x 693 x 961 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>6,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 28,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY:</strong> 135,000 / 100,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 50,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador opcional.<br />\r\nDisponible tambi&eacute;n como fotocopiadora remanufacturada.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C458 / BH C558</p>', 1, 'productos/21 BH C458.png', 16, NULL, NULL),
(159, 'Konica Minolta BH C558', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C558</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Julio de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 55 ppm&nbsp;</li>\r\n	<li><strong>Memoria: </strong>4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 300 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>615 x 693 x 961 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 6,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 28,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY:</strong> 26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK: </strong>600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>140,000 / 100,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 60,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nFotocopiadora con finalizador opcional.<br />\r\nDisponible tambi&eacute;n como fotocopiadora remanufacturada.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C458 / BH C558</p>', 1, 'productos/22 BH C558.png', 16, NULL, NULL),
(160, 'Konica Minolta BH C658', '<p>La fotocopiadora multifuncional <strong>Konica Minolta BH C658</strong> es el equipo de impresi&oacute;n<br />\r\nque tu centro de trabajo necesitaba. La versatilidad de estos equipos<br />\r\nhar&aacute;n que sean tu herramienta indispensable de producci&oacute;n.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n:</strong> Julio de 2016</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 65 ppm&nbsp;</li>\r\n	<li><strong>Memoria:</strong> 4GB RAM, 250GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF:</strong> 300 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto): </strong>615 x 768 x 961 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia: </strong>600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n: </strong>1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos: </strong>A6 - A3 / SRA3</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.): </strong>6,650 hojas / 3,300 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>50 - 300 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 28,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>26,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del revelador CMYK:</strong> 600,000 p&aacute;ginas</li>\r\n	<li><strong>Rendimiento del cilindro BK/CMY: </strong>150,000 / 105,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo: </strong>150,000 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/xmTff9s\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de pie Bizhub. Color. Seminuevas.<br />\r\nRicoh BH C658</p>', 1, 'productos/23 BH C658.png', 16, NULL, NULL),
(169, 'Tóner Ricoh Aficio 1515 / MP 161', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio / Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio 1515</li>\r\n	<li>Ricoh Aficio 1515F</li>\r\n	<li>Ricoh Aficio 1515SPF</li>\r\n	<li>MP 161</li>\r\n	<li>MP 161F</li>\r\n	<li>MP 161SPF</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 7,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 230 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/1 Aficio 1515.png', 30, NULL, NULL),
(170, 'Tóner Ricoh Aficio MP 171 / MP 201', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio / Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>MP 171</li>\r\n	<li>MP 171F</li>\r\n	<li>MP 171SPF</li>\r\n	<li>MP 201F</li>\r\n	<li>MP 201SPF</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 7,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 230 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/1 Aficio 1515.png', 30, NULL, NULL),
(171, 'Tóner Ricoh Aficio MP 301', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 301SP</li>\r\n	<li>Ricoh Aficio MP 301SPF</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 8,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 230 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/2 MP 301.png', 30, NULL, NULL),
(172, 'Tóner Ricoh Aficio MP 305', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 305SPF</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 9,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>250 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a><br />\r\n&nbsp;</p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/3 MP 305.png', 30, NULL, NULL),
(177, 'Tóner Ricoh Aficio MP 401 / MP 402', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 401SPF</li>\r\n	<li>Ricoh Aficio MP 402SPF</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 10,400 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 270 g</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/4 MP 401SPF.png', 30, NULL, NULL),
(179, 'Tóner Ricoh Aficio SP 4520DN', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio SP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio SP 4520DN</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 10,400 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 270 g</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/4 MP 401SPF.png', 30, NULL, NULL),
(180, 'Ricoh MP 501 / MP 601', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP 501SPF</li>\r\n	<li>Ricoh MP 601SPF</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 25,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 678 g</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/5 MP 501.png', 30, NULL, NULL),
(181, 'Tóner Ricoh SP 5300DN / SP 5310DN', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>SP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh SP 5300DN</li>\r\n	<li>Ricoh SP 5310DN</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 25,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 678 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/5 MP 501.png', 30, NULL, NULL),
(182, 'Tóner Ricoh IM 430F / P 502', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>IM / P</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh IM 430F</li>\r\n	<li>Ricoh P 502</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 17,400 p&aacute;ginas @5%</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEst&aacute;ndar.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/6 IM 430F.png', 30, NULL, NULL),
(183, 'Tóner Ricoh IM 550F / IM 600SRF', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>IM</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh IM 550F</li>\r\n	<li>Ricoh IM 600SRF</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 25,500 p&aacute;ginas @5%</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEst&aacute;ndar.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/7 IM 550F.png', 30, NULL, NULL),
(184, 'Tóner Ricoh P 800 / P 801', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>P</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh P 800</li>\r\n	<li>Ricoh P 801</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>25,500 p&aacute;ginas @5%</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEst&aacute;ndar.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/7 IM 550F.png', 30, NULL, NULL),
(185, 'Tóner Ricoh Aficio SP 5200 / SP 5210', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio SP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio SP 5200DN</li>\r\n	<li>Ricoh Aficio SP 5200S</li>\r\n	<li>Ricoh Aficio SP 5210DN</li>\r\n	<li>Ricoh Aficio SP 5210SF</li>\r\n	<li>Ricoh Aficio SP 5210SR</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 25,000 p&aacute;ginas @5%</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEst&aacute;ndar.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/8 Aficio SP 5200DN.png', 30, NULL, NULL),
(189, 'Tóner Ricoh Aficio 1022 / 1027 / 1032', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio 1022</li>\r\n	<li>Ricoh Aficio 1027</li>\r\n	<li>Ricoh Aficio 1032</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 11,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 360 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/9 Aficio 1022.png', 30, NULL, NULL),
(190, 'Tóner Ricoh Aficio 2022 / 2027 / 2032', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea<strong> Aficio</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio 2022</li>\r\n	<li>Ricoh Aficio 2027</li>\r\n	<li>Ricoh Aficio 2032</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 11,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 360 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/9 Aficio 1022.png', 30, NULL, NULL),
(191, 'Tóner Ricoh Aficio 3025 / 3030', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio 3025</li>\r\n	<li>Ricoh Aficio 3025P</li>\r\n	<li>Ricoh Aficio 3025SP</li>\r\n	<li>Ricoh Aficio 3025SPF</li>\r\n	<li>Ricoh Aficio 3025SPI</li>\r\n	<li>Ricoh Aficio 3030</li>\r\n	<li>Ricoh Aficio 3030P</li>\r\n	<li>Ricoh Aficio 3030SP</li>\r\n	<li>Ricoh Aficio 3030SPF</li>\r\n	<li>Ricoh Aficio 3030SPI</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 11,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 360 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/9 Aficio 1022.png', 30, NULL, NULL),
(195, 'Tóner Ricoh Aficio MP 2352 / MP 2510', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 2352SP</li>\r\n	<li>Ricoh Aficio MP 2510</li>\r\n	<li>Ricoh Aficio MP 2510P</li>\r\n	<li>Ricoh Aficio MP 2510PF</li>\r\n	<li>Ricoh Aficio MP 2510SP</li>\r\n	<li>Ricoh Aficio MP 2510SPF</li>\r\n	<li>Ricoh Aficio MP 2510SPI</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>11,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>360 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/9 Aficio 1022.png', 30, NULL, NULL),
(196, 'Tóner Ricoh Aficio MP 2550 / MP 2851', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 2550</li>\r\n	<li>Ricoh Aficio MP 2550B</li>\r\n	<li>Ricoh Aficio MP 2550SP</li>\r\n	<li>Ricoh Aficio MP 2550SPF</li>\r\n	<li>Ricoh Aficio MP 2851</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>11,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>360 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a><br />\r\n&nbsp;</p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/9 Aficio 1022.png', 30, NULL, NULL),
(197, 'Tóner Ricoh Aficio MP 2852 / MP 3010', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 2852</li>\r\n	<li>Ricoh Aficio MP 2852SP</li>\r\n	<li>Ricoh Aficio MP 3010</li>\r\n	<li>Ricoh Aficio MP 3010P</li>\r\n	<li>Ricoh Aficio MP 3010SP</li>\r\n	<li>Ricoh Aficio MP 3010SPF</li>\r\n	<li>Ricoh Aficio MP 3010SPFI</li>\r\n	<li>Ricoh Aficio MP 3010SPI</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>11,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>360 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/9 Aficio 1022.png', 30, NULL, NULL),
(198, 'Tóner Ricoh Aficio MP 3350 / MP 3351', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 3350</li>\r\n	<li>Ricoh Aficio MP 3350B</li>\r\n	<li>Ricoh Aficio MP 3350SP</li>\r\n	<li>Ricoh Aficio MP 3350SPF</li>\r\n	<li>Ricoh Aficio MP 3351SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>11,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 360 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/9 Aficio 1022.png', 30, NULL, NULL),
(199, 'Tóner Ricoh Aficio MP 3352', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 3352</li>\r\n	<li>Ricoh Aficio MP 3352SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>11,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 360 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.<br />\r\n&nbsp;</p>', 1, 'productos/9 Aficio 1022.png', 30, NULL, NULL),
(200, 'Tóner Ricoh MP 2553 / MP 3053', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP 2553</li>\r\n	<li>Ricoh MP 3053</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>11,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 360 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/9 Aficio 1022.png', 30, NULL, NULL),
(201, 'Tóner Ricoh MP 3353', '<p>T&oacute;ner negro de la marca<strong> Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP 3353</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 11,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>360 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/9 Aficio 1022.png', 30, NULL, NULL),
(203, 'Ricoh Aficio 3035 / 3045', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio 3035</li>\r\n	<li>Ricoh Aficio 3035G</li>\r\n	<li>Ricoh Aficio 3035SP</li>\r\n	<li>Ricoh Aficio 3035SPF</li>\r\n	<li>Ricoh Aficio 3035SPI</li>\r\n	<li>Ricoh Aficio 3045</li>\r\n	<li>Ricoh Aficio 3045G</li>\r\n	<li>Ricoh Aficio 3045SP</li>\r\n	<li>Ricoh Aficio 3045SPF</li>\r\n	<li>Ricoh Aficio 3045SPI</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>30,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>550 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/10 Aficio 2035.png', 30, NULL, NULL),
(204, 'Tóner Ricoh Aficio MP 3500 / MP 4000', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 3500</li>\r\n	<li>Ricoh Aficio MP 3500P</li>\r\n	<li>Ricoh Aficio MP 3500SP</li>\r\n	<li>Ricoh Aficio MP 3500SPF</li>\r\n	<li>Ricoh Aficio MP 3500SPI</li>\r\n	<li>Ricoh Aficio MP 4000</li>\r\n	<li>Ricoh Aficio MP 4000B</li>\r\n	<li>Ricoh Aficio MP 4000SP</li>\r\n	<li>Ricoh Aficio MP 4000SPF</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 30,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 630 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/11 Aficio MP 3500.png', 30, NULL, NULL),
(205, 'Tóner Ricoh Aficio MP 4001 / MP 4002', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 4001</li>\r\n	<li>Ricoh Aficio MP 4001G</li>\r\n	<li>Ricoh Aficio MP 4002</li>\r\n	<li>Ricoh Aficio MP 4002SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>30,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>630 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/11 Aficio MP 3500.png', 30, NULL, NULL),
(207, 'Tóner Ricoh Aficio MP 4500 / MP 5000', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 4500</li>\r\n	<li>Ricoh Aficio MP 4500P</li>\r\n	<li>Ricoh Aficio MP 4500SP</li>\r\n	<li>Ricoh Aficio MP 4500SPF</li>\r\n	<li>Ricoh Aficio MP 4500SPI</li>\r\n	<li>Ricoh Aficio MP 5000</li>\r\n	<li>Ricoh Aficio MP 5000B</li>\r\n	<li>Ricoh Aficio MP 5000SP</li>\r\n	<li>Ricoh Aficio MP 5000SPF&nbsp;</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 30,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 630 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/11 Aficio MP 3500.png', 30, NULL, NULL),
(208, 'Tóner Ricoh Aficio MP 5001 / MP 5002', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 5001</li>\r\n	<li>Ricoh Aficio MP 5001G</li>\r\n	<li>Ricoh Aficio MP 5001SP</li>\r\n	<li>Ricoh Aficio MP 5002</li>\r\n	<li>Ricoh Aficio MP 5002SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 30,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 630 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/11 Aficio MP 3500.png', 30, NULL, NULL),
(209, 'Tóner Ricoh Aficio 2035 / 2045', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio 2035&nbsp;</li>\r\n	<li>Ricoh Aficio 2035E</li>\r\n	<li>Ricoh Aficio 2035EG</li>\r\n	<li>Ricoh Aficio 2035ESP</li>\r\n	<li>Ricoh Aficio 2035G</li>\r\n	<li>Ricoh Aficio 2035P</li>\r\n	<li>Ricoh Aficio 2035S</li>\r\n	<li>Ricoh Aficio 2045</li>\r\n	<li>Ricoh Aficio 2045E</li>\r\n	<li>Ricoh Aficio 2045G</li>\r\n	<li>Ricoh Aficio 2045P</li>\r\n	<li>Ricoh Aficio 2045S</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 30,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 550 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/10 Aficio 2035.png', 30, NULL, NULL),
(210, 'Tóner Ricoh MP 2554 / MP 2555', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP 2554SP</li>\r\n	<li>Ricoh MP 2555SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>37,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1,050 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/12 MP 2554SP.png', 30, NULL, NULL),
(211, 'Tóner Ricoh MP 3054 / MP 3055', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea<strong> MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP 3054SP</li>\r\n	<li>Ricoh MP 3055SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 37,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,050 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/12 MP 2554SP.png', 30, NULL, NULL),
(212, 'Tóner Ricoh MP 3554 / MP 3555', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea MP:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP 3554SP</li>\r\n	<li>Ricoh MP 3555SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 37,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1,050 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/12 MP 2554SP.png', 30, NULL, NULL),
(213, 'Tóner Ricoh MP 4054 / MP 4055', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP 4054SP</li>\r\n	<li>Ricoh MP 4055SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 37,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1,050 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/12 MP 2554SP.png', 30, NULL, NULL),
(214, 'Tóner Ricoh MP 5054 / MP 5055', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium </strong>compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP 5054SP</li>\r\n	<li>Ricoh MP 5055SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 37,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1,050 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/12 MP 2554SP.png', 30, NULL, NULL),
(215, 'Tóner Ricoh MP 6054 / MP 6055', '<p>T&oacute;ner negro de la marca<strong> Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP 6054SP</li>\r\n	<li>Ricoh MP 6055SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>37,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,050 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/12 MP 2554SP.png', 30, NULL, NULL);
INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `detalles`, `estado`, `imagen`, `categoria_id`, `facebook`, `compartir`) VALUES
(216, 'Tóner Ricoh Aficio 1060 / 1070 / 1075', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio 1060</li>\r\n	<li>Ricoh Aficio 1070</li>\r\n	<li>Ricoh Aficio 1075</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>43,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,100 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/13 Aficio 1060.png', 30, NULL, NULL),
(217, 'Tóner Ricoh Aficio 2051 / 2060 / 2075', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio 2051</li>\r\n	<li>Ricoh Aficio 2051SP</li>\r\n	<li>Ricoh Aficio 2060</li>\r\n	<li>Ricoh Aficio 2060SP&nbsp;</li>\r\n	<li>Ricoh Aficio 2075</li>\r\n	<li>Ricoh Aficio 2075SP&nbsp;</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>43,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,100 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/13 Aficio 1060.png', 30, NULL, NULL),
(218, 'Tóner Ricoh Aficio AP 900 / MP 5500', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>AP / Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio AP 900</li>\r\n	<li>Ricoh Aficio MP 5500</li>\r\n	<li>Ricoh Aficio MP 5500SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>43,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1,100 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/13 Aficio 1060.png', 30, NULL, NULL),
(219, 'Tóner Ricoh Aficio MP 6000 / MP 6001', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 6000</li>\r\n	<li>Ricoh Aficio MP 6000SP</li>\r\n	<li>Ricoh Aficio MP 6001</li>\r\n	<li>Ricoh Aficio MP 6001</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 43,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,100 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/13 Aficio 1060.png', 30, NULL, NULL),
(220, 'Tóner Ricoh Aficio MP 6002 / MP 6500', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 6002</li>\r\n	<li>Ricoh Aficio MP 6002SP</li>\r\n	<li>Ricoh Aficio MP 6500</li>\r\n	<li>Ricoh Aficio MP 6500SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>43,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,100 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/13 Aficio 1060.png', 30, NULL, NULL),
(221, 'Tóner Ricoh Aficio MP 7000 / MP 7001', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 7000</li>\r\n	<li>Ricoh Aficio MP 7000SP</li>\r\n	<li>Ricoh Aficio MP 7001</li>\r\n	<li>Ricoh Aficio MP 7001SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 43,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1,100 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/13 Aficio 1060.png', 30, NULL, NULL),
(222, 'Ricoh Aficio MP 7500 / MP 7502', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 7500</li>\r\n	<li>Ricoh Aficio MP 7500SP</li>\r\n	<li>Ricoh Aficio MP 7502</li>\r\n	<li>Ricoh Aficio MP 7502SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>43,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1,100 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/13 Aficio 1060.png', 30, NULL, NULL),
(223, 'Tóner Ricoh Aficio MP 8000 / MP 8001', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 8000</li>\r\n	<li>Ricoh Aficio MP 8000SP</li>\r\n	<li>Ricoh Aficio MP 8001</li>\r\n	<li>Ricoh Aficio MP 8001SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 43,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,100 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/13 Aficio 1060.png', 30, NULL, NULL),
(224, 'Tóner Ricoh Aficio MP 9000 / MP 9001', '<p>T&oacute;ner negro de la marca<strong> Densitone Premium </strong>compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea<strong> Aficio MP:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP 9001</li>\r\n	<li>Ricoh Aficio MP 9001SP</li>\r\n	<li>Ricoh Aficio MP 9002</li>\r\n	<li>Ricoh Aficio MP 9002SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>43,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,100 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/13 Aficio 1060.png', 30, NULL, NULL),
(225, 'Tóner Ricoh Aficio SP 9100DN', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio SP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio SP 9100DN</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>43,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,100 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a><br />\r\n&nbsp;</p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/13 Aficio 1060.png', 30, NULL, NULL),
(226, 'Tóner Ricoh IM 7000 / IM 8000', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>IM</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh IM 7000</li>\r\n	<li>Ricoh IM 8000</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>43,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,100 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/13 Aficio 1060.png', 30, NULL, NULL),
(227, 'Tóner Ricoh IM 9000 / MP 6503', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>IM / MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh IM 9000</li>\r\n	<li>Ricoh MP 6503SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>43,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,100 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/13 Aficio 1060.png', 30, NULL, NULL),
(228, 'Tóner Ricoh MP 7503 / MP 9003', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea<strong> MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP 7503SP</li>\r\n	<li>Ricoh MP 9003SP</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>43,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1,100 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/13 Aficio 1060.png', 30, NULL, NULL),
(229, 'Tóner Ricoh Aficio 2090 / 2105', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea Aficio:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio 2090</li>\r\n	<li>Ricoh Aficio 2105</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>60,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1,430 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/14 Aficio 2090.png', 30, NULL, NULL),
(230, 'Tóner Ricoh Aficio 1085 / 1105', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Aficio</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio 1085</li>\r\n	<li>Ricoh Aficio 1105</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>60,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1,430 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/14 Aficio 2090.png', 30, NULL, NULL),
(231, 'Tóner Ricoh MP 1100 / MP 1350', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP 1100</li>\r\n	<li>Ricoh MP 1350</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 60,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,430 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/14 Aficio 2090.png', 30, NULL, NULL),
(232, 'Tóner Ricoh MP 9000 / Pro 1106', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>MP / Pro</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP 9000</li>\r\n	<li>Ricoh Pro 1106EX</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>60,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,430 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/14 Aficio 2090.png', 30, NULL, NULL),
(233, 'Tóner Ricoh Pro 1107 / Pro 1356', '<p>T&oacute;ner negro de la marca<strong> Densitone Premium </strong>compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Pro</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Pro 1107</li>\r\n	<li>Ricoh Pro 1107EX</li>\r\n	<li>Ricoh Pro 1356EX</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 60,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1,430 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/14 Aficio 2090.png', 30, NULL, NULL),
(235, 'Tóner Ricoh Pro 1357 / Pro 906', '<p>T&oacute;ner negro de la marca<strong> Densitone Premium </strong>compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Pro</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Pro 1357</li>\r\n	<li>Ricoh Pro 1357EX</li>\r\n	<li>Ricoh Pro 906EX</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Rendimiento:</strong> 60,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1,430 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.<br />\r\n&nbsp;</p>', 1, 'productos/14 Aficio 2090.png', 30, NULL, NULL),
(236, 'Tóner Ricoh Pro 907', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium </strong>compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales Ricoh<br />\r\nblanco y negro l&iacute;nea <strong>Pro</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Pro 907</li>\r\n	<li>Ricoh Pro 907EX</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>60,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1,430 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Blanco y negro.</p>', 1, 'productos/14 Aficio 2090.png', 30, NULL, NULL),
(238, 'Tóner Ricoh Aficio MP C300 / MP C400 / MP C401', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP C300</li>\r\n	<li>Ricoh Aficio MP C300SR</li>\r\n	<li>Ricoh Aficio MP C400</li>\r\n	<li>Ricoh Aficio MP C400SR</li>\r\n	<li>Ricoh Aficio MP C401</li>\r\n	<li>Ricoh Aficio MP C401SR</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 10,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>10,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 215 g<br />\r\n<strong>Peso CMY: </strong>135 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEst&aacute;ndar.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/1 MP C300.png', 31, NULL, NULL),
(239, 'Tóner Ricoh Aficio MP C305', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP C305SP</li>\r\n	<li>Ricoh Aficio MP C305SPF</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>12,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 4,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 224 g<br />\r\n<strong>Peso CMY: </strong>83 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/2 MP C305.png', 31, NULL, NULL),
(242, 'Tóner Ricoh MP C307 / MP C407', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP C307</li>\r\n	<li>Ricoh MP C407</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>17,500 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>8,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 300 g<br />\r\n<strong>Peso C:</strong>100 g / <strong>M:</strong>115 g /<strong> Y:</strong>114 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/3 MP C306.png', 31, NULL, NULL),
(243, 'Tóner Ricoh MP C306 / MP C406', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP C306</li>\r\n	<li>Ricoh MP C406</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>17,500 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>8,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>300 g<br />\r\n<strong>Peso C:</strong>100 g / <strong>M:</strong>115 g / <strong>Y:</strong>114 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/3 MP C306.png', 31, NULL, NULL),
(245, 'Tóner Ricoh Aficio MP C2030 / MP C2050 / MP C2530', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP C2030</li>\r\n	<li>Ricoh Aficio MP C2050</li>\r\n	<li>Ricoh Aficio MP C2050SPF</li>\r\n	<li>Ricoh Aficio MP C2530</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>10,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>9,500 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>220 g<br />\r\n<strong>Peso CMY: </strong>140 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/4 MP C2030.png', 31, NULL, NULL),
(246, 'Tóner Ricoh Aficio MP C2550 / MP C2051 / MP C2551', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP C2550</li>\r\n	<li>Ricoh Aficio MP C2550SPF</li>\r\n	<li>Ricoh Aficio MP C2051</li>\r\n	<li>Ricoh Aficio MP C2551</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>10,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>9,500 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 220 g<br />\r\n<strong>Peso CMY: </strong>140 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/4 MP C2030.png', 31, NULL, NULL),
(247, 'Tóner Ricoh Aficio MP C3001 / MP C3501', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>Aficio MP</strong>:</p>\r\n\r\n<p><br />\r\nRicoh Aficio MP C3001<br />\r\nRicoh Aficio MP C3501</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 22,500 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 15,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>450 g<br />\r\n<strong>Peso CMY: </strong>370 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/5 MP C3001.png', 31, NULL, NULL),
(248, 'Tóner Ricoh Aficio MP C2800 / MP C3300', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea<strong> Aficio MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh Aficio MP C2800</li>\r\n	<li>Ricoh Aficio MP C3300</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>22,500 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>15,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>450 g<br />\r\n<strong>Peso CMY: </strong>370 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/5 MP C3001.png', 31, NULL, NULL),
(249, 'Tóner Ricoh MP C4000 / MP C4501', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP C4000</li>\r\n	<li>Ricoh MP C4000SPF</li>\r\n	<li>Ricoh MP C4501</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>25,500 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>17,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>520 g<br />\r\n<strong>Peso CMY: </strong>410 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/6 MP C4000.png', 31, NULL, NULL),
(250, 'Tóner Ricoh MP C5000 / MP C5501', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea<strong> MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP C5000</li>\r\n	<li>Ricoh MP C5000SPF</li>\r\n	<li>Ricoh MP C5501</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 25,500 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 17,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 520 g<br />\r\n<strong>Peso CMY:</strong> 410 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/6 MP C4000.png', 31, NULL, NULL),
(251, 'Tóner Ricoh MP C3002 / MP C3502', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP C3002</li>\r\n	<li>Ricoh MP C3502</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>28,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>18,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>510 g<br />\r\n<strong>Peso CMY:</strong> 370 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/7 MP C3002.png', 31, NULL, NULL),
(252, 'Tóner Ricoh MP C4502 / MP C5502', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea<strong> MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP C4502</li>\r\n	<li>Ricoh MP C4502A</li>\r\n	<li>Ricoh MP C5502</li>\r\n	<li>Ricoh MP C5502A</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>31,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>22,500 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>540 g<br />\r\n<strong>Peso CMY:</strong> 440 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/8 MP C4502.png', 31, NULL, NULL),
(254, 'Tóner Ricoh MP C2004 / MP C2504', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP C2004</li>\r\n	<li>Ricoh MP C2004ex</li>\r\n	<li>Ricoh MP C2504</li>\r\n	<li>Ricoh MP C2504ex</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>15,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 9,500 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>360 g<br />\r\n<strong>Peso CMY:</strong> 275 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/9 MP C2003.png', 31, NULL, NULL),
(256, 'Tóner Ricoh MP C3003 / MP C3503', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium </strong>compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP C3003</li>\r\n	<li>Ricoh MP C3503</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 29,500 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 18,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>495 g<br />\r\n<strong>Peso C:</strong>331 g / <strong>M:</strong>374 g / <strong>Y:</strong>359 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/10 MP C3003.png', 31, NULL, NULL),
(257, 'Tóner Ricoh MP C3004 / MP C3504', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP C3004</li>\r\n	<li>Ricoh MP C3504</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>29,500 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>18,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>495 g<br />\r\n<strong>Peso C:</strong>331 g / <strong>M:</strong>374 g / <strong>Y:</strong>359 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/10 MP C3003.png', 31, NULL, NULL),
(258, 'Tóner Ricoh MP C4503 / MP C5503 / MP C6003', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium </strong>compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea<strong> MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP C4503</li>\r\n	<li>Ricoh MP C5503</li>\r\n	<li>Ricoh MP C6003</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>33,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>22,500 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 560 g<br />\r\n<strong>Peso C:&nbsp;</strong>400 g / <strong>M:&nbsp;</strong>455 g / <strong>Y:&nbsp;</strong>437 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/11 MP C4503.png', 31, NULL, NULL),
(259, 'Tóner Ricoh MP C4504 / MP C6004', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP C4504</li>\r\n	<li>Ricoh MP C6004</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 33,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 22,500 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 560 g<br />\r\n<strong>Peso C:</strong>400 g / <strong>M:</strong>455 g / <strong>Y:</strong>437 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/11 MP C4503.png', 31, NULL, NULL),
(260, 'Tóner Ricoh IM C2000 / IM C2500', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea<strong> IM:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh IM C2000</li>\r\n	<li>Ricoh IM C2500</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>16,500 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 10,500 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 365 g<br />\r\n<strong>Peso C:</strong>245 g / <strong>M:</strong>289 g / <strong>Y:</strong>283 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a><br />\r\n&nbsp;</p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/12 IM C2000.png', 31, NULL, NULL),
(261, 'Tóner Ricoh IM C3000 / IM C3500', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>IM</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh IM C3000</li>\r\n	<li>Ricoh IM C3500</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 31,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 19,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>598 g<br />\r\n<strong>Peso C:</strong>412 g / <strong>M:</strong>456 g / <strong>Y:</strong>440 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/13 IM C3000.png', 31, NULL, NULL),
(262, 'Tóner Ricoh IM C4500 / IM C6000', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea<strong> IM</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh IM C4500</li>\r\n	<li>Ricoh IM C6000</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 33,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 22,500 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 598 g<br />\r\n<strong>Peso C:</strong>516 g / <strong>M:</strong>537 g / <strong>Y:</strong>440 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/14 IM C4500.png', 31, NULL, NULL),
(263, 'Tóner Ricoh MP C2003 / MP C2503', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Ricoh color l&iacute;nea <strong>MP</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Ricoh MP C2003</li>\r\n	<li>Ricoh MP C2503</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 15,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 9,500 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>360 g<br />\r\n<strong>Peso CMY: </strong>275 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nPremium con recarga f&aacute;cil.<br />\r\nT&oacute;ner Densitone para Ricoh Color.</p>', 1, 'productos/9 MP C2003.png', 31, NULL, NULL),
(264, 'Tóner Konica Minolta BH 164 / BH 184 / BH 215', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 164</li>\r\n	<li>Konica Minolta BH 184</li>\r\n	<li>Konica Minolta BH 215</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN116; TN118]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 12,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>282 g c/u</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/2 BH 164.png', 27, NULL, NULL),
(265, 'Tóner Konica Minolta BH 200 / BH 250 / BH 350', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 200</li>\r\n	<li>Konica Minolta BH 250</li>\r\n	<li>Konica Minolta BH 350</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN211; TN311]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>17,500 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>360 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/3 BH 200.png', 27, NULL, NULL),
(266, 'Tóner Konica Minolta BH 222 / BH 282 / BH 362', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 222</li>\r\n	<li>Konica Minolta BH 282</li>\r\n	<li>Konica Minolta BH 362</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN211; TN311]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 17,500 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 360 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/3 BH 200.png', 27, NULL, NULL),
(267, 'Tóner Konica Minolta BH 223 / BH 283', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 223</li>\r\n	<li>Konica Minolta BH 283</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN217; TN414]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>25,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>512 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/4 BH 223.png', 27, NULL, NULL),
(268, 'Tóner Konica Minolta BH 363 / BH 423', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea<strong> Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 363</li>\r\n	<li>Konica Minolta BH 423</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN217; TN414]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>25,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>512 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/4 BH 223.png', 27, NULL, NULL),
(269, 'Tóner Konica Minolta BH 360 / BH 420 / BH 500', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 360</li>\r\n	<li>Konica Minolta BH 420</li>\r\n	<li>Konica Minolta BH 500</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN511]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>32,200 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 676 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/5 BH 360.png', 27, NULL, NULL),
(270, 'Tóner Konica Minolta BH 361 / BH 421 / BH 501', '<p>T&oacute;ner negro de la marca<strong> Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea<strong> Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 361</li>\r\n	<li>Konica Minolta BH 421</li>\r\n	<li>Konica Minolta BH 501</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TN511]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>32,200 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>676 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/5 BH 360.png', 27, NULL, NULL),
(271, 'Tóner Konica Minolta BH 600 / BH 750', '<p>T&oacute;ner negro de la marca<strong> Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea<strong> Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 600</li>\r\n	<li>Konica Minolta BH 750</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TN710]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 55,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1160 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/6 BH 600.png', 27, NULL, NULL),
(272, 'Tóner Konica Minolta BH 601 / BH 751', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 601</li>\r\n	<li>Konica Minolta BH 751</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN710]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>55,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>1160 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/6 BH 600.png', 27, NULL, NULL),
(273, 'Tóner Konica Minolta BH Pro 951 / BH Pro 1050', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub Pro:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH Pro 951</li>\r\n	<li>Konica Minolta BH Pro 1050</li>\r\n	<li>Konica Minolta BH Pro 1050e</li>\r\n	<li>Konica Minolta BH Pro 1050EP</li>\r\n	<li>Konica Minolta BH Pro 1050P</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN010; TN011; TN015]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>137,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1600 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/7 BH Pro951.png', 27, NULL, NULL),
(274, 'Tóner Konica Minolta BH Pro 1051 / BH Pro 1200', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium </strong>compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub Pro:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH Pro 1051</li>\r\n	<li>Konica Minolta BH Pro 1200</li>\r\n	<li>Konica Minolta BH Pro 1200P</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN010; TN011; TN015]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>137,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 1600 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/7 BH Pro951.png', 27, NULL, NULL),
(275, 'Tóner Konica Minolta BH 224e / BH 284e / BH 364e', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 224e</li>\r\n	<li>Konica Minolta BH 284e</li>\r\n	<li>Konica Minolta BH 364e</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN322]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 27,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>544 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/8 BH 224e.png', 27, NULL, NULL),
(276, 'Tóner Konica Minolta BH 454e / BH 554e', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 454e</li>\r\n	<li>Konica Minolta BH 554e</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN513]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>28,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>579 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/9 BH 454e.png', 27, NULL, NULL),
(277, 'Tóner Konica Minolta BH 227 / BH 287 / BH 637', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 227</li>\r\n	<li>Konica Minolta BH 287</li>\r\n	<li>Konica Minolta BH 367</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TN323]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 23,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 579 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/10 BH 227.png', 27, NULL, NULL),
(278, 'Tóner Konica Minolta BH 308 / BH 368', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 308</li>\r\n	<li>Konica Minolta BH 308e</li>\r\n	<li>Konica Minolta BH 308ePS</li>\r\n	<li>Konica Minolta BH 368</li>\r\n	<li>Konica Minolta BH 368e</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN325 ; TN 326]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>26,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 600 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/11 BH 308.png', 27, NULL, NULL),
(279, 'Tóner Konica Minolta BH 458 / BH 558 / BH 658', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 458</li>\r\n	<li>Konica Minolta BH 558</li>\r\n	<li>Konica Minolta BH 458e</li>\r\n	<li>Konica Minolta BH 558e</li>\r\n	<li>Konica Minolta BH 658e</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TN515 ; TN516]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>26,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 600 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/11 BH 308.png', 27, NULL, NULL),
(280, 'Tóner Konica Minolta BH 758 / BH 808 / BH 958', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKonica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH 758</li>\r\n	<li>Konica Minolta BH 808</li>\r\n	<li>Konica Minolta BH 958</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN812]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 40,800 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 986 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/12 BH 758.png', 27, NULL, NULL);
INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `detalles`, `estado`, `imagen`, `categoria_id`, `facebook`, `compartir`) VALUES
(281, 'Tóner Konica Minolta BH C200 / BH C203', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea <strong>Bizhub</strong>:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C200</li>\r\n	<li>Konica Minolta BH C203</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TN213;TN214]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>26,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 20,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 466 g<br />\r\n<strong>Peso CMY:</strong> 364 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo&nbsp;</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/1 BH C200.png', 28, NULL, NULL),
(282, 'Tóner Konica Minolta BH C253 / BH C353', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C253</li>\r\n	<li>Konica Minolta BH C353</li>\r\n	<li>Konica Minolta BH C353P</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN213;TN214]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 26,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 20,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>466 g<br />\r\n<strong>Peso CMY: </strong>364 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a>&nbsp;</p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/1 BH C200.png', 28, NULL, NULL),
(283, 'Tóner Konica Minolta BH C220 / BH C280 / BH C360', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C220</li>\r\n	<li>Konica Minolta BH C280</li>\r\n	<li>Konica Minolta BH C360</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN216;TN319]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>29,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 26,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>524 g<br />\r\n<strong>Peso CMY:</strong> 437 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/2 BH C220.png', 28, NULL, NULL),
(284, 'Tóner Konica Minolta BH C451 / BH C550 / BH C650', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea<strong> Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C451</li>\r\n	<li>Konica Minolta BH C550</li>\r\n	<li>Konica Minolta BH C650</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TN411;TN611]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>45,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 27,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>765 g<br />\r\n<strong>Peso CMY:</strong> 460 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/3 BH C451.png', 28, NULL, NULL),
(285, 'Tóner Konica Minolta BH C452 / BH C552 / BH C652', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C452</li>\r\n	<li>Konica Minolta BH C552</li>\r\n	<li>Konica Minolta BH C552DS</li>\r\n	<li>Konica Minolta BH C652</li>\r\n	<li>Konica Minolta BH C652DS</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TN413;TN613]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 45,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 30,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>900 g<br />\r\n<strong>Peso CMY:</strong> 510 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/4 BH C452.png', 28, NULL, NULL),
(286, 'Tóner Konica Minolta BH C224 / BH C284 / BH C364', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\nDensitone Premium compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C224 (e)</li>\r\n	<li>Konica Minolta BH C284 (e)</li>\r\n	<li>Konica Minolta BH C364 (e)</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN321]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>27,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 25,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 544 g<br />\r\n<strong>Peso CMY:</strong>514 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/5 BH C224 REVISAR.png', 28, NULL, NULL),
(289, 'Tóner Konica Minolta BH C454 / BH C554', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C454 (e)</li>\r\n	<li>Konica Minolta BH C554 (e)</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN512]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>28,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>26,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 579 g<br />\r\n<strong>Peso CMY:</strong> 512 g</p>\r\n\r\n<p><br />\r\nVer en cat&aacute;logo</p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/6 BH C454.png', 28, NULL, NULL),
(290, 'Tóner Konica Minolta BH C258 / BH C308 / BH C368', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea<strong> Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C258</li>\r\n	<li>Konica Minolta BH C308</li>\r\n	<li>Konica Minolta BH C368</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN324]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>28,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>26,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 579 g<br />\r\n<strong>Peso CMY: </strong>512 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/6 BH C454.png', 28, NULL, NULL),
(291, 'Tóner Konica Minolta BH C654 / BH 654', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C654 (e)</li>\r\n	<li>Konica Minolta BH 654 (e)</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TN711][TN712; mon&oacute;cromo]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>47,200 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>31,500 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>980 g<br />\r\n<strong>Peso CMY: </strong>535 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/7 BH C654.png', 28, NULL, NULL),
(292, 'Tóners Konica Minolta BH C754 / BH 754', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea<strong> Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C754 (e)</li>\r\n	<li>Konica Minolta BH 754 (e)</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN711][TN712; mon&oacute;cromo]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 47,200 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 31,500 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>980 g<br />\r\n<strong>Peso CMY: </strong>535 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/7 BH C654.png', 28, NULL, NULL),
(293, 'Tóner Konica Minolta BH C3350 / BH C3850', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea<strong> Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C3350</li>\r\n	<li>Konica Minolta BH C3850</li>\r\n	<li>Konica Minolta BH C3850FS</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TNP-48K; TNP-48C]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 10,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>10,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>245 g<br />\r\n<strong>Peso CMY: </strong>215 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/8 BH C3350.png', 28, NULL, NULL),
(294, 'Tóner Konica Minolta BH C458 / BH C558 / BH C658', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium </strong>compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C458</li>\r\n	<li>Konica Minolta BH C558</li>\r\n	<li>Konica Minolta BH C658</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN514]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 28,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 26,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 596 g<br />\r\n<strong>Peso CMY:</strong> 550 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/9 BH C458.png', 28, NULL, NULL),
(295, 'Tóner Konica Minolta BH C226 / BH C256 / BH C266', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C226</li>\r\n	<li>Konica Minolta BH C256</li>\r\n	<li>Konica Minolta BH C266</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN223]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 24,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 20,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 480 g<br />\r\n<strong>Peso CMY:</strong> 370 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/11 BH C226.png', 28, NULL, NULL),
(296, 'Tóner Konica Minolta BH C227 / BH C287 (CMY)', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C227</li>\r\n	<li>Konica Minolta BH C287</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN221]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento CMY: </strong>21,000 p&aacute;ginas @5%<br />\r\n<strong>Peso C:</strong>509 g / <strong>M:</strong>467 g / <strong>Y:</strong>478 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/12 BH C227 REVISAR.png', 28, NULL, NULL),
(297, 'Tóner Konica Minolta BH C227 / BH C287 (BK)', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea<strong> Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C227</li>\r\n	<li>Konica Minolta BH C287</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TN221; solo t&oacute;ner BK]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>27,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 25,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 544 g<br />\r\n<strong>Peso CMY:</strong>514 g</p>\r\n\r\n<p><br />\r\nVer en cat&aacute;logo</p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/6 BH C454.png', 28, NULL, NULL),
(298, 'Tóner Konica Minolta BH C250i / BH C300i / BH C360i', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium </strong>compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C250i</li>\r\n	<li>Konica Minolta BH C300i</li>\r\n	<li>Konica Minolta BH C360i</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TN328]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>28,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>28,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK: </strong>547 g<br />\r\n<strong>Peso C:</strong>486 g / <strong>M:</strong>519 g /<strong> Y:</strong>498 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEst&aacute;ndar.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/13 BH C250i.png', 28, NULL, NULL),
(300, 'Tóner Konica Minolta BH C221 / BH C281', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium </strong>compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Konica Minolta l&iacute;nea <strong>Bizhub:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Konica Minolta BH C221</li>\r\n	<li>Konica Minolta BH C281</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TN220]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 27,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 25,000 p&aacute;ginas @5%<br />\r\n<strong>Peso BK:</strong> 544 g<br />\r\n<strong>Peso CMY:</strong>514 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Color.</p>', 1, 'productos/5 BH C224 REVISAR.png', 28, NULL, NULL),
(301, 'Tóner Kyocera KM TaskAlfa 255 / 305', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera KM TaskAlfa 255</li>\r\n	<li>Kyocera KM TaskAlfa 255b</li>\r\n	<li>Kyocera KM TaskAlfa 305</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TK477]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>15,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 520 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/1 KM TaskAlfa 255.png', 29, NULL, NULL),
(302, 'Tóner Kyocera FS 6525 / FS 6530', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera FS 6525MFP</li>\r\n	<li>Kyocera FS 6530MFP</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TK477]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 15,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 520 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/1 KM TaskAlfa 255.png', 29, NULL, NULL),
(303, 'Tóner Kyocera KM TaskAlfa 3500i / 3501i', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera KM TaskAlfa 3500i</li>\r\n	<li>Kyocera KM TaskAlfa 3501i</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TK6307]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>35,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>860 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/2 KM TaskAlfa 3500i.png', 29, NULL, NULL),
(304, 'Tóner Kyocera KM TaskAlfa 4500i / 4501i', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera KM TaskAlfa 4500i</li>\r\n	<li>Kyocera KM TaskAlfa 4501i</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TK6307]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>35,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>860 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/2 KM TaskAlfa 3500i.png', 29, NULL, NULL),
(305, 'Tóner Kyocera KM TaskAlfa 5500i / 5501i', '<p>T&oacute;ner negro de la marca<strong> Densitone Premium </strong>compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera KM TaskAlfa 5500i</li>\r\n	<li>Kyocera KM TaskAlfa 5501i</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TK6307]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>35,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 860 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/2 KM TaskAlfa 3500i.png', 29, NULL, NULL),
(306, 'Kyocera KM FS 1035 / KM FS 1135', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera KM FS 1035</li>\r\n	<li>Kyocera KM FS 1135</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TK1147]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>7,200 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>392 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/3 KM FS 1035.png', 29, NULL, NULL),
(307, 'Kyocera Ecosys M2035dn / M2535dn', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium </strong>compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera ECOSYS M2035dn</li>\r\n	<li>Kyocera ECOSYS M2535dn</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TK1147]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 7,200 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>392 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/3 KM FS 1035.png', 29, NULL, NULL),
(309, 'Tóner Kyocera KM FS 2100DN', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera KM FS 2100DN</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TK3102]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>12,500 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 330 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/4 KM FS 2100DN.png', 29, NULL, NULL),
(310, 'Tóner Kyocera Ecosys M3040idn / M3540idn', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera ECOSYS M3040idn</li>\r\n	<li>Kyocera ECOSYS M3540idn</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TK3102]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 12,500 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 330 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/4 KM FS 2100DN.png', 29, NULL, NULL),
(311, 'Tóner Kyocera KM FS 4200DN / Ecosys M3550dn', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera KM FS 4200DN</li>\r\n	<li>Kyocera ECOSYS M3550dn</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TK3122]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 21,000 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 570 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/5 KM FS 4200DN.png', 29, NULL, NULL),
(312, 'Tóner Kyocera KM Ecosys M2135dn / M2635dn', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera KM ECOSYS M2135dn</li>\r\n	<li>Kyocera KM ECOSYS M2635dn</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TK1152;TK1155]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 3,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>120 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/6 KM ECOSYS M2135dn.png', 29, NULL, NULL),
(313, 'Tóner Kyocera KM Ecosys M2735dw / P2235', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera KM ECOSYS M2735dw</li>\r\n	<li>Kyocera KM ECOSYS P2235dn</li>\r\n	<li>Kyocera KM ECOSYS P2235dw</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TK1152;TK1155]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>3,000 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>120 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/6 KM ECOSYS M2135dn.png', 29, NULL, NULL),
(314, 'Tóner Kyocera KM Ecosys M2040dn / M 2540dn', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium </strong>compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera KM ECOSYS M2040dn</li>\r\n	<li>Kyocera KM ECOSYS M2540dn</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TK1175]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>7,200 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 520 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en descripci&oacute;n</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/7 KM ECOSYS M2040dn.png', 29, NULL, NULL),
(315, 'Tóner Kyocera KM Ecosys M2640idw', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium </strong>compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera KM ECOSYS M2640idw</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TK1175]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>7,200 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>520 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en descripci&oacute;n</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/7 KM ECOSYS M2040dn.png', 29, NULL, NULL),
(316, 'Recarga Kyocera Mita FS 1000 / FS 1010', '<p>Recarga de t&oacute;ner negro de la marca <strong>Densitone Premium </strong>compatible&nbsp;<br />\r\ncon los siguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera y Copystar Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera Mita FS 1000</li>\r\n	<li>Kyocera Mita FS 1010</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TK-17;TK-18]</p>\r\n\r\n<p><br />\r\n<strong>Peso:</strong> 250 g (Est&aacute;ndar) / 240 g (Premium)</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nRecarga Densitone para Kyocera Blanco y negro.</p>', 1, 'productos/1 Mita FS 1000.png', 33, NULL, NULL),
(317, 'Recarga Kyocera Mita FS 1015 / FS 1020D', '<p>Recarga de t&oacute;ner negro de la marca <strong>Densitone Premium </strong>compatible&nbsp;<br />\r\ncon los siguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera y Copystar Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera Mita FS 1015</li>\r\n	<li>Kyocera Mita FS 1020D</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TK-17;TK-18]</p>\r\n\r\n<p><br />\r\n<strong>Peso:</strong> 250 g (Est&aacute;ndar) / 240 g (Premium)</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nRecarga Densitone para Kyocera Blanco y negro.</p>', 1, 'productos/1 Mita FS 1000.png', 33, NULL, NULL),
(321, 'Guillotina A4', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nCorta y personaliza el tama&ntilde;o de tus documentos gracias a estas<br />\r\nguillotinas de gran durabilidad y excelente acabado.</p>\r\n\r\n<p><br />\r\nCualquier medida hasta <strong>A4.(Paso: 2.1 c/u / 22.5 caj&oacute;n)</strong><br />\r\nCantidad por caj&oacute;n: 10 pc/ctn. Material: Acero.<br />\r\n* Con ajustador de papel y cierre de seguridad.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a><br />\r\n&nbsp;</p>', '<p>Imagen referencial.<br />\r\nGuillotina para papel. Formato A4. Personalizable.</p>', 1, 'productos/1 Guillotina A4.png', 34, NULL, NULL),
(322, 'Guillotina Oficio', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nCorta y personaliza el tama&ntilde;o de tus documentos gracias a estas<br />\r\nguillotinas de gran durabilidad y excelente acabado.</p>\r\n\r\n<p><br />\r\nCualquier medida hasta tama&ntilde;o <strong>Oficio. (Paso: 3.1 c/u / 16 caj&oacute;n)</strong><br />\r\nCantidad por caj&oacute;n: 5 pc/ctn. Material: Acero.<br />\r\n* Con ajustador de papel y cierre de seguridad.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Guillotina para papel. Formato Oficio. Personalizable.</p>', 1, 'productos/2 Guillotina Oficio.png', 34, NULL, NULL),
(323, 'Guillotina A3', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nCorta y personaliza el tama&ntilde;o de tus documentos gracias a estas<br />\r\nguillotinas de gran durabilidad y excelente acabado.</p>\r\n\r\n<p><br />\r\nCualquier medida hasta<strong> A3. (Paso: 4 c/u / 21 caj&oacute;n)</strong><br />\r\nCantidad por caj&oacute;n: 5 pc/ctn. Material:Acero.<br />\r\n* Con ajustador de papel y cierre de seguridad.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Guillotina para papel. Formato A3. Personalizable.</p>', 1, 'productos/3 Guillotina A3.png', 34, NULL, NULL),
(324, 'Guillotina rotativa A4', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nCorta y personaliza el tama&ntilde;o de tus documentos gracias a estas<br />\r\nguillotinas de gran durabilidad y excelente acabado.</p>\r\n\r\n<p><br />\r\nRealiza cortes <strong>rectos, ondeados y troquelados.</strong><br />\r\nCualquier medida hasta A4.<br />\r\nMaterial: Acero.<br />\r\n* Con ajustador de papel y cierre de seguridad.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Guillotina rotativa para papel. Formato A4. Personalizable.</p>', 1, 'productos/4 Guillotina rotativa A4.png', 34, NULL, NULL),
(325, 'Enmicadora A4', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nLamina tus documentos, prot&eacute;gelos del ambiente y dales acabados<br />\r\nexcelentes con nuestras enmicadoras profesionales.</p>\r\n\r\n<p><br />\r\n<strong>Lamina en formato de 54x86 mm - A4 (210 x 297 mm).</strong><br />\r\nDesde 75 hasta 200 micrones.<br />\r\n* Cuenta con 2 rodillos y perilla.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Enmicadora de documentos. Formato A4.</p>', 1, 'productos/1 Enmicadora A4.png', 38, NULL, NULL),
(326, 'Enmicadora A3', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nLamina tus documentos, prot&eacute;gelos del ambiente y dales acabados<br />\r\nexcelentes con nuestras enmicadoras profesionales.</p>\r\n\r\n<p><br />\r\nLamina en formatos de <strong>54 x 86 mm, A4 (21 x 29.7 cm)<br />\r\ny A3 (29.7 x 42 cm)</strong><br />\r\nSoporta desde 75 hasta 250 micrones.<br />\r\nCuenta con 4 rodillos y pantalla LED.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Enmicadora de documentos. Formato A3.</p>', 1, 'productos/2 Enmicadora A3.png', 38, NULL, NULL),
(328, 'Espiraladora 15 hojas', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nAgrupa tus documentos y organizalos manteniendo una buena<br />\r\npresentaci&oacute;n, gracias a nuestras espiraladoras profesionales.</p>\r\n\r\n<p><br />\r\nEspiralado manual.<br />\r\nEn formatos <strong>Carta, A4, Oficio, B5, A5 y de menor tama&ntilde;o.</strong><br />\r\nHasta 15 hojas a la vez. Para trabajo fuerte.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Espiraladora de documentos. 15 hojas por perforado.</p>', 1, 'productos/2 Espiraladora 15 hjs.png', 35, NULL, NULL),
(329, 'Espiraladora 16 hojas', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nAgrupa tus documentos y organizalos manteniendo una buena<br />\r\npresentaci&oacute;n, gracias a nuestras espiraladoras profesionales.</p>\r\n\r\n<p><br />\r\nEspiralado manual.<br />\r\n<strong>En formatos A4, B5, A5 y de menor tama&ntilde;o.</strong><br />\r\nHasta 16 hojas a la vez.Con Rodillo el&eacute;ctrico.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Espiraladora de documentos. 16 hojas por perforado.</p>', 1, 'productos/3 Espiraladora 16 hjs.png', 35, NULL, NULL),
(330, 'Espiraladora 12 hojas', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nAgrupa tus documentos y organizalos manteniendo una buena<br />\r\npresentaci&oacute;n, gracias a nuestras espiraladoras profesionales.</p>\r\n\r\n<p><br />\r\nEspiralado manual<br />\r\n<strong>En formatos Carta y A4.</strong><br />\r\nHasta 12 hojas a la vez. Sin tope de papel.</p>\r\n\r\n<p><a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Espiraladora de documentos. 12 hojas por perforado.</p>', 1, 'productos/1 Espiraladora 12 hjs.png', 35, NULL, NULL),
(335, 'Boleador', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nPerforador 2 en 1 para rect&aacute;ngulo redondeado y boleador de esquinas.</p>\r\n\r\n<p><br />\r\nRanura para cinta.<br />\r\nPerforador rect&aacute;ngular y boleador de esquinas.<br />\r\n<strong>Radio: 6.4 mm / Ranura: 15 x 3.5 mm.</strong></p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>-</p>', 1, 'productos/1 Boleador.png', 40, NULL, NULL),
(336, 'Perforador para calendario', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\n<strong>Perforador de un hueco, ideal para la elaboraci&oacute;n de calendarios.</strong></p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>-</p>', 1, 'productos/2 Perforador para calendario.png', 40, NULL, NULL),
(337, 'Espiral 7mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 7mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado:</strong> Hasta 25 hojas.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/1 Espiral 7 mm.png', 41, NULL, NULL),
(338, 'Espiral 9mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 9mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado:</strong> Hasta 50 hojas.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/2 Espiral 9 mm.png', 41, NULL, NULL),
(339, 'Espiral 12 mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 12mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado:</strong> Hasta 70 hojas.<br />\r\nDisponible en paquete de 50 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/3 Espiral 12 mm.png', 41, NULL, NULL),
(340, 'Espiral 14 mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 14mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado:</strong> Hasta 85 hojas.<br />\r\nDisponible en paquete de 50 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/4 Espiral 14 mm.png', 41, NULL, NULL),
(342, 'Espiral 17 mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 17mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado:</strong> Hasta 100 hojas.<br />\r\nDisponible en paquete de 50 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/5 Espiral 17 mm.png', 41, NULL, NULL),
(343, 'Espiral 20 mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 20mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado: </strong>Hasta 120 hojas.<br />\r\nDisponible en paquete de 50 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/6  Espiral 20 mm.png', 41, NULL, NULL),
(344, 'Espiral 23 mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 23mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado: </strong>Hasta 140 hojas.<br />\r\nDisponible en paquete de 25 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/7 Espiral 23 mm.png', 41, NULL, NULL),
(345, 'Espiral 25 mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 25mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado:</strong> Hasta 160 hojas.<br />\r\nDisponible en paquete de 25 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/8 Espiral 25 mm.png', 41, NULL, NULL),
(347, 'Espiral 30 mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 30mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado:</strong> Hasta 200 hojas.<br />\r\nDisponible en paquete de 25 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/9 Espiral 30 mm.png', 41, NULL, NULL),
(348, 'Espiral 33 mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 33mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado: </strong>Hasta 250 hojas.<br />\r\nDisponible en paquete de 25 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/10 Espiral 33 mm.png', 41, NULL, NULL),
(349, 'Espiral 36 mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 36mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado: </strong>Hasta 300 hojas.<br />\r\nDisponible en paquete de 25 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/11 Espiral 36 mm.png', 41, NULL, NULL),
(350, 'Espiral 40 mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 40mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado:</strong> Hasta 350 hojas.<br />\r\nDisponible en paquete de 20 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/12 Espiral 40 mm.png', 41, NULL, NULL),
(351, 'Espiral 45 mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 45mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado: </strong>Hasta 400 hojas.<br />\r\nDisponible en paquete de 20 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/13 Espiral 45 mm.png', 41, NULL, NULL),
(352, 'Espiral 50 mm', '<p>Espirales de pl&aacute;stico ideales para acabados y encuadernaci&oacute;n<br />\r\nde documentos. Encuentra el que mejor se adapte a tus necesidades<br />\r\nde gesti&oacute;n documental.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora y tapas plastificadas.<br />\r\nEspiral de 50mm en color negro y otros.<br />\r\n<strong>Capacidad de espiralado: </strong>Hasta 500 hojas.<br />\r\nDisponible en paquete de 20 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEspirales disponibles de 7 a 50 mm de di&aacute;metro.</p>', 1, 'productos/14 Espiral 50 mm.png', 41, NULL, NULL),
(368, 'Mica DNI Moderno', '<p>Forros de pl&aacute;stico para acabados profesionales. Protege tus<br />\r\ndocumentos con micas de material resistente, perfectas para<br />\r\norganizar mejor tus archivos importantes.</p>\r\n\r\n<p><br />\r\nCompatible con enmicadora.<br />\r\nMica en formato <strong>DNI Moderno (54 x 86 mm)</strong>.<br />\r\nGrosor de 200 micrones.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nMicas para enmicado en formatos variados desde DNI Moderno hasta A3.</p>', 1, 'productos/1 DNI Moderno 54 x 86.png', 43, NULL, NULL),
(369, 'Mica DNI Moderno con inserto', '<p>Forros de pl&aacute;stico para acabados profesionales. Protege tus<br />\r\ndocumentos con micas de material resistente, perfectas para<br />\r\norganizar mejor tus archivos importantes.</p>\r\n\r\n<p><br />\r\nCompatible con enmicadora.<br />\r\nMica con inserto en formato <strong>DNI Moderno (54 x 86 mm).</strong><br />\r\nGrosor de 730 micrones.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nMicas para enmicado en formatos variados desde DNI Moderno hasta A3.</p>', 1, 'productos/2 DNI Moderno 54 x 86 con inserto.png', 43, NULL, NULL),
(370, 'Mica Carnet', '<p>Forros de pl&aacute;stico para acabados profesionales. Protege tus<br />\r\ndocumentos con micas de material resistente, perfectas para<br />\r\norganizar mejor tus archivos importantes.</p>\r\n\r\n<p><br />\r\nCompatible con enmicadora.<br />\r\nMica en formato<strong> Carnet (60 x 92 mm).</strong><br />\r\nGrosor de 200 micrones.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nMicas para enmicado en formatos variados desde DNI Moderno hasta A3.</p>', 1, 'productos/3 Carnet 60 x 92.png', 43, NULL, NULL),
(371, 'Mica Carnet con inserto', '<p>Forros de pl&aacute;stico para acabados profesionales. Protege tus<br />\r\ndocumentos con micas de material resistente, perfectas para<br />\r\norganizar mejor tus archivos importantes.</p>\r\n\r\n<p><br />\r\nCompatible con enmicadora.<br />\r\nMica con inserto en formato <strong>Carnet (60 x 92 mm).</strong><br />\r\nGrosor de 730 micrones.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nMicas para enmicado en formatos variados desde DNI Moderno hasta A3.</p>', 1, 'productos/4 Carnet 60 x 92 con inserto.png', 43, NULL, NULL),
(373, 'Mica Fotocheck', '<p>Forros de pl&aacute;stico para acabados profesionales. Protege tus<br />\r\ndocumentos con micas de material resistente, perfectas para<br />\r\norganizar mejor tus archivos importantes.</p>\r\n\r\n<p><br />\r\nCompatible con enmicadora.<br />\r\nMica en formato <strong>Fotocheck (67 x 98 mm).</strong><br />\r\nGrosor de 200 micrones.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nMicas para enmicado en formatos variados desde DNI Moderno hasta A3.</p>', 1, 'productos/5 Fotocheck 67 x 98.png', 43, NULL, NULL),
(374, 'Mica Fotocheck con inserto', '<p>Forros de pl&aacute;stico para acabados profesionales. Protege tus<br />\r\ndocumentos con micas de material resistente, perfectas para<br />\r\norganizar mejor tus archivos importantes.</p>\r\n\r\n<p><br />\r\nCompatible con enmicadora.<br />\r\nMica con inserto en formato<strong> Fotocheck (67 x 98 mm).</strong><br />\r\nGrosor de 730 micrones.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nMicas para enmicado en formatos variados desde DNI Moderno hasta A3.</p>', 1, 'productos/6 Fotocheck 67 x 98 con inserto.png', 43, NULL, NULL);
INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `detalles`, `estado`, `imagen`, `categoria_id`, `facebook`, `compartir`) VALUES
(375, 'Mica Credencial / DNI Antiguo', '<p>Forros de pl&aacute;stico para acabados profesionales. Protege tus<br />\r\ndocumentos con micas de material resistente, perfectas para<br />\r\norganizar mejor tus archivos importantes.</p>\r\n\r\n<p><br />\r\nCompatible con enmicadora.<br />\r\nMica en formato <strong>Credencial / DNI Antiguo (75 x 105 mm).</strong><br />\r\nGrosor de 200 micrones.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nMicas para enmicado en formatos variados desde DNI Moderno hasta A3.</p>', 1, 'productos/7 Credencial 75 x 105.png', 43, NULL, NULL),
(376, 'Mica Tarjeta de propiedad', '<p>Forros de pl&aacute;stico para acabados profesionales. Protege tus<br />\r\ndocumentos con micas de material resistente, perfectas para<br />\r\norganizar mejor tus archivos importantes.</p>\r\n\r\n<p><br />\r\nCompatible con enmicadora.<br />\r\nMica en formato<strong> Tarjeta de propiedad (96 x 110 mm).</strong><br />\r\nGrosor de 200 micrones.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nMicas para enmicado en formatos variados desde DNI Moderno hasta A3.</p>', 1, 'productos/8 Tarjeta de propiedad 96 x 110.png', 43, NULL, NULL),
(377, 'Mica Postal / Prensa', '<p>Forros de pl&aacute;stico para acabados profesionales. Protege tus<br />\r\ndocumentos con micas de material resistente, perfectas para<br />\r\norganizar mejor tus archivos importantes.</p>\r\n\r\n<p><br />\r\nCompatible con enmicadora.<br />\r\nMica en formato <strong>Postal / Prensa (100 x 145 mm).</strong><br />\r\nGrosor de 175 micrones.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nMicas para enmicado en formatos variados desde DNI Moderno hasta A3.</p>', 1, 'productos/9 Postal 100 x 145.png', 43, NULL, NULL),
(378, 'Mica A5', '<p>Forros de pl&aacute;stico para acabados profesionales. Protege tus<br />\r\ndocumentos con micas de material resistente, perfectas para<br />\r\norganizar mejor tus archivos importantes.</p>\r\n\r\n<p><br />\r\nCompatible con enmicadora.<br />\r\nMica en formato <strong>A5 (154 x 216 mm).</strong><br />\r\nGrosor de 175 micrones.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nMicas para enmicado en formatos variados desde DNI Moderno hasta A3.</p>', 1, 'productos/10 A5 154 x 216.png', 43, NULL, NULL),
(379, 'Mica A4', '<p>Forros de pl&aacute;stico para acabados profesionales. Protege tus<br />\r\ndocumentos con micas de material resistente, perfectas para<br />\r\norganizar mejor tus archivos importantes.</p>\r\n\r\n<p><br />\r\nCompatible con enmicadora.<br />\r\nMica en formato <strong>A4 (216 x 303 mm).</strong><br />\r\nGrosor de 175 micrones.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nMicas para enmicado en formatos variados desde DNI Moderno hasta A3.</p>', 1, 'productos/11 A4 216 x 303.png', 43, NULL, NULL),
(380, 'Mica Oficio', '<p>Forros de pl&aacute;stico para acabados profesionales. Protege tus<br />\r\ndocumentos con micas de material resistente, perfectas para<br />\r\norganizar mejor tus archivos importantes.</p>\r\n\r\n<p><br />\r\nCompatible con enmicadora.<br />\r\nMica en formato <strong>Oficio (229 x 363 mm).</strong><br />\r\nGrosor de 175 micrones.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nMicas para enmicado en formatos variados desde DNI Moderno hasta A3.</p>', 1, 'productos/12 Oficio 229 x 363.png', 43, NULL, NULL),
(381, 'Mica A3', '<p>Forros de pl&aacute;stico para acabados profesionales. Protege tus<br />\r\ndocumentos con micas de material resistente, perfectas para<br />\r\norganizar mejor tus archivos importantes.</p>\r\n\r\n<p><br />\r\nCompatible con enmicadora.<br />\r\nMica en formato <strong>A3 (303 x 426 mm).</strong><br />\r\nGrosor de 175 micrones.<br />\r\nDisponible en paquete de 100 unidades.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nMicas para enmicado en formatos variados desde DNI Moderno hasta A3.</p>', 1, 'productos/13 A3 303 x 426.png', 43, NULL, NULL),
(388, 'Tapa plastificada Azul', '<p>Tapas de pl&aacute;stico muy resistentes en diferentes colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de pl&aacute;stico de color azul.<br />\r\n<strong>Formatos disponibles:</strong> A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa, catedral o cubo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas plastificadas disponibles en A4.</p>', 1, 'productos/2 Tapa azul.png', 42, NULL, NULL),
(389, 'Tapa plastificada Cristal', '<p>Tapas de pl&aacute;stico muy resistentes en diferentes colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de pl&aacute;stico de color cristal.<br />\r\n<strong>Formatos disponibles</strong>: A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa, catedral o cubo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas plastificadas disponibles en A4.</p>', 1, 'productos/1 Tapa cristal.png', 42, NULL, NULL),
(390, 'Tapa plastificada Verde', '<p>Tapas de pl&aacute;stico muy resistentes en diferentes colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de pl&aacute;stico de color verde.<br />\r\n<strong>Formatos disponibles:</strong> A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa, catedral o cubo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas plastificadas disponibles en A4.</p>', 1, 'productos/3 Tapa verde.png', 42, NULL, NULL),
(391, 'Tapa plastificada Roja', '<p>Tapas de pl&aacute;stico muy resistentes en diferentes colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de pl&aacute;stico de color rojo.<br />\r\n<strong>Formatos disponibles:</strong> A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa, catedral o cubo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas plastificadas disponibles en A4.</p>', 1, 'productos/4 Tapa roja.png', 42, NULL, NULL),
(392, 'Tapa plastificada Amarilla', '<p>Tapas de pl&aacute;stico muy resistentes en diferentes colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de pl&aacute;stico de color amarillo.<br />\r\n<strong>Formatos disponibles: </strong>A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa, catedral o cubo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas plastificadas disponibles en A4.</p>', 1, 'productos/5 Tapa amarilla.png', 42, NULL, NULL),
(393, 'Tapa plastificada Rosada', '<p>Tapas de pl&aacute;stico muy resistentes en diferentes colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de pl&aacute;stico de color rosado.<br />\r\n<strong>Formatos disponibles: </strong>A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa, catedral o cubo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas plastificadas disponibles en A4.</p>', 1, 'productos/6 Tapa rosada.png', 42, NULL, NULL),
(394, 'Tapa plastificada Celeste', '<p>Tapas de pl&aacute;stico muy resistentes en diferentes colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de pl&aacute;stico de color celeste.<br />\r\n<strong>Formatos disponibles: </strong>A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa, catedral o cubo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas plastificadas disponibles en A4.</p>', 1, 'productos/7 Tapa celeste.png', 42, NULL, NULL),
(395, 'Tapa plastificada Caramelo', '<p>Tapas de pl&aacute;stico muy resistentes en diferentes colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de pl&aacute;stico de color caramelo.<br />\r\n<strong>Formatos disponibles:</strong> A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa, catedral o cubo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas plastificadas disponibles en A4.</p>', 1, 'productos/8 Tapa caramelo.png', 42, NULL, NULL),
(396, 'Tapa plastificada Naranja', '<p>Tapas de pl&aacute;stico muy resistentes en diferentes colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de pl&aacute;stico de color naranja.<br />\r\n<strong>Formatos disponibles:</strong> A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa, catedral o cubo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas plastificadas disponibles en A4.</p>', 1, 'productos/9 Tapa naranja.png', 42, NULL, NULL),
(397, 'Tapa plastificada Humo', '<p>Tapas de pl&aacute;stico muy resistentes en diferentes colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de pl&aacute;stico de color humo.<br />\r\n<strong>Formatos disponibles</strong>: A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa, catedral o cubo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas plastificadas disponibles en A4.</p>', 1, 'productos/10 Tapa humo.png', 42, NULL, NULL),
(398, 'Tapa plastificada Lila', '<p>Tapas de pl&aacute;stico muy resistentes en diferentes colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de pl&aacute;stico de color lila.<br />\r\n<strong>Formatos disponibles:</strong> A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa, catedral o cubo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas plastificadas disponibles en A4.</p>', 1, 'productos/11 Tapa lila.png', 42, NULL, NULL),
(399, 'Tapa plastificada Guinda', '<p>Tapas de pl&aacute;stico muy resistentes en diferentes colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de pl&aacute;stico de color guinda.<br />\r\n<strong>Formatos disponibles:</strong> A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa, catedral o cubo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas plastificadas disponibles en A4</p>', 1, 'productos/12 Tapa guinda.png', 42, NULL, NULL),
(400, 'Tapa plastificada Neón', '<p>Tapas de pl&aacute;stico muy resistentes en diferentes colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de pl&aacute;stico de color ne&oacute;n.<br />\r\n<strong>Formatos disponibles: </strong>A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa, catedral o cubo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas plastificadas disponibles en A4.</p>', 1, 'productos/13 Tapa neón.png', 42, NULL, NULL),
(401, 'Tapa plastificada de cartón', '<p>Tapas de cart&oacute;n muy resistentes en variados colores. Hechas&nbsp;<br />\r\npara que tus documentos est&eacute;n protegidos y cuenten con un&nbsp;<br />\r\nacabado est&eacute;tico impecable.</p>\r\n\r\n<p><br />\r\nCompatible con espiraladora, anilladora y espirales.<br />\r\nTapa de cart&oacute;n de colores variados.<br />\r\n<strong>Formatos disponibles:</strong> A4.<br />\r\nDisponible en paquete de 100 unidades.<br />\r\nDisponible como tapa lisa o cofrado.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nTapas de cart&oacute;n disponibles en A4.</p>', 1, 'productos/14 Tapas de cartón.png', 42, NULL, NULL),
(402, 'Tóner Canon image Runner Advance C5030 / C5035', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Canon Color:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Canon image Runner Advance C5030</li>\r\n	<li>Canon image Runner Advance C5035</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 36,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>27,000 p&aacute;ginas @5%</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEst&aacute;ndar.<br />\r\nT&oacute;ner Densitone para Canon Color.</p>', 1, 'productos/1 C5030.png', 26, NULL, NULL),
(403, 'Tóner Canon image Runner Advance C5235 / C5240', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Canon Color:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Canon image Runner Advance C5235</li>\r\n	<li>Canon image Runner Advance C5235A</li>\r\n	<li>Canon image Runner Advance C5240</li>\r\n	<li>Canon image Runner Advance C5240A</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>36,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY:</strong> 27,000 p&aacute;ginas @5%</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEst&aacute;ndar.<br />\r\nT&oacute;ner Densitone para Canon Color.</p>', 1, 'productos/1 C5030.png', 26, NULL, NULL),
(404, 'Tóner Canon image Runner Advance C5250 / C5045', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Canon Color:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Canon image Runner Advance C5250</li>\r\n	<li>Canon image Runner Advance C5045</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK:</strong> 44,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>38,000 p&aacute;ginas @5%</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEst&aacute;ndar.<br />\r\nT&oacute;ner Densitone para Canon Color.</p>', 1, 'productos/2 C5250.png', 26, NULL, NULL),
(405, 'Tóner Canon image Runner Advance C5051 / C5255', '<p>T&oacute;ners Cyan, Magenta, Amarillo (CMY) y negro (BK) de la marca&nbsp;<br />\r\n<strong>Densitone Premium</strong> compatible con los siguientes modelos de&nbsp;<br />\r\nfotocopiadoras multifuncionales Canon Color:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Canon image Runner Advance C5051</li>\r\n	<li>Canon image Runner Advance C5255</li>\r\n</ul>\r\n\r\n<p><br />\r\n<strong>Rendimiento BK: </strong>44,000 p&aacute;ginas @5%<br />\r\n<strong>Rendimiento CMY: </strong>38,000 p&aacute;ginas @5%</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Imagen referencial.<br />\r\nEst&aacute;ndar.<br />\r\nT&oacute;ner Densitone para Canon Color.</p>', 1, 'productos/2 C5250.png', 26, NULL, NULL),
(406, 'Tóner Kyocera KM FS 1035 / FS 1135', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera KM FS 1035</li>\r\n	<li>Kyocera KM FS 1135</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TK1147]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento:</strong> 7,200 p&aacute;ginas @5%<br />\r\n<strong>Peso:</strong> 392 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/3 KM FS 1035.png', 29, NULL, NULL),
(407, 'Tóner Kyocera Ecosys M2035dn / M2535dn', '<p>T&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible con los<br />\r\nsiguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera Blanco y negro.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera ECOSYS M2035dn</li>\r\n	<li>Kyocera ECOSYS M2535dn</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TK1147]</p>\r\n\r\n<p><br />\r\n<strong>Rendimiento: </strong>7,200 p&aacute;ginas @5%<br />\r\n<strong>Peso: </strong>392 g</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/3 KM FS 1035.png', 29, NULL, NULL),
(409, 'Recarga Kyocera Mita KM 1500 / 1815 / 1820', '<p>Recarga de t&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible&nbsp;<br />\r\ncon los siguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera y Copystar Blanco y negro.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Kyocera Mita KM 1500</li>\r\n	<li>Kyocera Mita KM 1815</li>\r\n	<li>Kyocera Mita KM 1820</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo: </strong>[TK-17;TK-18]</p>\r\n\r\n<p><br />\r\n<strong>Peso: </strong>250 g (Est&aacute;ndar) / 240 g (Premium)</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro.</p>', 1, 'productos/1 Mita FS 1000.png', 33, NULL, NULL),
(410, 'Recarga Copystar CS 1500 / CS 1815 / CS 1820', '<p>Recarga de t&oacute;ner negro de la marca <strong>Densitone Premium</strong> compatible&nbsp;<br />\r\ncon los siguientes modelos de fotocopiadoras multifuncionales&nbsp;<br />\r\nKyocera y Copystar Blanco y negro:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Copystar CS 1500</li>\r\n	<li>Copystar CS 1815</li>\r\n	<li>Copystar CS 1820</li>\r\n</ul>\r\n\r\n<p><strong>C&oacute;digo:</strong> [TK-17;TK-18]</p>\r\n\r\n<p><br />\r\n<strong>Peso:</strong> 250 g (Est&aacute;ndar) / 240 g (Premium)</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Est&aacute;ndar y Premium.<br />\r\nT&oacute;ner Densitone para Konica Minolta Blanco y negro</p>', 1, 'productos/1 Mita FS 1000.png', 33, NULL, NULL),
(411, 'Espiraladora 20 hojas', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nAgrupa tus documentos y organizalos manteniendo una buena<br />\r\npresentaci&oacute;n, gracias a nuestras espiraladoras profesionales.</p>\r\n\r\n<p><br />\r\nEspiralado manual.<br />\r\n<strong>En formatos A4, B5, A5 y de menor tama&ntilde;o.</strong><br />\r\nHasta 20 hojas a la vez. Con Rodillo el&eacute;ctrico. Trabajo continuo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Espiraladora de documentos. 20 hojas por perforado.</p>', 1, 'productos/4 Espiraladora 20 hjs.png', 35, NULL, NULL),
(412, 'Espiraladora 25 hojas', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nAgrupa tus documentos y organizalos manteniendo una buena<br />\r\npresentaci&oacute;n, gracias a nuestras espiraladoras profesionales.</p>\r\n\r\n<p><br />\r\nEspiralado manual.<br />\r\n<strong>En formatos A4 y A3 expandible.</strong><br />\r\nHasta 25 hojas a la vez.Con Rodillo el&eacute;ctrico. Trabajo continuo.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Espiraladora de documentos. 25 hojas por perforado.</p>', 1, 'productos/5 Espiraladora 25 hjs.png', 35, NULL, NULL),
(413, 'Anilladora 12 hojas', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nAgrupa tus documentos y organizalos manteniendo una buena<br />\r\npresentaci&oacute;n, gracias a nuestras anilladoras profesionales.</p>\r\n\r\n<p><br />\r\n<strong>En formatos Carta y A4</strong>, hasta 12 hojas a la vez.<br />\r\nDoble Ring.Paso 3:1 y anillo 120.<br />\r\nIdeal para trabajos universitarios.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a></p>', '<p>Anilladora de documentos. 12 hojas por perforado.</p>', 1, 'productos/1 Anilladora 12 hjs.png', 36, NULL, NULL),
(414, 'Anilladora 20 hojas', '<p>Herramienta esencial para la labor de gesti&oacute;n documental.<br />\r\nAgrupa tus documentos y organizalos manteniendo una buena<br />\r\npresentaci&oacute;n, gracias a nuestras anilladoras profesionales.</p>\r\n\r\n<p><br />\r\n<strong>M&aacute;rgen ajustable 2.5, 4.5 y 6.5 mm (Carta/B5/A5) hasta formato A4.</strong><br />\r\nAnillo: 120. Doble Ring 14.3. Paso 3:1.<br />\r\nPara trabajos continuos.</p>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/9mTfhzm\">Ver en cat&aacute;logo</a><br />\r\n&nbsp;</p>', '<p>Anilladora de documentos. 20 hojas por perforado.</p>', 1, 'productos/2 Anilladora 20 hjs.png', 36, NULL, NULL),
(415, 'Ricoh IM C300', '<p>La fotocopiadora multifuncional <strong>Ricoh IM C400F</strong> es el equipo perfecto<br />\r\npara aquellos que desean eficiencia, conectividad smart y<br />\r\npracticidad compactada para su centro de trabajo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Fecha de introducci&oacute;n: </strong>Marzo de 2020</li>\r\n	<li><strong>Velocidad de impresi&oacute;n:</strong> 30 ppm</li>\r\n	<li><strong>Memoria:</strong> 2GB RAM, 320GB HDD</li>\r\n	<li>Alimentador de documentos de una sola pasada (SPDF)</li>\r\n	<li><strong>Capacidad del SPDF: </strong>50 hojas</li>\r\n	<li><strong>Dimensiones (Ancho/Lado/Alto):</strong> 498 x 561 x 510 mm</li>\r\n	<li><strong>Resoluci&oacute;n de copia:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de impresi&oacute;n:</strong> 1,200 x 1,200 ppp</li>\r\n	<li><strong>Resoluci&oacute;n de escaneo:</strong> 600 x 600 ppp</li>\r\n	<li><strong>Formatos:</strong> A5 - A4 / B5</li>\r\n	<li><strong>Entrada y salida de papel (m&aacute;x.):</strong> 2,000 hojas / 200 hojas</li>\r\n	<li><strong>Gramaje de papel (m&aacute;x.): </strong>60 - 220 g/m&sup2;</li>\r\n	<li><strong>Rendimiento del t&oacute;ner BK:</strong> 17,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento del t&oacute;ner CMY: </strong>6,000 p&aacute;gs. @5%</li>\r\n	<li><strong>Rendimiento de la unidad de imagen CMYK: </strong>60,000 p&aacute;ginas</li>\r\n	<li><strong>Ciclo mensual de trabajo:</strong> 7,500 impresiones</li>\r\n</ul>\r\n\r\n<p><br />\r\n<a href=\"https://cutt.ly/ImTfsmP\">Ver descripci&oacute;n completa</a></p>', '<p>Imagen referencial.<br />\r\nL&iacute;nea de mesa IM, Serie 0. Color. Nuevas.<br />\r\nRicoh IM C300 / IM C400F</p>', 1, 'productos/1 IM C300.png', 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ubigeo` varchar(2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `departamento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id`, `nombre`, `ubigeo`, `estado`, `departamento_id`) VALUES
(1, 'CHACHAPOYAS ', '01', 1, 1),
(2, 'BAGUA', '02', 1, 1),
(3, 'BONGARA', '03', 1, 1),
(4, 'CONDORCANQUI', '04', 1, 1),
(5, 'LUYA', '05', 1, 1),
(6, 'RODRIGUEZ DE MENDOZA', '06', 1, 1),
(7, 'UTCUBAMBA', '07', 1, 1),
(8, 'HUARAZ', '01', 1, 2),
(9, 'AIJA', '02', 1, 2),
(10, 'ANTONIO RAYMONDI', '03', 1, 2),
(11, 'ASUNCION', '04', 1, 2),
(12, 'BOLOGNESI', '05', 1, 2),
(13, 'CARHUAZ', '06', 1, 2),
(14, 'CARLOS FERMIN FITZCARRALD', '07', 1, 2),
(15, 'CASMA', '08', 1, 2),
(16, 'CORONGO', '09', 1, 2),
(17, 'HUARI', '10', 1, 2),
(18, 'HUARMEY', '11', 1, 2),
(19, 'HUAYLAS', '12', 1, 2),
(20, 'MARISCAL LUZURIAGA', '13', 1, 2),
(21, 'OCROS', '14', 1, 2),
(22, 'PALLASCA', '15', 1, 2),
(23, 'POMABAMBA', '16', 1, 2),
(24, 'RECUAY', '17', 1, 2),
(25, 'SANTA', '18', 1, 2),
(26, 'SIHUAS', '19', 1, 2),
(27, 'YUNGAY', '20', 1, 2),
(28, 'ABANCAY', '01', 1, 3),
(29, 'ANDAHUAYLAS', '02', 1, 3),
(30, 'ANTABAMBA', '03', 1, 3),
(31, 'AYMARAES', '04', 1, 3),
(32, 'COTABAMBAS', '05', 1, 3),
(33, 'CHINCHEROS', '06', 1, 3),
(34, 'GRAU', '07', 1, 3),
(35, 'AREQUIPA', '01', 1, 4),
(36, 'CAMANA', '02', 1, 4),
(37, 'CARAVELI', '03', 1, 4),
(38, 'CASTILLA', '04', 1, 4),
(39, 'CAYLLOMA', '05', 1, 4),
(40, 'CONDESUYOS', '06', 1, 4),
(41, 'ISLAY', '07', 1, 4),
(42, 'LA UNION', '08', 1, 4),
(43, 'HUAMANGA', '01', 1, 5),
(44, 'CANGALLO', '02', 1, 5),
(45, 'HUANCA SANCOS', '03', 1, 5),
(46, 'HUANTA', '04', 1, 5),
(47, 'LA MAR', '05', 1, 5),
(48, 'LUCANAS', '06', 1, 5),
(49, 'PARINACOCHAS', '07', 1, 5),
(50, 'PAUCAR DEL SARA SARA', '08', 1, 5),
(51, 'SUCRE', '09', 1, 5),
(52, 'VICTOR FAJARDO', '10', 1, 5),
(53, 'VILCAS HUAMAN', '11', 1, 5),
(54, 'CAJAMARCA', '01', 1, 6),
(55, 'CAJABAMBA', '02', 1, 6),
(56, 'CELENDIN', '03', 1, 6),
(57, 'CHOTA ', '04', 1, 6),
(58, 'CONTUMAZA', '05', 1, 6),
(59, 'CUTERVO', '06', 1, 6),
(60, 'HUALGAYOC', '07', 1, 6),
(61, 'JAEN', '08', 1, 6),
(62, 'SAN IGNACIO', '09', 1, 6),
(63, 'SAN MARCOS', '10', 1, 6),
(64, 'SAN MIGUEL', '11', 1, 6),
(65, 'SAN PABLO', '12', 1, 6),
(66, 'SANTA CRUZ', '13', 1, 6),
(67, 'PROV. CONST. DEL CALLAO', '01', 1, 7),
(68, 'CUSCO', '01', 1, 8),
(69, 'ACOMAYO', '02', 1, 8),
(70, 'ANTA', '03', 1, 8),
(71, 'CALCA', '04', 1, 8),
(72, 'CANAS', '05', 1, 8),
(73, 'CANCHIS', '06', 1, 8),
(74, 'CHUMBIVILCAS', '07', 1, 8),
(75, 'ESPINAR', '08', 1, 8),
(76, 'LA CONVENCION', '09', 1, 8),
(77, 'PARURO', '10', 1, 8),
(78, 'PAUCARTAMBO', '11', 1, 8),
(79, 'QUISPICANCHI', '12', 1, 8),
(80, 'URUBAMBA', '13', 1, 8),
(81, 'HUANCAVELICA', '01', 1, 9),
(82, 'ACOBAMBA', '02', 1, 9),
(83, 'ANGARAES', '03', 1, 9),
(84, 'CASTROVIRREYNA', '04', 1, 9),
(85, 'CHURCAMPA', '05', 1, 9),
(86, 'HUAYTARA', '06', 1, 9),
(87, 'TAYACAJA', '07', 1, 9),
(88, 'HUANUCO', '01', 1, 10),
(89, 'AMBO', '02', 1, 10),
(90, 'DOS DE MAYO', '03', 1, 10),
(91, 'HUACAYBAMBA', '04', 1, 10),
(92, 'HUAMALIES', '05', 1, 10),
(93, 'LEONCIO PRADO', '06', 1, 10),
(94, 'MARAÑON', '07', 1, 10),
(95, 'PACHITEA', '08', 1, 10),
(96, 'PUERTO INCA', '09', 1, 10),
(97, 'LAURICOCHA', '10', 1, 10),
(98, 'YAROWILCA', '11', 1, 10),
(99, 'ICA', '01', 1, 11),
(100, 'CHINCHA', '02', 1, 11),
(101, 'NAZCA', '03', 1, 11),
(102, 'PALPA', '04', 1, 11),
(103, 'PISCO', '05', 1, 11),
(104, 'HUANCAYO', '01', 1, 12),
(105, 'CONCEPCION', '02', 1, 12),
(106, 'CHANCHAMAYO', '03', 1, 12),
(107, 'JAUJA', '04', 1, 12),
(108, 'JUNIN', '05', 1, 12),
(109, 'SATIPO', '06', 1, 12),
(110, 'TARMA', '07', 1, 12),
(111, 'YAULI', '08', 1, 12),
(112, 'CHUPACA', '09', 1, 12),
(113, 'TRUJILLO', '01', 1, 13),
(114, 'ASCOPE', '02', 1, 13),
(115, 'BOLIVAR', '03', 1, 13),
(116, 'CHEPEN', '04', 1, 13),
(117, 'JULCAN', '05', 1, 13),
(118, 'OTUZCO', '06', 1, 13),
(119, 'PACASMAYO', '07', 1, 13),
(120, 'PATAZ', '08', 1, 13),
(121, 'SANCHEZ CARRION', '09', 1, 13),
(122, 'SANTIAGO DE CHUCO', '10', 1, 13),
(123, 'GRAN CHIMU', '11', 1, 13),
(124, 'VIRU', '12', 1, 13),
(125, 'CHICLAYO', '01', 1, 14),
(126, 'FERREÑAFE', '02', 1, 14),
(127, 'LAMBAYEQUE', '03', 1, 14),
(128, 'LIMA', '01', 1, 15),
(129, 'BARRANCA', '02', 1, 15),
(130, 'CAJATAMBO', '03', 1, 15),
(131, 'CANTA', '04', 1, 15),
(132, 'CAÑETE', '05', 1, 15),
(133, 'HUARAL', '06', 1, 15),
(134, 'HUAROCHIRI', '07', 1, 15),
(135, 'HUAURA', '08', 1, 15),
(136, 'OYON', '09', 1, 15),
(137, 'YAUYOS', '10', 1, 15),
(138, 'MAYNAS', '01', 1, 16),
(139, 'ALTO AMAZONAS', '02', 1, 16),
(140, 'LORETO', '03', 1, 16),
(141, 'MARISCAL RAMON CASTILLA', '04', 1, 16),
(142, 'REQUENA', '05', 1, 16),
(143, 'UCAYALI', '06', 1, 16),
(144, 'DATEM MARAÑON', '07', 1, 16),
(145, 'PUTUMAYO', '08', 1, 16),
(146, 'TAMBOPATA', '01', 1, 17),
(147, 'MANU', '02', 1, 17),
(148, 'TAHUAMANU', '03', 1, 17),
(149, 'MARISCAL NIETO', '01', 1, 18),
(150, 'GENERAL SANCHEZ CERRO', '02', 1, 18),
(151, 'ILO', '03', 1, 18),
(152, 'PASCO', '01', 1, 19),
(153, 'DANIEL ALCIDES CARRION', '02', 1, 19),
(154, 'OXAPAMPA', '03', 1, 19),
(155, 'PIURA', '01', 1, 20),
(156, 'AYABACA', '02', 1, 20),
(157, 'HUANCABAMBA', '03', 1, 20),
(158, 'MORROPON', '04', 1, 20),
(159, 'PAITA', '05', 1, 20),
(160, 'SULLANA', '06', 1, 20),
(161, 'TALARA', '07', 1, 20),
(162, 'SECHURA', '08', 1, 20),
(163, 'PUNO', '01', 1, 21),
(164, 'AZANGARO', '02', 1, 21),
(165, 'CARABAYA', '03', 1, 21),
(166, 'CHUCUITO', '04', 1, 21),
(167, 'EL COLLAO', '05', 1, 21),
(168, 'HUANCANE', '06', 1, 21),
(169, 'LAMPA', '07', 1, 21),
(170, 'MELGAR', '08', 1, 21),
(171, 'MOHO', '09', 1, 21),
(172, 'SAN ANTONIO DE PUTINA', '10', 1, 21),
(173, 'SAN ROMAN', '11', 1, 21),
(174, 'SANDIA', '12', 1, 21),
(175, 'YUNGUYO', '13', 1, 21),
(176, 'MOYOBAMBA', '01', 1, 22),
(177, 'BELLAVISTA', '02', 1, 22),
(178, 'EL DORADO', '03', 1, 22),
(179, 'HUALLAGA', '04', 1, 22),
(180, 'LAMAS', '05', 1, 22),
(181, 'MARISCAL CACERES', '06', 1, 22),
(182, 'PICOTA', '07', 1, 22),
(183, 'RIOJA', '08', 1, 22),
(184, 'SAN MARTIN', '09', 1, 22),
(185, 'TOCACHE', '10', 1, 22),
(186, 'TACNA', '01', 1, 23),
(187, 'CANDARAVE', '02', 1, 23),
(188, 'JORGE BASADRE', '03', 1, 23),
(189, 'TARATA', '04', 1, 23),
(190, 'TUMBES', '01', 1, 24),
(191, 'CONTRALMIRANTE VILLAR', '02', 1, 24),
(192, 'ZARUMILLA', '03', 1, 24),
(193, 'CORONEL PORTILLO', '01', 1, 25),
(194, 'ATALAYA', '02', 1, 25),
(195, 'PADRE ABAD', '03', 1, 25),
(196, 'PURUS', '04', 1, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes`
--

CREATE TABLE `redes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ruta` varchar(150) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `redes`
--

INSERT INTO `redes` (`id`, `nombre`, `ruta`, `estado`) VALUES
(1, 'whatsapp', 'https://wa.link/fkrlja', 1),
(3, 'facebook', 'https://www.facebook.com/syscopyperu', 1),
(4, 'instagram', 'https://www.instagram.com/syscopyperu/', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL,
  `respuesta` text NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(45) NOT NULL,
  `responsable` varchar(45) NOT NULL,
  `libro_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('086fNCYoO86mnjCMVLqj2F6Yhd7u7nSeE8f2Xkkv', NULL, '114.119.137.125', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2V0TWZac3RLd3RpU3VHZ01peW4wV25vYnBPVGVyVTlHUUxYdWJDciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vc3lzY29weXBlcnUuY29tL2NhdGFsb2dvLzEzP3BhZ2U9MSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651765044),
('0ojuGMY68A7JbjOdwvJfrgdvIIf2yJjlfpv3F7OA', NULL, '200.48.106.33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHhid1lQSEs2UDlCS0Jqdjg3aGxUNlJCdFN5TFZwbWFNREVHaE1zRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9zeXNjb3B5cGVydS5jb20vY2F0YWxvZ28iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1651771067),
('15qTbvBSjCNpW6zSID32fddX19wsIBzdwo0FNmko', NULL, '194.190.90.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVJBaVFmbUxnVnk4RnlrUXlvWTVLbjB0emxlcXMzbG9tQUFnWWNPayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9zeXNjb3B5cGVydS5jb20vcHVibGljL2NvbnRhY3RvIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1651757179),
('4iWrb1PbXPtdtQwLI2rmwaPwLcPwGwOM0gdPVMUt', NULL, '114.119.137.123', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaktIaG9RT3lWMWNRTEZoWVhmTlRWUHVTcG5NZ1FQWVd3VmpEanVrbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzI4MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651769429),
('5KiIiUawVaYinhd754b6BhFhQ5G2hfcMjwQ8c2Al', NULL, '114.119.137.122', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0lJdWg0VzlVZ2JScm9Sa2Jka3V0QjJ5YTVVSHl5ZUdNZ2dIVW9BTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzMyNiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651763793),
('6CH7fd0pv3n3faj31tT1BeM1kIQu7FTGncMsUaDa', NULL, '46.161.11.252', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36/iYA9HebN-7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlZMS0huYXptSmw0ZTJ5anlaMHR6NnM0b0hJcm9FbkF3SHZuTGxjUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9zeXNjb3B5cGVydS5jb20vY29udGFjdG8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1651772105),
('6H5dUGZubq2psPgNUIB8FIChTqTP4zhrefBEGz6n', NULL, '114.119.137.125', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWd3dlVKUm81OGpOMFJBMVVPOFlXeDN4SmRleXV4MnEzc3E4SHlIcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzQwNCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651758175),
('7ckVJx0Q8AfQxmK6KgFLelw50nAdZuNTRx362zCA', NULL, '51.222.253.11', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFpNMzE4U0l1d2lteGJMOWt4dzFHbDZseXlicEI4cnZLemthZ0d6eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvLzE2Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1651757795),
('9KN4Ijyt3K1UrnGfq0wHXCRLODCFLFC81V1mTujb', NULL, '114.119.137.122', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmhFVHN3TTMzWmw0NGp2NWFDTzA3ZHJ1M21oYmkzdWVBbmxyMkVHMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzExOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651756946),
('9T1u86NeHXK3YaZx2VqbSjj6GHxauCbEtumye375', NULL, '51.222.253.5', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVJKZlJCV2VFZEg4ZGVJZERUMDR5SkhQaXhlU284N2xnbjV2eGZDVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9zeXNjb3B5cGVydS5jb20vY2F0YWxvZ28/cGFnZT03Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1651766046),
('aMpg0gQvoWhMpXZpJb4FfWZKXnmf67pSXRwCFOOk', NULL, '114.119.137.122', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienVXZ0J1TUpYM2RCbnZHTnJFMlRCOFNIdmh5QVZaUk9neFBrUTltOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvLzQwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1651766915),
('C49QXDLFf7Zd86SCTArb3cgJnNx8pazuIg3ARCl7', NULL, '114.119.137.122', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWFYenN6N01RNUJyVEt4Ykg0dk1zS2VKZVhHQTdhbUlKNE4wQW5KdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzIxMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651759413),
('d0N8WCQ8tibr2VLAXPGeOgMNH23QDypgqJdiaXoI', NULL, '51.222.253.15', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFNOMGtSMXZyUXVOWDFqVHh4dUpnM1NCSTVMdHhKNm1BUk5wcExoeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHBzOi8vd3d3LnN5c2NvcHlwZXJ1LmNvbS9jYXRhbG9nby9wcm9kdWN0by8yNjMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1651758400),
('dAcOyUwjQgQtoa95ZrqwOwyaodFOGUsAhYg2PxsR', NULL, '114.119.137.105', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHNIcm9xWlhxN2pubmNWTllVRmp6U3hjb0ZITHVIeVV6eWExU0hRRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzM0OCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651766292),
('eH7hl5InkN6OhVv00d2VKNyGRYlJJb55kODUHWZ7', NULL, '51.222.253.12', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUozOXpiMkp6SVROVHFjRmNkQWhYNVA2bjY4dk5VM2tZdVdpWEFyWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly9zeXNjb3B5cGVydS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1651763865),
('FmO9oc7tTouEDhYPqIKoMWF9owReK3d7QhhZdvzX', NULL, '114.119.137.124', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0NnS2tMdzJwckJMVEVLdjFLenUwYnhQRmFEVGZCV09NVlNpNnBqMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzE1NyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651757560),
('G7ECvXAIJuhOzU1ZqC3q7wKBHMjmvhvhzcTuR8YI', NULL, '114.119.137.125', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0M1RHJqSmxWU3FMRktBeDN3VUVxNm9IdXZGM1dvdHBNUEVaYzlqYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzE4MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651768803),
('gcvcxGnGsiiaFvaBrZcmQTgU0vbQoBrNNz99NAl7', NULL, '51.222.253.10', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTB3VE5sOFBRVFZXODlzWXhEb2p3djFwemRQeEEyWEpBSW9wdDVRRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9zeXNjb3B5cGVydS5jb20vY2F0YWxvZ28vMTUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1651761532),
('INLdWRQib7yEHZbloEPcwetm1gDoPvD3IOqGCbjJ', NULL, '114.119.137.122', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNk9lUEZ5NENkeFBJN0pxczRmTjMwMmo1WEpPT2p5TnNsMGJsNmlxbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzIzMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651760667),
('izrzlNNzI8tymwegN5HNIlsEylHt7eR0ORkianat', NULL, '51.222.253.18', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXBsSzI3aFRNWWk0d1dLaDVsdExObnZoZU95U1JyNnJWRDFvNG1EMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHBzOi8vd3d3LnN5c2NvcHlwZXJ1LmNvbS9jYXRhbG9nby9wcm9kdWN0by8zMjIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1651759004),
('K0A9izZmwuHNj7hRZTQJ31sdYeUq09OXJouaHJKn', NULL, '114.119.137.105', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZllZc0s5Wm1qRlRJbzA2blZJZVlqQ1NBYjlaMHNoZEk2dVI2YjBDRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vc3lzY29weXBlcnUuY29tL2NhdGFsb2dvLzE4P3BhZ2U9MyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651765665),
('K3JtOBrrUK1Vf082wH3N3oYJKnJrkvvSvEPM3td5', NULL, '114.119.137.122', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnY0NzVOYm9TeVdtenBHOEJYYzY1enVPUUx5WVZPQ3IxZDRscDFEMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzM0OSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651768178),
('kMOvm7UU5AGpAoSZpPmsgqHqreTkKelHJm1ivirp', NULL, '114.119.137.125', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUQwV1l4ZU5uQTg1VmV2QnB0NFFuRFhvZWxsdmtxaTRCZ0phZ1pGRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzI0MiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651758796),
('mn2yF3iFgCN2sQb4YQFCZMC5bolajkWttJGYJvQW', NULL, '51.222.253.16', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejIxQUduaFNKYTF2V2VMVUNHNUx0OXFvZ1M4WUtFTm1IMVpDTVdiTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vc3lzY29weXBlcnUuY29tL2NhdGFsb2dvP3BhZ2U9NSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651760279),
('nsfcpFqr6BX95wkPOEqfsehbNwDAzJJcnVP3IZEu', NULL, '216.244.66.194', 'Mozilla/5.0 (compatible; DotBot/1.2; +https://opensiteexplorer.org/dotbot; help@moz.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjVXSmdQQ09NUkFnbXFROFBjUkRmRHFVeEJmcndHekxVSXhydXhmOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9zeXNjb3B5cGVydS5jb20vY29udGFjdG8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1651767807),
('ogPIe16iUtSwdRxcE3SFAwnST7RCqmMNDMpzrBEL', NULL, '200.45.169.27', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHc5SzczVXdKaTdtbE1xa2EyRkcxUW4xc1ZpTXJad254YUt2MlVhQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vc3lzY29weXBlcnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1651770778),
('pFI66tD60CSttY3MC0CZvA3u7viy9yXbV8ZLELw8', NULL, '51.222.253.8', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1pwR2JISHdock1tUW1URkV5QjhKRnBrQUVPV2hEd2Zlbk9rZEFVTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzExOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651757190),
('S9UuTCDzrKeyF1gbHi8vADp0SRmUKH2B5Il20VMt', NULL, '114.119.137.103', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmVyQk9HaDdkQlVsdVZWbWFnNFIwRkpZdmdZRGJmUm1HbGppVUJlNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvLzI5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1651764415),
('Sfw2Qa1El7R81J1RAUI9IkvIEdCZmfG935HMa8Iq', NULL, '114.119.137.122', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2k3UnVZcE5pQjBMaThJRk91bVBXVkhhY3dqQmhqcXo0bUQ1YlcxUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzE5NiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651763162),
('TQbpBqQi8kClQzuzyMANKfc3Zg4molT0k0uVxHpF', NULL, '51.222.253.5', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclZJTHNqdGVYd1JWVmVwblFidk9kb2Z2YXlEemxORlZnaEFGSGpGUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vd3d3LnN5c2NvcHlwZXJ1LmNvbS9jYXRhbG9nbyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651768296),
('TUoQTvTQojPK7xIYZOaTAcSNm6nlp1MHtpJL9Uoe', NULL, '51.222.253.11', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDU5NzBlVmVVaEtaTVhiRDI1NnJKNUQzZUNQbTFLeFlvbWkxbXBWbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzI3NCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651759644),
('uFAVxPNugHbZ7npppMntUFWdFQOUAurHf2KINXvI', NULL, '51.222.253.6', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVFvVDJQWGZWT0JiMzJ3ZGk1eDRydEx1aVdsQnVoM2VKTTNMNm1SMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvP3BhZ2U9MTAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1651770649),
('UpD101FOOJ1HN7IV5gyEJzraOJfwqUj5jpqGRt5p', NULL, '114.119.137.124', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWx2VGFSNmV6cHpjVzduTTFRaWpwc21pT0hacmplMG1iNGx3VkhDMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHBzOi8vc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL21yYy8yNT9wYWdlPTciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1651761289),
('vGWGLG65UKZsCubzBJKlXh7vU6U2L513luOAxlxn', NULL, '114.119.137.103', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUtZWTRDcjNiOVBTZ0pBT1BsempaQUhaTXQ2TjJJRDVXbVFZbHFJTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzMxNyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651767547),
('WAvRzdP7jw0sLYQX8MBblMS8RwToWeGmnZ6JZBFA', NULL, '66.249.79.234', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzFiRjBVbEdJVEVnSXBlTmJncHFpS2ZUdUhsUEgwM1d1VVpQQVBEcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vd3d3LnN5c2NvcHlwZXJ1LmNvbS9jb250YWN0byI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651757130),
('WH2S4meX5BzOxQrPnG5iOLg5v8G0S6EeX4Bd33Yh', NULL, '190.187.217.85', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUtTY0tQdjZMa3hySEcxRWlQWnVLOW9MUlE0VEFyaVdrN0RyZUZWWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vc3lzY29weXBlcnUuY29tL2NvbnRhY3RvIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1651761969),
('Wxl9aMIkzJBYXrZDn9zdMO7etm3ueefLycwnvrdD', NULL, '114.119.137.123', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0lNZld4S2VsQ2RsMFZaalF3YXF4UEpqVDdRSkF5ZW9Zblh4ZGFGaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzQwMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651760040),
('XQF4rixvJr3ALkFhk0tqEKrMZzRWI7bj1g7aZ4Gj', NULL, '114.119.137.128', 'Mozilla/5.0 (Linux; Android 7.0;) AppleWebKit/537.36 (KHTML, like Gecko) Mobile Safari/537.36 (compatible; PetalBot;+https://webmaster.petalsearch.com/site/petalbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXhNeDZ6NlgxdmYxS0VMMjBuYmpzT2RZaDc2TURTV0x0R2FZUVBtbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvL3Byb2R1Y3RvLzI5MSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1651761916),
('XwZ7WlbGlKThJimMO6ak9TAJ4uJv7bz1cND2BvA7', NULL, '51.222.253.11', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmlrRFFPOHhXeHY4cWRIVldtdHhnZGxuYWVVYzRlR0FFSTJVS2pWMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly93d3cuc3lzY29weXBlcnUuY29tL2NhdGFsb2dvLzQwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1651762807);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `imagen` text NOT NULL,
  `mensaje` text,
  `boton` varchar(50) DEFAULT NULL,
  `enlace` varchar(200) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sliders`
--

INSERT INTO `sliders` (`id`, `imagen`, `mensaje`, `boton`, `enlace`, `estado`) VALUES
(20, 'slider/3.png', '<p><strong>Servicio t&eacute;cnico</strong> para tus equipos, mayor producci&oacute;n para tu centro de trabajo.</p>', 'Solicítalo ahora', 'http://syscopyperu.com/tecnico', 1),
(28, 'slider/6.png', '<p><strong>Papel bond</strong>&nbsp;ecol&oacute;gico y de alta calidad en formatos A4 y A3.</p>', 'Pídelo ya', 'https://api.whatsapp.com/send?phone=51924167425', 1),
(29, 'slider/5.png', '<p><strong>Espacios dise&ntilde;ados</strong> para tu comodidad y confianza.</p>', 'Visítanos', 'http://syscopyperu.com/contacto', 1),
(32, 'slider/Slider 1.png', '<p>Grandes <strong>promociones</strong> <strong>de verano</strong>, para un inicio de a&ntilde;o exitoso.</p>', 'Entérate más', 'https://www.facebook.com/syscopyperu', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `empresa` varchar(100) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  `direccion` text NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`id`, `nombre`, `empresa`, `ruc`, `direccion`, `telefono`, `estado`) VALUES
(1, 'TIENDA LAMPA 1170', 'SYSCOPY PERU S.A.C', '20546324878', 'Jirón Lampa 1038, Cercado de Lima 15001', '996311447', 1),
(3, 'JR.  LAMPA 1038', 'IMARXLE SAC', '20508229152', 'JR. LAMPA 1038 Cercado de Lima 15001', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `login`, `rol`, `provider_id`, `avatar`) VALUES
(1, 'Nilton Rivera Silva', 'nrivera@gmail.com', NULL, '$2y$10$nqqNJxRNhAipxwcyZdP2COMbZu00lzxCCRyM19oI4SGxQyu6I8HSu', NULL, NULL, NULL, NULL, NULL, '2021-05-11 05:15:04', '2021-05-11 05:15:04', 'nrivera', '1', NULL, NULL),
(3, 'Humberto Medina', 'hmedina@gmail.com', NULL, '$2y$10$04BGLxfR1KVt7InZvkV7UOO2Yi3Ln.ZbzPUlWnKZsO4eJRCj/KHp2', NULL, NULL, NULL, NULL, NULL, '2021-07-16 17:14:12', '2021-08-12 17:58:42', 'hmedina', '0', NULL, NULL),
(4, 'Humberto Medina', 'hmedinahm@hotmail.com', NULL, '$2y$10$o9WyFPKt269ddJQZNuZUtOy9BWSX4zt7j..r8tpN8yzZVf1NWxp2O', NULL, NULL, 'iqont13Fd9uVQzhBr8rUkatd7w070ohDMNBf8krEhwY5eywDldUPirEILBpY', NULL, NULL, '2021-07-17 15:51:13', '2021-08-20 13:17:57', 'fmedina', '1', NULL, NULL),
(5, 'Mark Bonilla', 'mbonilla@syscopyperu.com', NULL, '$2y$10$.JrFmP2izvV8.1xOLuKEmOwoO3mBsrFVEPaXfMJYnCyCjGFju91se', NULL, NULL, NULL, NULL, NULL, '2021-07-19 15:44:04', '2021-07-19 15:44:04', 'markb', '0', NULL, NULL),
(6, 'Ivan Linares Hugar', 'ilinareshugar@gmail.com', NULL, '$2y$10$YPDG5pC2QkwBISN.OLinMuTcNKJGL9c3WAo6hbWTegB.GHU6xUqB.', NULL, NULL, 'LaS8d2Lph6RR9uolxEUMwKZQn4SFBPHX7oyRmFFuXGlMk9PBgBpK8g1yadXw', NULL, NULL, '2021-08-16 22:51:20', '2021-08-21 05:50:16', 'ivanlh', '1', NULL, NULL),
(7, 'prueba', 'prueba@hotmail.com', NULL, '$2y$10$lMcz13tC2jFeclfyJ0023.LwDEaXBhO.xrytyXzKKNgzeE/.Sj.pe', NULL, NULL, NULL, NULL, NULL, '2021-08-16 22:55:09', '2021-08-16 22:55:09', 'prueba1', '0', NULL, NULL),
(8, 'rocio ayala ramirez', '12345678@gmail.com', NULL, '$2y$10$cx3tbBMuFDYy.vThnzTsL.LlhWB63LnqkcY1.ts/5kR2evqk4ufuS', NULL, NULL, NULL, NULL, NULL, '2021-08-19 19:37:19', '2021-08-19 19:37:19', 'rocio', '0', NULL, NULL),
(9, 'Angelo Medina G', 'amedina@hotmail.com', NULL, '$2y$10$SJHFctN4XPTKJ7mrU/PL2uhDuui6SxAml/GOt7R.0UlwF3Oljg4bC', NULL, NULL, NULL, NULL, NULL, '2021-08-21 13:26:57', '2021-08-21 13:26:57', 'amedina', '0', NULL, NULL),
(10, 'Nilton rivera silva', 'nrivera.web@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-28 01:40:58', '2021-08-28 01:40:58', NULL, '0', '109004681971971440103', 'https://lh3.googleusercontent.com/a/AATXAJxvW_7mH1QKlCYtXLX39SltYbgNzvOK27voX7Gh=s96-c'),
(11, 'Nilton Rivera', 'niltonrs1480@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-28 02:08:03', '2021-08-28 02:08:03', NULL, '0', '10159217856074333', 'https://graph.facebook.com/v3.3/10159217856074333/picture?type=normal'),
(12, 'MATEO MEDINA TONGO', 'mgprudens@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-28 02:46:09', '2021-08-28 02:46:09', NULL, '0', '113578999166755586305', 'https://lh3.googleusercontent.com/a-/AOh14GhVYf9UEAwE195kx9IAw-cO-dv0o-F4VhWYr6hc=s96-c'),
(13, 'Humberto Medina', 'siscomwebhoy@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-31 03:48:43', '2021-08-31 03:48:43', NULL, '0', '101799518551583660631', 'https://lh3.googleusercontent.com/a-/AOh14GhgBYKH3a77DCtM3h82Uxh9bjJL_G6LWpFrmsj7=s96-c'),
(14, 'Maria Ayala', 'maria.ayalaweb@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-03 03:33:33', '2021-09-03 03:33:33', NULL, '0', '112865746405995073309', 'https://lh3.googleusercontent.com/a/AATXAJxWjToWdeUuXzy3S5v0G-SZOF-roDz0LO02Uliq=s96-c'),
(15, 'Rogger Anderson Palomino Gallegos', 'rogger.developer@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-07 17:19:28', '2021-09-07 17:19:28', NULL, '0', '113880846142077520067', 'https://lh3.googleusercontent.com/a-/AOh14GjWUbM9LI4WRa5gdHs_MI5s7gwcGg5t2wBITeKD=s96-c'),
(16, 'Lenin Bonilla', 'bonilla.flores.len@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-07 17:59:43', '2021-09-07 17:59:43', NULL, '0', '114383472487031314986', 'https://lh3.googleusercontent.com/a/AATXAJxMiZqSwG8FaeO2WOHtavS4mgmqzJZuj--IaKca=s96-c'),
(17, 'Julietyhob', 'mmar.k.i.zdesa.nd@gmail.com', NULL, '$2y$10$2u2/uNRRniWchFtW39LtAON14n0WwMygur5JOs.nkpbmaJa0d6.zq', NULL, NULL, NULL, NULL, NULL, '2021-10-26 18:42:37', '2021-10-26 18:42:37', 'Julietyhob', '0', NULL, NULL),
(18, 'Herless Max Anthony Bravo Huamán', 'maxbrvo93@gmail.com', NULL, '$2y$10$jAh27Tt/VdQPod7cqUB15.9H1Qh7mAFH.W3F1YyLehtygZlzEnqvO', NULL, NULL, NULL, NULL, NULL, '2021-12-01 20:54:50', '2021-12-01 20:54:50', 'MaxBravo', '0', NULL, NULL),
(19, 'syscopyperu.com bbbdnwkdowifhrdokpwoeiyutrieowsowddfbvksodkasofjgiekwskfieghrhjkfejfegigofwkdkbhbgiejfwokdd', 'dimafokin199506780tx+63z2@inbox.ru', NULL, '$2y$10$GHQC5W/D0m1lMq3jmYTlseF6H2yeRqiy9mhn53Ze0cqjyJBbSTyeG', NULL, NULL, NULL, NULL, NULL, '2022-02-08 14:26:51', '2022-02-08 14:26:51', 'syscopyperu.com bbbdnwkdowifhrdokpwoeiyutrieowsowddfbvksodkasofjgiekwskfieghrhjkfejfegigofwkdkbhbgiejfwokdd', '0', NULL, NULL),
(20, 'syscopyperu.com ugrfeiohofidsksmvnjdbvsijf94t9u5t0i4r94ijgrjght9y84r49t64rkowf0ereiuguejdkwdiweofuehdskodjjdgofjsoddggfsidj', 'KsenofontMaidanov+1t2q@mail.ru', NULL, '$2y$10$bZbsoxPwkX6IjjeGu3BHwud/p6x3omMSq/83VRmq2UqYX.3HpDXL2', NULL, NULL, NULL, NULL, NULL, '2022-04-14 17:33:54', '2022-04-14 17:33:54', 'syscopyperu.com ugrfeiohofidsksmvnjdbvsijf94t9u5t0i4r94ijgrjght9y84r49t64rkowf0ereiuguejdkwdiweofuehdskodjjdgofjsoddggfsidj', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wishes`
--

CREATE TABLE `wishes` (
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `productos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wishes`
--

INSERT INTO `wishes` (`users_id`, `productos_id`) VALUES
(4, 39),
(6, 39),
(4, 44),
(6, 133),
(6, 410),
(4, 415);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `canal`
--
ALTER TABLE `canal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categoria_categoria1_idx` (`categoria_id`);

--
-- Indices de la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_distrito_provincia_idx` (`provincia_id`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_libro_distrito1_idx` (`distrito_id`),
  ADD KEY `fk_libro_canal1_idx` (`canal_id`),
  ADD KEY `fk_libro_concepto1_idx` (`concepto_id`),
  ADD KEY `fk_libro_tienda1_idx` (`tienda_id`),
  ADD KEY `fk_libro_documento1_idx` (`documento_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productos_categoria1_idx` (`categoria_id`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_provincia_departamento1_idx` (`departamento_id`);

--
-- Indices de la tabla `redes`
--
ALTER TABLE `redes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_respuestas_libro1_idx` (`libro_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `wishes`
--
ALTER TABLE `wishes`
  ADD PRIMARY KEY (`users_id`,`productos_id`),
  ADD KEY `fk_users_has_productos_productos1_idx` (`productos_id`),
  ADD KEY `fk_users_has_productos_users1_idx` (`users_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `canal`
--
ALTER TABLE `canal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1857;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=416;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT de la tabla `redes`
--
ALTER TABLE `redes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categoria_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD CONSTRAINT `fk_distrito_provincia` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `fk_libro_canal1` FOREIGN KEY (`canal_id`) REFERENCES `canal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_libro_concepto1` FOREIGN KEY (`concepto_id`) REFERENCES `concepto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_libro_distrito1` FOREIGN KEY (`distrito_id`) REFERENCES `distrito` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_libro_documento1` FOREIGN KEY (`documento_id`) REFERENCES `documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_libro_tienda1` FOREIGN KEY (`tienda_id`) REFERENCES `tienda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `fk_provincia_departamento1` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `fk_respuestas_libro1` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `wishes`
--
ALTER TABLE `wishes`
  ADD CONSTRAINT `fk_users_has_productos_productos1` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_productos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
