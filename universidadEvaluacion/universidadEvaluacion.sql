-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 18-11-2023 a las 17:21:13
-- Versión del servidor: 8.0.35-0ubuntu0.22.04.1
-- Versión de PHP: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `universidadEvaluacion`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`juan`@`localhost` PROCEDURE `alumnas_ing_informatica_plan_2015` ()  BEGIN
    SELECT  pr.* from persona pr 
    JOIN alumno_se_matricula_asignatura  asma on pr.id =asma.id_alumno 
    JOIN asignatura asg on asma.id_asignatura = asg.id  
    JOIN grado gr on asg.id_grado =gr.id
    where (gr.nombre = 'Grado en Ingeniería Informática (Plan 2015)' and pr.sexo = 'm');
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `alumnos_matriculados_2018_2019` ()  BEGIN
    select DISTINCT
    pr.*
    from alumno_se_matricula_asignatura asma
    JOIN persona pr on asma.id_alumno = pr.id
    JOIN curso_escolar ce on asma.id_curso_escolar = ce.id
    WHERE ce.anyo_inicio = 2018  and ce.anyo_fin = 2019 ;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `alumnos_x_curso_escolar` ()  BEGIN
    SELECT c.anyo_inicio, COUNT(am.id_alumno) FROM alumno_se_matricula_asignatura am
    JOIN curso_escolar c ON am.id_curso_escolar = c.id
    GROUP BY c.anyo_inicio;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `alumno_mas_joven` ()  BEGIN
    SELECT * FROM persona WHERE id = (
  	SELECT id FROM persona ORDER BY fecha_nacimiento DESC LIMIT 1);
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `asignaturas_alumno_nif` ()  BEGIN
    SELECT  
    asg.nombre as nombre_asignatura ,
    ce.anyo_inicio ,
    ce.anyo_fin
    from  alumno_se_matricula_asignatura asma 
    JOIN asignatura asg  on  asma.id_asignatura = asg.id
    JOIN persona pr on asma.id_alumno = pr.id
    JOIN curso_escolar ce on asma.id_curso_escolar = ce.id
    WHERE pr.nif  = '26902806M' and pr.tipo = 'alumno';
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `asignaturas_cuatrimestre_3_grado_7` ()  BEGIN
   select 
    * 
    from asignatura asg
    where asg.cuatrimestre =1 and asg.curso =3 and asg.id_grado =7 ;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `asignaturas_ing_informatica_2015` ()  BEGIN
    SELECT  * FROM asignatura asg
    JOIN grado gr on asg.id_grado = gr.id 
    WHERE gr.nombre ='Grado en Ingeniería Informática (Plan 2015)';
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `asignaturas_por_grado` ()  BEGIN
    SELECT g.nombre, COUNT(a.id_grado) AS cantidad_asignaturas FROM asignatura a
    LEFT JOIN grado g ON a.id_grado = g.id
    GROUP BY g.nombre ORDER BY COUNT(a.id_grado) ;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `asignaturas_sin_profesor` ()  BEGIN
   	select  
    * 
    from asignatura asg 
    WHERE asg.id_profesor is null or LENGTH(asg.id_profesor) = 0 ;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `departamentos_sin_profesores` ()  BEGIN
    SELECT * FROM departamento WHERE id IN (
    SELECT id_departamento FROM profesor WHERE id_profesor IS NULL);
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `deptos_asignaturas_no_impartidas` ()  BEGIN
  	SELECT 
    dp.nombre as nombre_departamento , 
    asd.nombre as nombre_asignatura
    FROM departamento dp
    JOIN profesor pfr ON dp.id = pfr.id_departamento
    JOIN asignatura asd ON pfr.id_profesor = asd.id_profesor
    WHERE asd.id NOT IN (SELECT asma.id_asignatura FROM alumno_se_matricula_asignatura asma);  
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `deptos_con_profesores_ing_informatica_2015` ()  BEGIN
    SELECT dp.nombre  FROM  departamento dp 
     JOIN profesor pf on dp.id = pf.id_departamento
     JOIN asignatura asg on pf.id_profesor  = asg.id_profesor
     JOIN grado gr on asg.id_grado = gr.id 
     WHERE gr.nombre = 'Grado en Ingeniería Informática (Plan 2015)' GROUP by dp.nombre;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `dpto_sin_asignaturas` ()  BEGIN
  SELECT * FROM departamento WHERE id IN (
  SELECT d.id FROM departamento d
  JOIN profesor pro ON d.id = pro.id_departamento
  JOIN persona p ON pro.id_profesor = p.id
  JOIN asignatura a ON p.id = a.id_profesor
  LEFT JOIN alumno_se_matricula_asignatura am ON a.id = am.id_asignatura
  WHERE p.tipo = "profesor" AND am.id_asignatura IS NULL);
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `listar_alumnos_ordenados` ()  BEGIN

    SELECT 
    apellido1 AS primer_apellido,
    IF(apellido2 IS NULL OR LENGTH(apellido2) = 0, 'no tiene segundo apellido', apellido2) AS segundo_apellido,
    nombre AS nombre_empleado    
    FROM persona 
    WHERE tipo = 'alumno' 
    ORDER BY UPPER(apellido1) ASC, UPPER(apellido2) ASC, UPPER(nombre) ASC;

  END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `obtener_alumnos_nacidos_en_1999` ()  BEGIN
	SELECT * from persona WHERE tipo = 'alumno' and YEAR(fecha_nacimiento) =1999;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `obtener_alumnos_sin_telefono` ()  BEGIN
