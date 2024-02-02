# language: pt

Funcionalidade: ver contagem regressiva

    Contexto:
        Dado que eu escolhi o modo "Difícil"

    Cenário: tempo acabou
        Dado que a contagem regressiva é maior que zero
        Quando a contagem regressiva zerar
        Então eu não devo poder pular
        E eu não devo poder pedir dicas
        E eu devo poder sair
        E eu devo poder iniciar a partida novamente
        E eu devo poder ver a mensagem "seu tempo acabou"
        E eu não devo poder ver a próxima pergunta
        E eu nõ devo poder escolher nenhuma alternativa