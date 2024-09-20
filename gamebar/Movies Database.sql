CREATE DATABASE movies;

USE movies;

CREATE TABLE directors (
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
    director_name VARCHAR(50) NOT NULL,
    notes BLOB,
    PRIMARY KEY(id)
);

CREATE TABLE genres (
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL,
    notes BLOB,
    PRIMARY KEY(id)
);

CREATE TABLE categories (
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    notes BLOB,
    PRIMARY KEY(id)
);

CREATE TABLE movies (
	id INT UNIQUE NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    director_id INT,
    copyright_year INT,
    length DOUBLE(5, 2),
    genre_id INT,
    category_id INT,
    rating DOUBLE(3,1),
    notes BLOB,
    PRIMARY KEY(id)
);

INSERT INTO categories(category_name, notes) VALUES
('Action', 'Movies in the action genre are defined by risk and stakes. While many movies may feature an action sequence, to be appropriately categorized inside the action genre, the bulk of the content must be action-oriented, including fight scenes, stunts, car chases, and general danger.'),
('Animation', 'The animation genre is defined by inanimate objects being manipulated to appear as though they are living. This can be done in many different ways and can incorporate any other genre and sub-genre on this list. For more info on animation, you can dive deeper on the types of animation, the principles of animation or see our list of the best animated movies of all time.'),
('Comedy', 'The comedy genre is defined by events that are intended to make someone laugh, no matter if the story is macabre, droll, or zany. Comedy can be found in most movies, but if the majority of the film is intended to be a comedy you may safely place it in this genre. The best comedy movies range throughout this entire spectrum of humor.'),
('Western', 'Westerns are defined by their setting and time period. The story needs to take place in the American West, which begins as far east as Missouri and extends to the Pacific ocean. They’re set during the 19th century, and will often feature horse riding, military expansion, violent and non-violent interaction with Native American tribes, the creation of railways, gunfights, and technology created during the industrial revolution.'),
('Horror', 'The horror genre is centered upon depicting terrifying or macabre events for the sake of entertainment. A thriller might tease the possibility of a terrible event, whereas a horror film will deliver all throughout the film. The best horror movies are designed to get the heart pumping and to show us a glimpse of the unknown.');

ALTER TABLE movies
ADD CONSTRAINT fk_director_id FOREIGN KEY(director_id) REFERENCES directors(id),
ADD CONSTRAINT fk_categories_id FOREIGN KEY(category_id) REFERENCES categories(id),
ADD CONSTRAINT fk_genres_id FOREIGN KEY(genre_id) REFERENCES genres(id);