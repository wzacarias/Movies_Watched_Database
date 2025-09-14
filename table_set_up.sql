CREATE TABLE movie (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(24) NOT NULL,
    director_id INT,
    actor_id INT,
    FOREIGN KEY (director_id) REFERENCES director(director_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
);

CREATE TABLE director (
    director_id SERIAL PRIMARY KEY,
    director_name VARCHAR(24) NOT NULL
);

CREATE TABLE actor (
    actor_id SERIAL PRIMARY KEY,
    actor_name VARCHAR(24)
);

CREATE TABLE genre (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(24) NOT NULL UNIQUE
);

CREATE TABLE movie_genre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE movie_actor (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
);

CREATE TABLE watched (
    watched_id SERIAL PRIMARY KEY,
    movie_id INT,
    rating DECIMAL(2, 1),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);