PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY
    fname TEXT NOT NULL
    lname TEXT NOT NULL
);

CREATE TABLE quetsions (
    id INTEGER PRIMARY KEY
    body TEXT NOT NULL
    title TEXT NOT NULL
    author_id INTEGER NOT NULL
    FOREIGN KEY (author_id) REFERENCES user(id)
);

CREATE TABLE quetsions_follows (
    id INTEGER NOT NULL
    users_id INTEGER NOT NULL
    quetsions_id INTEGER NOT NULL
    FOREIGN KEY (users_id) REFERENCES user(id)
    FOREIGN KEY (quetsions_id) REFERENCES quetsions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY 
    parent_reply_id INTEGER 
    body TEXT NOT NULL
    quetsions_id INTEGER
    users_id INTEGER
    FOREIGN KEY (user_id) REFERENCES user(id)
    FOREIGN KEY (questions_id) REFERENCES quetsions(id)
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
    FOREIGN KEY (id) REFERENCES quetsions_follows(id)
);

CREATE TABLE question_likes (
    id INTEGER
    user_like INTEGER
    user_id INTEGER
    quetsions_id INTEGER
    FOREIGN KEY (user_id) REFERENCES user(id)
    FOREIGN KEY (questions_id) REFERENCES quetsions(id)
)



