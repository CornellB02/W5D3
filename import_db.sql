CREATE TABLE users (
    id INTEGER PRIMARY KEY
    fname TEXT NOT NULL
    lname TEXT NOT NULL
);

CREATE TABLE quetsions (
    id INTEGER PRIMARY KEY
    body TEXT
    title TEXT
    author_id INTEGER
);

CREATE TABLE quetsions_follows (
    users_id INTEGER
    quetsions_id INTEGER
);



