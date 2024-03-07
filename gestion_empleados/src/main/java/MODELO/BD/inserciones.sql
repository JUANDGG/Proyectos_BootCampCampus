use gempleado ;

-- inserciones tabla cargo

insert into cargo  (nombre_carg,salario) values
("Desarrollador de software", 1500000),
("Recepcionista", 2344343),
("Gerente de ventas", 2500000),
("Contador", 2000000),
("Secretaria", 1800000),
("Operario", 1600000),
("Cajero", 1400000),
("Vendedor", 1200000),
("Auxiliar de limpieza", 1000000);

-- INSERCIONES TABLA EMPLEADO

INSERT INTO empleado  (nombre_emp,id_cargo_fk) values
("juan david guiza garcia",1),
("roberto gomez bolanos",2),
("julian fabian alarcazar barreto",3) ;
