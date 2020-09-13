/*PRAGMA foreign_keys = ON;*/

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions
(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE question_follows
(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (question_id) REFERENCES questions (id)
);

CREATE TABLE replies
(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  author_user_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  body TEXT NOT NULL,

  FOREIGN KEY (author_user_id) REFERENCES users (id),
  FOREIGN KEY (question_id) REFERENCES questions (id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies (id)
);

CREATE TABLE question_likes
(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (question_id) REFERENCES questions (id)
);

INSERT INTO users (fname, lname)
VALUES
  ('Kieth', 'McNiel'),
  ('Sophie', 'Lacoste'),
  ('Daniel', 'Smith');

INSERT INTO questions (title, body, user_id)
VALUES
  ('SQL Question needing help', 'How do I join tables?', 1),
  ('Where do I find the dev tools in chrome?', 'I can''t seem to find it.', 2),
  ('How do I make this responsive?', 'I''m trying to use flexbox.', 2),
  ('How do I create a new sqlite3 database?', 'I can''t seem to pipe my cat output to sqlite3.', 3),
  ('What is better, frontend or backend?', 'I can''t seem to decide.', 3);

INSERT INTO question_follows (user_id, question_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 4),
  (2, 5),
  (3, 2);

INSERT INTO replies (question_id, body, author_user_id, parent_reply_id)
VALUES
  (1, "Try using JOIN ON.", 2, NULL),
  (1, "That should work.", 3, 1),
  (1, "Yup, works great.", 1, 2),
  (3, "Just use floats, why not?.", 1, NULL),
  (3, "Flexbox should work but you need to use a media query for smaller devices.", 3, 1),
  (5, "I think frontend is more fun.", 1, NULL);

INSERT INTO question_likes (user_id, question_id)
VALUES
  (1, 3),
  (1, 5),
  (2, 3),
  (2, 5),
  (3, 1),
  (3, 2);