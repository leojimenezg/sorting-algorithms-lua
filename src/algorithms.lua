--[[
Checks if a table in form of an array is sorted in an ascending order.
If the table is nil, has less than two elements or is ordered, returns true.
]]
local function checkSortAsc(t)
	if t == nil or #t < 2 then return true end
	for i = 1, #t - 1 do
		if t[i] > t[i + 1] then
			return false
		end
	end
	return true
end

--[[
Checks if a table in form of an array is sorted in an descending order.
If the table is nil, has less than two elements or is ordered, returns true.
]]
local function checkSortDes(t)
	if t == nil or #t < 2 then return true end
	for i = 1, #t - 1 do
		if t[i] < t[i + 1] then
			return false
		end
	end
	return true
end

Algorithms = {}

--[[
BogoSort shuffles the table randomly until it is ordered.
@param t: table in form of an array to be used by the algorithm.
@param inplace: boolean that indicates if the sorting is made inplace or in a new table (default: false).
@return: returns nil if t is nil, or if inplace is true (sorting made in same table). Otherwise, returns the sorted table.
]]
function Algorithms.bogoSort(t, inplace)
	if t == nil then return nil end
	inplace = inplace or false
	if inplace == false then
		if #t < 2 then return t end
		--Actual implementation.
	elseif inplace == true then
		if #t < 2 then return nil end
		--Actual implementation.
	end
end

function Algorithms.selectionSort(t, inplace)
	if t == nil then return nil end
	inplace = inplace or false
	if inplace == false then
		if #t < 2 then return t end
		--Actual implementation.
	elseif inplace == true then
		if #t < 2 then return nil end
		--Actual implementation.
	end
end

function Algorithms.bubbleSort(t, inplace)
	if t == nil then return nil end
	inplace = inplace or false
	if inplace == false then
		if #t < 2 then return t end
		--Actual implementation.
	elseif inplace == true then
		if #t < 2 then return nil end
		--Actual implementation.
	end
end

function Algorithms.mergeSort(t, inplace)
	if t == nil then return nil end
	inplace = inplace or false
	if inplace == false then
		if #t < 2 then return t end
		--Actual implementation.
	elseif inplace == true then
		if #t < 2 then return nil end
		--Actual implementation.
	end
end

function Algorithms.quickSort(t, inplace)
	if t == nil then return nil end
	inplace = inplace or false
	if inplace == false then
		if #t < 2 then return t end
		--Actual implementation.
	elseif inplace == true then
		if #t < 2 then return nil end
		--Actual implementation.
	end
end

function Algorithms.isSorted(t, order)
	order = order or "asc"
	if order == "asc" or order == "ascending" then
		return checkSortAsc(t)
	elseif order == "des" or order == "descending" then
		return checkSortDes(t)
	else
		return false
	end
end
