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
-- =========================================================================
-- 1. CRIAÇÃO DAS TABELAS (MIOLO DO BANCO DA BIBLIOTECA)
-- =========================================================================

CREATE TABLE LIVRO (
    id INT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL
);

CREATE TABLE LEITOR (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE EMPRESTIMO (
    id_leitor INT,
    id_livro INT,
    data_saida DATE NOT NULL,
    data_volta DATE,
    PRIMARY KEY (id_leitor, id_livro, data_saida),
    FOREIGN KEY (id_leitor) REFERENCES LEITOR(id),
    FOREIGN KEY (id_livro) REFERENCES LIVRO(id)
);

INSERT INTO LIVRO (id, titulo) VALUES (1, 'Dom Casmurro'), (2, 'O Alquimista');
INSERT INTO LEITOR (id, nome) VALUES (10, 'Carlos Silva'), (20, 'Ana Souza');
INSERT INTO EMPRESTIMO (id_leitor, id_livro, data_saida, data_volta) 
VALUES (10, 1, '2026-10-05', '2026-10-12');
INSERT INTO EMPRESTIMO (id_leitor, id_livro, data_saida, data_volta) 
VALUES (10, 1, '2026-10-07', NULL);

/*
POR QUE A CHAVE PRIMÁRIA RECUSA ESTE INSERT?
Este comando tenta registrar que o leitor Carlos (10) pegou o livro Dom Casmurro (1) 
no dia 05/10/2026 de novo.
*/
