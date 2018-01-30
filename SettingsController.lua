---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2018

local extends = extends
local Settings = require 'Settings'

module('SettingsContorller')
extends(_M, Object)

local _settings -- Settings object

---
-- 
-- @param settingsObj Object 
function load (self, settingsOxbj)
	self._settings = settingsObj or Settings:new()
end

function updateSettings(self)
	_settings:save()
	local currentSettings = _settings:current()
	currentSettings.video.window_width
	
	love.window.setmode(
		currentSettings.video.window_width, 
		currentSettings.video.window_height,
		{fullscreen=currentSettings.video.fullscreen,
		boarderless=currentSettings.video.boarderless})
	love.audio.setVolume( volume )

end