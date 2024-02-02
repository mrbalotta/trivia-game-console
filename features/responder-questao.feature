# language: pt

Funcionalidade: responder questão

    Cenário: escolha correta
        Dado que a questão "A" é correta
        Quando eu escolher a questão "A" como resposta
        Então eu devo poder receber um feedback positivo
        E eu devo poder ver a próxima questão
        E eu não devo poder pular
        E eu não devo poder pedir dicas

    Cenário: escolha incorreta
        Dado que a questão "A" é incorreta
        Quando eu escolher a questão "A" como resposta
        Então eu devo poder receber um feedback negativo
        E eu não devo poder ver a próxima questão
        E eu não devo poder pular
        E eu não devo poder pedir dicas
        E eu devo poder sair
        E eu devo poder iniciar novamente a partida

    Cenário: escolha feita, contagem zerada, nenhuma ação
        Dado que eu escolhi o modo "Difícil"
        E a contagem regressiva é igual a zero
        Quando eu escolher uma questão
        Então nenhuma ação deve ser executada

    Cenário: modo Difícil, escolha feita, contagem parada
        Dado que eu escolhi o modo "Difícil"
        E a contagem regressiva é maior que zero
        Quando eu escolher uma questão
        Então a contagem regressiva deve parar 

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