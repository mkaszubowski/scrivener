defmodule Scrivener.TestCase do
  use ExUnit.CaseTemplate

  using(opts) do
    quote do
      use ExSpec, unquote(opts)
      import EctoOne.Query
    end
  end

  setup do
    EctoOne.Adapters.SQL.begin_test_transaction(Scrivener.Repo)

    ExUnit.Callbacks.on_exit(fn ->
      EctoOne.Adapters.SQL.rollback_test_transaction(Scrivener.Repo)
    end)
  end
end

Scrivener.Repo.start_link
ExUnit.start()
