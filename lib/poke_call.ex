defmodule PokeCall do
  @moduledoc """
  PokeCall keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://pokeapi.co/api/v2/"
  plug Tesla.Middleware.JSON

  def poke_id(poke_name) do
    id = get("pokemon/" <> poke_name <> "/")
    case id do
      {:ok, info} ->
        poke_list = info.body
        poke_list["id"]
    end
  end

  def poke_name(poke_id_num) do
    name =
      get("pokemon-form/" <> Integer.to_string(poke_id_num) <> "/")
    case name do
      {:ok, info} ->
        poke_list = info.body
        poke_list["name"]
    end

  end

defmodule GitHub do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.github.com"
  plug Tesla.Middleware.Headers, %{"User-Agent" => "tesla"}
  plug Tesla.Middleware.JSON

  def user_info(login) do
    get("/user/" <> login)
  end

  def user_repos(login) do
    get("/user/" <> login <> "/repos")
  end

end

end
