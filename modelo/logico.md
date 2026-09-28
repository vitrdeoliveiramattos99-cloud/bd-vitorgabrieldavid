CAMPEONATO (id_campeonato, nome_campeonato, temporada)

EQUIPE (id_equipe, nome_equipe, cidade_equipe)

PARTICIPACAO (id_campeonato -> CAMPEONATO, id_equipe -> EQUIPE, posição_final)

PARTIDA (id_partida, data, horario, id_campeonato -> CAMPEONATO, id_equipe_mandante -> EQUIPE, id_equipe_visitante -> EQUIPE)

JOGADOR (id_jogador, nome_jogador, nº_camisa, posição, id_equipe -> EQUIPE)
