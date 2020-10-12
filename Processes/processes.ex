# In Elixir, all code runs inside processes.
# Processes are isolated from each other, run concurrent to one another and communicate via message passing.

# Processes are not the basis for concurrency in Elixir, they also provide the means for building distributed and fault-tolerant programs.

# Processes in Elixir are extremely lightweight in terms of memory and CPU. Because of this, it is not uncommon to have tens or even
# hundreds of thousands of processes running simultaneously.

# Now we gonna talk about the basic mechanism for spawning new processes. Is the auto-imported spawn/1 function.

spawn fn -> 1 + 2 end # => PID <0.43.0>

# spawn takes a function which will execute in another process.
# Notice spawns returns a PID. At this point, the process you spawned is very likely dead. The spawned process will execute the given function and exit
# after the function is done.

pid = spawn fx -> 1 + 2 end
Process.alive?(pid) # => False

# It can retrieve the PID of the current process by calling self/0

Process.alive?(self()) # => True.

# We can send messages to a process with send/2 and receive them using receive/1

send self(), {:hello, "world"}

receive do
  {:hello, msg} -> msg
  {:world, _msg} -> "won't match"
end # => This is will return 'world'


# When a message is sent to a process, the message is stores in the process mailbox.
# The receive/1 block goes through the current process mailbox searching for a message that matches any of the given patterns.
# Receive/1 supports guards and many clauses, such as case/2


# The majority of times wwe spawn processes in Elixir, we spawn them as linked processes. Before we show an example with spawn_link/1
# Let's see what happens when a process started with spawn/1 fails

spawn fn -> raise "whoops" end

# It merely logged an error but the parent process is still running. That's because processes are isolated. If we want the failure in one process propagate
# to another one, we should link them. Using spawn_link resolve this problem.

spawn_link fn -> raise "whoops" end

** (EXIT from #PID<0.41.0>) evaluator process exited with reason: an exception was raised:
    ** (RuntimeError) oops
        (stdlib) erl_eval.erl:668: :erl_eval.do_apply/6

[error] Process #PID<0.289.0> raised an exception
** (RuntimeError) oops
    (stdlib) erl_eval.erl:668: :erl_eval.do_apply/6



# Beucase processes are linked, we now see a message saying the parent process, which is the shell process has received an EXIT signal from another process.
# IEx detects this situation and starts a new shell session.

# Linking can also be done manually using Process.link/1. Processes and links play an importante role when building fault-tolerant systems.
# Elixir processes are isolated and don't share anything by default. Therefore, a failure in a process will never crash or corrupt the state of another process.
# Links allow processes to estabilish a relationship in case of failure. We often link our processes to supervisores which will detect when a process dies and starts a new process in its place.


# Tasks build on top of the spawn functions to provide better error reports and introspection.

Task.start fn -> raise "oops" ennd
Task.start_link fn -> raise "oops" ennd


# Instead of spawn or spawn_link, using Task.start and task.start_link, which return {:ok, pid} rather than just the PID.
# This is what enables tasks to be used in supervision trees. But, Task provides convenience functions like Async/Await.

# Finally, if we are building an application that requires state, to keep your application configuration, or you need to parse a file and keep it in memory?
# Store it in a process.

# Processes are most common answer to this question. We can write processes that loop infinitely, maintain state, and send/receive messages.
# For example, let's write a module that starts new processes that work as key-value store in a file called kv.exs
