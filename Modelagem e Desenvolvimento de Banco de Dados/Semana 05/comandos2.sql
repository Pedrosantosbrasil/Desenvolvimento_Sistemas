-- database: ./db2.sqlite
CREATE TABLE
  clientes2 (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    email TEXT
  );

BEGIN TRANSACTION;

INSERT INTO
  clientes2 (nome, email)
VALUES
  ('Ana', 'ana@email.com');

UPDATE clientes2
SET
  email = 'novo@email.com'
WHERE
  id = 1;

COMMIT;

ROLLBACK;
