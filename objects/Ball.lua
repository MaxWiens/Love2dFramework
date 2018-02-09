---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2018

local PhysicsObject = require 'objects.PhysicsObject'
local love = love
local extends = extends

module("objects.Ball")
extends(_M, PhysicsObject) -- allowing the module to be used as a class

local _body		-- love physics body
local _shape	-- love physics Shape
local _fixture	-- love physics fixture

local _radius	-- number raidus of circle
local _rgba = {255,0,0,255}	-- table with 4 elements containing the color RGBA values of the object
---
--
function load(self, world, r, x, y, rgba )
	r = r or 5
	x = x or 0
	y = y or 0
	self._radius = r
	self._rgba = rgba or _rgba

	self._body = love.physics.newBody(world, x, y, 'dynamic')
	self._shape = love.physics.newCircleShape(r)
	self._fixture = love.physics.newFixture(self._body, self._shape)
	self._body:setMass(10)
	self._fixture:setRestitution(-1)
end

function draw(self, xMod, yMod)
	xMod = xMod or 0
	yMod = yMod or 0
	local r, g, b, a = love.graphics.getColor()
	love.graphics.setColor(self._rgba)
	local x,y =	self._body:getWorldPoint( self._shape:getPoint())
	love.graphics.circle('fill',x+xMod, y+yMod, self._radius)
	love.graphics.setColor(r, g, b, a)
end



