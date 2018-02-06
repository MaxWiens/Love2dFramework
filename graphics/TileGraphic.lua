---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2018

local Object = require'Object'
local love = love
local extends = extends
local math = math

--debug
local print = print 

module("graphics.TileGraphic")
extends(_M, Object) -- allowing the module to be used as a class

local layer --layer which the TileGraphic is appart of
local tileSet
local flags
local mapWidth 
local mapHeight
local map
local spriteBatch

---
--
--@param spriteBatch
function load(self, tileSet, map, flags)
	local flags = flags or {
		xLoop = false,
		yLoop = false
	}
	self.tileSet = tileSet
	self.map = map
	self.mapWidth = #map[1]
	self.mapHeight = #map
	self.spriteBatch = love.graphics.newSpriteBatch(tileSet.image)
	self.flags = flags
end

function update(self, dt)
	local xRes, yRes = self.layer.stage.camera:getResolution()
	local xStartingTile = math.floor(-self.layer.xMod/self.tileSet.tileWidth) + 1
	local yStartingTile = math.floor(-self.layer.yMod/self.tileSet.tileHeight) + 1
	local xEndingTile = math.ceil((xRes-self.layer.xMod)/self.tileSet.tileWidth)
	local yEndingTile = math.ceil(yRes/self.tileSet.tileHeight) + yStartingTile
					print(xStartingTile,xEndingTile)	
	--print(xStartingTile,yStartingTile,xEndingTile, yEndingTile)

	self.spriteBatch:clear()
	if self.flags.xLoop and self.flags.yLoop then
		for y=yStartingTile, yEndingTile%self.mapHeight do
			for x=xStartingTile, xEndingTile%self.mapWidth do
				print(1)
				if self.map[y][x] ~= 0 then
					self.spriteBatch:add(self.tileSet.quads[self.map[y][x]], x*self.tileSet.tileWidth, y*self.tileSet.tileHeight)
				end
			end
		end
	elseif self.flags.xLoop then
		for y=yStartingTile, math.min(yEndingTile, self.mapHeight) do
			for x=xStartingTile, math.min(xEndingTile, self.mapWidth) do
				if self.map[y] and self.map[y][x] and self.map[y][x]~=0 then
					self.spriteBatch:add(self.tileSet.quads[
						self.map[y][x]], 
						(x-1)*self.tileSet.tileWidth, 
						(y-1)*self.tileSet.tileHeight)
				end
			end
		end
	elseif self.flags.yLoop then
		for y=yStartingTile, yEndingTile%self.mapHeight do
			for x=xStartingTile, math.min(xEndingTile, self.mapWidth) do
				print(3)
				self.spriteBatch:add(self.tileSet.quads[self.map[y][x]], x*self.tileSet.tileWidth, y*self.tileSet.tileHeight)
			end
		end
	else
		for y = yStartingTile, math.min(yEndingTile, self.mapHeight) do
			for x=xStartingTile, math.min(xEndingTile, self.mapWidth) do
				print(4)
				self.spriteBatch:add(self.tileSet.quads[self.map[y][x]], x*self.tileSet.tileWidth, y*self.tileSet.tileHeight)
			end
		end
	end
	self.spriteBatch:flush()
end

function draw(self, xMod, yMod)
	love.graphics.draw(self.spriteBatch, xMod, yMod)
end
