USE sakila;

SHOW TABLES IN sakila;

-- Challenge 1

-- 1. You need to use SQL built-in functions to gain insights relating to the duration of movies:

-- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.

SELECT MAX(length) AS 'max_duration', MIN(length) AS 'min_duration'
FROM sakila.film;

-- 1.2. Express the average movie duration in hours and minutes. Don't use decimals.

SELECT AVG(length)/60
FROM sakila.film;

