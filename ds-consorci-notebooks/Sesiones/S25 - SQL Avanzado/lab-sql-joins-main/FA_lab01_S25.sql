USE sakila;

-- 1. Número de películas por categoría

SELECT 
    c.name AS category,
    COUNT(f.film_id) AS film_count
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY film_count DESC;

-- 2. Información de las tiendas: store ID, ciudad y país

SELECT 
    s.store_id,
    c.city,
    co.country
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id;

-- 3. Ingresos totales generados por cada tienda

SELECT 
    s.store_id,
    SUM(p.amount) AS total_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN store s ON i.store_id = s.store_id
GROUP BY s.store_id
ORDER BY total_revenue DESC;

-- 4. Duración promedio de películas por categoría

SELECT 
    c.name AS category,
    ROUND(AVG(f.length), 2) AS avg_duration
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY avg_duration DESC;

