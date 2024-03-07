CREATE DATABASE hospital;
USE hospital;





-- tablas con bug arreglado


CREATE TABLE edificio(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    id_complejo INT NOT NULL,
    CONSTRAINT PK_id PRIMARY KEY (id)
);

CREATE TABLE piso(
    id INT NOT NULL ,
    id_edificio INT NOT NULL,
    id_empleado INT NOT NULL,
    ubicacion CHAR(255) NOT NULL,
    CONSTRAINT PK_id PRIMARY KEY (id)
);

CREATE TABLE empleado(
    id INT  NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    cargo ENUM('Jefe','Enfermera') NOT NULL,
    CONSTRAINT PK_id PRIMARY KEY empleado(id)
);

CREATE TABLE complejo_hospitalario(
    id INT  NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    CONSTRAINT PK_id PRIMARY KEY complejo_hospitalario(id)
);
CREATE TABLE especialidad(
    id INT  NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    CONSTRAINT PK_id PRIMARY KEY especialidad(id)
);

CREATE TABLE piso_especialidad(
    estado ENUM('Principal', 'Secundario') NOT NULL,
    id_piso INT NOT NULL,
    id_especialidad INT NOT NULL,
    CONSTRAINT UC_id_piso UNIQUE(id_piso),
    CONSTRAINT UC_id_especialidad UNIQUE(id_especialidad)
);

CREATE TABLE habitacion(
    id INT  NOT NULL AUTO_INCREMENT,
    camas INT NOT NULL,
    id_piso INT NOT NULL,
    CONSTRAINT PK_id  PRIMARY KEY habitacion(id)
);





-- claves foraneas
ALTER TABLE piso_especialidad ADD CONSTRAINT FK_piso_especialidad_x_piso_id FOREIGN KEY(id_piso) REFERENCES piso(id);
ALTER TABLE edificio ADD CONSTRAINT FK_complejo_hospitalario_id FOREIGN KEY(id_complejo) REFERENCES complejo_hospitalario(id);
ALTER TABLE habitacion ADD CONSTRAINT FK_habitacion_x_piso_id FOREIGN KEY(id_piso) REFERENCES piso(id);
ALTER TABLE piso ADD CONSTRAINT FK_edificio_id FOREIGN KEY(id_edificio) REFERENCES edificio(id);
ALTER TABLE piso ADD CONSTRAINT FK_empleado_id FOREIGN KEY(id_empleado) REFERENCES empleado(id);
ALTER TABLE piso_especialidad ADD CONSTRAINT FK_especialidad_id FOREIGN KEY(id_especialidad) REFERENCES especialidad(id);