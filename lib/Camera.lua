---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2017
require 'oop'
require 'lib.physics'

Camera = {
	_width = 0,
	_height = 0,
	_x = 0,
	_y = 0,
	_body = nil, -- Body
	_shape = nil, -- Shape
	_fixture = nil, -- Fixture

	load = function(self, width, height, x, y)
		_body = love.physics.newBody()
	end,
	update = function(self)
		
	end,
	draw = function(self)
		
	end
}
setmetatable(Camera, oop.prototypeMt)
