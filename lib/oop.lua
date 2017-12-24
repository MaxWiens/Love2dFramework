---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2017
-- Metatables which can be assigned to tables to make them function
-- like prototype classes.
require 'util' 

oop = {
	--Metatable for prototype class objects
	prototypeMt = {
		__index = {
			---
			-- Creates a new object from the class which this function
			-- is called.
			--
			-- @param ... A number of parameters to be used in the constructor of the object
			-- @return New object 
			new = function(self, ...)
				local newObject = {}

				newObject = util.deepClone(self)

				setmetatable(newObject, oop.activeObjectMt)
				newObject:load(...)
				return newObject
			end,

			---
			-- Modifies a prototype class to extend the cla 
			-- class prototype this function is called from.
			--
			-- @return New class prototype 
			extends = function(self, prototype)
				local newClass = {}
				newClass = util.deepMerge(prototype, self)
				setmetatable(newClass, oop.prototypeMt)
				self = newClass
				return newClass
			end
		}
	},

	--Metatable for active(new) objects
	activeObjectMt = {
		__index = {
			---
			-- A blank constructor which does nothing incase the object
			-- does not have a class
			--
			-- @param ... A number of parameters loaded into the blank constructor 
			load = function(self, ...)
			end
		},
	}
}