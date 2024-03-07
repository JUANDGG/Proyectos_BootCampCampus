-- tabla contrato

INSERT INTO contrato (numero_de_contrato, fecha_inicio, fecha_fin , estado_contrato)
VALUES
(1231101, '2023-01-01', '2023-12-01', 'activo'),
(2351301, '2023-11-29', '2024-11-29','espera'),
(3041167, '2014-06-10', '2019-02-15','vencido'),
(1050202, '2009-08-05', '2012-05-10','vencido'),
(2100332, '2010-01-20', '2010-12-31','vencido'),
(3442102,  '2021-05-15', '2024-01-05','activo'),
(1012313,  '2022-01-01', '2023-12-31','activo'),
(2110143,  '2023-12-05', '2024-12-31','espera'),
(3011123,  '2023-01-01', '2023-12-25','activo'),
(1224504,  '2004-03-15', '2013-01-15','vencido'),
(2334504,  '2020-06-05', '2022-03-10','vencido'),
(3221204,  '2012-01-22', '2015-06-25','vencido'),
(3115005,  '2012-12-10', '2018-09-15','vencido'),
(5012205,  '2018-01-25', '2020-10-28','vencido'),
(3115605,  '2023-01-01', '2023-11-29','activo'),
(2023406,  '2018-07-20', '2019-01-31','vencido'),
(2112306,  '2020-01-12', '2023-11-30','vencido'),
(3556016,  '2022-01-01', '2023-12-05','vencido'),
(1123407,  '2015-04-20', '2016-12-25','vencido'),
(2345697,  '2023-12-31', '2025-12-31','espera');


-- tabla de proveedor 

INSERT INTO proveedor(nit_proveedor, nombre_proveedor, direccion, ciudad, telefono, email) VALUES
(324457789, 'compu tech', 'Calle 123 #45-67', 'Bogotá', '3001234567', 'compuTech@hotmail.com'),
(234567890, 'ars tech', 'Carrera 89 #01-23', 'Medellín', '3102345678', 'arsTech@gmail.com'),
(345678901, 'compu abi', 'Avenida 76 #34-56', 'Cali', '3203456789', 'compuAbi@outlook.com'),
(456789012, 'compu service', 'Transversal 12 #78-90', 'Barranquilla', '3304567890', 'compuService@gmail.com'),
(567890123, 'alternova', 'Diagonal 90 #56-78', 'Cartagena', '3405678901', 'alternova@hotmail.com'),
(678901234, 'ebs ethos', 'Calle 78 #90-12', 'Cúcuta', '3506789012', 'ebsEthos@outlook.com'),
(789012345, 'factor clave', 'Carrera 01 #23-45', 'Bucaramanga', '3607890123', 'factorClave@gmail.com'),
(890123456, 'fookie pc', 'Avenida 45 #67-89', 'Pereira', '3708901234', 'fookiePc@hotmail.com'),
(901234567, 'falcon master', 'Transversal 23 #45-67', 'Santa Marta', '3809012345', 'falconMaster@outlook.com'),
(123456780, 'medea interactiva', 'Diagonal 56 #78-90', 'Ibagué', '3901234567', 'medeaInteractiva@gmail.com'),
(234567801, 'pluriza', 'Calle 89 #01-23', 'Pasto', '4002345678', 'pluriza@hotmail.com'),
(345678012, 'nova intergra', 'Carrera 12 #34-56', 'Manizales', '4103456780', 'novaIntergra@outlook.com'),
(456789021, 'signos estudio', 'Avenida 34 #56-78', 'Neiva', '4204567890', 'signosEstudio@gmail.com'),
(567890210, 'virtual impact', 'Transversal 45 #67-89', 'Armenia', '4305678901', 'virtualImpact@hotmail.com'),
(678901201, 'mps', 'Diagonal 67 #89-01', 'Villavicencio', '4406789012', 'mps@outlook.com'),
(789012120, 'compucon', 'Calle 90 #12-34', 'Valledupar', '4507890121', 'compucon@gmail.com'),
(890121234, 'comware', 'Carrera 34 #56-78', 'Montería', '4608901212', 'comware@hotmail.com'),
(901212345, 'bercon', 'Avenida 56 #78-90', 'Sincelejo', '4709012123', 'bercon@outlook.com'),
(121234567, 'aparts pc', 'Transversal 78 #90-12', 'Popayán', '4801212345', 'apartsPc@gmail.com'),
(212345678, 'astro compu', 'Diagonal 01 #23-45', 'Tunja', '4902123456', 'astroCompu@hotmail.com');




