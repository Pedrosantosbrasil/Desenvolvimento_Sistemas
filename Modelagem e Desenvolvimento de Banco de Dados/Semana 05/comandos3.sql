-- database: ./db3.sqlite

-- Criar tabela
CREATE TABLE Clientes (
    ClienteID INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT,
    Email TEXT,
    Cidade TEXT,
    Idade INTEGER
);

-- Inserir alguns dados
INSERT INTO Clientes (Nome, Email, Cidade, Idade)
VALUES 
('Pedro', 'pedro@email.com', 'São Paulo', 26),
('Ana', 'ana@email.com', 'São Paulo', 35),
('Carlos', 'carlos@email.com', 'Rio de Janeiro', 40),
('Maria', 'maria@email.com', 'São Paulo', 50);

-- Ver todos os dados
SELECT * FROM Clientes;

-- Atualizar o email de um cliente específico
UPDATE Clientes
SET Email = 'novo.email@example.com'
WHERE ClienteID = 1;

-- Atualizar cidade de clientes que moram em São Paulo e têm mais de 30 anos
UPDATE Clientes
SET Cidade = 'Porto Alegre'
WHERE Cidade = 'São Paulo' AND Idade > 30;

-- Verificar o resultado depois do UPDATE
SELECT * FROM Clientes;
