defmodule PokeCall do
  @moduledoc """
  PokeCall keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
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
        get_name(input)
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
            get_id(input2)
          "n" ->
            IO.puts("Have a beautiful poke-free day!")
        end
    end
  end

  defp get_id(poke_name) do
    with true <- poke_name_check(poke_name) do
      {:ok, info} = get(poke_name <> "/")
      info.body["id"]
    else
      _ ->
        {:error, "Not a valid pokemon name"}
    end
  end

  defp get_name(poke_id_num) do

    case (poke_id_num <= 898 && poke_id_num > 0) do
      true ->
        {:ok, info} = get(Integer.to_string(poke_id_num) <> "/")
        info.body["name"]

      false ->
        {:error, "Pokemon ID number is invalid"}
    end
  end

  defp poke_name_check(poke_name) do
   all_poke = Enum.reduce(1..898, %{}, fn
      poke, poke_map ->
       #%{poke_map | get_name(poke) => poke}
       Map.put(poke_map, get_name(poke), poke)
    end)

    Map.has_key?(all_poke, poke_name)

    #poke_name in poke_list
  end
end
