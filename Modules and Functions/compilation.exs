# In Elixir we have several functions into Modules.
# In order to create our own modules in Elixir, we use defmodule.
# Inside the defmodule, we use def to define functions

defmodule Math do
  def sum(a, b) do
    a+b
  end
end

IO.puts(Math.sum(1, 2))

# For the must of the time, it's convenient to write modules into files.
# They can be compiled and reused.
# There is a file called 'calculator.ex'. We can reuse this file in our code.

# To compile it, we use elixirc in CLI.

# This will generate a file called Elixir.Math.beam.
# This file contains bytecode for the defined module.

# For the most part of projects, Elixir are usually organized into three directories:
#   - ebin => Contains the compiled bytecode.
#   - lib => Contains Elixir code (usually '.ex' files)
#   - test =. Contains tests (usually '.exs' files)

# Working on actual projects, the build tool called MIX will be responsible to compile and setting up the proper paths for you.
# For learning purposes, Elixir also supports Scripted Mode, which doesn't generate any compiled artifacts.
