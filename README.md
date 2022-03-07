# PokeCall

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
For the graphQL interface you can visit [`localhost:4000/graphiql`](http://localhost:4000) from your browser. 

For use of the Poke Api you can run `iex -S mix` and then run `PokeCall.user_input` for the prompt to enter a Pokemon ID number and recieve that corresponding Pokemon's name, or to enter a Pokemon name and recieve that Pokemon's ID number. 

The functionality for persisting and querying a Pokemon's name and ID to the Postgres database have to be done manually on [`localhost:4000/graphiql`](http://localhost:4000) from your browser. 

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
# pokemon-calls
