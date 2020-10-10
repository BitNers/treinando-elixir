# An Atom is a constant whose value is its own name.
# They are often useful to enumerate distinct values

IO.puts ("Declaring :apple :orange :watermelon as Atoms for this code.")
:apple
:orange
:watermelon


IO.puts("Checking :apple == :apple => #{:apple == :apple}")
IO.puts("Checking :apple == :orange => #{:apple == :orange}")

# They often are used to express the state of an operation, such as :ok or :error
# Booleans are also atoms.

# Elixir allows to skip the leading ':' for the atoms false, true and nil.
