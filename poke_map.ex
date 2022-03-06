defmodule PokeCall do
  @moduledoc """
  PokeCall keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias PokeMap
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://pokeapi.co/api/v2/pokemon/"
  plug Tesla.Middleware.JSON

  def filed do
    pokemon = Enum.reduce(1..898, [], fn
      x, acc ->
      [get_name(x) | acc]
    end)
    Enum.each(pokemon, fn 
      poke ->
        File.write("./poke_map.txt", poke)
    end)
  end
end
