defmodule Mix.Tasks.Scrivener.Db.Reset do
  use Mix.Task

  @moduledoc false

  def run(_args) do
    Logger.configure(level: :error)

    Mix.Task.run("ecto_one.drop", [])
    Mix.Task.run("ecto_one.create", [])
    Mix.Task.run("ecto_one.migrate", [])
  end
end
