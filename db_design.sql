USE codeup_test_db;

DROP TABLE IF EXISTS quotes;

# quotes table

CREATE TABLE quotes (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        author_first_name VARCHAR(50),
                        author_last_name  VARCHAR(100) NOT NULL,
                        content TEXT NOT NULL,
                        PRIMARY KEY (id)
);

INSERT INTO quotes (author_first_name, author_last_name, content)
VALUES ('Douglas', 'Adams', 'I love deadlines. I love the whooshing noise they make as they go by.'),
       ('Douglas', 'Adams', 'Don''t Panic.'),
       ('Douglas', 'Adams', 'Time is an illusion. Lunchtime doubly so.'),
       ('Mark', 'Twain', 'Clothes make the man. Naked people have little or no influence on society.'),
       ('Kurt', 'Vonnegut', 'The universe is a big place, perhaps the biggest.');

# authors table

CREATE TABLE authors (
                         id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                         first_name VARCHAR(50),
                         last_name  VARCHAR(100) NOT NULL,
                         PRIMARY KEY (id)
);

INSERT INTO authors(first_name, last_name) VALUES
('Douglas', 'Adams'),
('Mark', 'Twain'),
('Kurt', 'Vonnegut');

# new quotes table

DROP TABLE IF EXISTS quotes;

CREATE TABLE quotes (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        content TEXT NOT NULL,
                        author_id INT UNSIGNED NOT NULL,
                        PRIMARY KEY (id),
                        FOREIGN KEY (author_id) REFERENCES authors (id)
);

# Seeds for quotes table
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
        'I love deadlines. I love the whooshing noise they make as they go by.');
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
        'Time is an illusion. Lunchtime doubly so.');
INSERT INTO quotes (author_id, content)
values ((select id from authors where first_name = 'Mark' and last_name = 'Twain'),
        'Clothes make the man. Naked people have little or no influence on society.');
INSERT INTO quotes (author_id, content)
values ((select id from authors where first_name = 'Kurt' and last_name = 'Vonnegut'),
        'The universe is a big place, perhaps the biggest.');
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'), 'Don''t Panic.');

# topics table

DROP TABLE IF EXISTS topics;

CREATE TABLE topics (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        name VARCHAR(255),
                        PRIMARY KEY (id)
);

INSERT INTO topics(name) VALUES
('Space and Time'),
('Humor'),
('Office Life'),
('Hitchiker''s Guide to the Galaxy');

# quote_topic table

CREATE TABLE quote_topic (
                             quote_id INTEGER UNSIGNED NOT NULL,
                             topic_id INTEGER UNSIGNED NOT NULL,
                             FOREIGN KEY (quote_id) REFERENCES quotes(id),
                             FOREIGN KEY (topic_id) REFERENCES topics(id)
);

INSERT INTO quote_topic(quote_id, topic_id)
VALUES (1, 2), (1, 3), (2, 4), (3, 1),
       (3, 2), (3, 3), (3, 4), (4, 2), (5, 1);

# EXERCISESESESESEESESSSSSSSS

CREATE TABLE users (
    id INT AUTO_INCREMENT,
    email VARCHAR(50),
    password VARCHAR(50),
    PRIMARY KEY (id)
    );

INSERT INTO users (email, password)
VALUES ('user1', 'user1@gmail.com'),
       ('user2', 'user2@gmail.com'),
       ('user3', 'user3@gmail.com');


CREATE TABLE ads (
    id INT AUTO_INCREMENT,
    title VARCHAR(50),
    description VARCHAR(150),
    category VARCHAR(50),
    user_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
    );

INSERT INTO ads (title, description, category, user_id)
VALUES ('toaster', 'a good toaster', 'kitchenware', 1),
       ('spatula', 'a good spatula', 'kitchenware, cooking', 2),
       ('mixer', 'a good mixer', 'kitchenware, mixing', 3),
       ('fork', 'a good fork', 'wares, eating', 1),
       ('spoon', 'a good spoon', 'wares, eating', 3),
       ('knife', 'a good knife', 'wares, cutting', 3);


CREATE TABLE user_ad (
    user_id INT NOT NULL,
    ad_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES ads (user_id),
    FOREIGN KEY (ad_id) REFERENCES ads (id)
);

INSERT INTO user_ad (user_id, ad_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (1, 4),
       (2, 5),
       (3, 6);

# For a given ad, what is the email address of the user that created it?
SELECT *
FROM users
WHERE id IN (
    SELECT id
    FROM ads
    WHERE title = 'spatula'
);

# For a given ad, what category, or categories, does it belong to?
SELECT category
FROM ads
WHERE title = 'spatula';

# For a given category, show all the ads that are in that category.
SELECT title, category
FROM ads
WHERE category lIKE '%kitchenware%';

# For a given user, show all the ads they have posted.
SELECT *
FROM ads
WHERE user_id IN (
    SELECT user_id
    FROM user_ad
    WHERE user_id = 1
    );

# BONUSSSSEEEEEESSSSS

CREATE TABLE quiz (
       id INT AUTO_INCREMENT,
       questions VARCHAR(50),
       PRIMARY KEY (id)
);

INSERT INTO quiz (questions)
VALUES ('what color is a tree?'),
       ('what color is an apple?'),
       ('what color is a banana');

# --------

CREATE TABLE quizAnswers (
      id INT AUTO_INCREMENT,
      answer1 VARCHAR(50),
      answer2 VARCHAR(50),
      answer3 VARCHAR(50),
      PRIMARY KEY (id)
);

INSERT INTO quizAnswers (answer1, answer2, answer3)
VALUES ('green', 'red', 'yellow');

# ------

CREATE TABLE students (
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY (id)
);
INSERT INTO students (name)
VALUES ('student1'),
    ('student2'),
    ('student3');

# ------

CREATE TABLE studentAnswers (
    student_id INT,
    answer1 VARCHAR(50),
    answer2 VARCHAR(50),
    answer3 VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES students (id)
);

INSERT INTO studentAnswers (student_id, answer1, answer2, answer3)
VALUES (1, 'green', 'red', 'yellow'),
       (2, 'green', 'red', 'brown'),
       (3, 'green', 'prange', 'brown');

# SELECT COUNT(*)
# FROM studentAnswers
# WHERE studentAnswers.