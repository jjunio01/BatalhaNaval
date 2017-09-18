tabuleiro = {}

function tabuleiro:inicializar()

local contadorLinha = 1
local contadorColuna = 0

local novoTabuleiro = {}

local novoTabuleiro = setmetatable(novoTabuleiro, {__index = tabuleiro})


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
		local aux = ""

		for coluna = 1, 11 do

			aux = aux .. self[linha][coluna] .. " | "

		end
		print("------------------------------------------------------------------------------------")
		print(aux)

	end
		print("------------------------------------------------------------------------------------")


end


function tabuleiro:posicionarNavios(linha, coluna)


	if self[linha][coluna] == " mar " then

		self[linha + 1][coluna + 1] = "navio"

	else
		print("Posiçao Inválida")

	end

end

return tabuleiro
