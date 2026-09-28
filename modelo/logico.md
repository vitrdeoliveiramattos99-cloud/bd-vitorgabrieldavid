CAMPEONATO (_id_campeonato, nome_campeonato, temporada)

EQUIPE (_id_equipe, nome_equipe, cidade_equipe)

PARTICIPACAO (_id_campeonato -> CAMPEONATO, id_equipe -> EQUIPE, posição_final)

PARTIDA (_id_partida, data, horario, id_campeonato -> CAMPEONATO, id_equipe_mandante -> EQUIPE, id_equipe_visitante -> EQUIPE)

JOGADOR (_id_jogador, nome, nº_camisa, posição, id_equipe -> EQUIPE)
