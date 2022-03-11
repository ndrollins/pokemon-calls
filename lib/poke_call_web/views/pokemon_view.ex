defmodule PokeCallWeb.PokeView do
  use PokeCallWeb, :view
  alias PokeCall.Pokedex
  alias PokeCall.Pokedex.Pokemon
  def pokemon_info(%Pokedex.Pokemon{id: id, name: name, number: number}) do-
    #IO.puts("id: #{id}, Name: #{name}, Number: #{number}")
    #|> Enum.at(0)
    #id
    name
  end
end

