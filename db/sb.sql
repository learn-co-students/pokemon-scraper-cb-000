.read db/schema_migration.sql
.read db/alter_table_migration.sql
.header ON

INSERT INTO pokemon (name, type) VALUES
  ('Pikachu', 'electric'),
  ('Kaju', 'dog'),
  ('Another', 'dog');
