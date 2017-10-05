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



	if linha >= 1 and linha <=10 and coluna >=1 and coluna <=10 then

		if self[linha + 1][coluna + 1] == " mar " then

			return true

		else

			print("POSIÇÃO INVÁLIDA")

			return false

		end

	else

		return false

	end

end



function tabuleiro:posicionarNaviosNovo(proa, popa, tipo, sentido)

	if tipo == 1 then

		self[proa[1] + 1][popa[2] + 1] = "NAVIO"

		return true

	end

	if tipo == 2 then

		self[proa[1] + 1][proa[2] + 1] = "NAVIO"
		self[popa[1] + 1][popa[2] + 1] = "NAVIO"

		return true

	end

	if tipo == 3 then

		if sentido == 1 then

			self[proa[1] + 1][proa[2] + 1] = "NAVIO"
			self[proa[1] + 1][proa[2] + 2] = "NAVIO"
			self[popa[1] + 1][popa[2] + 3] = "NAVIO"
			self[popa[1] + 1][popa[2] + 1] = "NAVIO"

			return true

		end

		if sentido == 2 then

			self[proa[1] + 1][proa[2] + 1] = "NAVIO"
			self[proa[1] + 2][proa[2] + 1] = "NAVIO"
			self[popa[1] + 3][popa[2] + 1] = "NAVIO"
			self[popa[1] + 1][popa[2] + 1] = "NAVIO"

			return true

		end

	end

end


function tabuleiro:posicionarParteNavio(linha, coluna)


	self[linha + 1][coluna + 1] = "NAVIO"


end



function verificaProa(proa)


	if proa[1] >= 1 and proa[1] <= 10 then

		return true

	else

		return false

	end

end



function tabuleiro:verificaPosicoesNavio(proa, popa, tipo, sentido)


	if tipo == 1 then

		if self:posicaoValida(proa[1], popa[2]) then

			return true

		end

	end

	if tipo == 2 then

		if self:posicaoValida(proa[1], proa[2]) and self:posicaoValida(popa[1], popa[2]) then

			if sentido == 1 then

				if proa[1] == popa[1] and proa[2] == (popa[2] + 1) then

					return true

				end

				return false

			end

			if sentido == 2 then

				if proa[2] == popa[2] and proa[1] == (popa[1] + 1) then

					return true
				end

				return false

			end

		else

			return false

		end

	end

	if tipo == 3 then

		if self:posicaoValida(proa[1], proa[2]) and self:posicaoValida(popa[1], popa[2]) then

			if sentido == 1 then

				if proa[1] == popa[1] and proa[2] == (popa[2] + 1) then

					return true

				end

				return false

			end

			if sentido == 2 then

				if proa[2] == popa[2] and proa[1] == (popa[1] + 1) then

					return true
				end

				return false

			end

		else

			return false

		end
	end

end


