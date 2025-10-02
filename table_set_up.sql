
-- Create initial entity tables --

BEGIN;

CREATE TABLE director (
    director_id SERIAL PRIMARY KEY,
    director_name VARCHAR(36) NOT NULL UNIQUE
);

CREATE TABLE actor (
    actor_id SERIAL PRIMARY KEY,
    actor_name VARCHAR(36) NOT NULL UNIQUE
);

CREATE TABLE genre (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(36) NOT NULL UNIQUE
);

COMMIT;

-- Create movie relationships --

BEGIN;

CREATE TABLE movie (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(128) NOT NULL,
    release_date DATE,
    duration_min INT CHECK (duration_min > 0),
    director_id INT,
    FOREIGN KEY (director_id) REFERENCES director(director_id)
);

CREATE TABLE movie_genre (
    movie_id INT REFERENCES movie(movie_id) ON DELETE CASCADE,
    genre_id INT REFERENCES genre(genre_id) ON DELETE CASCADE,
    PRIMARY KEY (movie_id, genre_id)
);

CREATE TABLE movie_actor (
    movie_id INT REFERENCES movie(movie_id) ON DELETE CASCADE,
    actor_id INT REFERENCES actor(actor_id) ON DELETE CASCADE,
    character_name VARCHAR(128),
    PRIMARY KEY (movie_id, actor_id)
);

CREATE TABLE watched (
    watched_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movie(movie_id) ON DELETE CASCADE,
    rating DECIMAL(3, 1) CHECK (rating >= 0 AND rating <= 10),
    watched_date DATE DEFAULT CURRENT_DATE,
    notes TEXT
);

COMMIT;