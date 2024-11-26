use sakila;

-- 1. Rankear películas por su duración

SELECT 
    title,
    length,
    RANK() OVER (ORDER BY length DESC) AS `rank`
FROM film
WHERE length IS NOT NULL AND length > 0;

-- 2. Rankear películas por duración dentro de la categoría de calificación

SELECT 
    title,
    length,
    rating,
    RANK() OVER (PARTITION BY rating ORDER BY length DESC) AS `rank`
FROM film
WHERE length IS NOT NULL AND length > 0;

-- 3. Actores con el mayor número de películas

WITH actor_film_count AS (
    SELECT 
        a.actor_id,
        CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
        COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
)

SELECT 
    f.title AS film_title,
    afc.actor_name,
    afc.film_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN (
    SELECT 
        a.actor_id,
        CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
        COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
    ORDER BY film_count DESC
) afc ON fa.actor_id = afc.actor_id
GROUP BY f.film_id, afc.actor_name, afc.film_count
ORDER BY afc.film_count DESC;