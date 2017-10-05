luaunit = require("luaunit")
novoJogo = require("jogo")



function testPosicionarNavio()
print("#######")

	local jogo = novoJogo:create()
	jogo.jogadorUm.tabuleiro[8][8] = "NAVIO"
	luaunit.assertEquals(jogo.jogadorUm.tabuleiro:posicionarNaviosNovo(11, 7), false)
	luaunit.assertEquals(jogo.jogadorUm.tabuleiro:posicionarNaviosNovo(5, 7), true)
	luaunit.assertEquals(jogo.jogadorUm.tabuleiro:posicionarNaviosNovo(8, 8), true)


end



os.exit( luaunit.LuaUnit.run() )
