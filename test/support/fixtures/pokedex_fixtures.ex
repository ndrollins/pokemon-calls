defmodule PokeCall.PokedexFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PokeCall.Pokedex` context.
  """

  @doc """
  Generate a pokemon.
  """
  def pokemon_fixture(attrs \\ %{}) do
    {:ok, pokemon} =
      attrs
      |> Enum.into(%{
        name: "some name",
        number: 42
      })
      |> PokeCall.Pokedex.create_pokemon()

    pokemon
  end
end
