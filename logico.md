CAMPEONATO (_id_campeonato_, nome_campeonato, temporada)

EQUIPE (_id_equipe_, nome_equipe, cidade_equipe)

PARTICIPACAO (_id_campeonato -> CAMPEONATO, id_equipe -> EQUIPE_, posição_final)

PARTIDA (_id_partida_, data, horario, id_campeonato -> CAMPEONATO, id_equipe_mandante -> EQUIPE, id_equipe_visitante -> EQUIPE)

JOGADOR (_id_jogador_, nome_jogador, nº_camisa, posição, id_equipe -> EQUIPE)
