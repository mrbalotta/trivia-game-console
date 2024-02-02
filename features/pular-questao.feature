# language: pt

Funcionalidade: pular questão

    Contexto:
        Dado que eu estou na tela da questão

    Cenário: pulo bem-sucedido
        Dado que não estou na última questão
        E eu tenho pulos disponíveis
        Quando eu pular a questão
        Então eu devo poder ver a próxima questão
        E a quantidade de pulos disponíveis deve ser decrementada em uma unidade

    Cenário: sem pulos disponíveis
        Dado que não estou na última questão
        E eu não tenho pulos disponíveis
        Quando eu pular a questão
        Então nenhuma ação deve ser executada
        E eu devo poder ver a mensagem "Você não tem mais pulos"
        

    Esquema do Cenário: pulo mal-sucedido, dado que última questão
        Dado que estou na última questão
        E o meu idioma é <idioma>
        Quando eu pular a questão
        Então nenhuma ação deve ser executada
        E eu devo poder ver a mensagem <mensagem>
    Exemplos:
        | idioma | mensagem                              |
        | pt-BR  | Você não pode pular a última questão  |

    

    


