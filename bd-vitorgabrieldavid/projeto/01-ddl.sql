-- Projeto - 01 - DDL
-- Dono: Vitor de Oliveira Mattos
--
-- Cria as tabelas do caso do trio, vazias.
-- Roda num banco em branco: nada pode depender de tabela criada fora daqui.
-- Minimo 4 tabelas, e uma associativa com atributo proprio.

CREATE TABLE CAMPEONATO (
    id_campeonato INT PRIMARY KEY,
    nome_campeonato VARCHAR(100) NOT NULL,
    temporada VARCHAR(20) NOT NULL
);

CREATE TABLE EQUIPE (
    id_equipe INT PRIMARY KEY,
    nome_equipe VARCHAR(100) NOT NULL,
    cidade_equipe VARCHAR(100) NOT NULL
);

CREATE TABLE PARTICIPACAO (
    id_campeonato INTEGER NOT NULL,
    id_equipe INTEGER NOT NULL,
    PRIMARY KEY (id_campeonato, id_equipe),
    FOREIGN KEY (id_campeonato) REFERENCES CAMPEONATO(id_campeonato),
    FOREIGN KEY (id_equipe) REFERENCES EQUIPE(id_equipe)
);

CREATE TABLE PARTIDA (
    id_partida INTEGER PRIMARY KEY,
    data DATE NOT NULL,
    horario TIME NOT NULL,
    id_campeonato INTEGER NOT NULL,
    id_equipe_mandante INTEGER NOT NULL,
    id_equipe_visitante INTEGER NOT NULL,
    FOREIGN KEY (id_campeonato) REFERENCES CAMPEONATO(id_campeonato),
    FOREIGN KEY (id_equipe_mandante) REFERENCES EQUIPE(id_equipe),
    FOREIGN KEY (id_equipe_visitante) REFERENCES EQUIPE(id_equipe)
);

CREATE TABLE JOGADOR (
    id_jogador INTEGER PRIMARY KEY,
    nome_jogador VARCHAR(100) NOT NULL,
    posicao VARCHAR(50) NOT NULL,
    id_equipe INTEGER,
    FOREIGN KEY (id_equipe) REFERENCES EQUIPE(id_equipe)
);

