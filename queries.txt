-- Write 15 SQL commands
--
-- The SQL statements you write are up to you, but you must include at least
-- two of each of the insert, update, delete, and select SQL commands.
--
-- Add SQL comments that explain what each SQL statement is doing.
--
-- At least one select statement must have a where clause.
--
-- At least one select statement must specify a subset of columns. IE: no *.

------------------

-- selecting and displaying all information from the movie table
SELECT * FROM movie;
-- selecting and displaying all information from the genre table
SELECT * FROM genre;

-- selecting and displaying all first_name information from the person table
SELECT first_name FROM person;
-- selecting and displaying all last_name information from the person table
SELECT last_name FROM person;


-- inserts a new movie genre called comedy into the primary_genre column in the genre table
INSERT INTO genre (primary_genre)
VALUES (comedy);

-- inserts a new movie genre called thriller into the primary_genre column in the genre table
INSERT INTO genre (primary_genre)
VALUES (thriller);

-- selects and displays user review scores that are greater than or equal to 7
SELECT user_review_score
FROM review
WHERE user_review_score >= 7;

-- selects and displays names from the person table that have a first name of Keanu
SELECT first_name, last_name
FROM person
WHERE first_name = 'Keanu';

-- updates the movie title in the movie table where id=10
UPDATE movie
SET title = 'Predator';
WHERE movie_id=10;

-- updates the movie title in the movie table where id=1
UPDATE movie
SET title = 'Jaws';
WHERE movie_id=1;

-- deletes from the specific column in the table
DELETE FROM role
WHERE role_id = 6;

-- deletes from the specific column in the table

DELETE FROM role
WHERE role_id = 1;

-- deletes from the specific column in the table

DELETE FROM person_movie
WHERE movie_id = 3;

-- selects the row only if the first name and last name match exactly
SELECT first_name, last_name
FROM person
WHERE first_name = 'Bob' AND last_name = 'Smith';

-- selects all columns from the movie table and orders them by date of release
SELECT * FROM movie
   ORDER BY release_date;

-- selects all columns from the movie table and orders them by the budget of the movie
SELECT * FROM movie
   ORDER BY budget;