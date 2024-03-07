
DROP DATABASE IF EXISTS TenisGrandSlamExamen ;


CREATE DATABASE IF NOT EXISTS TenisGrandSlamExamen ;


USE TenisGrandSlamExamen  ;

CREATE TABLE IF NOT EXISTS grand_slam (
    grand_slam_id INT NOT NULL  ,
    fecha_inicio DATE NOT NULL ,
    fecha_fin DATE NOT NULL
    
);



CREATE TABLE IF NOT EXISTS torneo (
    torneo_id INT not null  ,
    nombre_torneos VARCHAR(50) not null , 
    fecha_inicio DATE not NULL,
    fecha_fin DATE not NULL , 
    grand_slam_id_fk INT not null ,
    modalidad_torneo enum('individual masculino', 'individual femenino', 'dobles masculino', 'dobles femenino', 'dobles mixtos')
);

CREATE TABLE IF NOT EXISTS encuentro (
    encuentro_id int not null ,
    fecha_encuentro date not null  ,
    torneo_id_fk int not null ,
    fase_torneo enum('octavos','cuartos','semifinal','final') not null ,
    dni_arbitro_fk int not null 
) ;


CREATE Table if not EXISTS torneo_x_ciudad (
    ciudad_id_fk_pk int not null ,
    torneo_id_fk_pk int not null  
);

CREATE TABLE IF NOT EXISTS pais (
    nombre_pais VARCHAR(50) not null 
 ) ;



CREATE Table if NOT EXISTS ciudad (
    ciudad_id int not null ,
    nombre_ciudad VARCHAR(50) not null ,
    nombre_pais_fk VARCHAR(50) not null
);




CREATE TABLE IF NOT EXISTS persona (
    dni_persona int not null  ,
    primer_nombre varchar(50) not null  ,
    segundo_nombre VARCHAR(50) null ,
    primer_apellido varchar(50) not null , 
    segundo_apellido VARCHAR(50) null ,
    fecha_nacimiento DATE not null  ,
    sexo enum('mujer','hombre') not null ,
    rol enum ('entrenador','jugador','arbitro') not null
 ) ;


CREATE TABLE IF NOT EXISTS jugador_x_entrenador (
    dni_jugador_fk_pk int not null ,
    dni_entrenador_fk_pk int not null 
);


CREATE TABLE IF NOT EXISTS nacionalidad_persona (
    persona_dni_fk_pk int not null  ,
    nombre_pais_fk_pk VARCHAR(50) not null 
);




CREATE TABLE IF NOT EXISTS encuentro_x_jugador (
    encuentro_id_fk_pk int not null  ,
    dni_jugador_fk_pk int not null ,
    puntuacion int not null ,
    monto_premio float not null 
);



-- claves unicas 

ALTER TABLE ciudad ADD constraint  ciudad_nombre_pais_unique UNIQUE(nombre_ciudad) ;
ALTER TABLE jugador_x_entrenador ADD constraint jugador_x_entrenador_dni_entrenador_fk_pk_unique UNIQUE(dni_entrenador_fk_pk) ;



-- claves primarias 

ALTER TABLE grand_slam ADD CONSTRAINT grand_slam_grand_slam_id_pk PRIMARY KEY (grand_slam_id) , MODIFY grand_slam_id  INT NOT NULL AUTO_INCREMENT  ;
ALTER TABLE torneo  ADD CONSTRAINT torneo_torneo_id_pk PRIMARY KEY (torneo_id) , MODIFY torneo_id  INT NOT NULL AUTO_INCREMENT  ;
ALTER TABLE pais ADD CONSTRAINT pais_nombre_pais_pk PRIMARY KEY (nombre_pais) ;
ALTER TABLE ciudad ADD CONSTRAINT ciudad_ciudad_id_pk  PRIMARY KEY (ciudad_id) , MODIFY ciudad_id  INT NOT NULL AUTO_INCREMENT  ;
ALTER TABLE encuentro ADD CONSTRAINT encuentro_encuentro_id PRIMARY KEY (encuentro_id) , MODIFY encuentro_id  INT NOT NULL AUTO_INCREMENT  ;
ALTER TABLE torneo_x_ciudad ADD CONSTRAINT torneo_x_ciudad_id_pk_torneo_id_pk PRIMARY KEY (ciudad_id_fk_pk, torneo_id_fk_pk) ; 
ALTER TABLE nacionalidad_persona ADD CONSTRAINT nacionalidad_x_persona_id_pk_pais_id_pk PRIMARY KEY (persona_dni_fk_pk ,nombre_pais_fk_pk) ; 
ALTER TABLE persona ADD CONSTRAINT persona_dni_persona PRIMARY KEY (dni_persona) ; 
ALTER TABLE jugador_x_entrenador ADD CONSTRAINT jugador_x_entrenador_dni_jugador_dni_entrena PRIMARY KEY (dni_jugador_fk_pk , dni_entrenador_fk_pk) ;
ALTER TABLE encuentro_x_jugador ADD CONSTRAINT encuentro_x_jugador PRIMARY KEY (encuentro_id_fk_pk ,dni_jugador_fk_pk) ;


-- claves foraneas

ALTER TABLE torneo ADD CONSTRAINT torneo_grand_slam_id_fk  FOREIGN KEY(grand_slam_id_fk) REFERENCES grand_slam(grand_slam_id);
ALTER TABLE encuentro ADD CONSTRAINT encuentro_torneo_id_fk  FOREIGN KEY(torneo_id_fk) REFERENCES torneo(torneo_id);
ALTER TABLE encuentro ADD CONSTRAINT encuentro_dni_arbitro_fk  FOREIGN KEY(dni_arbitro_fk) REFERENCES persona(dni_persona);

ALTER Table torneo_x_ciudad ADD CONSTRAINT torneo_x_ciudad_ciudad_id  FOREIGN KEY(ciudad_id_fk_pk) REFERENCES ciudad(ciudad_id);
ALTER Table torneo_x_ciudad ADD CONSTRAINT torneo_x_ciudad_torneo_id  FOREIGN KEY(torneo_id_fk_pk) REFERENCES torneo(torneo_id);

ALTER Table ciudad ADD CONSTRAINT ciudad_nombre_pais_fk  FOREIGN KEY(nombre_pais_fk) REFERENCES pais(nombre_pais);

ALTER Table  nacionalidad_persona ADD CONSTRAINT nacionalidad_persona_persona_dni_fk_pk  FOREIGN KEY(persona_dni_fk_pk) REFERENCES persona(dni_persona);
ALTER Table  nacionalidad_persona ADD CONSTRAINT nacionalidad_persona_nombre_pais_fk_pk  FOREIGN KEY(nombre_pais_fk_pk) REFERENCES pais(nombre_pais);

ALTER Table encuentro_x_jugador ADD CONSTRAINT encuentro_x_jugador_encuentro_id_fk_pk  FOREIGN KEY(encuentro_id_fk_pk) REFERENCES encuentro(encuentro_id);

ALTER Table encuentro_x_jugador ADD CONSTRAINT encuentro_x_jugador_dni_jugador_fk_pk  FOREIGN KEY(dni_jugador_fk_pk) REFERENCES persona(dni_persona);


ALTER Table  jugador_x_entrenador ADD CONSTRAINT jugador_x_entrenador_dni_jugador_fk_pk FOREIGN KEY(dni_jugador_fk_pk) REFERENCES persona(dni_persona);
ALTER Table  jugador_x_entrenador ADD CONSTRAINT jugador_x_entrenador_dni_entrenador_fk_pk FOREIGN KEY(dni_entrenador_fk_pk) REFERENCES persona(dni_persona);