-- tabla de marcas

INSERT INTO marca (id_marca, nombre_marca)
VALUES 
(1, 'Apple'),
(2, 'Dell'),
(3, 'HP'),
(4, 'Lenovo'),
(5, 'Asus'),
(6, 'Acer'),
(7, 'Microsoft'),
(8, 'Sony'),
(9, 'Toshiba'),
(10, 'Samsung');



-- tabla  modelos arregla el id del modelo 

INSERT INTO modelos (id_modelo, fk_id_marca, nombre_modelo)
VALUES 
('A1B2C3D4', 1, 'MacBook Pro 13-inch M1'),
('E5F6G7H8', 1, 'MacBook Air M1'),
('I9J0K1L2', 1, 'iMac 24-inch M1'),
('M3N4O5P6', 1, 'Mac Mini M1'),
('Q7R8S9T0', 1, 'MacBook Pro 16-inch M1 Max'),
('U1V2W3X4', 2, 'Dell XPS 13'),
('Y5Z6A7B8', 2, 'Dell Inspiron 15 3000'),
('C9D0E1F2', 2, 'Dell Latitude 7420'),
('G3H4I5J6', 2, 'Dell Precision 3560'),
('K7L8M9N0', 2, 'Dell G5 Gaming Desktop'),
('O1P2Q3R4', 3, 'HP Spectre x360'),
('S5T6U7V8', 3, 'HP Pavilion 15'),
('W9X0Y1Z2', 3, 'HP Elite Dragonfly'),
('A3B4C5D6', 3, 'HP Omen 15'),
('E7F8G9H0', 3, 'HP Z2 Mini G5 Workstation'),
('I1J2K3L4', 4, 'Lenovo ThinkPad X1 Carbon Gen 9'),
('M5N6O7P8', 4, 'Lenovo IdeaPad Slim 7i'),
('Q9R0S1T2', 4, 'Lenovo Legion 5 Pro'),
('U3V4W5X6', 4, 'Lenovo Yoga 9i'),
('Y7Z8A9B0', 4, 'Lenovo ThinkCentre M90n Nano'),
('C1D2E3F4', 5, 'Sony VAIO SX14'),
('G5H6I7J8', 5, 'Sony VAIO S13'),
('K9L0M1N2', 5, 'Sony VAIO Z Flip'),
('O3P4Q5R6', 5, 'Sony VAIO E15'),
('S7T8U9V0', 5, 'Sony VAIO C15');


-- tabla de  computador


INSERT INTO inventario (cod_inventario, fk_id_modelo, precio, stock, fk_nit_proveedor)
VALUES 
('aa1', 'A1B2C3D4', 0, 0, 324457789),
('ab2', 'E5F6G7H8', 0, 0, 234567890),
('ac3', 'O1P2Q3R4', 0, 0, 345678901),
('a44', 'Y7Z8A9B0', 0, 0, 456789012),
('a05', 'Q7R8S9T0', 0, 0, 567890123),
('tc6', 'U1V2W3X4', 0, 0, 678901234),
('op7', 'Y5Z6A7B8', 0, 0, 789012345),
('kl8', 'C1D2E3F4', 0, 0, 890123456),
('ap0', 'G3H4I5J6', 0, 0, 901234567),
('aa2', 'Q9R0S1T2', 0, 0, 123456780);

-- tabla de servicio

