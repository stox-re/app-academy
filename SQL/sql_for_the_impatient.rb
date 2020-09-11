# Common Data Types to store in SQL columns

BOOLEAN
INT
FLOAT (stores "floating point" numbers)
VARCHAR(255) (essentialy a string with a length limit of 255 chars)
TEXT (a string of unlimited length)
DATE
DATETIME
TIME
BLOB (non-textual, binary data; e.g., an image)


# Selecting for a blog posts table
# A foreign key is a value in a database table whose responsibility is to point to a row in a different table
SELECT
  *
FROM
  posts
WHERE
  posts.user_id = 5
# We usually call the column that houses the foreign key [other_table_name_singularized]_id.

# Find crazy cat people
SELECT
  name, age, has_cats
FROM
  tenants
WHERE
  (has_cats = true AND age > 50)

# There are 4 main data manipulation operations that SQL provides:
SELECT: retrieve values from one or more rows
INSERT: insert a row into a table
UPDATE: update values in one or more existing rows
DELETE: delete one or more rows

# ---------------- SELECT ----------------
SELECT
  one or more columns (or all columns with *)
FROM
  one (or more tables, joined with JOIN)
WHERE
  one (or more conditions, joined with AND/OR);

# Examples
SELECT
  *
FROM
  users
WHERE
  name = 'Ned';
# ---
SELECT
  account_number, account_type
FROM
  accounts
WHERE
  (customer_id = 5 AND account_type = 'checking');

# ---------------- INSERT ----------------
INSERT INTO
  table name (column names)
VALUES
  (values);

# Examples
INSERT INTO
  users (name, age, height_in_inches)
VALUES
  ('Santa Claus', 876, 34);
# ---
INSERT INTO
  accounts (account_number, customer_id, account_type)
VALUES
  (12345, 76, 'savings');

# ---------------- UPDATE ----------------
UPDATE
  table_name
SET
  col_name1 = value1,
  col_name2 = value2
WHERE
  conditions

# Examples
UPDATE
  users
SET
  name = 'Eddard Stark', house = 'Winterfell'
WHERE
  name = 'Ned Stark';
# ---
UPDATE
  accounts
SET
  balance = 30
WHERE
  id = 6;

# ---------------- DELETE ----------------
DELETE FROM
  table_name
WHERE
  conditions

# Examples
DELETE FROM
  users
WHERE
  (name = 'Eddard Stark' AND house = 'Winterfell');
# ---
DELETE FROM
  accounts
WHERE
  customer_id = 666;

# Creating a table
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  birth_date DATE,
  house VARCHAR(255),
  favorite_food VARCHAR(20)
);

# Quering across multiple tables
# Let's write a query that returns the title of all the blog posts written by each user:
SELECT
  users.name, posts.title
FROM
  posts
JOIN
  users ON posts.user_id = users.id

# Example of multi join for posts that users can like
SELECT
  users.name, posts.title
FROM
  posts
JOIN
  likes ON posts.id = likes.post_id
JOIN
  users ON likes.user_id = users.id