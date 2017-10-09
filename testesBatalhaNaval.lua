luaunit = require("luaunit")
novoJogo = require("jogo")

function testPosicaoValidaNavioJogadorUm()

	local jogo = novoJogo:create()
	luaunit.assertTrue(jogo.jogadorUm.tabuleiro:posicaoValida(9, 7))

end

function testPosicaoValidaNavioJogadorDois()


	local jogo = novoJogo:create()
	luaunit.assertTrue(jogo.jogadorDois.tabuleiro:posicaoValida(5, 4))

end

function testPosicaoInvalidaNavioJogadorUm()

	local jogo = novoJogo:create()
	luaunit.assertEquals(jogo.jogadorUm.tabuleiro:posicaoValida(11, 7), false)

end

function testPosicaoInvalidaNavioJogadorDois()

	local jogo = novoJogo:create()
	luaunit.assertEquals(jogo.jogadorDois.tabuleiro:posicaoValida(21, 7), false)

end

function testPosicionarNavioUmPorUmValidoJogadorUm()

	local jogo = novoJogo:create()
	luaunit.assertTrue(jogo.jogadorUm.tabuleiro:posicionarNavios({5,7}, 1))

end

function testPosicionarNavioUmPorUmValidoJogadorDois()

	local jogo = novoJogo:create()
	luaunit.assertTrue(jogo.jogadorDois.tabuleiro:posicionarNavios({8,7}, 1))

end

function testPosicionarNavioUmPorUmInvalidoJogadorDois()

	local jogo = novoJogo:create()
	luaunit.assertEquals(jogo.jogadorDois.tabuleiro:posicionarNavios({0,2}, 1), false)

end

function testPosicionarNavioUmPorUmInvalidoJogadorUm()

	local jogo = novoJogo:create()
	luaunit.assertEquals(jogo.jogadorUm.tabuleiro:posicionarNavios({1,90}, 1), false)

end

function testverificaPosicoesNavioUmPorUmInvalido()

	local jogo = novoJogo:create()
	luaunit.assertEquals(jogo.jogadorUm.tabuleiro:verificaPosicoesNavio({7,0}, 1), false)

end

function testTiroValido()

	local jogo = novoJogo:create()
	luaunit.assertTrue(jogo:tiroValido(3,6,jogo.jogadorUm.tabuleiro))

end

function testTiroInvalido()

	local jogo = novoJogo:create()
	luaunit.assertEquals(jogo:tiroValido(3,11,jogo.jogadorUm.tabuleiro), false)

end

os.exit( luaunit.LuaUnit.run() )
