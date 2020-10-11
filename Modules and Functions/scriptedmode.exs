# In addition to the Elixir extension (.ex), Elixir supports .exs files.
# These files are for scripting Elixir.

# Elixir treats both files exactly the same way, the only difference is in intention.
# .ex Files are meant to be compiled while .exs files are used for scripting.

# When executed, both extensions compile and load their modules in memory.
# .ex write their bytecode to disk in the format of .beam files.

defmodule Math do
  def sum(a, b) do
    a + b
  end
end

IO.puts Math.sum(1, 2)

# Exactly the same example for compilation.

# The file will be compiled in memory and executed, printing 3.
# No bytecode file will be created.
