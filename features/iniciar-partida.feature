# language: pt

Funcionalidade: iniciar partida

    Contexto:
        Dado que eu estou na tela de início
        E eu escolhi a quantidade de questões da partida

    Cenário: início bem-sucedido para modo de dificuldade diferente de "Difícil"
        Dado que eu escolhi os temas da partida
        E o modo de dificuldade da partida escolhido não é "Difícil"
        Quando eu iniciar a partida
        Então eu devo poder ver a primeira questão que atenda aos critérios escolhidos
        E a escolha dessa questão pelo sistema deve ser aleatória
        E eu devo poder pular a questão
        E eu devo poder pedir uma dica

    Cenário: início bem-sucedido para modo "Difícil"
        Dado que eu escolhi os temas da partida
        E o modo de dificuldade da partida escolhido não é "Difícil"
        Quando eu iniciar a partida
        Então eu devo poder ver a primeira questão que atenda aos critérios escolhidos
        E a escolha dessa questão pelo sistema deve ser aleatória
        E eu devo poder ver a contagem regressiva de tempo para responder a questão
        E eu devo poder pular a questão
        E eu devo poder pedir uma dica

    Cenário: temas não escolhidos
        Dado que eu não escolhi pelo menos um tema para as questões da partida
        Quando eu iniciar a partida
        Então eu devo poder ver a mensagem "escolha um ou mais temas para as questões"
        E eu não devo poder ver nenhuma questão

    


