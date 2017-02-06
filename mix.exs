defmodule Gna.Mixfile do
  use Mix.Project

  def project do
    [
      app:      :gna,
      version:  "0.0.1",
      deps:     [],
      escript:  [main_module: Gna.CLI]
    ]
  end

  def application do
    [applications: []]
  end
end
