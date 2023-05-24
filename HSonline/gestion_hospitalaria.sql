-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2023 a las 00:26:19
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_hospitalaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idCita` int(11) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `motivo` varchar(12) NOT NULL,
  `servicio` varchar(16) NOT NULL,
  `notas` varchar(150) DEFAULT NULL,
  `estado` varchar(14) DEFAULT NULL,
  `fecha_solicitud` varchar(30) NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `medico` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`idCita`, `documento`, `nombre`, `motivo`, `servicio`, `notas`, `estado`, `fecha_solicitud`, `fecha_inicio`, `fecha_fin`, `medico`) VALUES
(2, '', 'Imelda Nchama', 'Revision', 'Genicologia', '', 'OK', '11-03-2023 11:43:24', '2023-03-25 00:00:00', NULL, 'Dr. Valentin'),
(5, '90891', 'Abdall2', 'Malestar', 'Odontologia', '', 'OK', '13-03-2023 02:47:04', '2023-05-16 00:00:00', NULL, 'Dr. Samuel'),
(6, '90890', 'Paciente Demo', 'Revision', 'Ecografia', '', 'OK', '21-03-2023 00:04:09', '2023-03-23 00:00:00', NULL, 'Dr. Samuel'),
(7, '90801', 'Paciente Demo2', 'Revision', 'Genicologia', '', 'OK', '23-03-2023 12:59:49', '2023-03-23 00:00:00', NULL, 'Dr. Samuel'),
(9, '90811', 'Paciente Demo3', 'Revision', 'Ecografia', 'revisar el edtado de mi rodilla', 'OK', '23-03-2023 13:08:12', '2023-03-26 00:00:00', NULL, 'Dr. Samuel'),
(10, '0759', 'Paciente Demo4', 'Malestar', 'Ecografia', '', 'OK', '23-03-2023 13:13:06', '2023-03-31 00:00:00', NULL, 'Dr. Samuel'),
(11, '90891', 'Abdal2', 'revision', 'ecografia', NULL, 'OK', '31/03/2023', '2023-04-02 08:30:00', '2023-04-01 09:30:00', 'Dr. Valentin'),
(12, '90891', 'Abdal2', 'revision', 'ecografia', NULL, 'OK', '31/03/2023', '2023-03-31 10:44:19', '2023-03-31 11:44:19', 'Dr. Samuel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta`
--