SELECT 
    nombre as nombre_alumno ,
    apellido1 as primer_apellido , 
    if(apellido2 is null or length(apellido2)=0 , 'no tiene apellido materno' , apellido2) as segundo_apellido
    from persona WHERE tipo = 'alumno' and (telefono is null or length(telefono) = 0 );
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `obtener_grados_max_40` ()  BEGIN
     SELECT g.*, COUNT(a.id_grado) AS cantidad_asignaturas FROM asignatura a
    LEFT JOIN grado g ON a.id_grado = g.id
    GROUP BY g.id
    HAVING COUNT(a.id_grado) > 40;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `obtener_profesores_sin_telefono_y_nif_k` ()  BEGIN
    SELECT 
    *
    from persona WHERE nif
    LIKE '%k' and
    tipo = 'profesor' and (telefono is null or length(telefono) =0 );
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `profesores_con_departamento` ()  BEGIN
    SELECT 
    pr.apellido1 as primer_apellido,
    pr.apellido2 as segundo_apellido,
    pr.nombre as nombre_profesor ,
    dp.nombre as nombre_departamento
    FROM profesor pf
    JOIN persona pr ON pf.id_profesor  = pr.id
    JOIN  departamento dp ON pf.id_departamento = dp.id
    ORDER BY pr.nombre ASC , pr.apellido1 ASC,pr.apellido2 ASC;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `profesores_con_departamentos` ()  BEGIN
    SELECT
    pr.apellido1 as primer_apellido,
    pr.apellido2 as segundo_apellido,
    pr.nombre as nombre_profesor ,
    if((dp.nombre =null or length (dp.nombre) =0 ),'no tiene departamento',dp.nombre )AS nombre_departamento
    from profesor pf
    JOIN persona pr on  pf.id_profesor = pr.id
    LEFT JOIN departamento dp on pf.id_departamento =dp.id ;  
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `profesores_sin_asignaturas` ()  BEGIN
    SELECT per.* 
    FROM persona per 
    WHERE per.id IN (
    SELECT prf.id_profesor 
    FROM profesor prf
    WHERE  prf.id_profesor
    NOT IN (
    SELECT asg.id_profesor 
    FROM asignatura asg
    WHERE asg.id_profesor IS NOT NULL
	)
);
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `profesores_sin_departamento` ()  BEGIN
   	SELECT * FROM persona WHERE id IN (
  	SELECT p.id FROM persona p
  	LEFT JOIN profesor pro ON p.id = pro.id_profesor
    WHERE p.tipo = "profesor" AND pro.id_profesor IS NULL) ;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `prof_sin_asignaturas_dpto` ()  BEGIN
     SELECT * FROM persona WHERE id IN (
    SELECT p.id FROM persona p
    JOIN profesor pro ON p.id = pro.id_profesor
    LEFT JOIN asignatura a ON p.id = a.id_profesor
    WHERE p.tipo = "profesor" AND a.id_profesor IS NULL);
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `suma_creditos_tipo_asg` ()  BEGIN
	SELECT g.nombre, a.tipo, SUM(a.creditos) FROM asignatura a
  	JOIN grado g ON a.id_grado = g.id
  	GROUP BY g.nombre, a.tipo
  	ORDER BY SUM(a.creditos) DESC;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `total_alumnas` ()  BEGIN
     select count(sexo) from persona WHERE sexo ='m' ;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `total_alumnos_nacidos_1999` ()  BEGIN
	select count(fecha_nacimiento) from persona WHERE YEAR(fecha_nacimiento) = '1999' ;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `total_asignaturas_por_profesor` ()  BEGIN
    SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) FROM persona p
    LEFT JOIN asignatura a ON p.id = a.id_profesor
    WHERE p.tipo = "profesor"
    GROUP BY p.id
    ORDER BY COUNT(a.id) DESC;
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `total_profesores_por_departamento` ()  BEGIN
	SELECT
  dp.nombre AS nombre_departamento,
  COUNT(pfr.id_profesor) AS numero_de_profesores
  FROM
  departamento dp
  JOIN
  profesor pfr ON dp.id = pfr.id_departamento
  GROUP BY
  dp.id, dp.nombre
  HAVING
  COUNT(pfr.id_profesor) >0
  ORDER BY
  numero_de_profesores DESC; 
