CREATE DATABASE IF NOT EXISTS gempleado ;

USE gempleado ;
CREATE TABLE cargo (
   id_carg int not null,
   nombre_carg varchar(60) not null ,
   salario FLOAT not null
);

CREATE TABLE empleado
(
    id_emp int not null,
    nombre_emp varchar(60) not null,
    id_cargo_fk int not null
);


-- LLAVES UNICAS

ALTER TABLE CARGO add constraint gempleado_cargo_nombre_carg_unique unique (nombre_carg) ;

-- LLAVES PRIMARIAS

ALTER TABLE empleado add constraint gempleado_empleado_nombre_emp_primary primary key (id_emp) ,MODIFY id_emp int auto_increment;
ALTER TABLE cargo add constraint gempleado_cargo_nombre_carg_primary primary key (id_carg) ,MODIFY id_carg int auto_increment;

-- LLAVES FORANEAS

ALTER TABLE empleado add constraint gempleado_empleado_id_cargo_fk_foreing foreign key (id_cargo_fk) REFERENCES  cargo (id_carg);