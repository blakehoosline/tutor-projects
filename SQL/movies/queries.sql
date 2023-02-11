--Query to retrieve all the movies that have box office revenue greater than or equal to $300.00
SELECT title, box_office
FROM movies
WHERE box_office >= 300.00;


--Query to retrieve all the genres of the movie 'Mission Impossible - Fallout'
SELECT genres.name
FROM genres
JOIN movie_genres ON movie_genres.genre_id = genres.id
JOIN movies ON movie_genres.movie_id = movies.id
WHERE movies.title = 'Mission Impossible - Fallout';



--Query to retrieve the total number of actors who appeared in the movie 'Once Upon a Time in Hollywood'
SELECT COUNT(actor_id) as TotalActors
FROM movie_cast
JOIN movies ON movie_cast.movie_id = movies.id
WHERE movies.title = 'Once Upon a Time in Hollywood';



--Query to retrieve all the movies of the 'Comedy' and 'Drama' genre 
--released after December 31, 2015 and with a box office --revenue greater than or equal to $200.00
SELECT movies.title, movies.release_date, movies.box_office
FROM movies
JOIN movie_genres ON movie_genres.movie_id = movies.id
JOIN genres ON movie_genres.genre_id = genres.id
WHERE (genres.name = 'Comedy' OR genres.name = 'Drama') AND (movies.release_date > '2015-12-31' AND movies.box_office >= 200.00);
