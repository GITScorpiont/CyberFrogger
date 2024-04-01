
Car = {}

Car.spawn = function(world,x,y,speed,sz)
local self = self or {}

--local sprites loading
self.spriteGreen = love.graphics.newImage("sprites/laserG.png")
self.spriteBlue = love.graphics.newImage("sprites/laserB.png")
self.spriteRed = love.graphics.newImage("sprites/laserR.png")

	--> self vars <--
self.world = world
self.x = x
self.y = y
self.speed = speed
self.sz = sz
self.w = self.sz
self.h = self.sz
self.sprite = nil

veicleType = function()

	--> Bikes = 1

	--> Cars = 2

	--> Trucks = 3


	self.type = love.math.random(1,3)
		
	if self.type == 1 then
		self.w = self.w * 2
		self.speed = self.speed * 2 
		self.sprite = self.spriteGreen
	end

	if self.type == 2 then
		self.h = self.h *1.5
		self.w = self.w * 3
		self.sprite = self.spriteBlue
	end

	if self.type == 3 then
		self.h = self.h * 1.5
		self.w = self.w * 6
		self.speed = self.speed * 0.75
		self.sprite = self.spriteRed
	end

end

veicleType()


	--> self physics <--
	self.body = world:newBSGRectangleCollider(self.x,self.y,self.w,self.h,self.h/6)
	self.body:setType("dynamic")
	self.body:setCollisionClass('cars')
	--> self functions <-- 
	self.updateCar = function(dt)
	
	--> car move <--
	self.body:setLinearVelocity(self.speed * level,0)

	--> killing the player <--
		if player.body:enter('cars') then
			Gamestate.switch(gameover)	
		end
	
	-->setting the world type<--	
		if self.body:getX() < (0 - self.w) then
			self.body:setX(screenW + self.w)
		elseif self.body:getX() > (screenW + self.w) then
			self.body:setX(0 - self.w)
		end
	end
	
	self.draw = function()
		love.graphics.draw(self.sprite,self.body:getX() - self.w/2,self.body:getY() - self.h/2,nil,self.w/64,self.h/64)
	end

	return self
end


