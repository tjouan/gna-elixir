defmodule Gna.Mixfile do
  use Mix.Project

  def project do
    [
      app:      :gna,
      version:  "0.0.1",
      elixir:   "~> 1.0.2",
      deps:     deps,
      escript:  escript
    ]
  end

  def application do
    [applications: []]
  end

  defp deps do
    []
  end

  defp escript do
    [main_module: Gna.CLI]
  end
end
