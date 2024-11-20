USE sakila;

-- 1. Display all available tables in the Sakila database.

SHOW TABLES IN sakila;

-- 2. Retrieve all the data from the tables actor, film and customer.

SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

-- 3. Retrieve the following columns from their respective tables:

-- 3.1 Titles of all films from the film table

SELECT * FROM film;
SELECT DISTINCT title FROM sakila.film; 

-- 3.2 List of languages used in films, with the column aliased as language from the language table

SELECT * FROM language;
SELECT name AS 'Language'
FROM language;

-- 3.3 List of first names of all employees from the staff table

SELECT * FROM staff;
SELECT first_name FROM sakila.staff; 

-- 4. Retrieve unique release years.

SELECT * FROM film;
SELECT DISTINCT release_year FROM sakila.film; 
-- Solo hay peliculas del 2006

-- 5. Counting records for database insights:
-- 5.1 Determine the number of stores that the company has.

SELECT * FROM store;
SELECT COUNT(*) FROM sakila.store;

-- 5.2 Determine the number of employees that the company has.

SELECT * FROM staff;
SELECT COUNT(*) FROM sakila.staff;

-- 5.3 Determine how many films are available for rent and how many have been rented.

SELECT * FROM rental;

SELECT COUNT(DISTINCT inventory_id) AS 'Available for rent'
FROM rental;

SELECT COUNT(inventory_id) AS 'Total rented'
FROM rental;

-- 5.4 Determine the number of distinct last names of the actors in the database.

SELECT * FROM actor;
SELECT COUNT(DISTINCT last_name) AS 'Number of distinct last names' 
FROM sakila.actor; 


-- 6. Retrieve the 10 longest films.

SELECT title, length 
FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 7. Use filtering techniques in order to:
-- 7.1 Retrieve all actors with the first name "SCARLETT".

SELECT *
FROM sakila.actor
WHERE first_name = 'SCARLETT';

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.

SELECT title, length 
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;

-- 7.3 Determine the number of films that include Behind the Scenes content

SELECT *
FROM sakila.film;

SELECT title, special_features
FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';

SELECT count(*) AS 'Number of films that include Behind the Scenes content: '
FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';
