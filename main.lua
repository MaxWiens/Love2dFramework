---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2018
-- This main lua file acts as the main game controller.
-- This game framework is meant to use a single camera and
-- a level/stage based game format.

-- Imports
local Settings = require'Settings'
local PhysicsObject = require'objects.PhysicsObject'
local Stage = require'Stage'
-- End Imports
local _settings
local _currentStage

--debug
local Ball = require'objects.Ball'
local Camera = require'graphics.Camera'
local tiledMap = require'maps.tiledMap'
local TileGraphic = require'graphics.TileGraphic'
local TileSet = require'graphics.TileSet'

Layer = require'Layer'

function love.load()
	_settings = Settings:new()
	--_currentStage = Stage:new()


	--debug
	love.graphics.setDefaultFilter( 'nearest', 'nearest', anisotropy )
	local tileSet = TileSet:new('2016-tiles.png',16,16)

	local tileGraphic1 = TileGraphic:new(tileSet, tiledMap.layers[1].data, {xLoop = true})
	local tileGraphic2 = TileGraphic:new(tileSet, tiledMap.layers[2].data, {xLoop = true})--, yLoop = true})

	world = love.physics.newWorld(0,0)
	camera = Camera:new(256,144,world)
	l1 = Layer:new(tileGraphic1, .9)
	l1:add(Ball:new(world, 5, 400, 200, {255,255,0,255}))
	l2 = Layer:new(tileGraphic2)
	l2:add(Ball:new(world, 5, 300, 200))
	_currentStage = Stage:new(camera, {l1, l2})
end

function love.update(dt)

	--debug
	world:update(dt)
	_currentStage:update(dt)
	camera._body:setLinearVelocity(0, 0 )
	if love.keyboard.isDown('w') then
		camera._body:setLinearVelocity(0, -200 )
	end
	if love.keyboard.isDown('a') then
		camera._body:setLinearVelocity(-200, 0 )
	end
	if love.keyboard.isDown('s') then
		camera._body:setLinearVelocity(0, 200 )
	end
	if love.keyboard.isDown('d') then
		camera._body:setLinearVelocity(200, 0 )
	end
	
	
end

function love.draw()


	--debug
	love.graphics.scale( 5, 5 )
	_currentStage:draw()
end


function foo(num)
	if num < 0 then
		return -math.ceil(-num)
	elseif num > 0 then
		return math.ceil(num)
	else
		return 0
	end
end