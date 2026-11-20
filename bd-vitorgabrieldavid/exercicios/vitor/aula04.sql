-- Aula 04 - O banco responde
-- Enunciado: exercicios/enunciados/aula04-dql.md
--
-- Escreva a resposta de cada exercicio embaixo do marcador.
-- Antes de cada SELECT, escreva a pergunta em comentario.
-- Hoje so se consulta: nao crie, nao insira, nao altere.
-- Os blocos rodam sobre o banco da secretaria ja carregado.
-- O ex9 fica em comentario (as tabelas do trio nao existem aqui).


-- ex1
-- Quais são o nome e a data de nascimento de todos os alunos?
SELECT nome, nascimento
FROM ALUNO;

-- ex2
-- Quais são os nomes dos alunos que estão na turma de id 1?
SELECT nome
FROM ALUNO
WHERE id_turma = 1;

-- Quais são as inscrições que estão com a situação ativa?
SELECT id_aluno, id_modalidade, data, situacao
FROM INSCRICAO
WHERE situacao = 'ativa';

-- ex3
-- Quais alunos estão sem turma cadastrada?
SELECT nome
FROM ALUNO
WHERE id_turma IS NULL;

-- Consulta errada:
-- SELECT nome FROM ALUNO WHERE id_turma = NULL;
-- Por que não responde à pergunta: NULL não é um valor comum, mas sim a ausência de registro. Comparar qualquer coluna com "= NULL" não produz verdadeiro, fazendo a consulta retornar vazia mesmo existindo alunos sem turma.


-- ex4
-- Quais são as inscrições ativas da modalidade 2?
SELECT id_aluno, id_modalidade, data, situacao
FROM INSCRICAO
WHERE situacao = 'ativa'
  AND id_modalidade = 2;

-- Quais alunos pertencem às turmas 1 ou 2?
SELECT nome, id_turma
FROM ALUNO
WHERE id_turma IN (1, 2);


-- ex5
-- Quais alunos têm o nome começando com a letra A?
SELECT nome
FROM ALUNO
WHERE nome LIKE 'A%';

-- Quais inscrições foram realizadas entre 2026-05-01 e 2026-05-31?
SELECT id_aluno, id_modalidade, data, situacao
FROM INSCRICAO
WHERE data BETWEEN '2026-05-01' AND '2026-05-31';


-- ex6
-- Quais são os alunos cadastrados em ordem alfabética?
SELECT nome
FROM ALUNO
ORDER BY nome ASC;

-- Quais são os três primeiros alunos em ordem alfabética?
SELECT nome
FROM ALUNO
ORDER BY nome ASC
LIMIT 3;


-- ex7
-- a) Quais alunos estão sem turma?
-- Erro lógico original: usou "= 0", mas "sem turma" no banco é representado por NULL, não pelo número zero.
SELECT nome
FROM ALUNO
WHERE id_turma IS NULL;

-- b) Quais alunos têm o nome começando com Ana?
-- Erro lógico original: usou "=" em vez de "LIKE", fazendo o banco procurar o texto literal "Ana%" com o símbolo de porcentagem.
SELECT nome
FROM ALUNO
WHERE nome LIKE 'Ana%';

-- c) Quais inscrições da modalidade 2 estão ativas ou trancadas?
-- Erro lógico original: sem parênteses, o banco resolve o AND antes do OR, trazendo todas as inscrições ativas de qualquer modalidade junto com as trancadas da modalidade 2.
SELECT *
FROM INSCRICAO
WHERE (situacao = 'ativa' OR situacao = 'trancada')
  AND id_modalidade = 2;


-- ex8
-- Pergunta: Quais são os nomes dos alunos que estão sem turma?
-- Linhas esperadas antes de executar: 1 linha (João Vitor, que vem sem turma na carga inicial do banco).
SELECT nome
FROM ALUNO
WHERE id_turma IS NULL;

-- Pergunta: Quais são os nomes dos alunos que contêm "Silva" em qualquer parte do nome, ordenados em ordem alfabética?
-- Linhas esperadas antes de executar: entre 1 e 2 linhas (dependendo de quantos alunos com sobrenome Silva existem na carga inicial).
SELECT nome
FROM ALUNO
WHERE nome LIKE '%Silva%'
ORDER BY nome;

-- Pergunta: Quais inscrições estão com a situação "ativa" e foram realizadas a partir de 01/09/2026?
-- Linhas esperadas antes de executar: 0 linhas (pois as inscrições da carga inicial do banco são do mês de maio de 2026).
SELECT *
FROM INSCRICAO
WHERE situacao = 'ativa'
  AND data >= '2026-09-01';


-- ex9
-- Pergunta 1: Quais livros ainda não possuem data de devolução registrada (estão emprestados)?
SELECT id_livro, id_leitor, data_retirada
FROM EMPRESTIMO
WHERE data_devolucao IS NULL;

-- Pergunta 2: Quais livros possuem "Dados" no título, ordenados em ordem alfabética?
SELECT titulo, autor
FROM LIVRO
WHERE titulo LIKE '%Dados%'
ORDER BY titulo ASC;

-- Pergunta 3: Quais empréstimos foram realizados no mês de maio de 2026, do mais recente para o mais antigo?
SELECT id_livro, id_leitor, data_retirada
FROM EMPRESTIMO
WHERE data_retirada BETWEEN '2026-05-01' AND '2026-05-31'
ORDER BY data_retirada DESC;