---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2018

-- import statements 
local Object = require 'Object'
local PhysicsObject = require 'objects.PhysicsObject'
local love = love
local extends = extends

-- debug
local print = print 

module("objects.Rectangle")
extends(_M, PhysicsObject)

local _width	-- number
local _height 	-- number
local _body		-- love physics body
local _shape	-- love physics Shape
local _fixture	-- love physics fixture

---
-- 
-- @param body Physics body of the object
-- @param shape Physics shape of the object
-- @param density 
-- @param ... Colision masks
function load(self, w, h, world, body, shape, density, ...)
	self._width = w
	self._height = h
	self._body = body
	self._shape = love.physics.newPolygonShape(verts)
	self._fixture = love.physics.newFixture(self._body, self._shape, density)
	
	self._body:setUserData(self)
	self._fixture:setUserData(self)
	if ... then
		self._fixture:setMask(...)
	end
end
