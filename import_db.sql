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
    FOREIGN KEY (author_id) REFERENCES user(id)
);

CREATE TABLE quetsions_follows (
    id INTEGER
    users_id INTEGER
    quetsions_id INTEGER
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY 
    
)