function tabuleiro:posicionarNavios()


	for contador = 1, 3 do

		print("============ Batalha Naval ============")
		print("Por favor posicione seu " .. contador .. " navio.")
		print()

		if contador == 1 then
			print("===== NAVIO 1 X 1 =====")
			local jogada = false

			while jogada == false do

				print("Escolha a linha :")

				local	linha = io.read("*number")

				print("Escolha a Coluna :")

				local	coluna = io.read("*number")

				if self:posicaoValida(linha, coluna) then

					self[linha + 1][coluna + 1] = "NAVIO"

					jogada = true

				else

					print("### Posi?o Inv?ida ###")

				end

			end

		end
		if contador == 2 then
			print("===== NAVIO 2 X 1 =====")
			print()
			local posicaoValida = false
			local posicaoNavio

			while posicaoValida == false do

				print("Escolha a posi?o do NAVIO:\nDigite:\n1 - Posi?o na vertical.\n2 - Posi?o na horizontal.")

				posicaoNavio = io.read("*number")

				if posicaoNavio == 1 or posicaoNavio == 2 then

					posicaoValida = true

				else

					print("### Posi?o do NAVIO Inv?ida ###")

				end

			end

			local jogada = false

			while jogada == false do

				if posicaoNavio == 1 then

					print("Escolha a coluna:")
					local coluna = io.read("*number")
					local linhaUm
					local linhaDois

					if coluna >= 1 and coluna <= 10 then

						print("Escolha a posi?o da linha para 'proa' do NAVIO")
						linhaUm = io.read("*number")
						print("Escolha a posi?o da linha para 'popa' do NAVIO")
						linhaDois = io.read("*number")

						if linhaDois == (linhaUm + 1) or linhaDois == (linhaUm - 1) then

							if self:posicaoValida(linhaUm, coluna) and self:posicaoValida(linhaDois, coluna) then

								coluna = coluna + 1
								self[linhaUm + 1][coluna] = "NAVIO"
								self[linhaDois + 1][coluna] = "NAVIO"
								jogada = true

							else

								print("### Posi?es Inv?idas ###")

							end
						else

							print("Escolha linhas que adjacentes")

						end

					else

						print("Posi?o de Coluna Inv?ida")

					end

				end

				if posicaoNavio == 2 then

					print("Escolha a linha:")
					local linha = io.read("*number")
					local colunaUm
					local colunaDois


					if linha >=1 and linha <= 10 then

						print("Escolha a posi?o da coluna para 'proa' do NAVIO")
						colunaUm = io.read("*number")
						print("Escolha a posi?o da coluna para 'popa' do NAVIO")
						colunaDois = io.read("*number")

						if colunaDois == (colunaUm + 1) or colunaDois == (colunaUm - 1) then

							if self:posicaoValida(linha, colunaUm) and  self:posicaoValida(linha, colunaDois) then

								linha = linha + 1
								self[linha][colunaUm + 1] = "NAVIO"
								self[linha][colunaDois + 1] = "NAVIO"
								jogada = true

							else

								print("### Posi?es Inv?idas ###")

							end
						else

							print("Escolha colunas que adjacentes")

						end
					else

						print("Posi?o de Linha inv?ida")
					end
				end

			end

		end
		if contador == 3 then

			print("===== NAVIO 4 X 1 =====")
			print()
			local posicaoValida = false
			local posicaoNavio

			while posicaoValida == false do

				print("Escolha a posi?o do NAVIO:\nDigite:\n1 - Posi?o na vertical.\n2 - Posi?o na horizontal.")
				posicaoNavio = io.read("*number")

				if posicaoNavio == 1 or posicaoNavio == 2 then

					posicaoValida = true
				else

					print("### Posi?o do NAVIO Inv?ida ###")

				end
			end

			local jogada = false

			while jogada == false do

				if posicaoNavio == 1 then

					print("Escolha a coluna:")
					local coluna = io.read("*number")
					local linhaUm
					local linhaQuatro

					if coluna >=1 and coluna <= 10 then

						print("Escolha a posi?o da linha para 'proa' do NAVIO")
						linhaUm = io.read("*number")
						print("Escolha a posi?o da linha para 'popa' do NAVIO")
						linhaQuatro = io.read("*number")

						if linhaQuatro == (linhaUm + 3) or linhaQuatro == (linhaUm - 3) then

							if self:posicaoValida(linhaUm, coluna) and self:posicaoValida((linhaUm + 1), coluna)
							and self:posicaoValida((linhaUm + 2), coluna) and self:posicaoValida(linhaQuatro, coluna)  then

								coluna = coluna + 1
								self[linhaUm + 1][coluna] = "NAVIO"
								self[linhaUm + 2][coluna] = "NAVIO"
								self[linhaUm + 3][coluna] = "NAVIO"
								self[linhaQuatro + 1][coluna] = "NAVIO"

								jogada = true

							else

								print("### Posi?es Inv?idas ###")

							end
						else
							print("Escolha linhas que adjacentes")

						end
					else

						print("Posi?o de coluna inv?ida")

					end
				end

				if posicaoNavio == 2 then

					print("Escolha a linha:")
					local linha = io.read("*number")
					local colunaUm
					local colunaQuatro

					if linha >= 1 or linha <= 10 then

						print("Escolha a posi?o da coluna para 'proa' do NAVIO")
						colunaUm = io.read("*number")
						print("Escolha a posi?o da coluna para 'popa' do NAVIO")
						colunaQuatro = io.read("*number")

						if colunaQuatro == (linha + 3) or colunaQuatro == (linha - 3) then

							if self:posicaoValida(linha, colunaUm) and self:posicaoValida(linha, (colunaUm + 1))
							and self:posicaoValida(linha, (colunaUm + 2)) and self:posicaoValida(linha, colunaQuatro)  then

								linha = linha + 1
								self[linha][colunaUm + 1] = "NAVIO"
								self[linha][colunaUm + 2] = "NAVIO"
								self[linha][colunaUm + 3] = "NAVIO"
								self[linha][colunaQuatro + 1] = "NAVIO"

								jogada = true

							end
						else

							print("Escolha colunas que adjacentes")

						end
					else

						print("Posi?o de linha inv?ida")
					end

				end

			end

		end

	end

end

return tabuleiro