INSERT INTO servicio (id_servicio, nombre_servicio, descripcion) VALUES
(1, 'Análisis de aguas', 'Análisis de la calidad del agua utilizada en los procesos de extracción'),
(2, 'Estudios geológicos', 'Estudios del subsuelo para identificar posibles yacimientos de petróleo'),
(3, 'Pruebas de presión', 'Pruebas para determinar la presión en un pozo petrolero'),
(4, 'Inspección de corrosión', 'Inspección de equipos y estructuras para detectar corrosión'),
(5, 'Servicios de perforación direccional', 'Perforación direccional para maximizar la producción de un yacimiento'),
(6, 'Análisis de suelos', 'Análisis de la composición del suelo en un área de interés'),
(7, 'Servicios de cementación', 'Servicios para aislar las distintas capas de subsuelo en un pozo petrolero'),
(8, 'Tratamiento de residuos', 'Gestión y tratamiento de los residuos generados en la extracción de petróleo'),
(9, 'Análisis de gases', 'Análisis de los gases presentes en un yacimiento de petróleo'),
(10, 'Servicios de recuperación de petróleo', 'Técnicas para aumentar la cantidad de petróleo extraído de un yacimiento');


-- tabla orden de servicio

INSERT INTO orden_de_servicio (numero_de_ods, fk_numero_de_contrato, descripcion, fk_id_servicio) VALUES
('ODS2023001', 1231101, 'Análisis de agua para el contrato 1231101', 1),
('ODS2023002', 3011123, 'Estudios geológicos para el contrato 2351301', 1),
('ODS2023003', 3041167, 'Pruebas de presión para el contrato 3041167', 3),
('ODS2023004', 1050202, 'Inspección de corrosión para el contrato 1050202', 4),
('ODS2023005', 2100332, 'Servicios de perforación direccional para el contrato 2100332', 5);


--  tabla de cargo

INSERT INTO cargo (id_cargo, nombre_cargo, descripcion) VALUES
(1, 'Gerente de Operaciones Petroleras', 'Responsable de la gestión y dirección de las operaciones petroleras'),
(2, 'Ingeniero de Perforación', 'Encargado de la planificación y ejecución de la perforación de pozos'),
(3, 'Geólogo Petrolero', 'Responsable del estudio de los yacimientos petroleros'),
(4, 'Ingeniero de Reservorios', 'Encargado de la gestión de los reservorios de petróleo'),
(5, 'Técnico de Seguridad Industrial', 'Responsable de la seguridad en las operaciones petroleras'),
(6, 'Ingeniero de Producción', 'Encargado de la optimización de la producción de petróleo'),
(7, 'Analista de Datos de Producción', 'Responsable del análisis de los datos de producción'),
(8, 'Especialista en Medio Ambiente', 'Encargado de garantizar el cumplimiento de las normativas ambientales'),
(9, 'Técnico de Mantenimiento de Pozos', 'Proporciona mantenimiento a los pozos petroleros'),
(10, 'Operador de Campo', 'Responsable de las operaciones en el campo petrolero');


