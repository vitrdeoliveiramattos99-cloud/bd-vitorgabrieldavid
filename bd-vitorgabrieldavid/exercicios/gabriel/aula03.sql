-- Aula 03 - O dado entra, e o banco discute
-- Enunciado: exercicios/enunciados/aula03-dml.md
--
-- Escreva a resposta de cada exercicio embaixo do marcador.
-- Comece CADA bloco com: PRAGMA foreign_keys = ON;
-- Os blocos rodam sobre o banco da secretaria ja carregado.

-- ex1
PRAGMA foreign_keys = ON;

INSERT INTO TURMA (id, nome, turno) VALUES (4, '1J', 'noite');

INSERT INTO ALUNO (id, nome, id_turma) VALUES
    (11, 'Lucas', 4),
    (12, 'Marina', 4);

-- ex2
PRAGMA foreign_keys = ON;

-- Comando recusado:
-- INSERT INTO ALUNO (id, nome, id_turma) VALUES (13, 'Pedro', 99);
-- Mensagem do banco: FOREIGN KEY constraint failed

-- Versão que funciona (apontando para uma turma existente):
INSERT INTO ALUNO (id, nome, id_turma) VALUES (13, 'Pedro', 1);

-- ex3
PRAGMA foreign_keys = ON;

SELECT * FROM INSCRICAO WHERE id_aluno = 3 AND id_modalidade = 2;

UPDATE INSCRICAO SET situacao = 'ativa' WHERE id_aluno = 3 AND id_modalidade = 2;

-- ex4
PRAGMA foreign_keys = ON;

UPDATE ALUNO SET id_turma = 2 WHERE id = 10;

-- UPDATE errado (sem WHERE):
-- UPDATE ALUNO SET id_turma = 2;
-- Quantas linhas pegaria: todas as linhas da tabela ALUNO (os 10 alunos iniciais do banco, ou 13 se considerar os 3 alunos inseridos nos exercícios anteriores).


-- ex5
PRAGMA foreign_keys = ON;

-- Tentativa de apagar a turma 1:
-- DELETE FROM TURMA WHERE id = 1;
-- O que aconteceu e por quê: O banco recusou com "FOREIGN KEY constraint failed" porque existem alunos (como Ana, Bruno e Carla) vinculados ao id_turma = 1, e o comportamento padrão (RESTRICT) impede deixar registros filhos órfãos.

DELETE FROM ALUNO WHERE id = 10;

-- Diferença entre os dois casos: A turma 1 possui registros filhos (alunos) apontando para ela, enquanto o aluno 10 não possui nenhum registro filho (inscrições) dependente dele.


-- ex6
PRAGMA foreign_keys = ON;

-- 1. Criação dos três pares de tabelas
CREATE TABLE PAI_A (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);
CREATE TABLE FILHO_A (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    id_pai INTEGER,
    FOREIGN KEY (id_pai) REFERENCES PAI_A(id) ON DELETE RESTRICT
);

CREATE TABLE PAI_B (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);
CREATE TABLE FILHO_B (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    id_pai INTEGER,
    FOREIGN KEY (id_pai) REFERENCES PAI_B(id) ON DELETE CASCADE
);

CREATE TABLE PAI_C (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);
CREATE TABLE FILHO_C (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    id_pai INTEGER,
    FOREIGN KEY (id_pai) REFERENCES PAI_C(id) ON DELETE SET NULL
);

-- 2. Inserção de 1 pai e 2 filhos em cada par
INSERT INTO PAI_A (id, nome) VALUES (1, 'Pai A');
INSERT INTO FILHO_A (id, nome, id_pai) VALUES (1, 'Filho A1', 1), (2, 'Filho A2', 1);

INSERT INTO PAI_B (id, nome) VALUES (1, 'Pai B');
INSERT INTO FILHO_B (id, nome, id_pai) VALUES (1, 'Filho B1', 1), (2, 'Filho B2', 1);

INSERT INTO PAI_C (id, nome) VALUES (1, 'Pai C');
INSERT INTO FILHO_C (id, nome, id_pai) VALUES (1, 'Filho C1', 1), (2, 'Filho C2', 1);

-- 3. Tentativa de apagar o pai dos três
-- DELETE FROM PAI_A WHERE id = 1; -- Recusado com FOREIGN KEY constraint failed (RESTRICT)
DELETE FROM PAI_B WHERE id = 1;
DELETE FROM PAI_C WHERE id = 1;

-- 4. Conferência do que sobrou em cada tabela de filhos
SELECT * FROM FILHO_A;
SELECT * FROM FILHO_B;
SELECT * FROM FILHO_C;

-- O que sobrou em cada caso:
-- FILHO_A (RESTRICT): Sobraram os 2 filhos intactos apontando para id_pai = 1, pois o banco impediu a exclusão do pai.
-- FILHO_B (CASCADE): Não sobrou nenhuma linha (0 registros), pois o banco apagou os filhos automaticamente junto com o pai.
-- FILHO_C (SET NULL): Sobraram os 2 filhos, mas com a coluna id_pai alterada para NULL (sem vínculo).

-- Opção escolhida entre ALUNO e INSCRICAO:
-- Eu usaria ON DELETE CASCADE, porque uma inscrição não faz sentido sozinha sem o aluno; se o aluno for removido do banco, suas inscrições devem ser apagadas junto.
