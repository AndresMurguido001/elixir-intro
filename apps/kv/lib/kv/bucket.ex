defmodule KV.Bucket do
  use Agent, restart: :temporary

  @doc """
  Starts a new bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from the bucket by key
  """
  def get(bucket, key) do
    # First argument in callback is the current state structured as a Map
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Sets a value from the bucket by key
  """
  def put(bucket, key, value) do
    # First argument in callback is the current state structured as a Map
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Deletes and returns a value from bucket
  """
  def delete(bucket, key) do
    # First argument in callback is the current state structured as a Map
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
