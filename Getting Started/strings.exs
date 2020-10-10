# Strings are delimited by double quotes, encoded in UTF-8
# Windows Terminal does not use UTF-8 by default, needing to change the encoding

IO.puts("Hello" <> " World")

# Strings can have line breaks and escape characteres.
# String are represented internally by contiguous sequences of bytes, known as binaries.

IO.puts(is_binary("hello"))
IO.puts(byte_size("hello"))


# There is a module known as String, having a bunch of functions that operate on strings.
# Such as lenght, upcase, replace, match, split, reverse, et cetera.


