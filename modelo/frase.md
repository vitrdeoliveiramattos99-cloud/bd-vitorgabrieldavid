# O caso do trio

**Integrantes: Gabriel Thomas, David Mathias, Vitor Mattos**

**Turma:1°C**

---

## Em uma frase

>A organização precisa saber quais equipes estão inscritas em cada campeonato, quais jogadores pertencem a cada equipe, >quais partidas serão disputadas, quem será o mandante e o visitante, e quais foram os resultados para acompanhar a >classificação.

## As entidades

Cada substantivo da frase que tem vida própria e que você precisa guardar mais
de um. Liste aqui, um por linha, com dois ou três atributos de cada:

CAMPEONATO:

-id_campeonato

-nome_campeonato

EQUIPE:

-id_equipe

-nome_equipe

-cidade_equipe

JOGADOR:

-id_jogador

-nome_jogador

-posição

PARTIDA:

-id_partida

-data

-horário

## O N:N com atributo próprio

Qual é o par de entidades que se cruza muitos-para-muitos, e qual dado nasce
**do encontro** entre elas (e não de nenhum dos dois lados)?

-Par de entidades: CAMPEONATO e EQUIPE

-Dado que nasce do encontro: classificação
