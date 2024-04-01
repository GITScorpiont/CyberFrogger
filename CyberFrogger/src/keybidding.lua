Key = {}

Key.new  = function(keyMode)
local self = string
self.keyMode = keyMode
self.up = up
self.down = down
self.left = left
self.right = right
self.skill = skill


self.change = function(dt)
	if self.keyMode == "aKeys" then
		self.up = "up"
		self.down = "down"
		self.left = "left"
		self.right = "right"
		self.skill = "space"
	else
		self.up = "w"
		self.down = "s"
		self.left = "a"
		self.right = "d"
		self.skill = "space"

	end 
end
	return self
end