nRandomLevel = {}

function nRandomLevel:enter()
	--> sets the game diff <--
	level = level

	--> game objects sizing vars <--
	carMinisz = screenH/24
	carMaxSz = screenH/10

	--> calls the basics functions <--  
	spawnFlux()

end

function nRandomLevel:update(dt)
	fluxUpdate(dt)

	--> updating level(the diff of the game) <--

	if player.body:getY() <= 16 then
		level = level + 0.5
		Gamestate.switch(nRandomLevel)
	end

end

function nRandomLevel:draw()
	fluxDraw()
end