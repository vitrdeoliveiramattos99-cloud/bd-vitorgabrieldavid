-- Aula 02 - Criando as tabelas
-- Enunciado: exercicios/enunciados/aula02-ddl.md
--
-- Escreva a resposta de cada exercicio embaixo do marcador dele.
-- Nao apague os marcadores, nao troque a ordem.
-- Cada bloco roda num banco em branco: crie o que voce for usar.

-- ex1
CREATE TABLE LIVRO(
    id INTEGER PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    ano INTEGER
    exemplares INTEGER NOT NULL DEFAULT 1
);


-- ex2
CREATE TABLE LEITOR(
    id INTEGER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL

    INSERT INTO LEITOR (id, nome) 
    VALUES (01, Vitor);

    INSERT INTO LEITOR (id, nome) 
    VALUES (02, Ana);

    INSERT INTO LEITOR (id, nome) 
    VALUES (03, Julia);

    ALTER TABLE LEITOR 
    ADD Telefone VARCHAR(20);

    SELECT * FROM LEITOR
);


-- ex3
CREATE TABLE EMPRESTIMO(
    id INTEGER PRIMARY KEY,
    id_livro INTEGER NOT NULL
);

INSERT INTO EMPRESTIMO (id, id_livro)
VALUES (01, 01);

INSERT INTO EMPRESTIMO (id, id_livro)
VALUES (02, 02);

ALTER TABLE Emprestimo
ADD situacao TEXT NOT NULL DEFAULT 'desconhecido'


-- ex4
CREATE TABLE EDITORA(
    id INTEGER,
    nm VARCHAR(255)
);

INSERT INTO EDITORA (id, nm)
VALUES (01, Companhia das Letras);

ALTER TABLE EDITORA
RENAME COLUMN nm TO nome

SELECT * FROM Editora


-- ex5
CREATE TABLE RASCUNHO(
    id INTEGER PRIMARY KEY,
    texto TEXT
);

INSERT INTO RASCUNHO
VALUES(01, XXX);

INSERT INTO RASCUNHO
VALUES(02, XXX);

INSERT INTO RASCUNHO
VALUES(03, XXX);

DELETE FROM RASCUNHO;

SELECT * FROM RASCUNHO

DROP TABLE RASCUNHO

-- ex6
