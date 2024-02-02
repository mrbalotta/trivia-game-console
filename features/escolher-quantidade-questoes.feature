# language: pt

Funcionalidade: escolher quantidade de questões da partida

    Regra: o mínimo de questões é 10 
    Regra: o máximo de questões é 20
    Regra: a quantidade padrão (valor default) deve ser de 10

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


