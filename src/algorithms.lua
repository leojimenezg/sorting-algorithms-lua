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
Compares two values based on an specified order to know if v1 is in order.
@param v1: first value to be used in the condition.
@param v2: second value to be used in the condition.
@param order: strings that indicates the polarity of the condition.
@return: returns the result of the condition.
]]
local function shouldMoveValue(v1, v2, order)
	if order == "ascending" then
		return v1 > v2
	else
		return v1 < v2
	end
end

--[[
Merges two tables into one following an order.
@param right: the right half table in form of an array to merge.
@param left: the left half table in form of an array to merge.
@param order: string that indicates the order of sorting.
@return: returns a new table with the merged and order halfs.
]]
local function mergeTables(left, right, order)
	local merged_table = {}
	local l_index, r_index = 1, 1
	local l_size, r_size = #left, #right
	while l_index <= l_size and r_index <= r_size do
		if not shouldMoveValue(left[l_index], right[r_index], order) then
			table.insert(merged_table, left[l_index])
			l_index = l_index + 1
		else
			table.insert(merged_table, right[r_index])
			r_index = r_index + 1
		end
	end
	while l_index <= l_size do
		table.insert(merged_table, left[l_index])
		l_index = l_index + 1
	end
	while r_index <= r_size do
		table.insert(merged_table, right[r_index])
		r_index = r_index + 1
	end
	return merged_table
end

--[[
Process the MergeSort algorithm. Needed to avoid extra function calls.
@param t: table in form of an array to be used by the algorithm.
@param order: string that indicates the order of sorting.
@return: returns the sorted table. Otherwise, returns nil if t is nil.
]]
local function completeMergeSort(t, order)
	local size = #t
	if size < 2 then return t end
	local half_idx = math.floor(size / 2)
	local left_half = completeMergeSort({table.unpack(t, 1, half_idx)}, order)
	local right_half = completeMergeSort({table.unpack(t, half_idx + 1, size)}, order)
	return mergeTables(left_half, right_half, order)
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
			if shouldMoveValue(t[j], t[j + 1], order) then
				local temp = t[j]
				t[j] = t[j + 1]
				t[j + 1] = temp
			end
		end
		last = last - 1
	end
	return t
end

--[[
MergeSort divides the table in halfs until single elements and sorts by halfs.
@param t: table in form of an array to be used by the algorithm.
@param order: string that indicates the order of sorting (default: "ascending").
@return: returns a new sorted table. Otherwise, returns nil if t is nil.
Warning: the sorting process does not happen in place.
]]
function Algorithms.mergeSort(t, order)
	if t == nil then return nil end
	if #t < 2 then return t end
	order = checkSortOrder(order) or "ascending"
	t = completeMergeSort(t, order)
	return t
end

--[[
QuickSort selects a pivot value in order to create two different halfs until
single elements and sorts by halfs. Uses Lomuto partition algorithm.
@param t: table in form of an array to be used by the algorithm.
@param order: string that indicates the order of sorting (default: "ascending").
@param first: int that indicates the first index of the table. Not required.
@param last: int that indicates the last index of the table. Not required.
@return: returns the sorted table. Otherwise, returns nil if t is nil.
Warning: the sorting process happens in place, modifying the original table.
]]
function Algorithms.quickSort(t, order, first, last)
	if t == nil then return nil end
	first = first or 1
	last = last or #t
	if first >= last then return t end
	order = checkSortOrder(order) or "ascending"
	local middle_idx = math.floor((first + last) / 2)
	local pivot_value = t[middle_idx]
	local temp1 = t[last]
	t[last] = pivot_value
	t[middle_idx] = temp1
	local limiter_idx = first
	for i = first, last - 1 do
		if not shouldMoveValue(t[i], pivot_value, order) then
			local temp2 = t[limiter_idx]
			t[limiter_idx] = t[i]
			t[i] = temp2
			limiter_idx = limiter_idx + 1
		end
	end
	local temp3 = t[limiter_idx]
	t[limiter_idx] = pivot_value
	t[last] = temp3
	--Left half
	Algorithms.quickSort(t, order, first, limiter_idx - 1)
	--Right half
	Algorithms.quickSort(t, order, limiter_idx + 1, last)
	return t
end

--[[
Checks if a table is sorted in an specific order.
@param t: table in form of an array to be used by the algorithm.
@param order: string that indicates the order of sorting (default: "ascending").
@return: returns true if the table is sorted. Otherwise, returns false.
]]
function Algorithms.isSorted(t, order)
	order = checkSortOrder(order) or "ascending"
	if order == "ascending" then
		return checkSortAsc(t)
	else
		return checkSortDes(t)
	end
end
