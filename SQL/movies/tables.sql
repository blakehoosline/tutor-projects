-- Create the "movies" table to store information about movies
CREATE TABLE movies (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL,
    plot TEXT NOT NULL,
    box_office DECIMAL(10, 2) NOT NULL
);

-- Create the "genres" table to store information about movie genres
CREATE TABLE genres (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Create the "movie_genres" table to link movies to their genres
CREATE TABLE movie_genres (
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES movies (id),
    FOREIGN KEY (genre_id) REFERENCES genres (id)
);

-- Create the "actors" table to store information about actors
CREATE TABLE actors (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

-- Create the "movie_cast" table to link actors to the movies they appeared in
CREATE TABLE movie_cast (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies (id),
    FOREIGN KEY (actor_id) REFERENCES actors (id)
);

-- Populate the "genres" table
INSERT INTO genres (name) VALUES
('Action'),
('Comedy'),
('Drama'),
('Horror'),
('Science Fiction'),
('Thriller');

-- Populate the "actors" table
INSERT INTO actors (first_name, last_name) VALUES
('Tom', 'Cruise'),
('Brad', 'Pitt'),
('Leonardo', 'DiCaprio'),
('Robert', 'Downey Jr.'),
('Saoirse', 'Ronan'),
('Margot', 'Robbie');

-- Populate the "movies" table
INSERT INTO movies (title, release_date, plot, box_office) VALUES
('Mission Impossible - Fallout', '2018-07-27', 'Ethan Hunt and his IMF team race against time after a mission goes wrong', 380.01),
('Once Upon a Time in Hollywood', '2019-07-26', 'A faded television actor and his stunt double strive to achieve fame and success in the film industry during the final years of Hollywood''s Golden Age in 1969 Los Angeles.', 365.01),
('The Revenant', '2015-12-25', 'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.', 330.02),
('Iron Man', '2008-05-02', 'When wealthy industrialist Tony Stark is forced to build an armored suit after a life-threatening incident, he ultimately decides to use its technology to fight against evil.', 318.04),
('Lady Bird', '2017-11-03', 'In 2002, an artistically inclined seventeen-year-old girl comes of age in Sacramento, California.', 100.03),
('I, Tonya', '2017-12-08', 'Competitive ice skater Tonya Harding rises amongst the ranks at the U.S. Figure Skating Championships, but her future in the activity is thrown into doubt when her ex-husband intervenes.', 120.01);

-- Populate the "movie_genres" table
INSERT INTO movie_genres (movie_id, genre_id) VALUES
(1, 1), (1, 5), (1, 6),
(2, 2), (2, 3),
(3, 3), (3, 5),
(4, 1), (4, 4),
(5, 3),
(6, 2), (6, 3);

-- Populate the "movie_cast" table
INSERT INTO movie_cast (movie_id, actor_id) VALUES
(1, 1),
(2, 2), (2, 5),
(3, 3),
(4, 4),
(5, 5),
(6, 6), (6, 5);
