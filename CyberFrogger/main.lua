

require'gameFlux/fluxReq'
	--> set the filter to save the sprites with small size <--
love.graphics.setDefaultFilter( 'nearest','nearest')


function love.load()
	love.mouse.setVisible(false)


	--> getting the screen dimensions for some calcs something like < viewporting > <-- 

	screenW , screenH = love.graphics.getDimensions()

	--> game states calls <--
    Gamestate.registerEvents()
    Gamestate.switch(menu)

end

function love.update(dt)

	--> quit the game <--
	if love.keyboard.isDown("escape")then
		love.event.quit()
	end

end

	--> dont use this here, check the < Gameflux >
function love.draw()

	--> print the resolution <--
	love.graphics.print(love.graphics.getDimensions(),nil,180)

end
