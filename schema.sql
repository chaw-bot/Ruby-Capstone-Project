CREATE DATABASE my_catalog

CREATE TABLE IF NOT EXISTS genre (
  id SERIAL,
  name VARCHAR(100),
  items INT [],
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS musicalbum (
  id SERIAL PRIMARY KEY,
  on_spotify BOOLEAN,
  published_date DATE,
  archived BOOLEAN,
  genre_id INT,
-- label_id INT,
-- author_id INT,
  CONSTRAINT fk_genre
    FOREIGN KEY(genre_id)
	    REFERENCES genre(id)
-- CONSTRAINT fk_label
  -- FOREIGN KEY(label_id)
--     REFERENCES label(id),
-- CONSTRAINT fk_author
-- FOREIGN KEY(author_id)
--     REFERENCES author(id)
);