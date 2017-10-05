luaunit = require("luaunit")
novoJogo = require("jogo")

function testPosicaoValidaNavio()


	local jogo = novoJogo:create()
	luaunit.assertEquals(jogo.jogadorUm.tabuleiro:posicaoValida(9, 7), true)
	luaunit.assertEquals(jogo.jogadorDois.tabuleiro:posicaoValida(9, 7), true)

end

function testPosicaoInvalidaNavio()

	local jogo = novoJogo:create()
	luaunit.assertEquals(jogo.jogadorUm.tabuleiro:posicaoValida(11, 7), false)
	luaunit.assertEquals(jogo.jogadorDois.tabuleiro:posicaoValida(11, 7), false)

end

function testPosicionarNavioValido()

	local jogo = novoJogo:create()
	luaunit.assertEquals(jogo.jogadorUm.tabuleiro:posicionarNaviosNovo(5, 7), true)


end

function testPosicionarNavioPosicaoInvalida()

	local jogo = novoJogo:create()
	jogo.jogadorUm.tabuleiro[9][9] = "NAVIO"
	luaunit.assertEquals(jogo.jogadorUm.tabuleiro:posicionarNaviosNovo(8, 8), false)

end


function testPosicionarNavioPosicaoInexistente()

	local jogo = novoJogo:create()
	luaunit.assertEquals(jogo.jogadorUm.tabuleiro:posicionarNaviosNovo(11, 8), false)


end

function testTiroValido()

	local jogo = novoJogo:create()
	tabuleiroAdversario = jogo.jogadorUm.tabuleiro
	luaunit.assertEquals(jogo:tiroValido(5,5,tabuleiroAdversario), true)

end


function testTiroInvalido()


	local jogo = novoJogo:create()
	luaunit.assertEquals(jogo:tiroValido(0,2,jogo.jogadorUm.tabuleiro), false)

end

os.exit( luaunit.LuaUnit.run() )