CREATE TABLE `consulta` (
  `idConsulta` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `motivo` varchar(30) DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `temperatura` varchar(4) DEFAULT NULL,
  `sintomas` varchar(200) DEFAULT NULL,
  `notas` varchar(150) DEFAULT NULL,
  `pruebas` varchar(200) DEFAULT NULL,
  `dianostico` varchar(100) DEFAULT NULL,
  `fecha_consulta` varchar(30) NOT NULL DEFAULT current_timestamp(),
  `fecha_dianostico` varchar(40) DEFAULT NULL,
  `medico_id` int(11) DEFAULT NULL,
  `estado` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `consulta`
--

INSERT INTO `consulta` (`idConsulta`, `paciente_id`, `motivo`, `altura`, `peso`, `temperatura`, `sintomas`, `notas`, `pruebas`, `dianostico`, `fecha_consulta`, `fecha_dianostico`, `medico_id`, `estado`) VALUES
(162, 98, 'Malestar', 174, 67, '36.0', 'fiebre, dolor de cabeza, debilidad corporal, ', '', 'COVID, MALARIA, PALUDISMO, VIH-SIDA, ', 'PALUDISMO+ 	', '15-05-2023 06:56:43', '15-05-2023 08:47:52', 23, NULL),
(163, 99, 'Malestar', 168, 55, '36.0', 'fiebre, vomitos, debilidad corporal, ', '', 'DIABETES, PALUDISMO, VIH-SIDA, ', 'PALUDISMO+ 	', '16-05-2023 14:50:47', '16-05-2023 14:52:38', 23, NULL),
(164, 100, 'Malestar', 178, 78, '36.0', 'fiebre, dolor de cabeza, debilidad corporal, ', '', 'COVID, PALUDISMO, ', 'PALUDISMO+ 	', '23-05-2023 18:34:34', '23-05-2023 18:35:13', 23, 'archivado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad`
--

CREATE TABLE `enfermedad` (
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `enfermedad`
--

INSERT INTO `enfermedad` (`nombre`) VALUES
('COVID'),
('DIABETES'),
('DIARREA'),
('GRIPE'),
('MALARIA'),
('PALUDISMO'),
('SARAMPION'),
('TUBERCULOSIS'),
('VIH-SIDA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad_sintoma`
--

CREATE TABLE `enfermedad_sintoma` (
  `idEnfermedadSintoma` int(11) NOT NULL,
  `sintoma_id` int(11) NOT NULL,
  `enfermedad_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `enfermedad_sintoma`
--

INSERT INTO `enfermedad_sintoma` (`idEnfermedadSintoma`, `sintoma_id`, `enfermedad_id`) VALUES
(16, 1, 'COVID'),
(17, 1, 'PALUDISMO'),
(18, 2, 'PALUDISMO'),
(19, 2, 'COVID'),
(20, 7, 'DIARREA'),
(21, 15, 'TUBERCULOSIS'),
(22, 1, 'VIH-SIDA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hc`
--

CREATE TABLE `hc` (
  `idHc` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `consulta_id` int(11) NOT NULL,
  `medico_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `hc`
--

INSERT INTO `hc` (`idHc`, `paciente_id`, `consulta_id`, `medico_id`, `fecha`) VALUES
(5, 100, 164, 23, '2023-05-23 18:36:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `idHorario` int(11) NOT NULL,
  `sanitario_id` int(11) NOT NULL,
  `dia_semana` varchar(14) NOT NULL,
  `inicio` time NOT NULL,
  `fin` time NOT NULL,
  `etiqueta` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`idHorario`, `sanitario_id`, `dia_semana`, `inicio`, `fin`, `etiqueta`) VALUES
(1, 23, 'lunes', '07:00:00', '14:00:00', 'sanitario'),
(2, 28, 'martes', '07:00:00', '14:00:00', 'sanitario'),
(3, 23, 'miercoles', '07:00:00', '14:00:00', 'sanitario'),
(4, 23, 'martes', '07:00:00', '14:00:00', 'sanitario'),
(5, 26, 'viernes', '09:00:00', '14:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hospitalizacion`
--

CREATE TABLE `hospitalizacion` (
  `idHospitalizacion` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `sala` varchar(6) DEFAULT NULL,
  `habitacion` int(11) DEFAULT NULL,
  `cama` int(11) DEFAULT NULL,
  `estado` varchar(15) NOT NULL,
  `fecha_ingreso` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_alta` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `hospitalizacion`
--

INSERT INTO `hospitalizacion` (`idHospitalizacion`, `paciente_id`, `nombre`, `sala`, `habitacion`, `cama`, `estado`, `fecha_ingreso`, `fecha_alta`) VALUES
(11, 98, 'Miguel Angel Momo', 'A', 1, 1, 'hospitalizado', '2023-05-16 07:36:05', NULL),
(12, 99, 'Maria del Carmen', 'A', 1, 2, 'hospitalizado', '2023-05-16 14:55:29', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `idPaciente` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `edad` int(11) NOT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `documento` varchar(15) DEFAULT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `contrasena` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`idPaciente`, `nombre`, `edad`, `sexo`, `documento`, `direccion`, `telefono`, `usuario`, `contrasena`) VALUES
(98, 'Miguel Angel Momo', 19, 'Hombre', '1160781', 'Sampaka', '555657488', 'miguel', 'miguel4'),
(99, 'Maria del Carmen', 28, 'Mujer', '111732', 'Buena Esperanza', '555202201', 'carmenM', '086855'),
(100, 'Javier', 26, 'Hombre', '111254', 'Semu', '', 'XMFF', '444836');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prescripciones`
--

CREATE TABLE `prescripciones` (
  `idPrescripcion` int(11) NOT NULL,
  `enfermedad` varchar(50) NOT NULL,
  `categoria` varchar(16) NOT NULL,
  `medicamento` varchar(60) NOT NULL,
  `cantidad` varchar(15) NOT NULL,
  `dosis` varchar(6) NOT NULL,
  `frecuencia` varchar(14) NOT NULL,
  `tratamiento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `prescripciones`
--

INSERT INTO `prescripciones` (`idPrescripcion`, `enfermedad`, `categoria`, `medicamento`, `cantidad`, `dosis`, `frecuencia`, `tratamiento_id`) VALUES
(10, 'PALUDISMO', 'bebes', 'cloroquinina', '150mg', '1/2', '0', 29),
(11, 'PALUDISMO', 'bebes', 'primaquinina', '3.5mg', '1/4', '0', 29),
(12, 'PALUDISMO', '3-6aÃ±os', 'cloroquinina', '300mg', '1', '0', 30),
(13, 'PALUDISMO', '3-6aÃ±os', 'primaquinina', '5mg', '1', '0', 30),
(14, 'PALUDISMO', 'adultos', 'cloroquinina', '1000mg', '2', '00-00', 31),
(15, 'PALUDISMO', 'adultos', 'primaquinina', '100mg', '1', '0', 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programacion`
--

CREATE TABLE `programacion` (
  `idProgramacion` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `fecha` date NOT NULL,
  `inicio` time NOT NULL,
  `fin` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `programacion`
--

INSERT INTO `programacion` (`idProgramacion`, `titulo`, `departamento`, `descripcion`, `fecha`, `inicio`, `fin`) VALUES
(1, 'HORARIO DE VISITAS A LOS PACIENTES', 'Atencion al cliente', 'Para visitar a su paciente acuda en las horas permitidas.', '2023-05-22', '10:00:00', '14:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pruebas_paciente`
--

CREATE TABLE `pruebas_paciente` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `enfermedad` varchar(100) NOT NULL,
  `consulta_id` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pruebas_paciente`
--

INSERT INTO `pruebas_paciente` (`id`, `paciente_id`, `enfermedad`, `consulta_id`, `fecha`) VALUES
(13, 98, 'COVID', 162, '2023-05-15'),
(14, 98, 'MALARIA', 162, '2023-05-15'),
(15, 98, 'PALUDISMO', 162, '2023-05-15'),
(16, 98, 'VIH-SIDA', 162, '2023-05-15'),
(17, 99, 'DIABETES', 163, '2023-05-16'),
(18, 99, 'PALUDISMO', 163, '2023-05-16'),
(19, 99, 'VIH-SIDA', 163, '2023-05-16'),
(20, 100, 'COVID', 164, '2023-05-23'),
(21, 100, 'PALUDISMO', 164, '2023-05-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sanitario`
--

CREATE TABLE `sanitario` (
  `idMedico` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `nacionalidad` varchar(45) DEFAULT NULL,
  `dip_pasaporte` varchar(12) DEFAULT NULL,
  `especialidad` varchar(100) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `contrasena` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sanitario`
--

INSERT INTO `sanitario` (`idMedico`, `nombre`, `sexo`, `nacionalidad`, `dip_pasaporte`, `especialidad`, `direccion`, `telefono`, `email`, `usuario`, `contrasena`) VALUES
(23, 'Dr Valentin Edu Angono', NULL, 'ecuatoguineano', '2133', 'Laboratorio, Medico general', 'B/Timbabe', '222094878', 'valedu@gmail.com', 'valAdmin', 'val123'),
(24, 'Guadalupe Nchama', 'mujer', 'ecuatoguineano', '106578', 'Enfermeria', 'B/Santa Maria 2', '222095873', 'lupenchama@gmail.com', 'guadalupe', 'lupe123'),
(25, 'Delfina Eyang', 'mujer', 'ecuatoguineano', '100678', 'Recepcionista', 'B/Sampaka', '222432354', 'eyangguada@gmail.com', 'eyang', 'defiEyang2'),
(26, 'Javier Clemente Mangue', NULL, 'ecuatoguineano', '106570', 'Admin', 'B/Hassan II', '222098789', 'javigalan32@gmail.com', 'javier', 'Clemente'),
(28, 'Dr. Camio Nsue', NULL, 'ecuatoguineano', '549375', 'Cirugia', 'Malabo2', '222349590', 'demo@gmail.com', 'camilo', 'cami1'),
(29, 'Miguel Angel', 'hombre', 'Ecuatoguineano', '908088', 'Odontologia', 'Mostoles', '222333444', '', 'LQJQLP', 'VL08GN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sintoma`
--

CREATE TABLE `sintoma` (
  `idSintoma` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sintoma`
--

INSERT INTO `sintoma` (`idSintoma`, `descripcion`) VALUES
(1, 'fiebre'),
(2, 'dolor de cabeza'),
(3, 'nauseas'),
(4, 'dolor de garganta'),
(5, 'perdida de peso'),
(6, 'dolor de abdomen'),
(7, 'diarrea'),
(8, 'tos'),
(9, 'vomitos'),
(10, 'mocos'),
(11, 'ojos enrojecidos y llorosos'),
(12, 'sarpullido'),
(13, 'estreñimiento'),
(14, 'cansancio'),
(15, 'debilidad o fatiga'),
(16, 'falta de apetito'),
(17, 'sudores nocturnos'),
(18, 'orinar con frecuencia'),
(19, 'sentir mucha sed'),
(20, 'mucha hambre'),
(21, 'vista borrosa'),
(22, 'congestion nasal'),
(23, 'dolores musculares o corporales'),
(24, 'dificultad para respirar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `idTratamiento` int(11) NOT NULL,
  `enfermedad` varchar(100) NOT NULL,
  `categoria` varchar(15) NOT NULL,
  `medico_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`idTratamiento`, `enfermedad`, `categoria`, `medico_id`) VALUES
(29, 'PALUDISMO', 'bebes', 23),
(30, 'PALUDISMO', '3-6aÃ±os', 23),
(31, 'PALUDISMO', 'adultos', 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento_paciente`
--

CREATE TABLE `tratamiento_paciente` (
  `id` int(11) NOT NULL,
  `tratamiento_id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `consulta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tratamiento_paciente`
--

INSERT INTO `tratamiento_paciente` (`id`, `tratamiento_id`, `paciente_id`, `consulta_id`) VALUES
(20, 31, 98, 162),
(21, 31, 99, 163),
(22, 31, 100, 164);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idCita`);

--
-- Indices de la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`idConsulta`),
  ADD KEY `fk_consulta_paciente1_idx` (`paciente_id`),
  ADD KEY `fk_consulta_medico1_idx` (`medico_id`);

--
-- Indices de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `enfermedad_sintoma`
--
ALTER TABLE `enfermedad_sintoma`
  ADD PRIMARY KEY (`idEnfermedadSintoma`),
  ADD KEY `enfermedad_sintoma_ibfk_1` (`sintoma_id`),
  ADD KEY `enfermedad_id` (`enfermedad_id`);

--
-- Indices de la tabla `hc`
--
ALTER TABLE `hc`
  ADD PRIMARY KEY (`idHc`),
  ADD KEY `hc_ibfk_1` (`paciente_id`),
  ADD KEY `hc_ibfk_2` (`consulta_id`),
  ADD KEY `hc_ibfk_3` (`medico_id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`idHorario`),
  ADD KEY `paciente_id` (`sanitario_id`);

--
-- Indices de la tabla `hospitalizacion`
--
ALTER TABLE `hospitalizacion`
  ADD PRIMARY KEY (`idHospitalizacion`),
  ADD KEY `hospitalizacion_ibfk_1` (`paciente_id`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`idPaciente`);

--
-- Indices de la tabla `prescripciones`
--
ALTER TABLE `prescripciones`
  ADD PRIMARY KEY (`idPrescripcion`),
  ADD KEY `prescripciones_ibfk_1` (`tratamiento_id`);

--
-- Indices de la tabla `programacion`
--
ALTER TABLE `programacion`
  ADD PRIMARY KEY (`idProgramacion`);

--
-- Indices de la tabla `pruebas_paciente`
--
ALTER TABLE `pruebas_paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pruebas_paciente_ibfk_1` (`consulta_id`),
  ADD KEY `pruebas_paciente_ibfk_2` (`enfermedad`);

--
-- Indices de la tabla `sanitario`
--
ALTER TABLE `sanitario`
  ADD PRIMARY KEY (`idMedico`);

--
-- Indices de la tabla `sintoma`
--
ALTER TABLE `sintoma`
  ADD PRIMARY KEY (`idSintoma`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`idTratamiento`),
  ADD KEY `tratamiento_ibfk_1` (`medico_id`);

--
-- Indices de la tabla `tratamiento_paciente`
--
ALTER TABLE `tratamiento_paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `consulta_id` (`consulta_id`),
  ADD KEY `tratamiento_paciente_ibfk_1` (`tratamiento_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `idCita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `consulta`
--
ALTER TABLE `consulta`
  MODIFY `idConsulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT de la tabla `enfermedad_sintoma`
--
ALTER TABLE `enfermedad_sintoma`
  MODIFY `idEnfermedadSintoma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `hc`
--
ALTER TABLE `hc`
  MODIFY `idHc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `idHorario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `hospitalizacion`
--
ALTER TABLE `hospitalizacion`
  MODIFY `idHospitalizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `idPaciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `prescripciones`
--
ALTER TABLE `prescripciones`
  MODIFY `idPrescripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `programacion`
--
ALTER TABLE `programacion`
  MODIFY `idProgramacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pruebas_paciente`
--
ALTER TABLE `pruebas_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `sanitario`
--
ALTER TABLE `sanitario`
  MODIFY `idMedico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `sintoma`
--
ALTER TABLE `sintoma`
  MODIFY `idSintoma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `idTratamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `tratamiento_paciente`
--
ALTER TABLE `tratamiento_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`medico_id`) REFERENCES `sanitario` (`idMedico`),
  ADD CONSTRAINT `paciente_consulta` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`idPaciente`);

--
-- Filtros para la tabla `enfermedad_sintoma`
--
ALTER TABLE `enfermedad_sintoma`
  ADD CONSTRAINT `enfermedad_sintoma_ibfk_1` FOREIGN KEY (`sintoma_id`) REFERENCES `sintoma` (`idSintoma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enfermedad_sintoma_ibfk_2` FOREIGN KEY (`enfermedad_id`) REFERENCES `enfermedad` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `hc`
--
ALTER TABLE `hc`
  ADD CONSTRAINT `hc_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`idPaciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hc_ibfk_2` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`idConsulta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hc_ibfk_3` FOREIGN KEY (`medico_id`) REFERENCES `sanitario` (`idMedico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`sanitario_id`) REFERENCES `sanitario` (`idMedico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `hospitalizacion`
--
ALTER TABLE `hospitalizacion`
  ADD CONSTRAINT `hospitalizacion_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`idPaciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prescripciones`
--
ALTER TABLE `prescripciones`
  ADD CONSTRAINT `prescripciones_ibfk_1` FOREIGN KEY (`tratamiento_id`) REFERENCES `tratamiento` (`idTratamiento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pruebas_paciente`
--
ALTER TABLE `pruebas_paciente`
  ADD CONSTRAINT `pruebas_paciente_ibfk_1` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`idConsulta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pruebas_paciente_ibfk_2` FOREIGN KEY (`enfermedad`) REFERENCES `enfermedad` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD CONSTRAINT `tratamiento_ibfk_1` FOREIGN KEY (`medico_id`) REFERENCES `sanitario` (`idMedico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tratamiento_paciente`
--
ALTER TABLE `tratamiento_paciente`
  ADD CONSTRAINT `tratamiento_paciente_ibfk_1` FOREIGN KEY (`tratamiento_id`) REFERENCES `tratamiento` (`idTratamiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tratamiento_paciente_ibfk_2` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`idPaciente`),
  ADD CONSTRAINT `tratamiento_paciente_ibfk_3` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`idConsulta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
