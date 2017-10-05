navio = { {} , {} }


function navio:create()


		jogo.jogadorUm = novoJogador:inicializar()
		jogo.jogadorDois = novoJogador:inicializar()

	local novoJogo = setmetatable(novoJogo, {__index = jogo})

	return novoJogo

end