END$$

CREATE DEFINER=`juan`@`localhost` PROCEDURE `total_todos_profesores_x_dpto` ()  BEGIN
   SELECT
  dp.nombre AS nombre_departamento,
  IF(COUNT(pfr.id_profesor) > 0, COUNT(pfr.id_profesor), 'el departamento no tiene profesores') AS numero_de_profesores
  FROM
  departamento dp
  JOIN
  profesor pfr ON dp.id = pfr.id_departamento
  GROUP BY
  dp.id, dp.nombre
  HAVING
  COUNT(pfr.id_profesor) > 0;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_se_matricula_asignatura`
--

CREATE TABLE `alumno_se_matricula_asignatura` (
  `id_alumno` int NOT NULL,
  `id_asignatura` int NOT NULL,
  `id_curso_escolar` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `alumno_se_matricula_asignatura`
--

INSERT INTO `alumno_se_matricula_asignatura` (`id_alumno`, `id_asignatura`, `id_curso_escolar`) VALUES
(1, 1, 1),
(2, 1, 1),
(4, 1, 1),
(19, 1, 5),
(23, 1, 5),
(24, 1, 5),
(1, 2, 1),
(2, 2, 1),
(4, 2, 1),
(19, 2, 5),
(23, 2, 5),
(24, 2, 5),
(1, 3, 1),
(2, 3, 1),
(4, 3, 1),
(19, 3, 5),
(23, 3, 5),
(24, 3, 5),
(19, 4, 5),
(23, 4, 5),
(24, 4, 5),
(19, 5, 5),
(23, 5, 5),
(24, 5, 5),
(19, 6, 5),
(23, 6, 5),
(24, 6, 5),
(19, 7, 5),
(23, 7, 5),
(24, 7, 5),
(19, 8, 5),
(23, 8, 5),
(24, 8, 5),
(19, 9, 5),
(23, 9, 5),
(24, 9, 5),
(19, 10, 5),
(23, 10, 5),
(24, 10, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `creditos` float NOT NULL,
  `tipo` enum('básica','obligatoria','optativa') NOT NULL,
  `curso` tinyint NOT NULL,
  `cuatrimestre` tinyint NOT NULL,
  `id_profesor` int DEFAULT NULL,
  `id_grado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id`, `nombre`, `creditos`, `tipo`, `curso`, `cuatrimestre`, `id_profesor`, `id_grado`) VALUES
(1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, 3, 4),
(2, 'Cálculo', 6, 'básica', 1, 1, 14, 4),
(3, 'Física para informática', 6, 'básica', 1, 1, 3, 4),
(4, 'Introducción a la programación', 6, 'básica', 1, 1, 14, 4),
(5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, 3, 4),
(6, 'Estadística', 6, 'básica', 1, 2, 14, 4),
(7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, 3, 4),
(8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, 14, 4),
(9, 'Lógica y algorítmica', 6, 'básica', 1, 2, 3, 4),
(10, 'Metodología de la programación', 6, 'básica', 1, 2, 14, 4),
(11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4),
(12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4),
(13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4),
(14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4),
(15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4),
(16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4),
(17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4),
(18, 'Fundamentos de Redes de Computadores', 6, 'obligatoria', 2, 2, 3, 4),
(19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4),
(20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4),
(21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4),
(22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4),
(23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
(24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4),
(25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4),
(26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4),
(27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
(28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4),
(29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4),
(30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4),
(31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4),
(32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4),
(33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4),
(34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4),
(35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4),
(36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4),
(37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4),
(38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4),
(39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4),
(40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4),
(41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4),
(42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4),
(43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4),
(44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4),
(45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4),
(46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4),
(47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4),
(48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4),
(49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4),
(50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4),
(51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4),
(52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7),
(53, 'Física', 6, 'básica', 1, 1, NULL, 7),
(54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7),
(55, 'Química general', 6, 'básica', 1, 1, NULL, 7),
(56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7),
(57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7),
(58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7),
(59, 'Genética', 6, 'básica', 1, 2, NULL, 7),
(60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7),
(61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7),
(62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7),
(63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7),
(64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7),
(65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7),
(66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7),
(67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7),
(68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7),
(69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7),
(70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7),
(71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7),
(72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7),
(73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7),
(74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7),
(75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7),
(76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7),
(77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7),
(78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7),
(79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7),
(80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7),
(81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7),
(82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7),
(83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_escolar`
--

