
# Hospital modulo mysql

## Objectivo del repositorio 


el principal objectivo del repositorio es la creacion de 2 bloques de queris las cuales se dividen entre consultas simples y por procedimientos de almacenado


### como clonal el repositorio

```
git clone https://github.com/JUANDGG/hospital.git
```

## Consultas simples

# Obtener el nombre del empleado que trabaja en el piso con id 3.

```sql
select em.nombre from empleado em JOIN piso ps on em.id = ps.id_empleado WHERE ps.id =3;
```

# Mostrar el nombre y la especialidad de los pisos principales. 
```sql
SELECT esp.nombre FROM piso_especialidad pe JOIN piso ps on pe.id_piso = ps.id JOIN especialidad esp on pe.id_especialidad = esp.id WHERE pe.estado = 'principal'; 
```

# Obtener el nombre del complejo hospitalario al que pertenece el edificio con id 5.

```sql
SELECT ch.nombre FROM edificio ed JOIN complejo_hospitalario ch on ed.id_complejo = ch.id WHERE ed.id =5
```

# Mostrar el nombre y la cantidad de camas de las habitaciones en el piso con id 8.
```sql
select CONCAT('habitacion',' ',hb.id) as nombre_habitacion , sum(hb.camas) as total_camas from habitacion hb JOIN piso ps on hb.id_piso = ps.id 
WHERE ps.id=8
GROUP by CONCAT('habitacion',' ',hb.id);
```

# Obtener el nombre del empleado que trabaja en el edificio con id 6.

```sql
SELECT 
em.nombre as nombre_empleado 
from piso ps
JOIN empleado em on  ps.id_empleado = em.id
JOIN edificio ed on ps.id_edificio = ed.id
WHERE ed.id =6;


```

# Mostrar el nombre de las especialidades en el piso principal del edificio con id 3.
```sql
SELECT 
es.nombre as nombre_especialidad

FROM piso_especialidad pe
JOIN piso ps on pe.id_piso = ps.id
JOIN edificio ed on ps.id = ed.id
JOIN especialidad es on pe.id_especialidad = es.id

WHERE pe.estado = 'principal' and ed.id =3;
```

# Obtener el nombre y el cargo de los empleados que trabajan en el edificio con id 7.
```sql
SELECT
emp.nombre as nombre_empleado ,
emp.cargo as cargo_empleado 
from empleado emp
JOIN piso ps on emp.id = ps.id_empleado 
JOIN edificio ed on ps.id_edificio = ed.id
WHERE ed.id =7
```
# Mostrar el nombre y la ubicaciÃ³n de los pisos con mÃ¡s de 15 camas.
```sql
select 
CONCAT('piso',' ',ps.id) as nombre_piso  ,
ps.ubicacion as ubicacion_piso 
FROM habitacion hb 
JOIN piso ps on hb.id_piso = ps.id 
WHERE hb.camas >15 ;
```
# Obtener el nombre del complejo hospitalario que tiene el mayor numero de edificios.

```sql
SELECT 
ch.nombre as nombre_complejo ,
COUNT(ed.id) as numero_edificios
FROM complejo_hospitalario  ch
JOIN edificio ed  on ch.id = ed.id_complejo 
GROUP by  ch.id 
HAVING COUNT(ed.id) =
(SELECT 
MAX(tabla.numero_edificios) as numero_maximo
FROM
(SELECT 
ch.nombre as nombre_complejo ,
COUNT(ed.id) as numero_edificios
FROM complejo_hospitalario  ch
JOIN edificio ed  on ch.id = ed.id_complejo 
GROUP by  ch.id
) tabla)

```

# Mostrar el nombre y la especialidad de los empleados que trabajan en el piso principal del edificio con id 1.

```sql
SELECT
emp.nombre as nombre_empleado ,
esp.nombre as nombre_especialidad

FROM empleado emp
JOIN piso ps on ps.id_empleado = emp.id
JOIN piso_especialidad pe on ps.id = pe.id_piso
JOIN especialidad esp on  pe.id_especialidad = esp.id
JOIN edificio edf  on ps.id_edificio =edf.id
WHERE pe.estado ='principal'  and edf.id =1
```

# Obtener el nombre y la ubicaciacion de los pisos donde trabaja un "Jefe".

```sql
```

# Mostrar el nombre y el cargo de los empleados que trabajan en mas de un piso.

```sql
SELECT  
emp.id ,
emp.nombre ,
emp.cargo ,
COUNT(*)  as numero_trabajo_piso
FROM empleado emp
JOIN piso ps on emp.id =  ps.id_empleado 
GROUP BY emp.id , emp.nombre , emp.cargo
HAVING COUNT(*) >1;
```

# Obtener el nombre y la cantidad de camas de las habitaciones en el piso principal del edificio con id 2.

```sql
SELECT
CONCAT('habitacion',' ', hb.id) as nombre_habitaciones ,
hb.camas as numero_de_camas_habitacion
FROM habitacion hb
JOIN piso_especialidad pe on hb.id_piso = pe.id_piso
JOIN piso ps on hb.id_piso = ps.id
JOIN edificio ed on  ps.id_edificio = ed.id
WHERE pe.estado = 'principal' and ed.id =2;

```

# Mostrar el nombre del complejo hospitalario que tiene al menos un edificio sin asignacion de empleados.



## Consultas con procedimiento de almacenado


1. Crear un procedimiento almacenado que asigne un empleado a un piso dado su identificador.
```sql


```

2. Crear un procedimiento almacenado que asigne un empleado a un piso dado su identificador.

   ```sql
   # Solucion
   ```

3. Crear un procedimiento almacenado que cuente el número de habitaciones en un piso específico.

   ```sql
   # Solucion
   ```

4. Crear un procedimiento almacenado que actualice la ubicación de un piso dado su identificador.

   ```sql
     # Solucion
   ```


5. Crear un procedimiento almacenado que elimine la asignación de un empleado de un piso dado su identificador.

   ```sql
   # Solucion
   ```

6. Crear un procedimiento almacenado que devuelva los empleados que tienen una especialidad específica.

   ```sql
     # Solucion
   ```

7. Crear un procedimiento almacenado que cuente el número de edificios en un complejo hospitalario específico.

   ```sql
   # Solucion
   ```

8. Crear un procedimiento almacenado que devuelva los pisos asignados a empleados de un cargo específico.

   ```sql
   # Solucion
   ```

9. Crear un procedimiento almacenado que asigne una especialidad a un piso específico.

   ```sql
   # Solucion
   ```

10. Crear un procedimiento almacenado que devuelva los empleados que no están asignados a ningún piso.

     ```sql
      # Solucion
     ```

