# Build a Universe Project

> Intro

## 1. Subtask Example

For this project, you need to log in to psql as `freeCodeCamp`. Do that by entering `sudo -u freeCodeCamp psql` in the terminal. Do not change any of the user settings. Be sure to get creative, and have fun!

### 1.1

Complete all the tasks below

#### SUBTASKS

- You should create a database named `universe`
- You should have tables named `galaxy`, `star`, `planet`, and `moon`
- Each table should have a unique primary key
- Each primary key should be of type `SERIAL`
- Each table should have a `name` column that is a `VARCHAR`
- You should use the `INT` data type on at least two columns that are not a primary or foreign key
- You should use the `NUMERIC` data type
- You should use the `DATE` data type
- You should use the `BOOLEAN` data type on at least two columns
- Each star should have a foreign key that references one of the galaxies
- Each planet should have a foreign key that references one of the stars
- Each moon should have a foreign key that references one of the planets
- Your database should have at least five tables
- Each table should have at least six rows
- The `planet` table should have at least 12 rows
- The `moon` table should have at least 20 rows
- The required tables should each have at least five columns
- Each table should have at least 3 columns
- You should not have more than one column per table that accepts `NULL` values
- No rows should have empty fields
- At least two columns from each table should be `UNIQUE`
- Each primary key should follow the naming convention `table_name_id`. For example, the `moon` table should have a primary key named `moon_id`
