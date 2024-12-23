-- Create staging table
CREATE TABLE movies_staging(
	id VARCHAR,
	title VARCHAR,
	type VARCHAR,
	description VARCHAR,
	release_year INTEGER,
	age_certification VARCHAR,
	runtime INTEGER,
	genre TEXT[],
	production_countries TEXT[]
)

-- insert data csv
COPY movies_staging(id, title, type, description, release_year, age_certification, runtime, genre, production_countries)
FROM 'C:\tmp\movies.csv'
DELIMITER ','
CSV HEADER;

-- Create new tabel after normalisasi
CREATE TABLE movies(
	id VARCHAR PRIMARY KEY,
	genre_id INTEGER,
	production_id INTEGER,
	title VARCHAR,
	type VARCHAR,
	description VARCHAR,
	release_year INTEGER,
	age_certification VARCHAR,
	runtime INTEGER
);

CREATE TABLE genre(
	genre_id SERIAL PRIMARY KEY,
	genre VARCHAR
)

CREATE TABLE production(
	production_id SERIAL PRIMARY KEY,
	production_countries VARCHAR
);

ALTER TABLE movies
ADD FOREIGN KEY (production_id) REFERENCES production(production_id);

ALTER TABLE movies
ADD FOREIGN KEY (genre_id) REFERENCES genre(genre_id);

-- Insert new table data from movies_staging
INSERT INTO movies(id, title, type, description, release_year, age_certification, runtime) 
SELECT id, title, type, description, release_year, age_certification, runtime
FROM movies_staging;

INSERT INTO genre(genre) SELECT UNNEST(genre) AS new_genre 
FROM movies_staging; 

INSERT INTO production(production_countries) SELECT UNNEST(production_countries) as new_production_countries 
FROM movies_staging

-- Tampilkan semua film dengan genre dan negara produksinya.
SELECT * title

-- Genre film yang paling populer.
SELECT genre, COUNT(*) as jumlah_genre
FROM genre
GROUP BY genre
ORDER BY jumlah_genre DESC;

-- Negara yang paling banyak membuat film.
SELECT production_countries, COUNT(*) as jumlah_produksi
FROM production
GROUP BY Production_countries
ORDER BY jumlah_produksi DESC;
