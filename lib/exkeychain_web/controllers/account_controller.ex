defmodule ExkeychainWeb.AccountController do
  use ExkeychainWeb, :controller

  require Logger

  def entrypoint(conn, _params) do
    if :kc_server.is_loaded() do
      redirect(conn, to: "/accounts/")
    else
      redirect(conn, to: Routes.account_path(conn, :load) )
    end

  end

  def form(conn, _params) do
    render(conn, "load.html")
  end

  def load(conn, %{ "file" => file, "pwd" => pwd }) do
    with :ok <- :kc_server.load( file,pwd),
      do: redirect(conn, to: Routes.account_path(conn, :index) )
  end

  def index(conn, _params) do
    accounts = get_accounts([])
    render(conn, :index, accounts: accounts )
end

  def show(conn, %{ "file" => file, "pwd" => pwd, "id" => id }) do
    with :ok <- :kc_server.load(file, pwd),
      {:account, a} <- :kc_server.get(String.to_integer(id)),
      do: render(conn, "show.json", account: a)
  end

  def new(conn, _params) do
    Logger.info("#{ __MODULE__ }#{  elem(__ENV__.function,0) }")
    conn
  end

  def create(conn, _param) do
    Logger.info("#{ __MODULE__ }#{  elem(__ENV__.function,0) }")
    conn
  end

  def update(conn, _param) do
    Logger.info("#{ __MODULE__ }#{  elem(__ENV__.function,0) }")
    conn
  end

  def delete(conn, %{ "file" => file, "pwd" => pwd, "id" => id }) do
    Logger.info("#{ __MODULE__ }#{  elem(__ENV__.function,0) }")
    conn
  end

  @type account :: [%{}]
  @spec get_accounts([account] | []) :: [account | []]
  defp get_accounts([]) do
    case :kc_server.first() do
      {:account, a} -> get_accounts([a])
      _ -> []
    end
  end

  defp get_accounts(acc) do
    case :kc_server.next() do
      {:account, a} -> get_accounts([a|acc])
      _ -> acc
    end
  end
end
