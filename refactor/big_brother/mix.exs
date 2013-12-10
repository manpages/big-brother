defmodule BigBrother.Mixfile do
  use Mix.Project

  def project do
    [ app: :big_brother,
      version: "0.0.1",
      elixir: "~> 0.11.3-dev",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [mod: { BigBrother, [] }]
  end

  defp deps do
    [ 
      {:cowboy,  github: "extend/cowboy"},
      {:exdbi_pgsql, github: "exdbi/exdbi_pgsql"},
        {:epgsql, github: "spawngrid/epgsql", override: true}, 
    ]
  end
end
