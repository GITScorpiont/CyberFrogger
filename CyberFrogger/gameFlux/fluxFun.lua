function spawnFlux()

	--> sets the game diff <--
	score = level * 10

	--> world physics <--
	world = wf.newWorld(0,0,true)
	world:addCollisionClass('player')
	world:addCollisionClass('cars')
	world:addCollisionClass('shooters')

	--> spawning objects <--

	player = Player.spawn(world,screenW/2,screenH - 16,300,playerSz,"line")
	carA = Car.spawn(world,love.math.random(0,screenW),screenH - screenH/7,260,love.math.random(carMaxSz,carMaxSz),"line")
	carB = Car.spawn(world,love.math.random(0,screenW),screenH - (screenH/7)*2,(260)*(-1),love.math.random(carMaxSz,carMaxSz),"line")
	carC = Car.spawn(world,love.math.random(0,screenW),screenH - (screenH/7)*3,260,love.math.random(carMinisz,carMaxSz),"line")
	carD = Car.spawn(world,love.math.random(0,screenW),screenH - (screenH/7)*4,(260)*(-1),love.math.random(carMinisz,carMaxSz),"line")
	carE = Car.spawn(world,love.math.random(0,screenW),screenH - (screenH/7)*5,260,love.math.random(carMinisz,carMaxSz),"line")
	carF = Car.spawn(world,love.math.random(0,screenW),screenH - (screenH/7)*6,(260)*(-1),love.math.random(carMinisz,carMaxSz),"line")

	--> the crazy randomic functions on the x and y sizes defines a random spawn in the x on the screen and a pathfinding on the y (i don't know if its are correct)
end

function fluxUpdate(dt)

	--> updating objects <--
   world:update(dt)
	player:update(dt)
	carA:updateCar(dt)
	carB:updateCar(dt)
	carC:updateCar(dt)
	carD:updateCar(dt)
	carE:updateCar(dt)
	carF:updateCar(dt)

end 

function fluxDraw()

	--> draws the physics world <--
	   --world:draw(120)
	--> drawing the game <--
		
		player:draw()
		carA:draw()
		carB:draw()
		carC:draw()
		carD:draw()
		carE:draw()
		carF:draw()

    --> print the fps <--
		love.graphics.print("CurrentFPS = "..love.timer.getFPS())
	--> the game score <--
		love.graphics.print("Score = "..score,nil,48)
end