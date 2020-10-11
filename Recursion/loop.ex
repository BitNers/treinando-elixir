# Due to immutability of variables, loops in Elixir (as in any functional programming language) are written differently from imperative languages.
# In C Language we could write something like this.
"""
  for(i=0; i < sizeof(array); i++){
    array[i] = array[i] *2;
  }
"""

# In the example above, we are mutating the array and variable i.
# Data in Elixir are immutable. For this reason, functional languages rely on recursion: a function is called recusively until a condition
# is reached that stops the recursive action from continuing.

# No data is mutated in this process.
# Check this example that prints a string an arbitrary numbers of times.

defmodule Recursion do
  def print_multiple_times(msg, n) when n <= 1 do
    IO.puts msg
  end

  def print_multiple_times(msg, n) do
    IO.puts msg
    print_multiple_times(msg, n-1)
  end
end

Recursion.print_multiple_times("Hello", 3)

# Similar to case, a function may have many clauses. A particular clause is executed when the arguments passed
# to the function match the clause's argument patterns and its guard evaluates to true.


# We can use the power of recursion to sum a list of numbers.

defmodule Math do
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end
end

IO.puts Math.sum_list([1, 2, 3], 0) # => 6

# We invoke sum_list with the list [1,2,3] and the initial value 0 as arguments. We will try each clause until find one that matches
# according to the pattern matching rules. In this case, the list matches against [head | tail] which binds head to '1' and tails binds to [2,3]
# The accumulator is set to 0.

# Each clause, we add the head of the list to the accumulator, and call sum_list again, recursively, passing the tail of the list as its first arguments.
# The tails will once again match [head|tail] until the list is empty.

sum_list [1, 2, 3], 0
sum_list [2, 3], 1
sum_list [3], 3
sum_list [], 6

# When the list is empty, it will match final clause and stops, returning 6.
# The process to taking a list and reducing it down to the null value is known as a reduce algorithm.

# If we want to double all values inside a list, we need to traverse the list, doubling each element and returning the new list.
# The process to taking a list and mapping over it is known as a map algorithm.


# The Module Enum already provides many conveniences for working with lists.
