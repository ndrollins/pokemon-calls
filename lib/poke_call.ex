defmodule PokeCall do
  @moduledoc """
  PokeCall keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  import Ecto.Query, warn: false
  alias PokeCall.Repo

  alias PokeCall.Pokedex.Pokemon

  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://pokeapi.co/api/v2/pokemon/"
  plug Tesla.Middleware.JSON

  def user_input do
    choice = IO.gets("Enter pokemon ID [y]es or [n]o: ")
            |> String.split("\n", trim: true)
            |> List.to_string
            |> String.slice(0..0)
            |> String.downcase()
    case choice do
      "y" ->
        input = IO.gets("Enter pokemon ID #: ")
            |> String.split("\n", trim: true)
            |> List.to_string
            |> String.to_integer()
        _get_name(input)
      "n" ->
        choice2 = IO.gets("Enter pokemon name [y]es or [n]o: ")
            |> String.split("\n", trim: true)
            |> List.to_string
            |> String.slice(0..0)
            |> String.downcase()
        case choice2 do
          "y" ->
            input2 = IO.gets("Enter pokemon name: ")
                |> String.split("\n", trim: true)
                |> List.to_string
            _get_id(input2)
          "n" ->
            IO.puts("Have a beautiful poke-free day!")
        end
    end
  end

  defp _get_id(poke_name) do
    ## FOR POKEMON NAME CHECKER 
    #with true <- poke_name_check(poke_name) do
    with {:ok, info} <- get(poke_name <> "/") do
      info.body["id"]
    else
      _ ->
        {:error, "Not a valid pokemon name"}
    end
  end

  defp _get_name(poke_id_num) do
    case poke_id_num <= 898 && poke_id_num > 0 do
      true ->
        {:ok, info} = get(Integer.to_string(poke_id_num) <> "/")
        info.body["name"]

        #PokeCall.Pokedex.create_pokemon(%Pokemon{name: info.body["name"], id: poke_id_num})
      false ->
        {:error, "Pokemon ID number is invalid"}
    end
  end

## POKEMON NAME CHECKER available if needed but EXTREMELY SLOW
  defp _poke_name_check(poke_name) do
   all_poke = Enum.reduce(1..898, %{}, fn
      poke, poke_map ->
       Map.put(poke_map, _get_name(poke), poke)
    end)

    Map.has_key?(all_poke, poke_name)
  end
end
