Player = {}

Player.spawn = function(world,x,y,speed,radius,mode)
	key = Key:new("aKeys")
local self = self or {}
	
self.sprite = love.graphics.newImage("sprites/playersheet-Sheet.png")

	--> self vars <--
self.world = world
self.x = x
self.y = y
self.speed = speed
self.radius = radius
self.mode = mode
self.density = 1

	--> self physics <--
self.body = world:newCircleCollider(self.x,self.y,self.radius)
self.body:setCollisionClass('player')

	--> self functions <-- 
	self.update = function(dt)
	key:change(dt)


		--> player move <--
		if love.keyboard.isDown(key.up) then
			self.body:setLinearVelocity(0,(self.speed)*(-1))
		elseif love.keyboard.isDown(key.down) then
			self.body:setLinearVelocity(0,self.speed)
		elseif love.keyboard.isDown(key.left) then
			self.body:setLinearVelocity((self.speed)*(-1),0)
		elseif love.keyboard.isDown(key.right) then
			self.body:setLinearVelocity(self.speed,0)
		end

	-->setting the world type<--
		if self.body:getX() < 0 then
			self.body:setX(screenW)
		elseif self.body:getX() > screenW then
			self.body:setX(0)
		elseif self.body:getY() <= 0  then
			self.body:setY(screenH - 16)
		elseif self.body:getY() >= screenH - 16  then
			self.body:setY(screenH - 16)
		end
	end

	--> self draw <--
	self.draw = function()
		love.graphics.draw(self.sprite,self.body:getX() - self.radius,self.body:getY() - self.radius,nil,self.radius/32,self.radius/32)
	end

	return self
end
