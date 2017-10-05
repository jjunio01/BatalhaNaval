
jogo = {jogadorUm, jogadorDois}


function jogo:create()

	local novoJogador = require("jogador")
	local novoJogo = {}

	local novoJogo = setmetatable(novoJogo, {__index = jogo})

		novoJogo.jogadorUm = novoJogador:inicializar()
		novoJogo.jogadorDois = novoJogador:inicializar()



	return novoJogo

end



function jogo:tiroValido(linha, coluna, tabuleiroAdversario)

	if linha >= 1 and linha <= 10 and coluna >= 1 and coluna <= 10 and tabuleiroAdversario ~= nil then

		return true

	end

	return false

end



function alternarJogador()





end



function atirar()





end


function pontuacao()





end


function verificarVencedor()




end


return jogo
