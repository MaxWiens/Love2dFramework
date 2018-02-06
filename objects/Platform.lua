---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2018

local PhysicsObject = require 'objects.PhysicsObject'
local love = love
local extends = extends

module("objects.Platform")
extends(_M, PhysicsObject) -- allowing the module to be used as a class

local _body		-- love physics body
local _shape	-- love physics Shape
local _fixture	-- love physics fixture

local _width	-- number width of platform
local _height	-- number height of platform

local _rgba = {255,255,255,255}	-- table with 4 elements containing the color RGBA values of the object
---
--
function load(self, world, w, h, x, y, rgba )
	self._width = w
	self._height = h
	x = x or 0
	y = y or 0
	self._rgba = rgba or _rgba

	self._body = love.physics.newBody(world, x, y, 'kinematic')
	self._shape = love.physics.newRectangleShape(w, h)
	self._fixture = love.physics.newFixture(self._body, self._shape)
end

function draw(self)
	local r, g, b, a = love.graphics.getColor()
	love.graphics.setColor(self._rgba)
	love.graphics.polygon('line',self._body:getWorldPoints( self._shape:getPoints()))
	love.graphics.setColor(r, g, b, a)
end



