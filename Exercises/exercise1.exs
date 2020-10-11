# Create a list. The lenghts' input will be the Input by the user.
#
# The list will be filled up with random numbers.
# After that, code from scratch a bubble sort algorithm for this list.
# BigO(n^2)

# IO.gets always read the Input as String or Bytes.
# Using pipelininig |> to redirect the Stdout to another function to trimm_trailing, we can remove blank spaces.
# After that, we call the Built-in function in Module String to convert to the type that we want.

lenght = IO.gets("Set the List Lenght: ") |> String.trim_trailing
lenght = String.to_integer(lenght)

# If Lenght is lower than zero, the program will stop.
# Using System.halt for a script is good, but if you are running an application as Web Service
# Instead using System.halt, uses System.stop(0)

# You can call exit(:shutdown) to exit the current process.

if (lenght <= 0) do
	IO.puts("You must put a value greater than zero / You must input an Integer type data.")
	System.halt(0)
end

# We need to recursively insert the data in a function before put it in the memory.
# Variables in Elixir are immutable, that's mean if you declare 'x=1', you cannot change it along the running program.
# This is good because we save R/W in Memory, but we lose this easily to change a variable in an executing program.

# A variable list is running through a loop, for 1..lenght, pipelining this loop with an Enum.map function, where randomly
# receive random numbers from 0 to 9999.

list = 1..lenght |> Enum.map(fn _ -> Enum.random(0..9999) end)

# Now we have the list, but it's seems like unsorted.
# We can use Enum.sort() function to sorting it and done, but we want to create a bubble sort form scratch.
# Enum.sort() uses a merge sort algorithm.
# Using IO.inspect, we can declare label to describe the line which we want to see.


IO.inspect(list, label: "The List is ")
IO.inspect(Enum.sort(list), label: "Using Enum.sort() (Using Merge Sort) in List is ")

# Defining a function which receives a List and make a Bubble Sorting algorithm
# First of all, we gonna define a Module, this module will be called Bubble.
# A module can hold functions as an object and their methods.

defmodule Bubble do
	
	# In this function, we gonna check if the parameter is a list.
	# If is a list, then will call another function called make_pass(), which pass two parameters: the actual list and the new list.
	def sort(list) when is_list(list) do
		make_pass(do_sort(list, []), list)
	end

	# Now, we recursiverly check for the values using the function do_sort
	def make_pass(bubbled_list, old_list) when bubbled_list != old_list do
	      do_sort(bubbled_list, []) |> make_pass(bubbled_list)
        end
	
	def make_pass(bubbled_list, old_list) when bubbled_list == old_list do
		bubbled_list
	end

	def do_sort(_list = [], _acc) do
		[]
	end
	
	def do_sort([first|[]], acc) do
		acc ++ [first]
	end
	
	# Here's gonna be the swap between two arrays.
	def do_sort([first|[second|tail]], acc) do
		[new_first, new_second] = swap(first, second)
		do_sort([new_second|tail], acc ++ [new_first])
	end

	defp swap(e1, e2) do
		if e1 <= e2 do [e1, e2] else [e2, e1] end
	end
end

IO.inspect(Bubble.sort(list), label: "Using the function bubble sort from scratch: ")

