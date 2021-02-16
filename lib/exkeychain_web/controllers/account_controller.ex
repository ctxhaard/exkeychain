defmodule ExkeychainWeb.AccountController do
  use ExkeychainWeb, :controller

  require Logger

  def index(conn, %{ "file" => file, "pwd" => pwd }) do
    with :ok <- :kc_server.load( file,pwd),
      accounts = get_accounts([]),
      do: render(conn, "index.json", accounts: accounts )
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
