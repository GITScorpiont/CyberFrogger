function spawnFlux()

	--> worldMaps <--
	initialStreet = sti("maps/normalStreet.lua")
	gameMap = initialStreet
	--> cameras <--

	cam = camera()

	--> sets the game diff <--
	score = level * 10

	--> world physics <--
	world = wf.newWorld(0,0,true)
	world:addCollisionClass('player')
	world:addCollisionClass('cars')
	world:addCollisionClass('shooters')

    --> objects custom vars <--

    carSpeed = screenW/16

	--> spawning objects <--

	player = Player.spawn(world,screenW/2,screenH ,screenH/2,playerSz,"line","dasher")
	carA = Car.spawn(world,love.math.random(0,screenW),screenH - screenH/7,carSpeed,carSize)
	carB = Car.spawn(world,love.math.random(0,screenW),screenH - (screenH/7)*2,carSpeed*(-1),carSize)
	carC = Car.spawn(world,love.math.random(0,screenW),screenH - (screenH/7)*3,carSpeed,carSize)
	carD = Car.spawn(world,love.math.random(0,screenW),screenH - (screenH/7)*4,carSpeed*(-1),carSize)
	carE = Car.spawn(world,love.math.random(0,screenW),screenH - (screenH/7)*5,carSpeed,carSize)
	carF = Car.spawn(world,love.math.random(0,screenW),screenH - (screenH/7)*6,carSpeed*(-1),carSize)

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
	--> cam lock at map(kill the black borders) <--

	mWidth = gameMap.width * gameMap.tilewidth
	mHeight = gameMap.height * gameMap.tileheight

	wSize = screenW/mWidth
	hSize = screenH/mHeight
end 

function fluxDraw()

	--> draws the physics world <--
	   --world:draw(120)
	--> drawing the game <--
		cam:attach()
			gameMap:draw(nil,nil,wSize,hSize)
			player:draw()
			carA:draw()
			carB:draw()
			carC:draw()
			carD:draw()
			carE:draw()
			carF:draw()
		cam:detach()

    --> print the fps <--
		love.graphics.print("CurrentFPS = "..love.timer.getFPS())
	--> the game score <--
		love.graphics.print("Score = "..score,nil,48)
end