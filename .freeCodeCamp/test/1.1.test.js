const assert = require('assert');
const { Client } = require('pg');

const connectionString = 'postgresql://postgres@localhost:5432/universe';
const client = new Client({
  connectionString: connectionString,
});

describe('SUBTASKS 1.1', async () => {
  before(async () => {
    try {
      await client.connect();
    } catch (error) {
      throw new Error('Cannot connect to psql\n' + error);
    }
  });

  after(async () => {
    await client.end();
    console.log('client connection ended');
  });

  it(':1 "universe" database should exist', async () => {
    const queryDatabases = 'SELECT datname FROM pg_database';
    const databasesRes = await client.query(queryDatabases);

    if (!databasesRes) assert(false);

    const universeIndex = databasesRes.rows.findIndex(row => {
      return row.datname === 'universe';
    });

    assert(universeIndex >= 0);
  });

  it(':2 "galaxy", "star", "planet" and "moon" tables should exist', async () => {
    const queryTables = `SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name`;
    const tablesRes = await client.query(queryTables);

    if (!tablesRes) assert(false);

    const galaxyIndex = tablesRes.rows.findIndex(row => {
      return row.table_name === 'galaxy';
    });

    const starIndex = tablesRes.rows.findIndex(row => {
      return row.table_name === 'star';
    });

    const planetIndex = tablesRes.rows.findIndex(row => {
      return row.table_name === 'planet';
    });

    const moonIndex = tablesRes.rows.findIndex(row => {
      return row.table_name === 'moon';
    });

    assert(galaxyIndex >= 0 && starIndex >= 0 && planetIndex >= 0 && moonIndex >= 0);
  });

  it(':3 All tables should have a primary key', async () => {
    const queryPrimaryKeys = `SELECT c.column_name, c.ordinal_position FROM information_schema.key_column_usage AS c LEFT JOIN information_schema.table_constraints AS t ON t.constraint_name = c.constraint_name WHERE t.constraint_type = 'PRIMARY KEY'`;
    const queryTables = `SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name`;
    const primaryKeysRes = await client.query(queryPrimaryKeys);
    const tablesRes = await client.query(queryTables);

    if (!primaryKeysRes || !tablesRes) assert(false);

    const numberOfPrimaryKeys = primaryKeysRes.rows.length;
    const numberOfTables = tablesRes.rows.length;

    assert(numberOfTables >= 1 && numberOfTables === numberOfPrimaryKeys);
  });

  it(':4 All primary keys should automatically increment', async () => {
    const queryPrimaryKeys = `SELECT c.table_name, c.column_name FROM information_schema.key_column_usage AS c LEFT JOIN information_schema.table_constraints AS t ON t.constraint_name = c.constraint_name WHERE t.constraint_type = 'PRIMARY KEY'`;
    const queryColumns = `SELECT table_name, column_name, column_default FROM INFORMATION_SCHEMA.COLUMNS WHERE table_schema = 'public'`;
    const primaryKeysRes = await client.query(queryPrimaryKeys);
    const columnsRes = await client.query(queryColumns);

    if (!primaryKeysRes || !columnsRes) assert(false);

    primaryKeysRes.rows.forEach(row => {
      const filteredCols = columnsRes.rows.filter(col => {
        return row.table_name === col.table_name && row.column_name === col.column_name;
      });

      if (filteredCols.column_default === null) assert(false);
    });

    assert(primaryKeysRes.rows.length > 0);
  });

  it(':5 All tables should have a "name" column', async () => {
    const queryTables = `SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name`;
    const queryTablesWithNameColumn = `SELECT t.table_schema, t.table_name FROM information_schema.tables t INNER JOIN information_schema.columns c on c.table_name = t.table_name AND c.table_schema = t.table_schema WHERE c.column_name = 'name' AND t.table_schema NOT IN ('information_schema', 'pg_catalog') AND t.table_type = 'BASE TABLE' ORDER BY t.table_schema`;
    const tablesRes = await client.query(queryTables);
    const tablesWithNameColumnRes = await client.query(queryTablesWithNameColumn);

    if (!tablesRes || !tablesWithNameColumnRes) assert(false);

    assert(tablesRes.rows.length >= 1 && tablesRes.rows.length === tablesWithNameColumnRes.rows.length);
  });

  it(':6 "INT" data type should be used on two columns that aren\'t a key', async () => {
    const queryKeys = `SELECT c.column_name, c.table_name FROM information_schema.key_column_usage AS c LEFT JOIN information_schema.table_constraints AS t ON t.constraint_name = c.constraint_name WHERE t.constraint_type = 'PRIMARY KEY' OR t.constraint_type = 'FOREIGN KEY'`;
    const queryIntegerColumns = `SELECT table_name, column_name, data_type FROM information_schema.columns WHERE table_schema = 'public' AND data_type = 'integer'`;
    const keysRes = await client.query(queryKeys);
    const integerColumnsRes = await client.query(queryIntegerColumns);

    if (!keysRes || !integerColumnsRes) assert(false);
    
    let intKeys = 0;
    integerColumnsRes.rows.forEach(intRow => {
      const isIntKey = keysRes.rows.find(keyRow => {
        return (intRow.table_name == keyRow.table_name) && (intRow.column_name == keyRow.column_name);
      });

      if(isIntKey) {
        intKeys++;
      }
    });

    assert(integerColumnsRes.rows.length - intKeys >= 2);
  });

  it(':7 "NUMERIC" data type should be used at least once', async () => {
    const queryNumericColumns = `SELECT table_name, column_name, column_default, data_type FROM information_schema.columns WHERE table_schema = 'public' AND data_type = 'numeric'`;
    const numericColumnsRes = await client.query(queryNumericColumns);

    if (!numericColumnsRes) assert(false);

    assert(numericColumnsRes.rows.length >= 1);
  });

  it(':8 "TEXT" data type should be used at least once', async () => {
    const queryDateColumns = `SELECT table_name, column_name, column_default, data_type FROM information_schema.columns WHERE table_schema = 'public' AND data_type = 'text'`;
    const dateColumnsRes = await client.query(queryDateColumns);

    if (!dateColumnsRes) assert(false);

    assert(dateColumnsRes.rows.length >= 1);
  });

  it(':9 "BOOLEAN" data type should be used on at least two columns', async () => {
    const queryBooleanColumns = `SELECT table_name, column_name, column_default, data_type FROM information_schema.columns WHERE table_schema = 'public' AND data_type = 'boolean'`;
    const booleanColumnsRes = await client.query(queryBooleanColumns);

    if (!booleanColumnsRes) assert(false);

    assert(booleanColumnsRes.rows.length >= 2);
  });

  it(':10 Each "star" row should have a foreign key that references one of the "galaxy" rows', async () => {
    const queryForeignKeys = `SELECT tc.table_schema, tc.constraint_name, tc.table_name, kcu.column_name, ccu.table_name AS foreign_table_name, ccu.column_name AS foreign_column_name FROM information_schema.table_constraints tc JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY'`;
    const foreignKeysRes = await client.query(queryForeignKeys);
    const queryStarRows = `SELECT * FROM star`;
    const starRowsRes = await client.query(queryStarRows);

    if (!foreignKeysRes || !starRowsRes) assert(false);

    const foreignKey = foreignKeysRes.rows.filter(row => {
      return row.table_name === 'star' && row.foreign_table_name === 'galaxy';
    });

    const rowsWithoutKey = starRowsRes.rows.filter(row => {
      return row[foreignKey[0].column_name] === null;
    });

    if (rowsWithoutKey.length > 0) assert(false);

    assert(starRowsRes.rows.length >= 1);
  });

  it(':11 Each "planet" row should have a foreign key that references one of the "star" rows', async () => {
    const queryForeignKeys = `SELECT tc.table_schema, tc.constraint_name, tc.table_name, kcu.column_name, ccu.table_name AS foreign_table_name, ccu.column_name AS foreign_column_name FROM information_schema.table_constraints tc JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY'`;
    const foreignKeysRes = await client.query(queryForeignKeys);
    const queryPlanetRows = `SELECT * FROM planet`;
    const planetRowsRes = await client.query(queryPlanetRows);

    if (!foreignKeysRes || !planetRowsRes) assert(false);

    const foreignKey = foreignKeysRes.rows.filter(row => {
      return row.table_name === 'planet' && row.foreign_table_name === 'star';
    });

    const rowsWithoutKey = planetRowsRes.rows.filter(row => {
      return row[foreignKey[0].column_name] === null;
    });

    if (rowsWithoutKey.length > 0) assert(false);

    assert(planetRowsRes.rows.length >= 1);
  });

  it(':12 Each "moon" row should have a foreign key that references one of the "planet" rows', async () => {
    const queryForeignKeys = `SELECT tc.table_schema, tc.constraint_name, tc.table_name, kcu.column_name, ccu.table_name AS foreign_table_name, ccu.column_name AS foreign_column_name FROM information_schema.table_constraints tc JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY'`;
    const foreignKeysRes = await client.query(queryForeignKeys);
    const queryMoonRows = `SELECT * FROM moon`;
    const moonRowsRes = await client.query(queryMoonRows);

    if (!foreignKeysRes || !moonRowsRes) assert(false);

    const foreignKey = foreignKeysRes.rows.filter(row => {
      return row.table_name === 'moon' && row.foreign_table_name === 'planet';
    });

    const rowsWithoutKey = moonRowsRes.rows.filter(row => {
      return row[foreignKey[0].column_name] === null;
    });

    if (rowsWithoutKey.length > 0) assert(false);

    assert(moonRowsRes.rows.length >= 1);
  });

  it(':13 "universe" database should have at least five tables', async () => {
    const queryTables = `SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name`;
    const tablesRes = await client.query(queryTables);

    if (!tablesRes) assert(false);

    assert(tablesRes.rows.length >= 5);
  });

  it(':14 Each table should have at least three rows', async () => {
    const queryTables = `SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name`;
    const tablesRes = await client.query(queryTables);

    if (!tablesRes) assert(false);

    for (const row of tablesRes.rows) {
      const queryAllRows = `SELECT * From ${row.table_name}`;
      const allRowsRes = await client.query(queryAllRows);

      if (!allRowsRes || allRowsRes.rows.length < 3) assert(false);
    }

    assert(tablesRes.rows.length >= 1);
  });

  it(':15 The "galaxy" and "star" tables should each have at least six rows', async () => {
    const queryGalaxyRows = `SELECT * FROM galaxy`;
    const queryStarRows = `SELECT * FROM star`;
    const galaxyRowsRes = await client.query(queryGalaxyRows);
    const starRowsRes = await client.query(queryStarRows);

    if (!galaxyRowsRes || !starRowsRes) assert(false);

    assert(galaxyRowsRes.rows.length >= 6 && starRowsRes.rows.length >= 6);
  });

  it(':16 The "planet" table should have at least 12 rows', async () => {
    const queryPlanetRows = `SELECT * FROM planet`;
    const planetRowsRes = await client.query(queryPlanetRows);

    if (!planetRowsRes) assert(false);

    assert(planetRowsRes.rows.length >= 12);
  });

  it(':17 The "moon" table should have at least 20 rows', async () => {
    const queryMoonRows = `SELECT * FROM moon`;
    const moonRowsRes = await client.query(queryMoonRows);

    if (!moonRowsRes) assert(false);

    assert(moonRowsRes.rows.length >= 20);
  });

  it(':18 Each table should have at least three columns', async () => {
    const queryTablesAndColumns = `SELECT t.table_name, array_agg(c.column_name::text) AS columns FROM information_schema.tables t INNER JOIN information_schema.columns c ON t.table_name = c.table_name WHERE t.table_schema = 'public' AND t.table_type= 'BASE TABLE' AND c.table_schema = 'public' GROUP BY t.table_name`;
    const tablesAndColumnsRes = await client.query(queryTablesAndColumns);

    if (!tablesAndColumnsRes) assert(false);

    const tablesWithLessThanThreeColumns = tablesAndColumnsRes.rows.filter(row => {
      return row.columns.length < 3;
    });

    assert(tablesAndColumnsRes.rows.length >= 1 && tablesWithLessThanThreeColumns.length <= 0);
  });

  it(':19 The "galaxy", "star", "planet" and "moon" should each have at least five columns', async () => {
    const queryTablesAndColumns = `SELECT t.table_name, array_agg(c.column_name::text) AS columns FROM information_schema.tables t INNER JOIN information_schema.columns c ON t.table_name = c.table_name WHERE t.table_schema = 'public' AND t.table_type= 'BASE TABLE' AND c.table_schema = 'public' GROUP BY t.table_name`;
    const tablesAndColumnsRes = await client.query(queryTablesAndColumns);

    if (!tablesAndColumnsRes) assert(false);

    const tableNames = ['galaxy', 'star', 'planet', 'moon'];
    const filteredTables = tablesAndColumnsRes.rows.filter(row => {
      return row.columns.length >= 5 && tableNames.includes(row.table_name);
    });

    assert(filteredTables.length >= 4);
  });

  it(':20 At least two columns in each table should have the "NOT NULL" constraint', async () => {
    const queryNotNullColumns = `SELECT DISTINCT column_name, table_name FROM INFORMATION_SCHEMA.COLUMNS WHERE table_schema = 'public' AND is_nullable='NO'`;
    const queryTables = `SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name`;
    const notNullColumnsRes = await client.query(queryNotNullColumns);
    const tablesRes = await client.query(queryTables);

    if (!notNullColumnsRes || !tablesRes) assert(false);

    tablesRes.rows.forEach(row => {
      const notNullColumns = notNullColumnsRes.rows.filter(col => {
        return col.table_name === row.table_name;
      });

      if (notNullColumns.length < 2) assert(false);
    });

    assert(tablesRes.rows.length > 0);
  });

  it(':21 At least one column in each table should have the "UNIQUE" constraint', async () => {
    const queryUniqueColumns = `SELECT c.column_name, c.table_name FROM information_schema.key_column_usage AS c LEFT JOIN information_schema.table_constraints AS t ON t.constraint_name = c.constraint_name WHERE t.constraint_type = 'UNIQUE'`;
    const queryTables = `SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name`;
    const uniqueColumnsRes = await client.query(queryUniqueColumns);
    const tablesRes = await client.query(queryTables);

    if (!uniqueColumnsRes || !tablesRes) assert(false);

    tablesRes.rows.forEach(row => {
      const index = uniqueColumnsRes.rows.findIndex(col => {
        return col.table_name === row.table_name;
      });

      if (index < 0) assert(false);
    });

    assert(tablesRes.rows.length > 0);
  });

  it(':22 All columns named "name" should be of type "VARCHAR"', async () => {
    const queryNameColumns = `SELECT table_name, column_name, column_default, data_type FROM information_schema.columns WHERE table_schema = 'public' AND column_name = 'name'`;
    const nameColumnsRes = await client.query(queryNameColumns);

    if (!nameColumnsRes) assert(false);

    const varcharNameColumns = nameColumnsRes.rows.filter(row => {
      return row.data_type === 'character varying';
    });

    assert(nameColumnsRes.rows.length >= 1 && varcharNameColumns.length === nameColumnsRes.rows.length);
  });

  it(':23 Each primary key should have the correct naming convention', async () => {
    const queryPrimaryKeys = `SELECT c.column_name, c.table_name FROM information_schema.key_column_usage AS c LEFT JOIN information_schema.table_constraints AS t ON t.constraint_name = c.constraint_name WHERE t.constraint_type = 'PRIMARY KEY'`;
    const primaryKeysRes = await client.query(queryPrimaryKeys);

    if (!primaryKeysRes) assert(false);

    primaryKeysRes.rows.forEach(row => {
      if (row.table_name + '_id' !== row.column_name) assert(false);
    });

    assert(primaryKeysRes.rows.length >= 1);
  });

  it(':24 Each foreign key column should share a name with the column it is referencing', async () => {
    const queryForeignKeys = `SELECT tc.table_schema, tc.constraint_name, tc.table_name, kcu.column_name, ccu.table_name AS foreign_table_name, ccu.column_name AS foreign_column_name FROM information_schema.table_constraints tc JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY'`;
    const foreignKeysRes = await client.query(queryForeignKeys);

    if (!foreignKeysRes) assert(false);

    foreignKeysRes.rows.forEach(row => {
      if (row.column_name !== row.foreign_column_name) assert(false);
    });

    assert(foreignKeysRes.rows.length >= 1);
  });
});
