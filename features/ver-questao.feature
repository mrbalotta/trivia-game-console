Funcionalidade: ver questão

    Cenário: modo de dificuldade diferente de "Difícil"
        Dado que eu escolhi o modo de dificuldade diferente de "Difícil"
        Quando eu tentar ver a questão
        Então eu devo poder ver a pergunta
        E eu devo poder ver as alternativas
        E eu não devo ver contagem regressiva
        E eu devo poder pular
        E eu devo poder ver dicas
        E eu devo poder sair

    Cenário: modo de dificuldade "Difícil"
        Dado que eu escolhi o modo de dificuldade "Difícil"
        Quando eu tentar ver a questão
        Então eu devo poder ver a pergunta
        E eu devo poder ver as alternativas
        E a contagem regressiva deve ser iniciada
        E eu devo poder pular
        E eu devo poder ver dicas
        E eu devo poder sair