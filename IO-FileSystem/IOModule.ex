# The IO module is the main mechanism in Elixir for R/W and stdio/stdout/stderr .
# The usage of the module is pretty straightforward.

IO.puts ("Hello world") # => The function puts will print a message.
IO.gets ("Yes or no?") # => The function gets will get the input from user IN BYTES/String.Break

# By default, function in the IO module read from the standard input and write to the standard output.
# We can change for others standards by passing :stderr as an argument.

IO.puts(:stderr, "Hello world")
