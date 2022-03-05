defmodule PokeCall.Repo do
  use Ecto.Repo,
    otp_app: :poke_call,
    adapter: Ecto.Adapters.Postgres
end
