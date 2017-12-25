---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2017
require 'oop'
require 'lib.physics'
--[[
PhysicsObject
==============================
_body : Body
_shape : Shape 
_fixture : Fixture
==============================
load(body, shape)
update()
draw()
setX(Number val)
setY(Number val)
getX() : Number
getY() : Number
--]]

Camera = {
	_width = 0,
	_height = 0,

	load = function(self, xResolution, yResolution, world, x, y)
		_body = love.physics.newBody()
	end,
	update = function(self)
		
	end,
	draw = function(self)
		love.graphics.circle("fill", )
		love.graphics.polygon("line", self._body:getWorldPoints(self._shape:getPoints()))
	end
 -- getX() : Number
 -- getY() : Number
 -- setX(val) : Void
 -- setY(val) : Void

}
setmetatable(Camera, oop.prototypeMt)
Camera:extends(PhysicsObject)