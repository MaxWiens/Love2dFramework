---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2017
-- A number of utility functions.

util = {
	---
	-- Creates a new table which has all the elements from table1
	-- and table2. If there are elements which share the same name
	-- in table1 as table2 they are overwritten
	--
	-- @param table1 One table to merge 
	-- @param table2 Annother table to merge which can overwriteelements from table1
	-- @return Merged table
	deepMerge = function(table1, table2)
		table1 = table1 or {}
		table2 = table2 or {}
		newTable = util.deepclone(table1)
		for key, value in pairs(table2) do
			if type(value) == 'table' then
				newTable[key] = {}
				newTable[key] = util.deepoverwrite(table1[key], table2[key])
			else
				newTable[key] = value
			end
		end
		return newTable
	end,

	---
	-- Creates a new table which has all the values of a table passed
	-- in to the function. This copy does not share any references with
	-- the old table.
	--
	-- @param table Table to clone
	-- @return Copied table
	deepClone = function(table)
		newTable = {}
		for key, value in pairs(table) do
			if type(value) == 'table' then
				newTable[key] = util.deepclone(table[key])
			else
				newTable[key] = value
			end
		end
		return newTable
	end,

	---
	-- Rounds a number to the nearest integer.
	--
	-- @param n Number to round
	-- @return Rounded number
	round = function (n)
		if n < 0 then
			return math.ceil(n-.5)
		else 
			return math.floor(n+.5)
		end
	end
}