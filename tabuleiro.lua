tabuleiro = {}

function tabuleiro:inicializar()

	local contadorLinha = 1
	local contadorColuna = 0

	local novoTabuleiro = {}

	setmetatable(novoTabuleiro, {__index = tabuleiro})


	for linha = 1, 11 do

		novoTabuleiro[linha] = {}

		for coluna = 1, 11 do

			if linha == 1  and coluna > 1 and coluna < 12 then

				novoTabuleiro[linha][coluna] = "  " .. contadorLinha .."  "
				contadorLinha = contadorLinha + 1
				novoTabuleiro[1][1] = " "

			else
				novoTabuleiro[linha][coluna] = " mar "
			end

			if coluna == 1 then

				novoTabuleiro[linha][coluna] = "" .. contadorColuna .. " "
				contadorColuna = contadorColuna + 1

			end

		end
	end

	return novoTabuleiro

end


function tabuleiro:visualizar()

	for linha = 1, 11 do

		local tabuleiroJogo = ""

		for coluna = 1, 11 do

			tabuleiroJogo = tabuleiroJogo .. self[linha][coluna] .. " | "

		end
		print("------------------------------------------------------------------------------------")
		print(tabuleiroJogo)

	end
		print("------------------------------------------------------------------------------------")


end


function tabuleiro:posicaoValida(linha, coluna)

	if linha ~= nil and coluna ~= nil then

		if linha >= 1 and linha <=10 and coluna >=1 and coluna <=10 then

			if self[linha + 1][coluna + 1] == " mar " then

				return true
			else

				print("POSIÇÃO INVÁLIDA -\nJá existe NAVIO nesta posição")

				return false
			end
		else

			return false

		end
	else
		return false
	end
end


function tabuleiro:posicionarNavios(proa, tipo, sentido, direcao)

	if self:verificaPosicoesNavio(proa, tipo, sentido, direcao) then

		if tipo == 1 then

			self:posicionarParteNavio(proa[1], proa[2])

			return true

		end

		if tipo == 2 then

			if sentido == 1 then

				if direcao == 1 then
					self:posicionarParteNavio(proa[1], proa[2])
					self:posicionarParteNavio(proa[1], (proa[2] + 1))
					return true
				end

				if direcao == 2 then
					self:posicionarParteNavio(proa[1], proa[2])
					self:posicionarParteNavio(proa[1], (proa[2] - 1))
					return true
				end
			end

			if sentido == 2 then

				if direcao == 1 then
					self:posicionarParteNavio(proa[1], proa[2])
					self:posicionarParteNavio((proa[1] - 1), proa[2])
					return true
				end

				if direcao == 2 then
					self:posicionarParteNavio(proa[1], proa[2])
					self:posicionarParteNavio((proa[1] + 1), proa[2])
					return true
				end
			end

			return false

		end

		if tipo == 3 then

			if sentido == 1 then

				if direcao == 1 then
					self:posicionarParteNavio(proa[1], proa[2])
					self:posicionarParteNavio(proa[1], (proa[2] + 1))
					self:posicionarParteNavio(proa[1], (proa[2] + 2))
					self:posicionarParteNavio(proa[1], (proa[2] + 3))
					return true
				end

				if direcao == 2 then
					self:posicionarParteNavio(proa[1], proa[2])
					self:posicionarParteNavio(proa[1], (proa[2] - 1))
					self:posicionarParteNavio(proa[1], (proa[2] - 2))
					self:posicionarParteNavio(proa[1], (proa[2] - 3))
					return true
				end
			end

			if sentido == 2 then

				if direcao == 1 then
					self:posicionarParteNavio(proa[1], proa[2])
					self:posicionarParteNavio((proa[1] - 1), proa[2])
					self:posicionarParteNavio((proa[1] - 2), proa[2])
					self:posicionarParteNavio((proa[1] - 3), proa[2])
					return true
				end

				if direcao == 2 then
					self:posicionarParteNavio(proa[1], proa[2])
					self:posicionarParteNavio((proa[1] + 1), proa[2])
					self:posicionarParteNavio((proa[1] + 2), proa[2])
					self:posicionarParteNavio((proa[1] + 3), proa[2])
					return true
				end
			end
			return false
		end
	else
		return false
	end
end


function tabuleiro:posicionarParteNavio(linha, coluna)


	self[linha + 1][coluna + 1] = "NAVIO"


end

function tabuleiro:verificaPosicoesNavio(proa, tipo, sentido, direcao)


	if tipo == 1 then

		if self:posicaoValida(proa[1],proa[2]) then
			return true
		else
			return false
		end

	end

	if tipo == 2 then

		if self:posicaoValida(proa[1], proa[2]) then

			if sentido == 1 then

				if direcao == 1 then

					if self:posicaoValida(proa[1], (proa[2] + 1)) then

						return true

					else
						return false
					end
				end

				if direcao == 2 then

					if self:posicaoValida(proa[1], (proa[2] - 1)) then

						return true

					else
						return false
					end
				end

				return false

			end

			if sentido == 2 then

				if direcao == 1 then

					if self:posicaoValida((proa[1] - 1), proa[2]) then

						return true

					else
						return false
					end
				end

				if direcao == 2 then

					if self:posicaoValida((proa[1] + 1), proa[2]) then

						return true

					else
						return false
					end
				end
				return false

			end

		else

			return false

		end

	end

	if tipo == 3 then

		if self:posicaoValida(proa[1], proa[2]) then

			if sentido == 1 then

				if direcao == 1 then

					if self:posicaoValida(proa[1], (proa[2] + 1))  and self:posicaoValida(proa[1], (proa[2] + 2)) and self:posicaoValida(proa[1], (proa[2] + 3))then

						return true

					else
						return false
					end
				end

				if direcao == 2 then

					if self:posicaoValida(proa[1], (proa[2] - 1))  and self:posicaoValida(proa[1], (proa[2] - 2)) and self:posicaoValida(proa[1], (proa[2] - 3))then

						return true

					else
						return false
					end
				end

				return false

			end

			if sentido == 2 then

				if direcao == 1 then

					if self:posicaoValida((proa[1] - 1), proa[2])  and self:posicaoValida((proa[1] - 2), proa[2]) and self:posicaoValida((proa[1] - 3), proa[2])then

						return true

					else
						return false
					end
				end

				if direcao == 2 then

					if self:posicaoValida((proa[1] + 1), proa[2]) and self:posicaoValida((proa[1] + 2), proa[2]) and self:posicaoValida((proa[1] + 3), proa[2])then

						return true

					else
						return false
					end
				end
				return false

			end

			return false

		else

			return false

		end

	end

end

return tabuleiro
