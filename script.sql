IF OBJECT_ID('Movimento') IS NOT NULL DROP TABLE Movimento; -- Exclua Movimento primeiro
GO
IF OBJECT_ID('Produto') IS NOT NULL DROP TABLE Produto;
GO
IF OBJECT_ID('Usuários') IS NOT NULL DROP TABLE Usuários;
GO
IF OBJECT_ID('Pessoas') IS NOT NULL DROP TABLE Pessoas;
GO


-- Criando as tabelas
CREATE TABLE Produto (
    idProduto INTEGER NOT NULL IDENTITY,
    nome VARCHAR(255) NOT NULL,
    quantidade INTEGER NOT NULL DEFAULT 0,
    precoVenda NUMERIC NOT NULL DEFAULT 0.0,
    PRIMARY KEY(idProduto)
);
GO

CREATE TABLE Usuários (
    idUsuario INT NOT NULL IDENTITY,
    nomeUsuario VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    PRIMARY KEY(idUsuario)
);
GO

CREATE TABLE Pessoas (
    idPessoas INTEGER NOT NULL IDENTITY,
    nome VARCHAR(255) NOT NULL,
    logradouro VARCHAR(255),
    cidade VARCHAR(255),
    estado CHAR(2),
    telefone VARCHAR(11),
    email VARCHAR(255),
    PRIMARY KEY(idPessoas)
);
GO

CREATE TABLE Movimento (
    idMovimento INTEGER NOT NULL IDENTITY,
    Usuários_idUsuario INT NOT NULL,
    Pessoas_idPessoas INTEGER NOT NULL,
    Produto_idProduto INTEGER NOT NULL,
    quantidades INTEGER NOT NULL,
    tipo CHAR(1) DEFAULT ' ', -- Definindo tamanho para CHAR
    valorUnitario NUMERIC NOT NULL DEFAULT 0.0,
    PRIMARY KEY(idMovimento),
    FOREIGN KEY(Usuários_idUsuario) REFERENCES Usuários(idUsuario),
    FOREIGN KEY(Pessoas_idPessoas) REFERENCES Pessoas(idPessoas),
    FOREIGN KEY(Produto_idProduto) REFERENCES Produto(idProduto)
);
GO

-- Criando os índices
CREATE INDEX Movimento_FKIndex1 ON Movimento (Usuários_idUsuario);
GO
CREATE INDEX Movimento_FKIndex2 ON Movimento (Pessoas_idPessoas);
GO
CREATE INDEX Movimento_FKIndex3 ON Movimento (Produto_idProduto);
GO