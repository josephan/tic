defmodule TicWeb.GameController do
  use TicWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, _params) do
    game_id = Tic.GameSupervisor.start_game()
    redirect(conn, to: game_path(conn, :show, game_id))
  end

  def show(conn, %{"id" => game_id}) do
    case Tic.Game.join(game_id) do
      {:ok, uuid} ->
        conn
        |> render("show.html", player_id: uuid)
      {:error, _msg} ->
        conn
        |> put_flash(:error, "Sorry that game is full.")
        |> redirect(to: game_path(conn, :index))
    end
  end
end
