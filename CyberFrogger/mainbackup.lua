

require'libs.hump.gamestate'
wf = require'libs.windfield'
require'src.player' --> require the player script <--
require'src.cars' --> require the cars script <--




 -----> gamestates <-----

		menu = {}
		pause = {}


function love.load()

	level = 1

	--> world physics <--
	world = wf.newWorld(0,0,true)
	world:addCollisionClass('player')
	world:addCollisionClass('cars')


	--> spawning objects <--
	player = Player.spawn(world,400,584,300,16,"line")
	carA = Car.spawn(world,0,0,260,256,32,"line")
	carB = Car.spawn(world,128,128,(260)*(-1),256,64,"line")
	carC = Car.spawn(world,256,256,260,256,32,"line")
	carD = Car.spawn(world,384,384,(260)*(-1),256,64,"line")
	carE = Car.spawn(world,512,512,260,256,32,"line")
	
end

function love.update(dt)
	--> updating objects <--
	world:update(dt)
	player:update(dt)
	carA:updateCar(dt)
	carB:updateCar(dt)
	carC:updateCar(dt)
	carD:updateCar(dt)
	carE:updateCar(dt)

	--> killing the player <--					

	if player.body:enter('cars')then
		player.body:destroy()	
	end

	--> updating level <--
	if player.body:getY() <= 16 then
		player.body:setY(584)
		level = level + 0.5
	else
		Clearlevel = "false"
	end
end

function love.draw()
	world:draw()
	player:draw()
	love.graphics.print("CurrentFPS = "..love.timer.getFPS())
	love.graphics.print("Score = "..level,nil,48)
end
