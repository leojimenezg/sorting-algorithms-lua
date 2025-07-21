math.randomseed(os.time())

--[[
Checks if a string is a valid sorting order.
@param s: string containing the sorting order.
@return: Returns "ascending" or "descending". Otherwise, returns nil.
]]
local function checkSortOrder(s)
	if s == "asc" or s == "ascending" then
		return "ascending"
	elseif s == "des" or s == "descending" then
		return "descending"
	else return nil end
end

--[[
Checks if a table in form of an array is sorted in an ascending order.
@param t: the table in form of an array to be used by the function.
@return: returns true if ordered. Otherwise, returns false.
]]
local function checkSortAsc(t)
	for i = 1, #t - 1 do
		if t[i] > t[i + 1] then
			return false
		end
	end
	return true
end

--[[
Checks if a table in form of an array is sorted in a descending order.
@param t: the table in form of an array to be used by the function.
@return: returns true if ordered. Otherwise, returns false.
]]
local function checkSortDes(t)
	for i = 1, #t - 1 do
		if t[i] < t[i + 1] then
			return false
		end
	end
	return true
end

--[[
Shuffles all the elements of a table using Fisher-Yates algorithm.
@param t: the table in form of an array to be used by the function.
@return: returns the shuffled table.
Warning: the sorting process happens in place, modifying the original table.
]]
local function shuffleTable(t)
	for i = #t, 1, -1 do
		local random_idx = math.random(1, i)
		local temp = t[i]
		t[i] = t[random_idx]
		t[random_idx] = temp
	end
	return t
end

--[[
Gets the index of the minimun value of a table going through all elements.
@param t: the table in form of an array to be used by the function.
@param first: the starting index for the search process.
@param last: the ending index for the search process.
@return: returns the index of the minimun value.
]]
local function getMinIndex(t, first, last)
	local min_index = first
	for i = first, last do
		if t[i] < t[min_index] then
			min_index = i
		end
	end
	return min_index
end

--[[
Gets the index of the maximum value of a table going through all elements.
@param t: the table in form of an array to be used by the function.
@param first: the starting index for the search process.
@param last: the ending index for the search process.
@return: returns the index of the maximum value.
]]
local function getMaxIndex(t, first, last)
	local max_index = first
	for i = first, last do
		if t[i] > t[max_index] then
			max_index = i
		end
	end
	return max_index
end

--[[
Compares two values based on an specified order.
@param v1: first value to be used in the condition.
@param v2: second value to be used in the condition.
@param order: strings that indicates the polarity of the condition.
@return: returns the result of the condition.
]]
local function shouldSwap(v1, v2, order)
	if order == "ascending" then
		return v1 > v2
	else
		return v1 < v2
	end
end

Algorithms = {}

--[[
BogoSort shuffles the table randomly until it is sorted.
@param t: table in form of an array to be used by the algorithm.
@param order: string that indicates the order of sorting (default: "ascending").
@return: returns the sorted table. Otherwise, returns nil if t is nil.
Warning: the sorting process happens in place, modifying the original table.
]]
function Algorithms.bogoSort(t, order)
	if t == nil then return nil end
	if #t < 2 then return t end
	order = checkSortOrder(order) or "ascending"
	local checkSort
	if order == "ascending" then
		checkSort = checkSortAsc
	else
		checkSort = checkSortDes
	end
	while not checkSort(t) do
		t = shuffleTable(t)
	end
	return t
end

--[[
SelectionSort uses the index of the min/max value and swaps values until sorted.
@param t: table in form of an array to be used by the algorithm.
@param order: string that indicates the order of sorting (default: "ascending").
@return: returns the sorted table. Otherwise, returns nil if t is nil.
Warning: the sorting process happens in place, modifying the original table.
]]
function Algorithms.selectionSort(t, order)
	if t == nil then return nil end
	local size = #t
	if size < 2 then return t end
	order = checkSortOrder(order) or "ascending"
	local getIndex
	if order == "ascending" then
		getIndex = getMinIndex
	else
		getIndex = getMaxIndex
	end
	for i = 1, size - 1 do
		local index = getIndex(t, i, size)
		if index ~= i then
			local temp = t[i]
			t[i] = t[index]
			t[index] = temp
		end
	end
	return t
end

--[[
BubbleSort swaps the min/max value constantly until sorted.
@param t: table in form of an array to be used by the algorithm.
@param order: string that indicates the order of sorting (default: "ascending").
@return: returns the sorted table. Otherwise, returns nil if t is nil.
Warning: the sorting process happens in place, modifying the original table.
]]
function Algorithms.bubbleSort(t, order)
	if t == nil then return nil end
	local size = #t
	if size < 2 then return t end
	order = checkSortOrder(order) or "ascending"
	local last = size - 1
	for _ = 1, last do
		for j = 1, last do
			if shouldSwap(t[j], t[j + 1], order) then
				local temp = t[j]
				t[j] = t[j + 1]
				t[j + 1] = temp
			end
		end
		last = last - 1
	end
	return t
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
	order = order or "ascending"
	if order == "asc" or order == "ascending" then
		return checkSortAsc(t)
	elseif order == "des" or order == "descending" then
		return checkSortDes(t)
	else
		return false
	end
end
