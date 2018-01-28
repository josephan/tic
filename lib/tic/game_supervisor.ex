defmodule Tic.GameSupervisor do
  alias DynamicSupervisor, as: DynSup
  alias Tic.Game

  use DynSup

  def start_link do
    DynSup.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args), do: DynSup.init(strategy: :one_for_one)

  def start_game do
    spec = %{id: Game, start: {Game, :start_link, []}}
    {:ok, pid} = DynSup.start_child(__MODULE__, spec)
    Game.get_id(pid)
  end

  def stop_game(game_id) do
    DynSup.terminate_child(__MODULE__, Game.process(game_id))
  end

  def which_games(), do: DynSup.which_children(__MODULE__)
  def count_games(), do: DynSup.count_children(__MODULE__)
end
