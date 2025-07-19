require("src.algorithms")

local algorithms = Algorithms

local tests = {
	--Basic cases.
	{3, 1, 4, 1, 5, 9, 2, 6},
	{5, 4, 3, 2, 1},
	{1, 2, 3, 4, 5},
	--Extreme cases.
	{42},
	{},
	{7, 7, 7, 7},
	{100, -50, 0, 25, -100},
	--Worst case.
	{10, 9, 8, 7, 6, 5, 4, 3, 2, 1},
}

local order = "asc"
local algorithm = algorithms.bogoSort
for i, test in pairs(tests) do
	print("Test " .. i)
	test = algorithm(test, order)
	if test == nil then break end
	for j=1, #test do
		print(test[j])
	end
end
