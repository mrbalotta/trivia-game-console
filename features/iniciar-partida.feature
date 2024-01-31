# language: pt

Funcionalidade: iniciar partida

    Cenário: início bem-sucedido
        Dado que eu estou na tela de início
        E eu escolhi os temas da partida
        E eu escolhi a quantidade de questões da partida
        E eu escolhi o modo de dificuldade da partida
        Quando eu iniciar a partida
        Então eu devo poder ver a primeira questão que atenda aos critérios escolhidos
        E a escolha dessa questão pelo sistema deve ser aleatória

