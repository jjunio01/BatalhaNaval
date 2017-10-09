jogador = {nome, id, tabuleiro, tabuleiroAdversario, pontuacao, jogadorAdversario}


function jogador:inicializar()


	local novoJogador = {}

	local novoTabuleiro = require("tabuleiro")

	local novoJogador = setmetatable(novoJogador, {__index = jogador})

	novoJogador.tabuleiro = novoTabuleiro:inicializar()

	novoJogador.tabuleiroAdversario = novoTabuleiro:inicializar()

	novoJogador.id = math.random(1,10)

    return novoJogador

end

return jogador

