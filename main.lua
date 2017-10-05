createJogo = require("jogo")

novoJogo = createJogo:create()


novoJogo.jogadorUm.tabuleiro:posicionarNavios()

print("###  JOGADOR UM ###")
novoJogo.jogadorUm.tabuleiro:visualizar()
print("###  JOGADOR DOIS ###")
novoJogo.jogadorDois.tabuleiro:visualizar()
print("###  JOGADOR UM TABULEIRO ADVERSARIO ###")
novoJogo.jogadorUm.tabuleiroAdversario:visualizar()
print("###  JOGADOR DOIS TABULEIRO ADVERSARIO ###")
novoJogo.jogadorDois.tabuleiroAdversario:visualizar()



