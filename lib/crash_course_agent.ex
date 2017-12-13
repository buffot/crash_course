defmodule CrashCourseAgent do
  use GenServer
  @moduledoc """
  Gen Server with Agent API
  """
  # Client
  def start_link(state \\ %{}) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def get(), do: GenServer.call(__MODULE__, {:get})
  def get(key), do: GenServer.call(__MODULE__, {:get, key})
  def put(key, value), do: GenServer.call(__MODULE__, {:put, key, value})
  def delete(key), do: GenServer.call(__MODULE__, {:delete, key})
  def clear(), do: GenServer.call(__MODULE__, {:clear})

  # Server (callbacks)
  def init(state), do: {:ok, state}

  def handle_call({:get}, _from, state), do: {:reply, state, state}

  def handle_call({:get, key}, _from, state), do: {:reply, Map.get(state, key), state}

  def handle_call({:put, key, value}, _from, state) do
    new_state = Map.put(state, key, value)
    {:reply, new_state, new_state}
  end

  def handle_call({:delete, key}, _from, state) do
    new_state = Map.delete(state, key)
    {:reply, new_state, new_state}
  end

  def handle_call({:clear}, _from, _state), do: {:reply, %{}, %{}}
end
