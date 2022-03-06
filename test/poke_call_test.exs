defmodule PokeCallTest do
  use ExUnit.Case
  import Tesla.Mock

  setup do
    mock(fn
      %{method: :get, url: "https://pokeapi.co/api/v2/pokemon/25"} ->
        %Tesla.Env{body: %{"name" => "pikachu"}}

      %{method: :get, url: "https://pokeapi.co/api/v2/pokemon/0"} ->
        %Tesla.Env{body: %{"name" => {:error, "Not a valid pokemon id"}}}

      %{method: :get, url: "https://pokeapi.co/api/v2/pokemon/pikachu"} ->
        %Tesla.Env{body: %{"id" => 25}}

      %{method: :get, url: "https://pokeapi.co/api/v2/pokemon/pikabluu"} ->
        %Tesla.Env{body: %{"id" => {:error, "Not a valid pokemon name"}}}

      end)

      :ok
    end

  test "for each pokemon name it returns an id, and for each id it returns a name" do
    assert {:ok, %Tesla.Env{} = id} = PokeCall.get("25")
    assert id.body["name"] == "pikachu"

    assert {:ok, %Tesla.Env{} = id} = PokeCall.get("0")
    assert id.body["name"] == {:error, "Not a valid pokemon id"}
  end

  test "gets an id" do
    assert {:ok, %Tesla.Env{} = name} = PokeCall.get("pikachu")
    assert name.body["id"] == 25

    assert {:ok, %Tesla.Env{} = id} = PokeCall.get("pikabluu")
    assert id.body["id"] == {:error, "Not a valid pokemon name"}

  end
end
