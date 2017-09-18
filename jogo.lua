
jogo = {jogadorUm, jogadorDois}


function jogo:create()

	local novoJogador = require("jogador")
	local novoJogo = {}


		jogo.jogadorUm = novoJogador:inicializar()
		jogo.jogadorDois = novoJogador:inicializar()

	local novoJogo = setmetatable(novoJogo, {__index = jogo})

	return novoJogo

end


function jogo:posicionarNavios(jogador,linha, coluna)


	if jogador.tabuleiro[linha][coluna] == " mar " then

		jogador.tabuleiro[linha + 1][coluna + 1] = "navio"

	else
		print("Posiçao Inválida")

	end

end


return jogo
