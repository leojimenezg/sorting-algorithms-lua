# Sorting Algorithms Lua

Lua implementations of classic sorting algorithms. Contains fundamental sorting techniques like Bubble Sort, Selection Sort, Merge Sort, Bogo Sort, etc.

---

## Installation

To get this project up and runnig on your local machine, follow the next instructions.

### Prerequisites
Before anything else, make sure you have installed **Lua 5.x.x** or a newer version in your system.

### Steps
1. **Clone the repository:**
Open your prefered terminal and clone the project to your local machine.
    ```bash
    git clone https://github.com/leojimenezg/sorting-algorithms-lua.git
    ```
2. **Navigate into the project directory:**
    ```bash
    cd sorting-algorithms-lua
    ```
3. **Run the Application**
Finally, execute the main script to launch the Sorting Algorithms Lua Program.
    ```bash
    lua src/main.lua
    ```

---

## Quick Start

Get started with Sorting Algorithms Lua in just a few simple steps:
1. **Import the module:**
    ```Lua
    require("src/algorithms.lua")
    ```
2. **Create your data:**
    ```Lua
    local numbers = {64, 34, 25, 12, 22, 11, 90}
    ```
3. **Sort using any algorithm:**
    ```Lua
    local sorted_numbers = Algorithms.quickSort(numbers, "asc")
    ```

That's it! Your table is now sorted and ready to further use.

---

## How Does It Work?

### Project Architecture
This project is built around a simple but effective architecture designed for clarity and maintainability. All sorting algorithms are encapsulated within the `Algorithms` object in `algorithms.lua`, serving two  two purposes: preventind namespace pollution and creating a clear, organized tool where users immediately understand that `Algorithms.quickSort()` is part of the same family of functions as `Algorithms.bubbleSort()`.
```Lua
--Simple import and usage pattern.
require("src/algorithms")
local sortedData = Algorithms.quickSort(myTable, "asc")
```

### Memory management philosophy
A key design principle in this implementation is leveraging Lua's table reference system. Since Lua passes tables by reference, most algorithms operate in-place, modifying the original table directly. This approach offers several advantages:
* Memory efficiency: No additional space needed for copying large datasets.
* Performance: Eliminates the overhead of creating new table structures.
* Simplicity: Straightforward implementation that mirrors classic algorithm descriptions.

However, this design choice required a careful exception for MergeSort. The merge operation's complexity would significantly increase if forced to work in-place, potentially making the code less readable and harder to maintain. Therefore, MergeSort creates and returns a new table, trading memory efficiency for implementation clarity.

### Algorithm implementation details
Each sorting function follows a consistent signature: `algorithmName(table, order)` where:
* `table`: The input table in form of an array to be sorted (modified in-place for most algorithms).
* `order`: String parameter accepting "asc"/"ascending" or "des"/"descending". This parameter accepts both abbreviated and full forms for allowing users to choose their preferred style without sacrificing functionality.

**In-Place Algorithms (bubbleSort, selectionSort, quickSort, bogoSort):** These functions modify the original table and return a reference to it. The return value is provided for convenience and method chaining, but the original table is already sorted.
**Non In-Place Algorithm (mergeSort):** Due to the recursive nature of the merge operation and the complexity of implementing it in-place, this function creates a new sorted table. The original table remains unchanged.

### Design decisions
The decision to return table references even for in-place operations serves a practical purpose: it enables assignment patterns that make the sorting operation explicit in the code (`data = Algorithms.bubbleSort(data, "asc")`), improving code readability while maintaining the efficiency of in-place operations.

This architecture makes extending the project straightforward, where new algorithms simply need to follow the established signature and be added to the `Algorithms` object, maintaining consistency across the entire tool.

---

## Notes

* This project was incredibly enjoyable to develop in Lua. There's something elegant about Lua's simplicity that makes implementing classic algorithms feel natural and clean. It has quickly become in one of my favorite programming languages.
* Building this library taught me valuable lessons beyond just sorting algorithms. I discovered the importance of consistent function signatures, learned better documentation practices, and gained deeper insights into algorithm trade-offs.
* While I haven't subjected this code to industrial-scale stress testing, I've verified its correctness across various scenarios and data sizes. The algorithms perform consistently and reliably when used as intended. If you encounter edge cases or unexpected behavior, please feel free to open an issue.
* I focused on creating clean, readable implementations rather than heavily optimized versions. There's certainly room for micro-optimizations, but I prioritized code clarity and educational value.

---

## Useful Resources

* [Lua Manual](https://www.lua.org/manual/5.4/manual.html) - The official and comprehensive reference manual for Lua 5.4.
* [Lua Table Usage](https://www.lua.org/manual/5.4/manual.html#6.6) - Detailed information on `table` manipulation functions in the official manual.
* [BogoSort Algorithm](https://en.wikipedia.org/wiki/Bogosort) - Humorous but educational look at the worst possible sorting algorithm.
* [SelectionSort Algorithm](https://en.wikipedia.org/wiki/Selection_sort) - Comprehensive explanation of selection sort with implementation details.
* [BubbleSort Algorithm](https://en.wikipedia.org/wiki/Bubble_sort) - Deep dive into bubble sort algorithm with complexity analysis and variants.
* [MergeSort Algorithm](https://en.wikipedia.org/wiki/Merge_sort) - Detailed coverage of merge sort including divide-and-conquer strategy.
* [QuickSort Algorithm](https://en.wikipedia.org/wiki/Quicksort) - Extensive article on quicksort variations, pivot selection, and optimization techniques.
