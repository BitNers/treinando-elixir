# Conditions in Elixir is used to control flow structures in code.
# There are four keywords: case cond if/unless and do/end blocks


# Case
# Allows to compare a value against many patterns until we find a matching one.
# We can pattern match against an existing variable, using operator ^
x = 2
case {1,2,3} do
	{4,5,6} ->
		"This clause won't match."
	{1,^x,3} ->
		"This clause will match and bind x to 2 in this clause."
	_ ->
		"This clause would match any value"
end

# Cond
# Useful when needs to match against different values, however, in many circumstances,
# we want to check and find the first one that does not evaluate to nil or false.
# This is equivalent to else if clauses.
# If all conditions return nil or false, an error CondClauseError is raised, to avoid this error
# we need to add a final condition, equal to true, which will always match

cond do
	2+2 == 5 ->
		IO.puts("This will not be true.")
	2 * 2 == 3 ->
		IO.puts("Nor this.")
	1 + 1 == 2 ->
		IO.puts("But this will.")
end

cond do
	2+2 == 5 ->
		IO.puts("This will not be true.")
	2 * 2 == 3 ->
		IO.puts("Nor this.")
	1 + 1 == 3 ->
		IO.puts("But this will not work too.")
	true ->
		IO.puts("This is always true, to avoid the CondClauseError")
end


# If and Unless
# Beside case and cond, Elixir provides If and Unless, which are useful when you need to check for only one condition.

if true do
	IO.puts("This works!")
end

unless true do
	IO.puts("This will never be seen")
end

# If the codition given to if returns false or nil, the body given between do and end is not executed and instead
# returns nil. The OPPOSITE HAPPENS WITH UNLESS.

if nil do
	IO.puts("This won't be seen...")
else
	IO.puts("This will!")
end

# An interesting note regarding if and unless, is that they are implemented as macros in the language.
# There are not special language constructs as they would be in many languages. 
# Check the documentation and the source of if in the Kernel moduels docs.
# The Kernel Module is also where operators like +/2 and functions like is_function/2 are defined.
# All automatically imported and available in your code by default.



# Do/End Blocks
# Learning about four control structures: Case, Cond, If and Unless.
# They were all wrapped in do/end blocks.

if true, do: 1 + 2

# Notice how the example above has a comma between true and do:
# That's beucase it is using Elixir's regular syntax, where each argument is separated by a comma.
# We say this syntax is using a keyword lists. We can passe else using keywords too.

if false, do :this, else: that

# Do/End blocks are a syntactic convenience built on top of the keywords one. That's why do/end blocks do not require a comma between their arguments.
# They are useful because they remove the verbosity when writing blocks of code.

# This works, but look how messy is this block. 
a = 0

if true do
	a = 1 + 2
	a + 10
end

#That's better
a = 0
if true, do: (
	a = 1 + 2
	a + 10
)

# We can use in bound to the outermost function call.
# Example:

is_number if true do
	1+2
end

# This will generate a CompileError. Because that invocation passes two arguments, and the function does not exist.
# The if true expression is invalid in itself because it needs the block but since the arity of is_number does not match, Elixir does not even reach its evaluation.
# Adding explicit parentheses is enough to bind the block to if.

is_number(if true do
	1+2
end)

