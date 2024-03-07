-- Active: 1699024281602@@192.168.110.170@3306@olimpiadaEvaluacion
CREATE TABLE `equipamiento_evento`(
    `equipamiento_evento_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre_equipamiento` VARCHAR(50) NOT NULL,
    `descripcion` VARCHAR(155) NULL
);
CREATE TABLE `Deportes`(
    `deportes_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre_deporte` VARCHAR(50) NOT NULL
);
ALTER TABLE
    `Deportes` ADD UNIQUE `deportes_nombre_deporte_unique`(`nombre_deporte`);
CREATE TABLE `matenimiento`(
    `mantenimiento_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre_mantenimiento` VARCHAR(50) NOT NULL
);
ALTER TABLE
    `matenimiento` ADD UNIQUE `matenimiento_nombre_mantenimiento_unique`(`nombre_mantenimiento`);
CREATE TABLE `complejo_x_evento`(
    `fk_pk_complejo_id` INT NOT NULL,
    `fk_pk_evento_id` INT NOT NULL
);
ALTER TABLE
    `complejo_x_evento` ADD PRIMARY KEY(`fk_pk_complejo_id`,`fk_pk_evento_id`);

CREATE TABLE `deportes_x_complejo`(
    `fk_pk_complejo_id` INT NOT NULL,
    `fk_pk_deportes_id` INT NOT NULL
);
ALTER TABLE
    `deportes_x_complejo` ADD PRIMARY KEY(`fk_pk_complejo_id`,`fk_pk_deportes_id`);

CREATE TABLE `mantenimiento_x_complejo`(
    `fk_pk_ mantenimiento_id` INT NOT NULL,
    `fk_pk_equipamiento_mantenimiento_id` INT NOT NULL,
    `fk_pk_complejo_id` INT NOT NULL,
    `fk_pk_persona_dni` INT NOT NULL
);
ALTER TABLE
    `mantenimiento_x_complejo` ADD PRIMARY KEY(`fk_pk_ mantenimiento_id`,`fk_pk_equipamiento_mantenimiento_id`,`fk_pk_complejo_id`,`fk_pk_persona_dni`);



CREATE TABLE `comisario_x_evento`(
    `comisario_x_evento_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fk_persona_id` INT NOT NULL,
    `fk_evento_id` INT NOT NULL,
    `rol_comisario` ENUM('') NOT NULL
);
CREATE TABLE `Persona`(
    `persona_dni` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `primer_nombre` VARCHAR(50) NOT NULL,
    `segundo_nombre` VARCHAR(50) NULL,
    `primer_apellido` VARCHAR(50) NOT NULL,
    `segundo_apellido` VARCHAR(50) NULL
);
CREATE TABLE `equipamiento_mantenimiento`(
    `equipamiento_mantenimiento_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre_equipamiento` VARCHAR(50) NOT NULL,
    `descripcion_` VARCHAR(155) NULL
);
CREATE TABLE `personas_a_cargo_evento`(
    `personas_a_cargo_evento_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fk_persona_dni` INT NOT NULL,
    `fk_evento_id` INT NOT NULL
);
CREATE TABLE `equipamiento_x_evento`(
    `fk_pk_equipamiento_eventos_id` INT NOT NULL,
    `fk_pk_evento_id` INT NOT NULL
);
ALTER TABLE
    `equipamiento_x_evento` ADD PRIMARY KEY(`fk_pk_equipamiento_eventos_id`,`fk_pk_evento_id`);

CREATE TABLE `sedes`(
    `sede_nit` INT NOT NULL,
    `nombre_sede` VARCHAR(50) NOT NULL,
    `numero_complejos` INT NOT NULL
);
ALTER TABLE
    `sedes` ADD PRIMARY KEY(`sede_nit`);
CREATE TABLE `complejo`(
    `complejo_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre_complejo` VARCHAR(50) NOT NULL,
    `localizacion` VARCHAR(50) NOT NULL,
    `area_total` DOUBLE(8, 2) NOT NULL,
    `fk_nit_sede` INT NOT NULL,
    `fk_tipo_complejo_id` INT NOT NULL
);
CREATE TABLE `Evento`(
    `evento_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre_evento` VARCHAR(50) NOT NULL,
    `cantidad_de_personas` INT NOT NULL,
    `fecha_inicio` DATE NOT NULL,
    `fecha_fin` DATE NOT NULL
);
CREATE TABLE `Tipo_complejo`(
    `tipo_complejo_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre_tipo` VARCHAR(50) NOT NULL
);
ALTER TABLE
    `complejo` ADD CONSTRAINT `complejo_complejo_id_foreign` FOREIGN KEY(`complejo_id`) REFERENCES `complejo_x_evento`(`fk_pk_complejo_id`);
