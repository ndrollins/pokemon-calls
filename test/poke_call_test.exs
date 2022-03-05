defmodule PokeCallTest do
  use ExUnit.Case

  import Tesla.Mock 

  setup do
    mock(fn
      %{method: :get, url: "https://pokeapi.co/api/v2/pokemon/"} ->
          %Tesla.Env{body: "name"}

        #%{method: :post, url: "https://example.com/world"} ->
            #json(%{"my" => "data"})
      end)

      :ok
    end

  test "for each pokemon name it returns an id, and for each id it returns a name" do
    #assert PokeCalls.hello() == :world
    assert PokeCall.poke_id("pikachu") == 25
    assert PokeCall.poke_name(25) == "pikachu"
  end
end
