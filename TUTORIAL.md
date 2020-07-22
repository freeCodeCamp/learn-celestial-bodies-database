# Build a Universe Project

> Welcome! Are you ready to build a database of the universe?

## 1. Instructions

For this project, you need to log in to psql. Do that by entering `psql -U freecodecamp postgres` in the terminal. Be sure to get creative, and have fun! **Don't forget to connect to your database after you create it** :smile:

Here's some ideas for other column and table names: `description`, `has_life`, `is_spherical`, `age_in_millions_of_years`, `planet_types`, `galaxy_types`, `distance_from_earth`.

You can export your database at any time by entering `sudo pg_dump -U freecodecamp universe > universe.sql` from a terminal (not the psql prompt). It will save your database to `universe.sql`. Then, you can save that file to your computer and use it to recreate the database.

### 1.1

Complete all the tasks below

#### SUBTASKS

- You should create a database named `universe`
- You should have tables named `galaxy`, `star`, `planet`, and `moon`
- Each table should have a unique primary key
- Each primary key should automatically increment
- Each table should have a `name` column
- You should use the `INT` data type for at least two columns that are not a primary or foreign key
- You should use the `NUMERIC` data type
- You should use the `TEXT` data type
- You should use the `BOOLEAN` data type on at least two columns
- Each "star" should have a foreign key that references one of the rows in `galaxy`
- Each "planet" should have a foreign key that references one of the rows in `star`
- Each "moon" should have a foreign key that references one of the rows in `planet`
- Your database should have at least five tables
- Each table should have at least three rows
- The `galaxy` and `star` tables should each have at least six rows
- The `planet` table should have at least 12 rows
- The `moon` table should have at least 20 rows
- Each table should have at least three columns
- The `galaxy`, `star`, `planet`, and `moon` tables should each have at least five columns
- At least two columns per table should not accept `NULL` values
- At least one column from each table should be required to be `UNIQUE`
- All columns named `name` should be of type `VARCHAR`
- Each primary key column should follow the naming convention `table_name_id`. For example, the `moon` table should have a primary key columm named `moon_id`
- Each foreign key column should have the same name as the column it is referencing
