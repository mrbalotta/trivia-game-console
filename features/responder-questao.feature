# language: pt

Funcionalidade: responder questão

    Cenário: escolha correta, dado que não estou na última questão
        Dado que a questão "A" é correta
        E eu não estou na última questão
        Quando eu escolher a questão "A" como resposta
        Então eu devo poder receber um feedback positivo
        E eu devo poder ver a próxima questão
        E eu não devo poder pular
        E eu não devo poder pedir dicas

    Cenário: escolha correta e estou na última questão
        Dado que a questão "A" é correta
        E eu estou na última questão
        Quando eu escolher a questão "A" como resposta
        Então eu devo receber um feedback de conclusão do jogo
        E eu não devo poder ver outras questões
        E eu devo poder sair do jogo
        E eu devo poder retornar para a tela de início
        E eu não devo poder pular
        E eu não devo poder pedir dicas