# Inside a module, we can define functions wif def, and private functions using defp
# A private function only can be invoked locally.

defmodule Math do
  def sum(a, b) do
    do_sum(a, b)
  end

  defp do_sum(a, b) do
    a + b
  end
end

IO.puts Math.sum(1, 2) # -> 3
IO.puts Math.do_sum(1, 2) #  -> Generate an error, (UndefinedFunctionError)


# Function declarations also support guards and multiple clauses.
# If a function has several clauses, Exlir will try each clause until it finds one that matches.
# Here is an example.


# An implementation of a function that checks if the given number is zero or not.
# Giving an argument that does not match any of the clauses raises an error.

defmodule Math do
  def zero?(0) do #=> The trailing question mark means that this function will returns a Boolean.
    true
  end

  def zero?(x) when is_integer(x) do
    false
  end
end

IO.puts Math.zero?(0)         #=> true
IO.puts Math.zero?(1)         #=> false
IO.puts Math.zero?([1, 2, 3]) #=> ** (FunctionClauseError)
IO.puts Math.zero?(0.0)       #=> ** (FunctionClauseError)
