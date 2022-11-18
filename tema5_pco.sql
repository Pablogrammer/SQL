--Bloque B:


--1.5.4

--2.- Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono
--en la base de datos.

SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' and telefono is null;

--4. Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y
--además su nif termina en K.

SELECT nombre, apellido1, apellido2 
FROM persona
WHERE tipo = 'profesor' and nif like '%K' and telefono is null;

--5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del
--grado que tiene el identificador 7.

SELECT nombre, cuatrimestre, curso, id_grado
FROM asignatura
WHERE cuatrimestre = '1' and curso = '3' and id_grado = '7';

--1.5.5

--1. Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado
--en Ingeniería Informática (Plan 2015).

SELECT distinct persona.nombre, persona.apellido1, persona.apellido2, persona.sexo, grado.nombre
FROM persona, matricula, grado
WHERE matricula.id_alumno = persona.id and sexo = 'M' and grado.nombre like 'Grado en Ingeniería Informática (Plan 2015)';

--4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del
--alumno con nif 26902806M.

SELECT asignatura.nombre, persona.nif,  curso_escolar.inicio, curso_escolar.fin
FROM  curso_escolar, asignatura, persona
WHERE persona.nif like '26902806M';

--5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura 
--en el Grado en Ingeniería Informática (Plan 2015).
SELECT departamento.nombre
FROM asignatura, profesor, departamento
WHERE departamento.id=profesor.id_profesor and asignatura.nombre like 'Grado en Ingeniería Informática (Plan 2015)';



--1.5.6
--2. Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT persona.nombre, persona.apellido1, persona.apellido2
FROM persona, profesor, departamento
WHERE persona.id = id_profesor and id_departamento is null;

--4. Devuelve un listado con los profesores que no imparten ninguna asignatura.
SELECT persona.nombre, persona.apellido1, persona.apellido2
FROM persona, profesor, asignatura
WHERE persona.id = profesor.id_profesor and id_profesor is null;

--5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT nombre
FROM asignatura
WHERE id_profesor is null;


--1.5.7
--3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una
--con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El
--resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado
--de mayor a menor por el número de profesores.

select nombre,  count(distinct id_profesor)
from profesor,departamento
GROUP BY departamento.nombre, profesor.id_profesor
ORDER BY count(id_profesor) desc;

--6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de
--asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

SELECT grado.nombre, count(asignatura.id) AS "número de asignaturas"
FROM grado, asignatura
WHERE asignatura.id_grado = grado.id
GROUP BY grado.id
HAVING COUNT (asignatura.id)> 40;

--7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay
--para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura
--y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a
--menor por el número total de crédidos.

SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos)
FROM asignatura, grado
WHERE grado.id = asignatura.id_grado
GROUP BY grado.nombre, asignatura.tipo
ORDER BY SUM(asignatura.creditos) desc;

--9. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en
--cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas:
--id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de
--mayor a menor por el número de asignaturas.

SELECT profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2, count(asignatura.nombre)
FROM persona, asignatura, profesor
WHERE profesor.id_profesor = persona.id and profesor.id_profesor = asignatura.id_profesor
GROUP BY profesor.id_profesor,  persona.nombre, persona.apellido1, persona.apellido2
ORDER BY count(asignatura.nombre) desc;

--1.5.8
--1. Devuelve todos los datos del alumno más joven.
SELECT * 
FROM persona
WHERE fecha_nacimiento=(SELECT max(fecha_nacimiento) FROM persona WHERE tipo = 'alumno');

--3. Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT departamento.nombre 
FROM departamento
WHERE departamento.id NOT IN (SELECT id_departamento FROM profesor );


--5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT asignatura.nombre 
FROM asignatura
WHERE id NOT IN (SELECT id FROM asignatura WHERE id_profesor is NULL);

--sakila
-- 4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 2;

-- 6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.

SELECT f.title, COUNT(a.actor_id)
FROM film f INNER JOIN film_actor  a ON f.film_id = a.film_id
GROUP BY f.title;

-- 7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.
--Use joins to retrieve this information.
SELECT first_name, last_name, email 
FROM customer 
JOIN address a ON (customer.address_id = a.address_id)
JOIN city ON (a.city_id=city.city_id)
JOIN country ON (city.country_id=country.country_id);

-- 7f. Write a query to display how much business, in dollars, each store brought in.
SELECT staff.store_id, SUM(payment.amount) 
FROM payment
JOIN staff ON (payment.staff_id=staff.staff_id)
GROUP BY store_id;






