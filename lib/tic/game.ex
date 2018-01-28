defmodule Tic.Game do
  use GenServer

  # Client

  def start_link({player1_id, player2_id}) do
    game_id = UUID.uuid1()
    id = game_id <> player1_id <> player2_id
    GenServer.start_link(__MODULE__, {game_id, player1_id, player2_id}, name: via_tuple(id))
  end

  defp via_tuple(id) do
    {:via, Registry, {:game_process_registry, id}}
  end

  # Server

  def init({game_id, player1_id, player2_id}) do
    init_state = %{
      id: game_id,
      player1: player1_id,
      player2: player2_id
    }
    {:ok, init_state}
  end
end
