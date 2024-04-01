	
	--> libraries requires <--
sti = require'libs.sti'
Gamestate = require'libs.hump.gamestate'
camera = require'libs.hump.camera'
wf = require'libs.windfield'
anim8 = require'libs.anim8'

--> scripts requires <--
require'src.player' --> require the player script <--
require'src.cars' --> require the cars script <--
require'src.keybidding' --> keyboard vars

--> GameFlux (fix the same code that need to be in every single level) <--
require'gameFlux.fluxFun'

--> gamestates <--

	--<the game menu>--
require'gamestates.menu'

	--< initial script that load the <gameplay> >--
require'gamestates.game'

	--<load the game over screen>--
require'gamestates.gameover'

	--< load the level that continue the game randomly >--
require'gamestates.nRandomLevel'
