-- tabla grant slam

use TenisGrandSlamExamen ;

INSERT INTO grand_slam (fecha_inicio ,fecha_fin)
VALUES
('2023-01-01', '2023-12-31')



-- tabla torneo ADD

INSERT INTO torneo (nombre_torneos ,fecha_inicio ,fecha_fin ,grand_slam_id_fk ,modalidad_torneo)
VALUES
('torneo vuelta a alemania' ,'2023-04-30', '2023-08-30' ,1 ,'individual masculino'),
('torneo vuelta asia' ,'2023-09-11', '2023-10-11',1 ,'individual femenino'),
('torneo a estados unidos' ,'2023-12-05', '2024-01-05',1 ,'dobles masculino'),
('torneo vuelta a australia' ,'2024-05-01', '2024-06-01',1,'dobles femenino' )

-- tabla persona
INSERT INTO persona (
    dni_persona,
    primer_nombre,
    segundo_nombre ,
    primer_apellido,
    segundo_apellido ,
    fecha_nacimiento ,
    sexo ,
    rol 
)
VALUES
(12345678, 'Juan', NULL, 'Pérez', NULL, '1970-01-01', 'hombre' ,'arbitro'),
(23456789, 'María', 'Fernanda', 'López', NULL, '1980-02-02', 'mujer' ,'arbitro'),
(34567890, 'Carlos', NULL, 'Rodríguez', 'Díaz', '1990-03-03', 'hombre' ,'arbitro'),
(45678901, 'Ana', 'María', 'González', NULL,  '2000-04-04' , 'mujer' ,'arbitro' ),
(56789012, 'Luis', 'Miguel', 'Torres', NULL,  '1975-05-05',  'hombre' ,'jugador' ),
(67890123, 'Sandra', NULL, 'Morales', 'Castro',  '1985-06-06', 'mujer' ,'entrenador' ),
(78901234, 'Jorge', NULL, 'Gutiérrez', NULL,'1995-07-07',    'hombre' , 'jugador'  ),
(89012345, 'Laura', 'Cristina', 'Vargas', NULL,'1980-08-08', 'mujer' , 'entrenador'  ),
(10123456, 'Luz', 'guerrero', 'Vargas', NULL,'1980-08-08', 'mujer' , 'jugador'  ),
(90123456, 'Pedro', 'Jaimes', 'Rojas', 'Mendoza', '1990-09-09', 'hombre'  , 'entrenador'  ),
(99012345, 'rafael', 'villgram', 'Rojas', 'Mendoza', '1990-09-09', 'hombre'  , 'entrenador'  ),
(10234567, 'Carmen', 'Rocio', 'Reyes', NULL, '2004-10-10',  'mujer' , 'jugador'   ),
(88901234, 'maria', 'cristina', 'durango', NULL, '2004-10-10',  'mujer' , 'entrenador'   ),
(84523456, 'teresa', 'calcuta', 'Vargas', NULL,'1980-08-08', 'mujer' , 'jugador'  )



-- tabla encuentro  

INSERT INTO encuentro (fecha_encuentro ,torneo_id_fk , fase_torneo ,dni_arbitro_fk)
VALUES
('2023-06-15',1,'octavos' ,12345678),
('2023-09-15',2,'cuartos' ,23456789),
('2023-12-15',3,'semifinal' ,34567890),
('2023-05-15',4,'final' ,45678901)

-- tabla torneo_x_ciudad

INSERT INTO torneo_x_ciudad (ciudad_id_fk_pk ,torneo_id_fk_pk)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4)


-- tabla pais  

INSERT INTO pais (nombre_pais)
VALUES
('alemania'),
('china'),
('estados unidos'),
('australia'),
('españa'),
('nueva zelanda') ,
('irlanda') ,
('francia')




-- tabla ciudad 

INSERT INTO ciudad (nombre_ciudad,nombre_pais_fk)
VALUES
('berlin', 'alemania'),
('Honk kong', 'china'),
('new york', 'estados unidos'),
('zitney', 'australia'),
('madrid', 'españa'),
('queestown', 'nueva zelanda'),
('dublin', 'irlanda'),
('paris', 'francia')









-- tabla jugador_x_entrenador 

INSERT INTO jugador_x_entrenador (
    dni_jugador_fk_pk,
    dni_entrenador_fk_pk
)
VALUES
(56789012, 67890123),
(78901234,89012345 ),
(10123456, 90123456) ,
(10123456, 99012345) ,
(84523456, 88901234)




-- tabla  nacionalidad_persona

INSERT INTO nacionalidad_persona (
    persona_dni_fk_pk,
    nombre_pais_fk_pk
)
VALUES
(56789012,'alemania'),
(78901234,'china'),
(10123456,'estados unidos'),
(10234567,'australia'),
(67890123,'españa'),
(89012345,'nueva zelanda') ,
(90123456,'irlanda') ,
(88901234,'francia') ,
(84523456, 'españa')


--  tabla encuentro_x_jugador
INSERT INTO encuentro_x_jugador (
    encuentro_id_fk_pk,
    dni_jugador_fk_pk ,
    puntuacion ,
    monto_premio
)
VALUES
(17,78901234,250,2500),
(17,56789012,500,4500 ),
(18,10123456,233,8000),
(18,84523456,250,10000)
