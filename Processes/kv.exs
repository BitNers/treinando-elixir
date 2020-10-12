defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end


# Note that the start_link function starts a new process that runs the loop/1 function, starting a new empty map.
# The loop function then waits for messages and performs the appropriate action for each message.
# We made loop private by using defp instead of def.
# In the case of a :get message, it sends a message back to the caller and calls loop/1 again, to wait for a new message.

# While :put message actually invokes loop/1 with a new version of the map, with the given key and value stores.
# Let's try running iex kv.exs
