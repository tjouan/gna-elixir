defmodule Gna.Commands.Check do
  alias Gna.Checker
  alias Gna.RunControl

  def run [] do
    Enum.each RunControl.repos, &Checker.check(&1) |> report
  end

  defp report {:ok, _, _} do end
  defp report {status, repository, output} do
    IO.puts "*** #{repository} ***"
    if status == :error, do: IO.puts "ERROR: cannot check repository"
  end
end
