defmodule ExkeychainWeb.AccountView do
  use ExkeychainWeb, :view

  def render("authentication.json", _) do
    %{ status: "ok" }
  end

  def render("index.json", %{accounts: accounts}) do
    %{ data: render_many(accounts, ExkeychainWeb.AccountView, "account.json")}
  end

  def render("show.json", %{account: account}) do
    %{ data: render_one(account, ExkeychainWeb.AccountView, "account.json")}
  end

  def render("update.json", %{account: {:account, map}}) do
    %{ id: map.id }
  end

  def render("account.json", %{ account: account }) do
    account
  end
end
