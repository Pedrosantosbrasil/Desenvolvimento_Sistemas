-- database: ./db.sqlite

CREATE TABLE
  usuarios (id, nome);

INSERT INTO
  usuarios (id, nome)
VALUES
  (1, 'Pedro');

CREATE TABLE
  clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
  );

ALTER TABLE clientes
ADD COLUMN telefone VARCHAR(15);

DROP TABLE clientes;

SELECT
  *
FROM
  clientes;

INSERT INTO
  clientes (id, nome, email)
VALUES
  (1, 'João Silva', 'joao@email.com');

UPDATE clientes
SET
  email = 'novoemail@email.com'
WHERE
  id = 1;

UPDATE clientes
SET
  email = 'pedro@email.com'
WHERE
  id = 1;

DELETE FROM clientes
WHERE
  id = 1;

SELECT
  nome,
  email
FROM
  clientes;

-- GRANT
-- SELECT
-- ,
--   INSERT ON clientes TO usuario1;

-- REVOKE INSERT ON clientes
-- FROM
--   usuario1;

-- 1. Inicia a transação (abre o rascunho)
-- BEGIN TRANSACTION;

-- -- 2. Faz as alterações (DML)
-- INSERT INTO clientes (nome, email) VALUES ('Ana', 'ana@email.com');
-- UPDATE contas SET saldo = saldo - 100 WHERE id = 1;

-- -- 3. Agora você escolhe:
-- COMMIT;   -- Salva tudo permanentemente
-- -- OU
-- ROLLBACK; -- Desfaz tudo e volta ao que era antes

