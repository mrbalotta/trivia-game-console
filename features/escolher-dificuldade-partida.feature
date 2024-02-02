# language: pt

Funcionalidade: escolher dificuldade da partida

    Regra: a dificuldade padrão deve ser a "Fácil"

    Esquema do Cenário: escolha bem-sucedida
        Dado que eu estou na tela de início
        Quando eu selecionar a dificuldade <dificuldade>
        Então eu devo poder pular <pulos> vezes durante a partida
        E eu devo poder pedir <dicas_partida> dicas durante toda a partida
        E eu devo poder responder a questão <limite_tempo> durante a partida
    Exemplos:
        | dificuldade | pulos | dicas_partida | limite_tempo         |
        | Fácil       | 4     | 3             | sem limite de tempo  |
        | Normal      | 3     | 3             | sem limite de tempo  |
        | Difícil     | 3     | 3             | em 20 segundos       |