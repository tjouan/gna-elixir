defmodule Gna.Commands.Check do
  alias Gna.Repository
  alias Gna.RunControl

  def run([]) do
    Enum.each RunControl.repos, &Repository.check(&1) |> report
  end

  defp report({status, repository, output}) do
    IO.puts "*** #{repository} ***"
    if status == :error, do: IO.puts "ERROR: cannot check repository"
    IO.write output
  end
end
