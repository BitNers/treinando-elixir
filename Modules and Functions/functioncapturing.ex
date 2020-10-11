# Elixir makes a distinction between anonymous functions and named functions.
# The former must be invoked with a dot between the variable name and parentheses.

# The capture operator bridges this gap by allowing named functions to be assigned to variables
# and passed as arguments in the same way we assign, invoke and pass anonymous functions.

Math.zero?(0) # => Using the module Math and the function zero? to check if a number is zero or not

fun = &Math.zero?/1 # => We can create a anonymous function by passing & in the start of function

is_function(fun) # => This is going to return true, because it's an anonymous function.
fun.(0) # => This is going to return true.
