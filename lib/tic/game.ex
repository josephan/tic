defmodule Tic.Game do
  use GenServer

  # Client

  def process(game_id) do
    {:via, Registry, {:game_process_registry, game_id}}
  end

  def start_link do
    game_id = UUID.uuid1()
    GenServer.start_link(__MODULE__, game_id, name: process(game_id))
  end

  def get_id(pid) do
    GenServer.call(pid, :get_id)
  end

  # Server

  def init(game_id) do
    init_state = %{
      id: game_id,
      player1: nil,
      player2: nil
    }
    {:ok, init_state}
  end

  def handle_call(:get_id, _from, state) do
    {:reply, Map.get(state, :id), state}
  end
end
