USE codeup_test_db;

SELECT name AS 'Albums released after 1991' FROM albums WHERE release_date > 1991;

SELECT name AS 'Albums with the genre ''disco''' FROM albums WHERE genre = 'disco';

SELECT name AS 'Albums by ''Whitney Houston''' FROM albums WHERE artist = 'Whitney Houston';

DELETE FROM albums WHERE release_date > 1991;

DELETE FROM albums WHERE genre = 'disco';

DELETE FROM albums WHERE artist = 'Whitney Houston';

