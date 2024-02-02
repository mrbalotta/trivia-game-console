# language: pt

Funcionalidade: iniciar partida

    Contexto:
        Dado que eu estou na tela de início

    Cenário: início bem-sucedido
        Dado que eu escolhi os temas da partida
        E eu escolhi a quantidade de questões da partida
        E eu escolhi o modo de dificuldade da partida
        Quando eu iniciar a partida
        Então eu devo poder ver a primeira questão que atenda aos critérios escolhidos
        E a escolha dessa questão pelo sistema deve ser aleatória

    Cenário: temas não escolhidos
        Dado que eu não escolhi pelo menos um tema para as questões da partida
        Quando eu iniciar a partida
        Então eu devo poder ver a mensagem "escolha um ou mais temas para as questões"
        E eu não devo poder ver nenhuma questão

    


