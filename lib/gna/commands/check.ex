defmodule Gna.Commands.Check do
  alias Gna.Repository
  alias Gna.RunControl

  def run([]) do
    Enum.each RunControl.repos, &Repository.check(&1) |> report
  end

  defp report({:ok, repository, output}) do
    IO.puts "*** #{repository} ***"
    IO.write output
  end

  defp report({:error, repository, output}) do
    IO.puts "*** #{repository} ***"
    IO.puts "ERROR: cannot check repository"
    IO.write output
  end
end
