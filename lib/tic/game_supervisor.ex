defmodule Tic.GameSupervisor do
  alias DynamicSupervisor, as: DynSup

  use DynSup

  def start_link do
    DynSup.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args), do: DynSup.init(strategy: :one_for_one)

  def start_stack(initial_value) do
    DynSup.start_child(__MODULE__, {Tic.Game, initial_value})
  end

  def stop_stack(stack_pid) do
    DynSup.terminate_child(__MODULE__, stack_pid)
  end

  def which_stacks(), do: DynamicSupervisor.which_children(__MODULE__)
  def count_stacks(), do: DynamicSupervisor.count_children(__MODULE__)
end
