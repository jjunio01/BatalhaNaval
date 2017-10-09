
jogo = {jogadorUm, jogadorDois}


function jogo:create()

	local novoJogador = require("jogador")
	local novoJogo = {}

	local novoJogo = setmetatable(novoJogo, {__index = jogo})

		novoJogo.jogadorUm = novoJogador:inicializar()
		novoJogo.jogadorDois = novoJogador:inicializar()
		novoJogo.jogadorUm.jogadorAdversario = novoJogo.jogadorDois
		novoJogo.jogadorDois.jogadorAdversario = novoJogo.jogadorUm

	return novoJogo

end

function jogo:tiroValido(linha, coluna)

	if linha ~= nil and coluna ~= nil then
		if linha >= 1 and linha <= 10 and coluna >= 1 and coluna <= 10 then

			return true

		else
			return false
		end
	else
		return false
	end
end

function jogo:valoresValidos(linha, coluna)

	if linha ~= nil and coluna ~= nil then

		if linha >= 1 and linha <= 10 then

			if coluna >= 1 and coluna<= 10 then

				return true
			end
			return false
		else
			return	false
		end
	end
	return false
end

function jogo:sentidoValido(sentido)

	if sentido ~= nil then
		if sentido == 1 or sentido == 2 then
			return true
		else
			return false
		end
	else
		return false
	end
end

function jogo:direcaoValida(direcao)

	if direcao ~= nil then
		if direcao == 1 or direcao == 2 then
			return true
		else
			return false
		end
	else
		return false
	end
end

function jogo:atirar(linha, coluna, jogadorAdversario)

	if self:tiroValido(linha, coluna) then
		if jogadorAdversario.tabuleiro[linha][coluna] == " mar " then
			print("TIRO NA AGUA ")
			tiroNaAgua(linha, coluna, jogadorAdversario)
			return {true, 1}
		end
		if jogadorAdversario.tabuleiro[linha][coluna] == "NAVIO" then
			print("NAVIO ATINGIDO")
			mudarTabuleiroAdversario(linha,coluna,jogadorAdversario)
			return {true, 2}
		end
	else
		return{false}
	end
end


function jogo:mudarTabuleiroAdversario(linha, coluna, jogador)

	jogador.tabuleiroAdversario:posicionarParteNavio(linha, coluna)

end

function jogo:tiroNaAgua(linha, coluna, jogador)

	jogador.tabuleiroAdversario[linha][coluna] = "*****"

end


return jogo
