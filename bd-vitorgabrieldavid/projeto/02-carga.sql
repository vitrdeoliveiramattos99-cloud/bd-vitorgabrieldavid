-- Projeto - 02 - Carga
-- Dono:
--
-- Enche as tabelas criadas pelo 01-ddl.sql.
-- Ordem importa: quem tem chave estrangeira entra depois de quem ela aponta.

PRAGMA foreign_keys = ON;

INSERT INTO CAMPEONATO (id_campeonato, nome_campeonato, temporada) 
    VALUES
        (1, 'Campeonato Brasileiro', '2026'),
        (2, 'Copa do Brasil', '2026');

INSERT INTO EQUIPE (id_equipe, nome_equipe, cidade_equipe) 
    VALUES
        (1, 'Flamengo', 'Rio de Janeiro'),
        (2, 'Palmeiras', 'Sao Paulo'),
        (3, 'Santos', 'Santos'),
        (4, 'Gremio', 'Porto Alegre');

INSERT INTO PARTICIPACAO 
    (id_campeonato, id_equipe) 
    VALUES
        (1, 1),
        (1, 2),
        (1, 3),
        (1, 4),
        (2, 1),
        (2, 2),
        (2, 3);

INSERT INTO PARTIDA 
    (id_partida, data, horario, id_campeonato, id_equipe_mandante, id_equipe_visitante) 
    VALUES
        (1, '2026-05-10', '16:00:00', 1, 1, 2),
        (2, '2026-05-11', '18:30:00', 1, 3, 4),
        (3, '2026-05-17', '16:00:00', 1, 2, 3),
        (4, '2026-05-18', '18:30:00', 2, 1, 4);

INSERT INTO JOGADOR 
    (id_jogador, nome_jogador, posicao, id_equipe) 
    VALUES
        (1, 'Pedro Silva', 'Atacante', 1),
        (2, 'Lucas Santos', 'Goleiro', 1),
        (3, 'Joao Oliveira', 'Meio-campo', 2),
        (4, 'Gabriel Costa', 'Zagueiro', 2),
        (5, 'Marcos Lima', 'Atacante', 3),
        (6, 'Rafael Souza', 'Goleiro', 4);