defmodule PokeCall.Repo.Migrations.CreatePokemons do
  use Ecto.Migration

  def change do
    create table(:pokemons) do
      add :name, :string
      add :number, :integer

      timestamps()
    end
  end
end
