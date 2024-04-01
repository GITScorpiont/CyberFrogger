game = {}

function game:enter()
	--> sets the game diff <--
	level = 1

	--> game objects sizing vars <--
	carSize = screenH/16

	playerSz = screenH/50

	--> calls the basics functions <--  
	spawnFlux()

end

function game:update(dt)
	fluxUpdate(dt)

	--> updating level(the diff of the game) <--

	if player.body:getY() < 16 then
		level = level + 0.5
		Gamestate.switch(nRandomLevel)
	end

end

function game:draw()
	fluxDraw()
end