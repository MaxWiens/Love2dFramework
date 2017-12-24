---
-- @author Max Wiens-Evangelista
-- @copyright Max Wiens-Evangelista 2017
-- A number of debug functions.

debug = {
	---
	-- Prints the contents of a table to the standard output. Indents
	-- for sub-table contents.
	--
	-- @param table The table which should be printed
	-- @param count The number of indents which should be present
	deepprint = function(table, count)
		count = count or 0
		for key, value in pairs(table) do
			if key == 'parent' then
				for i=1,count do
						io.write('=')
				end
				print(key..'         \t'..tostring(value))
			else
				if type(value) == 'table' then
					for i=1,count do
						io.write('=')
					end
					print(key..'         \t'..tostring(value))
					debug.deepprint(value, count+1)
				else
					for i=1,count do
						io.write('=')
					end
					print(key..'         \t'..tostring(value))
				end
			end
		end
	end
}