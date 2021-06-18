USE codeup_test_db;

SELECT * FROM albums;
UPDATE albums SET sales = (sales * 10) WHERE sales;

SELECT name AS 'All albums released before 1980' FROM albums WHERE release_date < 1980;
UPDATE albums SET release_date = (release_date - 100) WHERE release_date;

SELECT name AS 'Michael Jackson''s albums' FROM albums WHERE artist = 'Michael Jackson';
UPDATE albums SET artist = 'Peter Jackson' WHERE artist = 'Michael Jackson';
