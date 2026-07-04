-- SQL Portfolio Queries
-- Alexandre Rafael Almeida | July 2026
-- Dataset: Pixar Movies (SQLBolt exercises)

-- 1. Select all movies
SELECT * FROM movies;

-- 2. Find movies directed by X Author (E.g. John Lasseter)
SELECT title, year FROM movies
WHERE director = "John Lasseter";

-- 3. List directors without duplicates, alphabetically
SELECT DISTINCT director FROM movies
ORDER BY director;

-- 4. Last 4 Pixar movies released
SELECT title, year FROM movies
ORDER BY year DESC
LIMIT 4;

-- 5. Total and international sales per movie (in millions)
SELECT title, 
       (domestic_sales + international_sales) / 1000000 AS total_sales_millions
FROM movies
INNER JOIN boxoffice ON movies.id = boxoffice.movie_id;

-- 6. Movies where international sales beat domestic
SELECT title FROM movies
INNER JOIN boxoffice ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales;

-- 7. Average rating per director
SELECT director, AVG(rating) AS avg_rating
FROM movies
INNER JOIN boxoffice ON movies.id = boxoffice.movie_id
GROUP BY director;

-- 8. Movies released in even years
SELECT title, year FROM movies
WHERE year % 2 = 0;
