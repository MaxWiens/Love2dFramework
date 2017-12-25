---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2017
require 'lib.oop'
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

PhysicsObject = {
	_body = nil,
	_shape = nil,
	_fixture = nil,
	
	load = function(self, body, shape, density)
		self._body = body
		self._shape = shape
		self._fixture = love.physics.newFixture(self._body, self._shape, density)
	end,

	update = function(self)
		
	end,

	draw = function(self)
		love.graphics.draw()
	end,

	getX = function(self)
		return self._body:getX()
	end,
	setX = function(self, val)
		self._body:setX(val)
	end,
	getY = function(self)
		return self._body:getY()
	end,
	setY = function(self, val)
		self._body:setY(val)
	end,
}
setmetatable(PhysicsObject, oop.prototypeMt)



--[[
RectanglePhysicsObject = {
	load = function(self, width, height, world, density, x, y)
		density = density or 1
		x = x or 0
		y = y or 0
		self._body = love.physics.newBody()
		self._shape = love.physics.newRectangleShape(width, height)
		self._fixture = love.physics.newFixture(self._body, self._shape, density)
	end
}
setmetatable(RectanglePhysicsObject, oop.prototypeMt)
RectanglePhysicsObject:extends(PhysicsObject)

--]]