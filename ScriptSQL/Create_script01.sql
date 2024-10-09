USE Loja;
GO

CREATE SEQUENCE orderPessoa
as INT
START WITH 1
INCREMENT BY 1;

CREATE TABLE Pessoa (
  idPessoa INTEGER  NOT NULL,
  nome VARCHAR(255),
  logradouro VARCHAR(255),
  cidade VARCHAR(255),
  estado CHAR(2),
  telefone VARCHAR(15),
  email VARCHAR(255),
  PRIMARY KEY(idPessoa));
GO

CREATE TABLE PessoaFisica (
  Pessoa_idPessoa INTEGER  NOT NULL,
  cpf VARCHAR(11)  NOT NULL,
  PRIMARY KEY(Pessoa_idPessoa),
  FOREIGN KEY(Pessoa_idPessoa) REFERENCES Pessoa(idPessoa)
  ON UPDATE CASCADE
  ON DELETE CASCADE
  );
GO

CREATE TABLE PessoaJuridica (
  Pessoa_idPessoa INTEGER  NOT NULL,
  cnpj VARCHAR(14)  NOT NULL,
  PRIMARY KEY(Pessoa_idPessoa),
  FOREIGN KEY(Pessoa_idPessoa) REFERENCES Pessoa(idPessoa)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);
GO

CREATE TABLE Usuario (
  idUsuario INTEGER  NOT NULL IDENTITY,
  nome VARCHAR(20) NOT NULL,
  senha VARCHAR(20) NOT NULL,
  PRIMARY KEY(idUsuario));
GO

CREATE TABLE Produto (
  idProduto INTEGER  NOT NULL IDENTITY,
  nome VARCHAR(255),
  quantidade INTEGER,
  precoVenda NUMERIC,
  PRIMARY KEY(idProduto));
GO

CREATE TABLE Movimento (
  idMovimento INTEGER  NOT NULL IDENTITY,
  Pessoa_idPessoa INTEGER  NOT NULL,
  Usuario_idUsuario INTEGER  NOT NULL,
  Produto_idProduto INTEGER  NOT NULL,
  quantidade INTEGER,
  tipo CHAR(1),
  valorUnitario NUMERIC,
PRIMARY KEY(idMovimento)      ,
  FOREIGN KEY(Produto_idProduto)
    REFERENCES Produto(idProduto)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
  FOREIGN KEY(Usuario_idUsuario)
    REFERENCES Usuario(idUsuario)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa)
	ON UPDATE CASCADE
	ON DELETE CASCADE);
GO

select * from produto;
