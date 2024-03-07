

DROP DATABASE IF EXISTS tip_control_equipos ;

CREATE DATABASE IF NOT EXISTS tip_control_equipos;

USE tip_control_equipos ;

CREATE TABLE  IF NOT EXISTS empleado(
    dni_empleado INT NOT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50) NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50) NULL,
    fk_id_cargo INT NOT NULL,
    fk_numero_de_ods VARCHAR(80)  NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fk_dni_empleado INT  NULL,
    estado_empleado TINYINT(1) NOT NULL ,
    telefono VARCHAR(50) NOT NULL,
    email VARCHAR(50) NULL
);



CREATE TABLE IF NOT EXISTS  contrato(
    numero_de_contrato INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado_contrato ENUM('activo','vencido','espera') NOT NULL
);

CREATE TABLE  IF NOT EXISTS proveedor(
    nit_proveedor INT NOT NULL,
    nombre_proveedor VARCHAR(50) NOT NULL,
    direccion VARCHAR(90) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    telefono VARCHAR(80) NOT NULL,
    email VARCHAR(80) NULL
);




CREATE TABLE  IF NOT EXISTS  modelos(
    id_modelo VARCHAR(20) NOT NULL,
    fk_id_marca INT NOT NULL,
    nombre_modelo VARCHAR(50) NOT NULL
);





CREATE TABLE  IF NOT EXISTS  inventario(
    cod_inventario varchar(4) NOT NULL,
    fk_id_modelo VARCHAR(20) NOT NULL,
    precio FLOAT NOT NULL,
    stock INT NOT NULL,
    fk_nit_proveedor INT NOT NULL
);


CREATE TABLE  IF NOT EXISTS  servicio(
    id_servicio INT NOT NULL ,
    nombre_servicio VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NULL
);


CREATE TABLE  IF NOT EXISTS  acta(
    numero_acta INT NOT NULL,
    fecha_entrega DATE NOT NULL,
    fecha_recibido DATE NOT NULL,
    fk_serial_computador VARCHAR(150) NOT NULL,
    fk_dni_empleado INT NOT NULL,
    estado_acta ENUM('entrega','recibo') NOT NULL
);

CREATE TABLE  IF NOT EXISTS  marca(
    id_marca INT NOT NULL ,
    nombre_marca VARCHAR(50) NOT NULL
);

CREATE TABLE  IF NOT EXISTS  observaciones_acta(
    fk_pk_numero_acta INT NOT NULL,
    observacion VARCHAR(100) NOT NULL,
    visto ENUM('bueno','malo') NOT NULL
);

CREATE TABLE  IF NOT EXISTS  procesador(
    id_procesador  INT  NOT NULL ,
    modelo_procesador VARCHAR(50) NOT NULL
);

CREATE TABLE  IF NOT EXISTS  orden_de_servicio(
    numero_de_ods VARCHAR(80) NOT NULL,
    fk_numero_de_contrato INT NOT NULL,
    descripcion VARCHAR(100) NULL,
    fk_id_servicio INT NOT NULL
);

CREATE TABLE  IF NOT EXISTS  cargo(
    id_cargo INT NOT NULL ,
    nombre_cargo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NULL
);

CREATE TABLE  IF NOT EXISTS  computador(
    serial_computador VARCHAR(150) NOT NULL,
    fk_cod_inventario VARCHAR(4) NOT NULL,
    fecha_adquisicion DATE NOT NULL,
    estado_equipo ENUM('bueno','regular','malo') NOT NULL,
    observaciones_equipo VARCHAR(100) NULL,
    color VARCHAR(10) NOT NULL,
    fk_id_procesador INT NOT NULL,
    cantidad_memoria_ram INT NOT NULL,
    precio_equipo FLOAT NOT NULL
);



-- llaves unicas de la base de datos

ALTER TABLE
    proveedor ADD  CONSTRAINT proveedor_NOMBRE_unique  UNIQUE(nombre_proveedor);

ALTER TABLE inventario ADD CONSTRAINT  inventario_fk_modelo_unique  UNIQUE(fk_id_modelo);

ALTER TABLE
    servicio ADD CONSTRAINT  servicio_nombre_servicio_unique UNIQUE(nombre_servicio);

ALTER TABLE
    modelos ADD CONSTRAINT  modelos_nombre_modelo_unique UNIQUE(nombre_modelo);


ALTER TABLE
    marca ADD CONSTRAINT marca_nombre_marca_unique UNIQUE(nombre_marca);

ALTER TABLE procesador ADD CONSTRAINT  procesador_modelo_procesador_unique UNIQUE(modelo_procesador);

ALTER TABLE cargo ADD CONSTRAINT  cargo_nombre_cargo_unique UNIQUE(nombre_cargo);



