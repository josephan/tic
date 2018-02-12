defmodule TicWeb.GameChannel do
  use TicWeb, :channel

  def join("game:" <> game_id, _params, socket) do
    {:ok, socket}
  end

  def terminate({:shutdown, :left}, socket) do
    # call if clients disconnects from channel
  end
end
