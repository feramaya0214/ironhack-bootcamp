USE sakila;

-- 1. Número de copias de "Hunchback Impossible" en el sistema de inventario

SELECT 
    COUNT(*) AS copies_count
FROM inventory i
JOIN film f ON i.film_id = f.film_id
WHERE f.title = 'Hunchback Impossible';

-- 2. Listar todas las películas cuya duración es mayor que la duración promedio

SELECT 
    title,
    length
FROM film
WHERE length > (
    SELECT AVG(length)
    FROM film
)
ORDER BY length DESC;

-- 3. Actores que aparecen en la película "Alone Trip" usando una subconsulta

SELECT 
    a.actor_id,
    a.first_name,
    a.last_name
FROM actor a
WHERE a.actor_id IN (
    SELECT fa.actor_id
    FROM film_actor fa
    JOIN film f ON fa.film_id = f.film_id
    WHERE f.title = 'Alone Trip'
);

