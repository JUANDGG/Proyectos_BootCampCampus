-- datos complejo hospitalario
INSERT INTO complejo_hospitalario (nombre) VALUES 
('Hospital A'),
('Hospital B'),
('Hospital C'),
('Hospital D'),
('Hospital E'),
('Hospital F'),
('Hospital G'),
('Hospital H'),
('Hospital I'),
('Hospital J');


-- datos edificio
INSERT INTO edificio (nombre, id_complejo) VALUES
('Edificio 1', 1),
('Edificio 2', 2),
('Edificio 3', 3),
('Edificio 4', 4),
('Edificio 5', 5),
('Edificio 6', 6),
('Edificio 7', 7),
('Edificio 8', 8),
('Edificio 9', 9),
('Edificio 10', 10);

-- datos empleado
INSERT INTO empleado (id,nombre, cargo) VALUES
(372820281,'John Doe', 'Jefe'),
(100567932,'Jane Doe', 'Enfermera'),
(120547931,'Bob Smith', 'Jefe'),
(111568931 ,'Alice Johnson', 'Enfermera'),
(150040392 , 'Michael Brown', 'Jefe'),
(250045970,'Emily Davis', 'Enfermera'),
(456001235,'David Wilson', 'Jefe'),
(253445653,'Olivia Miller', 'Enfermera'),
(895479787 ,'James Taylor', 'Jefe'),
(909496297, 'Sophia White', 'Enfermera');

-- datos piso
INSERT INTO piso (id, id_edificio, id_empleado, ubicacion) VALUES
(1, 1, 100567932, 'Planta 1'),
(2, 2, 111568931, 'Planta 2'),
(3, 3, 120547931, 'Planta 3'),
(4, 4, 150040392, 'Planta 4'),
(5, 5, 250045970, 'Planta 5'),
(6, 6, 253445653, 'Planta 6'),
(7, 7, 372820281, 'Planta 7'),
(8, 8, 456001235, 'Planta 8'),
(9, 9, 895479787, 'Planta 9'),
(10, 10, 909496297, 'Planta 10');

-- datos especialidad
INSERT INTO especialidad (nombre) VALUES
('Cardiología'),
('Neurología'),
('Oncología'),
('Pediatría'),
('Ginecología'),
('Dermatología'),
('Oftalmología'),
('Ortopedia'),
('Psiquiatría'),
('Endocrinología');

-- datos piso_especialidad
INSERT INTO piso_especialidad (estado, id_piso, id_especialidad) VALUES
('Principal', 1, 1),
('Secundario', 2, 2),
('Principal', 3, 3),
('Secundario', 4, 4),
('Principal', 5, 5),
('Secundario', 6, 6),
('Principal', 7, 7),
('Secundario', 8, 8),
('Principal', 9, 9),
('Secundario', 10, 10);

-- datos habitaciones
INSERT INTO habitacion (camas, id_piso) VALUES
(10, 1),
(8, 2),
(12, 3),
(15, 4),
(20, 5),
(18, 6),
(25, 7),
(30, 8),
(22, 9),
(10, 10);