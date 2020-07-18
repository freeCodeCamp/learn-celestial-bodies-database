# Build a Universe Project

> Intro

## 1. Subtask Example

For this project, you need to start psql and log in as `postgres`. Start the service with `sudo service postgresql start`. Log in with `sudo -u postgres psql`. Do not change any of the user settings. Be sure to get creative, and have fun!

### 1.1

Complete all the tasks below

#### SUBTASKS

- You should create a database named `universe`
- Your database should have at least five tables
- You should have tables named `galaxy`, `star`, `planet`, and `moon`
- Each table should have a unique primary key that follows the naming convention: `tablename_id`. For example, the `moon` table should have a `moon_id` column
- Each primary key should be of type `SERIAL`
- Each table should have a name column that is a `VARCHAR`
- Each table should have at least four columns
- Each table should have a column of type `INT`
- At least one of your tables should have a column of type `numeric`
- At least one of your tables should have a column of type `date`
- At least one of your tables should have a column of type `boolean`
- You should not have more than one column per table that accepts `NULL` values
- At least two columns from each table should be `UNIQUE`
- Each star should have a foreign key that links to one of the galaxies
- Each planet should have a foreign key that links to one of the stars
- Each moon should have a foreign key that links to one of the planets
- Each table should have at least five rows
- The `star` table should have at least 10 rows
- The `planet` table should have at least 15 rows
- The `moon` table should have at least 20 rows
- No rows should have empty fields
