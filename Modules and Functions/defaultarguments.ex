# Named functions in Elixir supports default arguments.
# Any expression is allowed to serve as a default value, but it won't be evaluated during the
# function definition. Every time the function is invoked and any of its default values have to be used.
# The expression for that default value will be evaluated.

defmodule Concat do
  def join(a, b, sep \\ " ") do
    a <> sep <> b
  end
end

IO.puts Concat.join("Hello", "world")      # => Hello world
IO.puts Concat.join("Hello", "world", "_") # => Hello_world

# In this case, we can define the default argument using \\ and the default value after that.
# In the first IO.puts, there is no argument for the 'sep'. So instead stop the execution, the sep has a default value = " "
# But the second IO.puts, the sep has an argument = '_'. So the concat will be using the _ instead " " by default.


# When using default values functions, one must be careful to avoid overlapping function definitions.

defmodule Concat do
  def join(a, b) do
    IO.puts "***First join"
    a <> b
  end

  def join(a, b, sep \\ " ") do
    IO.puts "***Second join"
    a <> sep <> b
  end
end

# If we save the code above in a file and compile it, the Elixir will emit a warning
# - warning: this clause cannot match because a previous clause at line 2 always matches

# That's mean that invoking the join function with two arguments will always choose the first definition, whereas the second one
# will only be invoked when three arguments are passed.
