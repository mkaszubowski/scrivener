defmodule Scrivener.Mixfile do
  use Mix.Project

  def project do
    [
      app: :scrivener,
      version: "1.2.2",
      elixir: "~> 1.0",
      elixirc_paths: elixirc_paths(Mix.env),
      package: package,
      description: "Paginate your EctoOne queries",
      deps: deps,
      docs: [
        main: Scrivener,
        readme: "README.md"
      ]
    ]
  end

  def application do
    [
      applications: applications(Mix.env)
    ]
  end

  defp applications(:test), do: [:postgrex, :ecto_one, :logger]
  defp applications(_), do: [:logger]

  defp deps do
    [
      {:ecto_one, github: "mkaszubowski/ecto", branch: "ecto_one"},
      {:dialyze, "~> 0.2.0", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc, "~> 0.11.0", only: :dev},
      {:ex_spec, "~> 2.0", only: :test},
      {:postgrex, ">= 0.0.0", optional: true}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      maintainers: ["Drew Olson"],
      licenses: ["MIT"],
      links: %{"github" => "https://github.com/drewolson/scrivener"},
      files: [
        "lib/scrivener.ex",
        "lib/scrivener",
        "mix.exs",
        "README.md"
      ]
    ]
  end
end
