# language: pt

Funcionalidade: escolher quantidade de questões da partida

    Regra: o mínimo de questões é 10 
    Regra: o máximo de questões é 20

    Esquema do Cenário: escolha bem-sucedida
        Dado que eu estou na tela de início
        E a quantidade <quantidade> está entre 10 e 20 inclusive
        Quando eu escolher a quantidade <quantidade> de questões
        Então eu devo poder ver até <quantidade> durante a partida
    Exemplos:
        | quantidade |
        | 10         |
        | 15         |
        | 20         |

    Cenário: fora do limite de questões
        Dado que eu estou na tela de início
        E que a quantidade <quantidade> não está entre 10 e 20 inclusive
        Quando eu escolher a quantidade <quantidade> de questões
        Então eu devo poder ver até <quantidade> durante a partida


