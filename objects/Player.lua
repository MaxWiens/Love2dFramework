---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2018

local PhysicsObject = require 'objects.PhysicsObject'
local love = love
local extends = extends

module("objects.Player")
extends(_M, PhysicsObject) -- allowing the module to be used as a class

local _body		-- love physics body
local _shape	-- love physics Shape
local _fixture	-- love physics fixture

local _radius	-- number raidus of circle

---
--
function load(self, world, body, shape, x, y)
	self._radius = r or 5
	x = x or 0
	y = y or 0
	self._rgba = rgba or _rgba

	self._body = love.physics.newBody(world, x, y, 'dynamic')
	self._shape = love.physics.newCircleShape(r)
	self._fixture = love.physics.newFixture(self._body, self._shape)
	self._body:setMass(10)
	self._fixture:setRestitution(.8)
end

function draw(self)
	local r, g, b, a = love.graphics.getColor()
	love.graphics.setColor(self._rgba)
	local x,y =	self._body:getWorldPoint( self._shape:getPoint())
	love.graphics.circle('fill',x, y, self._radius)
	love.graphics.setColor(r, g, b, a)
end



