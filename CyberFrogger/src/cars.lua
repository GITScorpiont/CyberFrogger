
Car = {}

Car.spawn = function(world,x,y,speed,sz,mode)
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
self.w = sz * 4
self.h = sz
self.mode = mode
self.density = 500

	--> self physics <--
	self.body = world:newBSGRectangleCollider(self.x,self.y,self.w,self.h,self.h/6)
	self.body:setType("kinematic")
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
	
	rSprite = function()
		sPick = love.math.random(1,3)
			if sPick == 1 then
				self.sprite = self.spriteBlue
			end  

			if sPick == 2 then
				self.sprite = self.spriteRed
			end

			if sPick == 3 then
				self.sprite = self.spriteGreen
			end
	end

	rSprite()
	
	self.draw = function()
		love.graphics.draw(self.sprite,self.body:getX() - self.w/2,self.body:getY() - self.h/2,nil,self.w/64,self.h/64)
	end

	return self
end


