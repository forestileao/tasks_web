defmodule TasksWeb.Tasks do
  @moduledoc """
  In-memory store for tasks
  """

  def start_link do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, opts},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end

  def list, do: Agent.get(__MODULE__, & &1)
  def add(name, description) do
    Agent.update(__MODULE__, fn tasks -> [{name, description} | tasks] end)
  end

  def delete(index) do
    Agent.update(__MODULE__, fn tasks -> List.delete_at(tasks, index) end)
  end
end
