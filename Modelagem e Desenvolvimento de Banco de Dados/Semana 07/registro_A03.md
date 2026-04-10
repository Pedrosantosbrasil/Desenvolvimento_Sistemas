CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(11)
);

CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Itens_Pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Inserção de dados
INSERT INTO Clientes (nome, cpf) VALUES ('Bruno', '12345678901');
INSERT INTO Produto (nome, preco) VALUES ('Mouse Gamer', 150.00);
INSERT INTO Pedido (id_cliente) VALUES (1);
INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade) VALUES (1, 1, 2);

-- Atualização de preço
UPDATE Produto SET preco = 130.00 WHERE id_produto = 1;

SELECT 
    Clientes.nome AS Nome_Cliente,
    Clientes.cpf AS CPF,
    Pedido.id_pedido AS Numero_Pedido,
    Produto.nome AS Nome_Produto,
    Produto.preco AS Preco_Unitario,
    Itens_Pedido.quantidade AS Quantidade,
    (Produto.preco * Itens_Pedido.quantidade) AS Valor_Total_Item
FROM Clientes
JOIN Pedido ON Clientes.id_cliente = Pedido.id_cliente
JOIN Itens_Pedido ON Pedido.id_pedido = Itens_Pedido.id_pedido
JOIN Produto ON Itens_Pedido.id_produto = Produto.id_produto;