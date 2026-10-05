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
    ano INTEGER,
    exemplares INTEGER NOT NULL DEFAULT 1
)

-- ex2
CREATE TABLE LEITOR(
    id INTEGER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);
    INSERT INTO LEITOR (id, nome) 
    VALUES (01, 'Gabriel');

    INSERT INTO LEITOR (id, nome) 
    VALUES (02, 'Maria');

    INSERT INTO LEITOR (id, nome) 
    VALUES (03, 'Ana');

    ALTER TABLE LEITOR
    ADD Telefone VARCHAR(20);

    SELECT * FROM LEITOR

-- ex3
CREATE TABLE Emprestimo(
    id INTEGER PRIMARY KEY,
    id_livro INTEGER NOT NULL
);

insert into Emprestimo (id, id_livro) VALUES (1, 10), (2, 20);

ALTER TABLE Emprestimo
ADD COLUMMN situacao VARCHAR(50) NOT NULL DEFAULT 'ativo';

-- ex4
CREATE TABLE EDITORA(
    id INTEGER PRIMARY KEY,
    nm TEXT NOT NULL
);

INSERT INTO EDITORA (id, nm) VALUES (1, 'compania das letras');

ALTER TABLE EDITORA RENAME COLUMN nm TO nome;
-- ex5
CREATE TABLE RASCUNHO(
    id INTEGER PRIMARY KEY,
    texto TEXT
);
INSERT INTO RASCUNHO (id, texto) VALUES (1, 'primeira nota');
INSERT INTO RASCUNHO (id, texto) VALUES (2, 'segunda nota');
INSERT INTO RASCUNHO (id, texto) VALUES (3, 'terceira nota');

DELETE FROM RASCUNHO;

SELECT * FROM RASCUNHO;

DROP TABLE RASCUNHO;
-- ex6
