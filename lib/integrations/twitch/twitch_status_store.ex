defmodule TwitchStatusStore do
  def start_link do
    Agent.start_link(fn -> MapSet.new end, name: __MODULE__)
  end

  def put(key, value) do
    Agent.update(__MODULE__, &Map.put(&1, key, value))
  end

  def get(key) do
    Agent.get(__MODULE__, &Map.get(&1, key))
  end

  def keys do
    Agent.get(__MODULE__, &Map.keys(&1))
  end

  def delete(key) do
    Agent.get(__MODULE__, &Map.delete(&1, key))
  end

end