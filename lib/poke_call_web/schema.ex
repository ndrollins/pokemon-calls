defmodule PokeCallWeb.Schema do
  use Absinthe.Schema

  @desc "A Pokemon"
  object :pokemon do
    field :id, :id
    field :name, :string
    field :number, :integer
  end

  # Example data
  @pokedex %{
    "pikachu" => %{number: 25, name: "pikachu"},
    "25" => %{number: 25, name: "pikachu"},
    "raichu" => %{number: 26, name: "raichu"},
    "26" => %{number: 26, name: "raichu"},
    "mew" => %{number: 151, name: "mew"},
    "151" => %{number: 151, name: "mew"}
  }

  query do
    field :pokemon, :pokemon do
      arg(:id, non_null(:id))

      resolve(fn args, _->
        {:ok, PokeCall.Pokedex.get_pokemon!(args)}
      end)
    end
  end

  mutation do
    field :create_pokemon, :pokemon do
      arg(:name, non_null(:string))
      arg(:number, non_null(:integer))

      resolve(fn args, _->
        PokeCall.Pokedex.create_pokemon(args)
      end)
    end
  end

  ## PRACTICE TEST QUERY FOR THE EXAMPLE
  #query do
    #field :pokedex_pokemon,  :pokemon do
      #arg :id, non_null(:id)
      #resolve fn %{id: pokemon_id}, _ ->
        #{:ok, @pokedex[pokemon_id]}
      #end
    #end
  #end
end
