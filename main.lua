createJogador = require("jogador")


jogadorUm = createJogador:inicializar()
jogadorDois = createJogador:inicializar()

print("Jogadores")
print(jogadorUm)
print(jogadorDois)

jogadorUm.tabuleiro:visualizar()
jogadorUm.tabuleiro:posicionarNavios(5,5)
jogadorUm.tabuleiro:visualizar()
jogadorDois.tabuleiro:visualizar()
jogadorUm.tabuleiroAdversario:visualizar()


