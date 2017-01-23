# Scrivener

[![Build Status](https://travis-ci.org/drewolson/scrivener.svg)](https://travis-ci.org/drewolson/scrivener) [![Hex Version](http://img.shields.io/hexpm/v/scrivener.svg?style=flat)](https://hex.pm/packages/scrivener) [![Hex docs](http://img.shields.io/badge/hex.pm-docs-green.svg?style=flat)](https://hexdocs.pm/scrivener)

Scrivener allows you to paginate your EctoOne queries. It gives you useful information such as the total number of pages, the current page, and the current page's entries. It works nicely with Phoenix as well.

First, you'll want to `use` Scrivener in your application's Repo. This will add a `paginate` function to your Repo. This `paginate` function expects to be called with, at a minimum, an EctoOne query. It will then paginate the query and execute it, returning a `Scrivener.Page`. Defaults for `page_size` can be configued when you `use` Scrivener. If no `page_size` is provided, Scrivener will use `10` by default.

You may also want to call `paginate` with a params map along with your query. If provided with a params map, Scrivener will use the values in the keys `"page"` and `"page_size"` before using any configured defaults.

## Example

```elixir
defmodule MyApp.Repo do
  use EctoOne.Repo, otp_app: :my_app
  use Scrivener, page_size: 10
end
```

```elixir
defmodule MyApp.Person do
  use EctoOne.Model

  schema "people" do
    field :name, :string
    field :age, :integer

    has_many :friends, MyApp.Person
  end
end
```

```elixir
def index(conn, params) do
  page = MyApp.Person
  |> where([p], p.age > 30)
  |> order_by([p], desc: p.age)
  |> preload(:friends)
  |> MyApp.Repo.paginate(params)

  render conn, :index,
    people: page.entries,
    page_number: page.page_number,
    page_size: page.page_size,
    total_pages: page.total_pages,
    total_entries: page.total_entries
end
```

```elixir
page = MyApp.Person
|> where([p], p.age > 30)
|> order_by([p], desc: p.age)
|> preload(:friends)
|> MyApp.Repo.paginate(page: 2, page_size: 5)
```

## Installation

Add `scrivener` to your `mix.exs` dependencies.

```elixir
defp deps do
  [{:scrivener, "~> 1.0"}]
end
```

## Related Libraries

* [Scrivener.HTML](https://github.com/mgwidmann/scrivener_html) generates HTML output using Bootstrap or other frameworks
* [Scrivener.Headers](https://github.com/doomspork/scrivener_headers) adds response headers for API pagination

## Contributing

First, you'll need to build the test database.

```elixir
MIX_ENV=test mix scrivener.db.reset
```

This task assumes you have postgres installed and that your current user can create / drop databases. If you'd prefer to use a different user, you can specify it with the environment variable `SCRIVENER_DB_USER`.

With the database built, you can now run the tests.

```elixir
mix test
```
