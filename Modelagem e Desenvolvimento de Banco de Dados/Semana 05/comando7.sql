-- database: ./db7.sqlite

CREATE TABLE Veiculos (
    VeiculoID INT PRIMARY KEY AUTO_INCREMENT,
    Modelo VARCHAR(100),
    Marca VARCHAR(100),
    Ano INT,
    Status VARCHAR(20),
    PrecoDiaria DECIMAL(10, 2)
);

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Cidade VARCHAR(50),
    Idade INT,
    CategoriaCliente VARCHAR(20)
);