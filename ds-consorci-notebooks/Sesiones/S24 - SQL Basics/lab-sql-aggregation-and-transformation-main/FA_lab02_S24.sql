USE sakila;

SHOW TABLES IN sakila;

-- Challenge 1

-- 1. You need to use SQL built-in functions to gain insights relating to the duration of movies:

-- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.

SELECT 
    MAX(length) AS max_duration,
    MIN(length) AS min_duration
FROM film;

-- 1.2. Express the average movie duration in hours and minutes. Don't use decimals.

SELECT 
    FLOOR(AVG(length) / 60) AS avg_hours,
    ROUND(AVG(length) % 60) AS avg_minutes
FROM film;

-- 2. Rental Insights
-- 2.1 Calculate the number of days the company has been operating

SELECT 
    DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days
FROM rental;

--2.2 Retrieve rental information with month and weekday

SELECT 
    rental_id,
    rental_date,
    MONTHNAME(rental_date) AS rental_month,
    DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

-- 2.3 Bonus: Add a column DAY_TYPE with 'weekend' or 'workday'

SELECT 
    rental_id,
    rental_date,
    DAYNAME(rental_date) AS rental_weekday,
    CASE 
        WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
        ELSE 'workday'
    END AS DAY_TYPE
FROM rental
LIMIT 20;


-- 3. Movie Collection Information
-- Retrieve film titles and rental durations, handling NULL values

SELECT 
    title,
    IFNULL(rental_duration, 'Not Available') AS rental_duration
FROM film
ORDER BY title ASC;

-- 4. Bonus: Personalized Email Campaign
-- Retrieve concatenated names and email information

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    SUBSTRING(email, 1, 3) AS email_prefix
FROM customer
ORDER BY last_name ASC;



-- Challenge 2

-- 1. Film Insights
-- 1.1 Total number of films released

SELECT 
    COUNT(*) AS total_films 
FROM film;

-- 1.2 Number of films for each rating

SELECT 
    rating,
    COUNT(*) AS film_count
FROM film
GROUP BY rating;

-- 1.3 Number of films for each rating, sorted in descending order

SELECT 
    rating,
    COUNT(*) AS film_count
FROM film
GROUP BY rating
ORDER BY film_count DESC;

-- 2. Film Duration Analysis
-- 2.1 Mean film duration for each rating, sorted in descending order

SELECT 
    rating,
    ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
ORDER BY mean_duration DESC;

-- 2.2 Ratings with a mean duration of over two hours

SELECT 
    rating,
    ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
HAVING AVG(length) > 120;

-- 3. Bonus: Unique Last Names in Actor Table
-- Last names that are not repeated in the actor table

SELECT 
    last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;