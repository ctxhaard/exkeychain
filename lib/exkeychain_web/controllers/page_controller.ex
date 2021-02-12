defmodule ExkeychainWeb.PageController do
  use ExkeychainWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
