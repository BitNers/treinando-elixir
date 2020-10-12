# The File Module contains functions that allows us to open files as IO devices.
# Files are opened in binary mode, which requires developers to use IO.binread/2 and IO.binwrite/2 functionn from the IO module.

#      {:ok, file} = File.open("hello", [:write])
#      IO.binwrite(file, "world")
#      File.close()
#      File.read("hello")


# A file can also be opened with :utf8 encoding, which tells the File module to interpret the bytes read from the file as UTF-8 encoded bytes.

# Beside functions for opening R/W files, the module File work with the file system. Those function are named after their UNIX equivalents.
# For example, we can use File.rm/1 to remove files or File.mkdir/1 to create directories.
# Using File.rm_rf/1 or File.cp_r/2 to remove or copy recursively, respectively.


# Let's read a file named exemplo.txt
# Storing the readed bytes from exemplo.txt to a variable called arq, we can print it using IO.inspect function.

arq = File.read("exemplo.txt")
IO.inspect arq

# You gonna also notice that functions in the File module have two variantes.
# - The Regular (File.cp/3)
# - The Trailing Bang (!) => (File.cp!/3)

# This exclamation mark is used to return only the content of the file, instead of a tuple.

arq = File.read!("exemplo.txt")

IO.puts arq



# The Path module is going to access directories from the host. This module provides facilities for working with such paths.
Path.join("~/Elixir") # => This will change directory to /home/<$USER>/Elixir path.

# Using Path Module takes care of different Operating Systems.
# The Elixir will automatically convert / to \ on Windows when performing file operations.
