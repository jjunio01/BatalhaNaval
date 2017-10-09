createJogo = require("jogo")
local controlarJogador = 2
local partidaEncerrada = false
local jogoEncerrado = false
local tabuleirosPreenchido = false
local contador = 0

novoJogo = createJogo:create()

function insereDados(iterador)
	local proa
	local sentido
	local direcao

	local dadosValidos = false

	while dadosValidos == false do

		print("Por favor posicione seu " .. iterador .. " navio.")
		print("Digite a linha da 'proa' do navio")
		local linhaProa = io.read()
		print("Digite a coluna da 'proa' do navio")
		local colunaProa = io.read()
		linhaProa = tonumber(linhaProa)
		colunaProa = tonumber(colunaProa)
		proa = {linhaProa, colunaProa}

		if jogadorDaVez.tabuleiro:posicaoValida(linhaProa, colunaProa) then

			local sentidoValido = false

			while sentidoValido == false do

				print("Digite o sentido:\n1 - Horizontal\n2- Vertical")
				sentido = io.read()
				sentido = tonumber(sentido)

				if novoJogo:sentidoValido(sentido)  then

					local direcaoValida = false

					while direcaoValida == false do

						if sentido == 1 then
							print("Digite o direcao:\n1 - Direita\n2- Esquerda")
							direcao = io.read()
							direcao = tonumber(direcao)
						end

						if sentido == 2 then
							print("Digite o direcao:\n1 - Para Cima\n2- Para Baixo")
							direcao = io.read()
							direcao = tonumber(direcao)
						end

						if novoJogo:direcaoValida(direcao) then
							direcaoValida = true
							sentidoValido = true
							dadosValidos = true
						else
							print("=== Direção Inválida ===")
							print()
						end
					end
				else
					print("=== Sentido Inválido ===")
				end
			end
		else
			print("=== POSIÇÃO DA PROA INVÁILIDA ===\nDigite Valores entre 1 e 10")
			print()
		end
	end
	return {proa, sentido, direcao}
end

function preencherTabuleiro()

	for iterador = 1, 3 do

		if iterador == 1 then

			local navioUm = false

			while navioUm == false do
				print("Por favor posicione seu " .. iterador .. " navio.")
				print("Digite a linha do navio")
				local linha = io.read()
				print("Digite a coluna do navio")
				local coluna = io.read()
				linha = tonumber(linha)
				coluna = tonumber(coluna)
				local proa = {linha, coluna}

				if novoJogo:valoresValidos(linha, coluna) then

					if jogadorDaVez.tabuleiro:posicionarNavios(proa, 1) then
						navioUm = true
					else
						print("====  Posição Inválida   ====\n")
					end

				else
					print("=== POSIÇÃO INVÁILIDA ===\nDigite Valores entre 1 e 10")
					print()
				end
			end
			jogadorDaVez.tabuleiro:visualizar()
		end

		if iterador == 2 then

			local navioDois = false
			while navioDois == false do

				local dados = insereDados(iterador)
				local proa = dados[1]
				local sentido = dados[2]
				local direcao = dados[3]

				if jogadorDaVez.tabuleiro:posicionarNavios(proa, iterador, sentido, direcao) then

					navioDois = true
				else
					print("====  Posição para NAVIO Inválida   ====\n")
				end
			end
			jogadorDaVez.tabuleiro:visualizar()
		end

		if iterador == 3 then

			local navioTres = false
			while navioTres == false do

				local dados = insereDados(iterador)
				local proa = dados[1]
				local sentido = dados[2]
				local direcao = dados[3]

				if jogadorDaVez.tabuleiro:posicionarNavios(proa, iterador, sentido, direcao) then
					navioTres = true
				else
					print("====  Posição para NAVIO Inválida   ====\n")
				end

			end
			jogadorDaVez.tabuleiro:visualizar()
		end
	end
	contador = contador + 1
	controlarJogador = controlarJogador + 1
end

print("Bem Vindo Ao Jogo")
print("Jogador 1: Digite seu Nome: ")
novoJogo.jogadorUm.nome = io.read()
print("Jogador 2: Digite seu Nome: ")
novoJogo.jogadorDois.nome = io.read()

while tabuleirosPreenchido == false do

	if controlarJogador % 2 == 0 then

		jogadorDaVez = novoJogo.jogadorUm

	else
		jogadorDaVez = novoJogo.jogadorDois
	end

	print("============ Batalha Naval ============")
	print("Sua Vez: " .. "Jogaror " .. jogadorDaVez.nome)
	jogadorDaVez.tabuleiro:visualizar()

	preencherTabuleiro()

	if contador == 2 then
		tabuleirosPreenchido = true
	end
end

while jogoEncerrado == false do

	if controlarJogador % 2 == 0 then

		jogadorDaVez = novoJogo.jogadorUm

	else
		jogadorDaVez = novoJogo.jogadorDois
	end
	local encerrarJogo
	local encerrar = false
	local tiroCerto = false

	while tiroCerto == false do

		print("Jogador " .. jogadorDaVez.nome .. "Realize seu tiro")
		print("Digite a linha")
		local linha = io.read()
		print("Digite a coluna")
		local coluna = io.read()
		linha = tonumber(linha)
		coluna = tonumber(coluna)

		tiro = novoJogo:atirar(linha, coluna, jogadorDaVez.jogadorAdversario)

		if tiro[1] == false then
			print("Tiro Inválido")
			controlarJogador = controlarJogador + 1
		else
			controlarJogador = controlarJogador + 2
			jogadorDaVez.jogadorAdversario.tabuleiroAdversario:visualizar()
			tiroCerto = true
			jogoEncerrado = true
		end
	end

	while encerrar == false do
		print("Desejam Jogar Novamente:\n1 - sim\n2- Não")
		encerrarJogo = io.read()
		encerrarJogo = tonumber(encerrarJogo)
		if encerrarJogo ~= nil then
			if encerrarJogo == 1 then
			--Reiniciar jogo




				encerrar = true
			end
			if encerrarJogo == 2 then
				jogoEncerrado = true
				encerrar = true
			end
		end
	end
end



