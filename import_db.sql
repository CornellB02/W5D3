PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS questions_follows;
DROP TABLE IF EXISTS replies; 

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    title TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE questions_follows (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id)
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    parent_reply_id INTEGER, 
    body TEXT NOT NULL,
    questions_id INTEGER NOT NULL,
    replier_id INTEGER NOT NULL,

    FOREIGN KEY (replier_id) REFERENCES users(id)
    FOREIGN KEY (questions_id) REFERENCES questions(id)
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE questions_likes (
    id INTEGER PRIMARY KEY,
    liker_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (liker_id) REFERENCES users(id)
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Yen', 'Lee'),
    ('CJ', 'B');

INSERT INTO
    questions (body, title, author_id)
VALUES
    ('Whats your favorite food?', 'Foods', (SELECT id FROM users WHERE fname = 'Yen'));

