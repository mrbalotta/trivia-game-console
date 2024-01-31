# language: pt

Funcionalidade: escolher temas da partida

    Regra: o usuário pode adicionar quantos temas quiser, desde que estejam disponíveis

    Esquema do Cenário: escolha bem-sucedida
        Dado que eu estou na tela de início
        E o tema <tema> está disponível
        Quando eu selecionar o tema <tema>
        Então eu devo poder ver questões de <tema> durante a partida
    Exemplos:
        | tema      | 
        | biologia  |
        | português |
        | história  |
        | geografia | 