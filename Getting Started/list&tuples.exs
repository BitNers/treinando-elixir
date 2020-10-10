# Elixir uses square brackets to specifiy a list of values.
# They can have any type.

a = [1, 2, true, 3]
IO.inspect(a)
# Two lists can be concatenated or subtracted using ++ or --
# List operatores never modify the existing list, they just transform it.
# Elixir data structures are immutables. Concatenating to or removing elements from a list returns a new list.

# USING IO.PUTS TO PRINT A DATA STRUCTURE SUCH AS LIST, TUPLE, STACK, IS NOT RECOMMENDED.
# ALWAYS USE IO.INSPECT TO PRINT THEIR VALUES

# There are two functions when we talk about List: hd() and tl()
# hd() => Return the first element of list
# tl() => Return the second and the remaining of list.

b = [1, 2, 3]

IO.puts (hd(b))
IO.inspect (tl(b))