-- tabla de empleados
INSERT INTO empleado (dni_empleado, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, fk_id_cargo, fk_numero_de_ods, fecha_nacimiento, fk_dni_empleado, estado_empleado, telefono, email) VALUES
(12345678, 'Juan', NULL, 'Pérez', NULL, 1, 'ODS2023001', '1970-01-01', NULL, 1, '3001234567', 'juan.perez@email.com'),
(23456789, 'María', 'Fernanda', 'López', NULL, 2, 'ODS2023002', '1980-02-02', 12345678, 1, '3002345678', 'maria.lopez@email.com'),
(34567890, 'Carlos', NULL, 'Rodríguez', 'Díaz', 3, 'ODS2023001', '1990-03-03', 12345678, 0, '3003456789', 'carlos.rodriguez@email.com'),
(45678901, 'Ana', 'María', 'González', NULL, 4, 'ODS2023004', '2000-04-04', 23456789, 1, '3004567890', 'ana.gonzalez@email.com'),
(56789012, 'Luis', 'Miguel', 'Torres', NULL, 5, 'ODS2023005', '1975-05-05', 23456789, 1, '3005678901', 'luis.torres@email.com'),
(67890123, 'Sandra', NULL, 'Morales', 'Castro', 6, 'ODS2023001', '1985-06-06', 34567890, 0, '3006789012', 'sandra.morales@email.com'),
(78901234, 'Jorge', NULL, 'Gutiérrez', NULL, 7, 'ODS2023002', '1995-07-07', 34567890, 1, '3007890123', 'jorge.gutierrez@email.com'),
(89012345, 'Laura', 'Cristina', 'Vargas', NULL, 8, 'ODS2023003', '1980-08-08', 45678901, 1, '3008901234', 'laura.vargas@email.com'),
(90123456, 'Pedro', 'Jaimes', 'Rojas', 'Mendoza', 9, 'ODS2023004', '1990-09-09', 45678901, 1, '3009012345', 'pedro.rojas@email.com'),
(10234567, 'Carmen', 'Rocio', 'Reyes', NULL, 10, 'ODS2023005', '2004-10-10', 56789012, 1, '3001023456', 'carmen.reyes@email.com'),
(11234567, 'Fernando', 'Florez', 'Silva', 'Pérez', 1, 'ODS2023001', '1972-01-01', NULL, 1, '3001123456', 'fernando.silva@email.com'),
(22345678, 'Patricia', 'Isabel', 'Gómez', NULL, 2, 'ODS2023002', '1982-02-02', 11234567, 0, '3002234567', 'patricia.gomez@email.com'),
(33456789, 'Andrés', 'Uriel', 'Martínez', 'López', 3, 'ODS2023003', '1992-03-03', 11234567, 1, '3003345678', 'andres.martinez@email.com'),
(44567890, 'Cristina', 'María', 'Díaz', NULL, 4, 'ODS2023004', '2009-04-04', 22345678, 1, '3004456789', 'cristina.diaz@email.com'),
(55678901, 'Miguel', 'Luis', 'Hernández', NULL, 5, 'ODS2023005', '1977-05-05', 22345678, 1, '3005567890', 'miguel.hernandez@email.com'),
(66789012, 'Isabel', 'Franciso', 'Castro', 'Morales', 6, 'ODS2023001', '1987-06-06', 33456789, 1, '3006678901', 'isabel.castro@email.com'),
(77890123, 'Luis', 'Miguel', 'Ramírez', NULL, 7, 'ODS2023002', '1997-07-07', 33456789, 0, '3007789012', 'luis.ramirez@email.com'),
(88901234, 'María', 'Cristina', 'Ortiz', NULL, 8, 'ODS2023003', '1982-08-08', 44567890, 1, '3008890123', 'maria.ortiz@email.com'),
(99012345, 'José', NULL, 'Paredes', 'Mendoza', 9, 'ODS2023004', '1992-09-09', 44567890, 1, '3009901234', 'jose.paredes@email.com'),
(10123456, 'Luz', NULL, 'Guerrero', NULL, 10, 'ODS2023005', '2002-10-10', 55678901, 1, '3001012345', 'luz.guerrero@email.com');


-- procesadores


INSERT INTO procesador (id_procesador, modelo_procesador) VALUES 
(1, 'Intel Core i7-9700K'), 
(2, 'AMD Ryzen 7 3700X'), 
(3, 'Intel Core i9-9900K'), 
(4, 'AMD Ryzen 5 3600'), 
(5, 'Intel Core i5-9400F'),
(6, 'Intel Core i3-8100'), 
(7, 'AMD Ryzen 3 3200G'), 
(8, 'Intel Core i7-10700K'), 
(9, 'AMD Ryzen 9 3900X'), 
(10, 'Intel Core i9-10900K');


-- computador


