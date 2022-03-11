defmodule PokeCallWeb.PokeController do
  use PokeCallWeb, :controller

  alias PokeCall.Pokedex

  def index(conn, _params) do
    pokemons = Pokedex.list_pokemons()
    render(conn, "index.html", pokemons: pokemons)
  end
end
