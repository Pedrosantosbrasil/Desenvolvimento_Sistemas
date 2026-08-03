-- database: ./db5.sqlite
CREATE TABLE
  Veiculos (
    VeiculoID INT PRIMARY KEY,
    Modelo VARCHAR(100),
    Marca VARCHAR(100),
    Ano INT,
    Status VARCHAR(20),
    PrecoDiaria DECIMAL(10, 2)
  );

INSERT INTO
  Veiculos (
    VeiculoID,
    Modelo,
    Marca,
    Ano,
    Status,
    PrecoDiaria
  )
VALUES
  (
    1,
    'Onix',
    'Chevrolet',
    2019,
    'Disponível',
    120.00
  ),
  (2, 'Civic', 'Honda', 2021, 'Disponível', 200.50),
  (
    3,
    'Corolla',
    'Toyota',
    2018,
    'Disponível',
    180.75
  ),
  (
    4,
    'Gol',
    'Volkswagen',
    2020,
    'Disponível',
    100.00
  ),
  (5, 'Fiesta', 'Ford', 2017, 'Disponível', 90.00);

CREATE TABLE
  Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Cidade VARCHAR(50),
    Idade INT,
    CategoriaCliente VARCHAR(20),
    TempoAssociacao INT
  );

INSERT INTO
  Clientes (
    ClienteID,
    Nome,
    Email,
    Cidade,
    Idade,
    CategoriaCliente,
    TempoAssociacao
  )
VALUES
  (
    1,
    'Pedro Yokada',
    'pedro@email.com',
    'Barueri',
    26,
    'Prata',
    6
  ),
  (
    2,
    'Ana Silva',
    'ana@email.com',
    'São Paulo',
    35,
    'Prata',
    7
  ),
  (
    3,
    'Carlos Souza',
    'carlos@email.com',
    'São Paulo',
    45,
    'Prata',
    3
  ),
  (
    4,
    'Maria Oliveira',
    'maria@email.com',
    'Porto Alegre',
    50,
    'Prata',
    2
  ),
  (
    5,
    'João Santos',
    'joao@email.com',
    'Rio de Janeiro',
    30,
    'Prata',
    5
  );

SELECT
  *
FROM
  Clientes;

SELECT
  *
FROM
  Veiculos;

DROP TABLE Clientes;

DROP TABLE Veiculos;