INSERT INTO computador (serial_computador, fk_cod_inventario, fecha_adquisicion, estado_equipo, observaciones_equipo, color, fk_id_procesador, cantidad_memoria_ram, precio_equipo) VALUES 
('C1A2B3D4E5F6G7H8I', 'aa1', '2023-11-25', 'bueno', 'Funciona bien', 'Negro', 1, 16, 1000000), 
('J2K3L4M5N6O7P8Q9R', 'aa1', '2023-11-24', 'regular', 'Necesita mantenimiento', 'Blanco', 2, 8, 1800000), 
('S3T4U5V6W7X8Y9Z0A', 'aa1', '2023-11-23', 'malo', 'Necesita reparación', 'Plateado', 3, 32, 2600000), 
('B4C5D6E7F8G9H0I1J', 'a44', '2023-11-22', 'bueno', 'En excelente estado', 'Dorado', 4, 16, 1200000), 
('K5L6M7N8O9P0Q1R2S', 'a05', '2023-11-21', 'regular', 'Funciona, pero lento', 'Rojo', 5, 8, 1700000), 
('T6U7V8W9X0Y1Z2A3B', 'tc6', '2023-11-20', 'malo', 'No enciende', 'Negro', 6, 4, 1500000), 
('C7D8E9F0G1H2I3J4K', 'op7', '2023-11-19', 'bueno', 'Funciona perfectamente', 'Blanco', 7, 16, 1100000), 
('L8M9N0O1P2Q3R4S5T', 'kl8', '2023-11-18', 'regular', 'Problemas con el disco duro', 'Plateado', 8, 8, 1750000), 
('U9V0W1X2Y3Z4A5B6C', 'ap0', '2023-11-17', 'malo', 'Problemas con la pantalla', 'Dorado', 9, 32, 1650000), 
('D0E1F2G3H4I5J6K7L', 'aa2', '2023-11-16', 'bueno', 'En buen estado', 'Rojo', 10, 16, 900),
('M1N2O3P4Q5R6S7T8U', 'aa1', '2023-11-15', 'regular', 'Problemas con la batería', 'Negro', 1, 8, 18500000), 
('V2W3X4Y5Z6A7B8C9D', 'ab2', '2023-11-14', 'malo', 'No carga', 'Blanco', 2, 4, 1550000), 
('E3F4G5H6I7J8K9L0M', 'ac3', '2023-11-13', 'bueno', 'Funciona bien', 'Plateado', 3, 16, 1950000), 
('N4O5P6Q7R8S9T0U1V', 'a44', '2023-11-12', 'regular', 'Necesita actualización de software', 'Dorado', 4, 8, 1700000), 
('W5X6Y7Z8A9B0C1D2E', 'a05', '2023-11-11', 'malo', 'Problemas con el teclado', 'Rojo', 5, 32, 1600000), 
('F6G7H8I9J0K1L2M3N', 'tc6', '2023-11-10', 'bueno', 'En excelente estado', 'Negro', 6, 16, 1300000), 
('O7P8Q9R0S1T2U3V4W', 'op7', '2023-11-09', 'regular', 'Funciona, pero lento', 'Blanco', 7, 8, 1800000), 
('X8Y9Z0A1B2C3D4E5F', 'kl8', '2023-11-08', 'malo', 'No enciende', 'Plateado', 8, 4, 1500000), 
('G9H0I1J2K3L4M5N6O', 'ap0', '2023-11-07', 'bueno', 'Funciona perfectamente', 'Dorado', 9, 16, 1200000), 
('P0Q1R2S3T4U5V6W7X', 'aa2', '2023-11-06', 'regular', 'Problemas con el disco duro', 'Rojo', 10, 8, 1750000);


-- acta


INSERT INTO acta (numero_acta, fecha_entrega, fecha_recibido, fk_serial_computador, fk_dni_empleado, estado_acta) VALUES
(1, '2014-06-10', '2019-02-15', 'C1A2B3D4E5F6G7H8I', 33456789, 'recibo'),
(2, '2014-06-10', '2019-02-15', 'S3T4U5V6W7X8Y9Z0A', 88901234, 'recibo'),
(3, '2014-06-10', '2019-02-15', 'B4C5D6E7F8G9H0I1J', 89012345, 'recibo'),
(4, '2009-08-05', '2012-05-10', 'K5L6M7N8O9P0Q1R2S', 44567890, 'recibo'),
(5, '2023-01-01', '2023-01-01', 'T6U7V8W9X0Y1Z2A3B', 11234567, 'entrega'),
(6, '2023-01-01', '2023-12-01', 'C7D8E9F0G1H2I3J4K', 12345678, 'entrega'),
(7, '2023-01-01', '2023-01-01', 'L8M9N0O1P2Q3R4S5T', 66789012, 'entrega'),
(8, '2023-01-01', '2023-01-01', 'U9V0W1X2Y3Z4A5B6C', 34567890, 'entrega');


-- observaciones acta
INSERT INTO observaciones_acta  VALUES
(1, 'el computador llego en malas condiciones posble descuento', 'malo'),
(2, 'el computador llego tal y como se entrego muy bien ', 'bueno'),
(3, 'el computado presenta fisuras en el area del display posible descuento para le ingeniero', 'malo'),
(4, 'el computador llego en perfectas condiciones', 'bueno');
