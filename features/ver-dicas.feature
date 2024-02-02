# language: pt

Funcionalidade: ver dicas

    Regra: só é permitida pedir dica uma vez por questão

    Cenário: dicas disponíveis
        Dado que eu tenho dicas disponíveis
        E não estou na última questão
        E eu ainda não vi dicas
        Quando eu ver dicas
        Então eu devo poder ver duas alternativas erradas
        E a quantidade de dicas disponíveis deve ser decrementada

    Cenário: dicas indisponíveis
        Dado que eu não tenho dicas disponíveis
        Quando eu tentar ver dicas
        Então nenhuma alternativa errada deve ser revelada

    Cenário: disponibilidade de dicas na última questão
        Dado que eu tenho dicas disponíveis 
        E estou na última questão
        Quando eu tentar ver dicas
        Então nenhuma alternativa errada deve ser revelada
        E a quantidade de dicas disponíveis não deve ser decrementada

    Cenário: dicas já solicitadas para a questão corrente
        Dado eu já solicitei uma dica
        Quando eu tentar ver dicas
        Então nenhuma alternativa errada deve ser revelada
        E a quantidade de dicas disponíveis não deve ser decrementada

    



    