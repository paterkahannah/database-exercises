USE codeup_test_db;

SELECT name AS 'Pink floyd''s albums' FROM albums WHERE artist = 'Pink Floyd';

SELECT release_date AS 'Year Sgt. Pepper''s Lonely Hearts Club Band was released' FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';

SELECT genre AS 'The genre for Nevermind' FROM albums WHERE name = 'Nevermind';

SELECT name AS 'Albums released in 1990''s' FROM albums WHERE release_date BETWEEN 1990 AND 1999;

SELECT name AS 'Albums with less than 20 million certified sales' FROM albums WHERE sales <  20.0;

SELECT name AS 'Albums with a genre of "Rock"' FROM albums WHERE genre = 'rock';
