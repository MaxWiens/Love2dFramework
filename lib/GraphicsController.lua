---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2017
require 'lib.oop'

GraphicsController = {
	camera = nil, -- Camera
	X_RESOLUTION = love.graphics.getWidth(),
	Y_RESOLUTION = love.graphics.getHeight(),
	load = function(self, )
		self.camera = Camera:new()
	end,

	update = function(self, ... )
		-- body
	end,

	draw = function(self, ... )
		-- body
	end
	
}
setmetatable(GraphicsController, oop.prototypeMt)