CREATE TABLE `curso_escolar` (
  `id` int NOT NULL,
  `anyo_inicio` year NOT NULL,
  `anyo_fin` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `curso_escolar`
--

INSERT INTO `curso_escolar` (`id`, `anyo_inicio`, `anyo_fin`) VALUES
(1, 2014, 2015),
(2, 2015, 2016),
(3, 2016, 2017),
(4, 2017, 2018),
(5, 2018, 2019);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`) VALUES
(1, 'Informática'),
(2, 'Matemáticas'),
(3, 'Economía y Empresa'),
(4, 'Educación'),
(5, 'Agronomía'),
(6, 'Química y Física'),
(7, 'Filología'),
(8, 'Derecho'),
(9, 'Biología y Geología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`id`, `nombre`) VALUES
(1, 'Grado en Ingeniería Agrícola (Plan 2015)'),
(2, 'Grado en Ingeniería Eléctrica (Plan 2014)'),
(3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)'),
(4, 'Grado en Ingeniería Informática (Plan 2015)'),
(5, 'Grado en Ingeniería Mecánica (Plan 2010)'),
(6, 'Grado en Ingeniería Química Industrial (Plan 2010)'),
(7, 'Grado en Biotecnología (Plan 2015)'),
(8, 'Grado en Ciencias Ambientales (Plan 2009)'),
(9, 'Grado en Matemáticas (Plan 2010)'),
(10, 'Grado en Química (Plan 2009)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int NOT NULL,
  `nif` varchar(9) DEFAULT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `ciudad` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('H','M') NOT NULL,
  `tipo` enum('profesor','alumno') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nif`, `nombre`, `apellido1`, `apellido2`, `ciudad`, `direccion`, `telefono`, `fecha_nacimiento`, `sexo`, `tipo`) VALUES
(1, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991-03-28', 'H', 'alumno'),
(2, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992-08-08', 'H', 'alumno'),
(3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979-08-19', 'M', 'profesor'),
(4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000-10-05', 'H', 'alumno'),
(5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978-01-19', 'H', 'profesor'),
(6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998-01-28', 'H', 'alumno'),
(7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999-05-24', 'H', 'alumno'),
(8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977-08-21', 'M', 'profesor'),
(9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996-11-21', 'H', 'alumno'),
(10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977-05-19', 'M', 'profesor'),
(11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997-04-26', 'H', 'alumno'),
(12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor'),
(13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980-02-01', 'H', 'profesor'),
(14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977-01-02', 'H', 'profesor'),
(15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980-03-14', 'H', 'profesor'),
(16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982-03-18', 'H', 'profesor'),
(17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973-05-05', 'H', 'profesor'),
(18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976-02-25', 'H', 'profesor'),
(19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998-09-01', 'M', 'alumno'),
(20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980-10-31', 'H', 'profesor'),
(21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998-01-01', 'H', 'alumno'),
(22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999-02-11', 'H', 'alumno'),
(23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996-03-12', 'M', 'alumno'),
(24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995-04-13', 'M', 'alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` int NOT NULL,
  `id_departamento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id_profesor`, `id_departamento`) VALUES
(3, 1),
(14, 1),
(5, 2),
(15, 2),
(8, 3),
(16, 3),
(10, 4),
(12, 4),
(17, 4),
(18, 5),
(13, 6),
(20, 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno_se_matricula_asignatura`
--
ALTER TABLE `alumno_se_matricula_asignatura`
  ADD PRIMARY KEY (`id_alumno`,`id_asignatura`,`id_curso_escolar`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `id_curso_escolar` (`id_curso_escolar`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `id_grado` (`id_grado`);

--
-- Indices de la tabla `curso_escolar`
--
ALTER TABLE `curso_escolar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nif` (`nif`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `curso_escolar`
--
ALTER TABLE `curso_escolar`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno_se_matricula_asignatura`
--
ALTER TABLE `alumno_se_matricula_asignatura`
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id`),
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_3` FOREIGN KEY (`id_curso_escolar`) REFERENCES `curso_escolar` (`id`);

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`),
  ADD CONSTRAINT `asignatura_ibfk_2` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`);

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `profesor_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
