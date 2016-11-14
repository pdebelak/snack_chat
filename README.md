# SnackChat

An app to chat about your favorite snacks.

## Running the app

* Install elixir dependencies with `mix deps.get`
* Create and migrate the database with `mix ecto.create && mix ecto.migrate`
* Install javascript dependencies with `cd ui && npm install`
* Install the `foreman` gem to run local server with `gem install foreman`
* Start the server with `foreman s` - your browser will open the app automatically

## Running the tests

* Run elixir tests with `mix tests`
* Run javascript tests with `cd ui && npm test`