ALTER TABLE
    `comisario_x_evento` ADD CONSTRAINT `comisario_x_evento_fk_persona_id_foreign` FOREIGN KEY(`fk_persona_id`) REFERENCES `Persona`(`persona_dni`);
ALTER TABLE
    `complejo` ADD CONSTRAINT `complejo_fk_nit_sede_foreign` FOREIGN KEY(`fk_nit_sede`) REFERENCES `sedes`(`sede_nit`);
ALTER TABLE
    `Evento` ADD CONSTRAINT `evento_evento_id_foreign` FOREIGN KEY(`evento_id`) REFERENCES `complejo_x_evento`(`fk_pk_evento_id`);
ALTER TABLE
    `complejo` ADD CONSTRAINT `complejo_fk_tipo_complejo_id_foreign` FOREIGN KEY(`fk_tipo_complejo_id`) REFERENCES `Tipo_complejo`(`tipo_complejo_id`);
ALTER TABLE
    `Persona` ADD CONSTRAINT `persona_persona_dni_foreign` FOREIGN KEY(`persona_dni`) REFERENCES `mantenimiento_x_complejo`(`fk_pk_persona_dni`);
ALTER TABLE
    `personas_a_cargo_evento` ADD CONSTRAINT `personas_a_cargo_evento_fk_persona_dni_foreign` FOREIGN KEY(`fk_persona_dni`) REFERENCES `Persona`(`persona_dni`);
ALTER TABLE
    `comisario_x_evento` ADD CONSTRAINT `comisario_x_evento_fk_evento_id_foreign` FOREIGN KEY(`fk_evento_id`) REFERENCES `Evento`(`evento_id`);
ALTER TABLE
    `Deportes` ADD CONSTRAINT `deportes_deportes_id_foreign` FOREIGN KEY(`deportes_id`) REFERENCES `deportes_x_complejo`(`fk_pk_deportes_id`);
ALTER TABLE
    `personas_a_cargo_evento` ADD CONSTRAINT `personas_a_cargo_evento_fk_evento_id_foreign` FOREIGN KEY(`fk_evento_id`) REFERENCES `Evento`(`evento_id`);
ALTER TABLE
    `complejo` ADD CONSTRAINT `complejo_complejo_id_foreign` FOREIGN KEY(`complejo_id`) REFERENCES `deportes_x_complejo`(`fk_pk_complejo_id`);
ALTER TABLE
    `mantenimiento_x_complejo` ADD CONSTRAINT `mantenimiento_x_complejo_fk_pk_ mantenimiento_id_foreign` FOREIGN KEY(`fk_pk_ mantenimiento_id`) REFERENCES `matenimiento`(`mantenimiento_id`);
ALTER TABLE
    `mantenimiento_x_complejo` ADD CONSTRAINT `mantenimiento_x_complejo_fk_pk_complejo_id_foreign` FOREIGN KEY(`fk_pk_complejo_id`) REFERENCES `complejo`(`complejo_id`);
ALTER TABLE
    `mantenimiento_x_complejo` ADD CONSTRAINT `mantenimiento_x_complejo_fk_pk_equipamiento_mantenimiento_id_foreign` FOREIGN KEY(
        `fk_pk_equipamiento_mantenimiento_id`
    ) REFERENCES `equipamiento_mantenimiento`(`equipamiento_mantenimiento_id`);
ALTER TABLE
    `equipamiento_x_evento` ADD CONSTRAINT `equipamiento_x_evento_fk_pk_evento_id_foreign` FOREIGN KEY(`fk_pk_evento_id`) REFERENCES `Evento`(`evento_id`);
ALTER TABLE
    `equipamiento_x_evento` ADD CONSTRAINT `equipamiento_x_evento_fk_pk_equipamiento_eventos_id_foreign` FOREIGN KEY(`fk_pk_equipamiento_eventos_id`) REFERENCES `equipamiento_evento`(`equipamiento_evento_id`);