-- llaves primarias de la base de datos



ALTER TABLE cargo ADD CONSTRAINT cargo_pk_id_cargo PRIMARY KEY (id_cargo) , MODIFY id_cargo INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE servicio ADD CONSTRAINT servicion_pk_id_servicio PRIMARY KEY (id_servicio) ,  MODIFY id_servicio INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE procesador ADD CONSTRAINT procesador_pk_id_procesador PRIMARY KEY (id_procesador) , MODIFY id_procesador INT  NOT NULL AUTO_INCREMENT ;


ALTER TABLE marca ADD CONSTRAINT marca_pk_id_marca PRIMARY KEY (id_marca) , MODIFY id_marca INT NOT NULL AUTO_INCREMENT;

ALTER TABLE
computador ADD CONSTRAINT computador_pk_serial_computador  PRIMARY KEY(serial_computador);

ALTER TABLE
    orden_de_servicio ADD CONSTRAINT orden_de_servicio_pk_numero_de_ods  PRIMARY KEY(numero_de_ods);

ALTER TABLE
    observaciones_acta ADD CONSTRAINT observaciones_acta_fk_pk_numero_acta   PRIMARY KEY(fk_pk_numero_acta);

ALTER TABLE
    acta ADD CONSTRAINT acta_pk_numero_acta PRIMARY KEY(numero_acta) , MODIFY numero_acta INT NOT NULL AUTO_INCREMENT;


ALTER TABLE
    modelos ADD CONSTRAINT  modelo_pk_id_modelo PRIMARY KEY(id_modelo);

ALTER TABLE
    inventario ADD  CONSTRAINT inventario_pk_cod_inventario PRIMARY KEY(cod_inventario);


ALTER TABLE
    proveedor ADD  CONSTRAINT proveedor_pk_nit_proveedor  PRIMARY KEY(nit_proveedor);


ALTER TABLE
    contrato ADD  CONSTRAINT contrato_numero_de_contrato PRIMARY KEY(numero_de_contrato);

ALTER TABLE
    empleado ADD CONSTRAINT empleado PRIMARY KEY(dni_empleado);


-- llaves foraneas de la base de datos
ALTER TABLE
    empleado ADD CONSTRAINT empleado_fk_dni_empleado_foreign FOREIGN KEY(fk_dni_empleado) REFERENCES empleado(dni_empleado);
ALTER TABLE
    orden_de_servicio ADD CONSTRAINT orden_de_servicio_fk_numero_de_contrato_foreign FOREIGN KEY(fk_numero_de_contrato) REFERENCES contrato(numero_de_contrato);
ALTER TABLE
    modelos ADD CONSTRAINT modelos_fk_id_marca_foreign FOREIGN KEY(fk_id_marca) REFERENCES marca(id_marca);
ALTER TABLE
    computador ADD CONSTRAINT computador_fk_cod_inventario_foreign FOREIGN KEY(fk_cod_inventario) REFERENCES inventario(cod_inventario);
ALTER TABLE
    empleado ADD CONSTRAINT empleado_fk_numero_de_ods_foreign FOREIGN KEY(fk_numero_de_ods) REFERENCES orden_de_servicio(numero_de_ods);
ALTER TABLE
    empleado ADD CONSTRAINT empleado_fk_id_cargo_foreign FOREIGN KEY(fk_id_cargo) REFERENCES cargo(id_cargo);
ALTER TABLE
    observaciones_acta ADD CONSTRAINT observaciones_fk_pk_numero_acta FOREIGN KEY(fk_pk_numero_acta) REFERENCES acta(numero_acta);
ALTER TABLE
    orden_de_servicio ADD CONSTRAINT orden_de_servicio_fk_id_servicio_foreign FOREIGN KEY(fk_id_servicio) REFERENCES servicio(id_servicio);
ALTER TABLE
    computador ADD CONSTRAINT computador_fk_id_procesador_foreign FOREIGN KEY(fk_id_procesador) REFERENCES procesador(id_procesador);
ALTER TABLE
    inventario ADD CONSTRAINT inventario_fk_id_modelo_foreign FOREIGN KEY(fk_id_modelo) REFERENCES modelos(id_modelo);


ALTER TABLE
    acta ADD CONSTRAINT acta_fk_dni_empleado_foreign FOREIGN KEY(fk_dni_empleado) REFERENCES empleado(dni_empleado);
ALTER TABLE
    acta ADD CONSTRAINT acta_fk_serial_computador_foreign FOREIGN KEY(fk_serial_computador) REFERENCES computador(serial_computador);
ALTER TABLE
    inventario ADD CONSTRAINT inventario_fk_nit_proveedor_foreign FOREIGN KEY(fk_nit_proveedor) REFERENCES proveedor(nit_proveedor);
