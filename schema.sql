CREATE DATABASE my_catalog

CREATE TABLE IF NOT EXISTS genre (
  id SERIAL,
  name VARCHAR(100),
  items INT [],
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS label (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    items INT [],
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS music_album (
  id SERIAL PRIMARY KEY,
  on_spotify BOOLEAN,
  published_date DATE,
  archived BOOLEAN,
  genre_id INT,
  label_id INT,
-- author_id INT,
  CONSTRAINT fk_genre
    FOREIGN KEY(genre_id)
	    REFERENCES genre(id)
  CONSTRAINT fk_label
    FOREIGN KEY(label_id)
        REFERENCES label(id),
-- CONSTRAINT fk_author
-- FOREIGN KEY(author_id)
--     REFERENCES author(id)
);

CREATE TABLE IF NOT EXISTS books (
    id  INT GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    -- FOREIGN KEY (author_id) REFERENCES authors (id),
    FOREIGN KEY (label_id) REFERENCES labels (id)
)

