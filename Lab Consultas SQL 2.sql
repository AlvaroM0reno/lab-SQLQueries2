-- 1. Seleccione todos los actores con el nombre 'Scarlett'.
SELECT
	*
FROM sakila.actor
WHERE first_name = "SCARLETT";

-- 2. Selecciona todos los actores con el apellido 'Johansson'.
SELECT
	*
FROM sakila.actor
WHERE last_name = "JOHANSSON";

-- 3. ¿Cuántas películas hay disponibles para alquilar?
SELECT
	title
FROM film
WHERE film_id IN (SELECT
	DISTINCT film_id
FROM sakila.inventory
WHERE inventory_id NOT IN (SELECT DISTINCT inventory_id FROM rental WHERE return_date is null));

-- 4. ¿Cuántas películas se han alquilado?
SELECT
	title
FROM film
WHERE film_id IN (SELECT
	DISTINCT film_id
FROM sakila.inventory
WHERE inventory_id IN (SELECT DISTINCT inventory_id FROM rental WHERE rental_date is not null));

-- 5. ¿Cuál es el período de alquiler más corto y más largo?
	SELECT
		MAX(rental_duration) as max_rental_duration,
		MIN(rental_duration) as min_rental_duration
    FROM film;
    
   -- 6. ¿Cuáles son la duración más corta y más larga de la película? Nombra los valores max_duration y min_duration.
   SELECT
		MAX(length) as max_duration,
		MIN(length) as min_duration
    FROM film;
    
    -- 7. ¿Cuál es la duración promedio de la película?
    
    SELECT
		AVG(length) as Promedio_length
	FROM film;
   
-- 8. ¿Cuál es la duración promedio de una película expresada en formato (horas, minutos)?
SELECT 
    CONCAT(
        FLOOR(AVG(length) % 60), ' horas ',
        MOD(AVG(length), 60), ' minutos'
    ) AS promedio_length_formato_horas_minutos
FROM film;

-- 9. ¿Cuántas películas duran más de 3 horas?
SELECT
	*
FROM film
WHERE length >= 180;

-- 10. Obtenga el formato del nombre y el correo electrónico. Ejemplo: Mary SMITH - mary.smith@sakilacustomer.org.

SELECT
	first_name, last_name, email
FROM customer;

-- 11. ¿Cuál es la duración del título de película más largo?

SELECT
	title
FROM film
WHERE length = (
	SELECT MAX(length)
    FROM film);
	



