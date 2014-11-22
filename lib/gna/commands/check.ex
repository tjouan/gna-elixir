defmodule Gna.Commands.Check do
  @git "git"
  @git_commands [
    ~w(symbolic-ref --short HEAD),
    ~w(status --porcelain)
  ]

  def run([]) do
    Enum.each Gna.RunControl.repos, fn(repo) ->
      IO.puts "*** #{repo} ***"
      Enum.each @git_commands, fn(command) ->
        case System.cmd @git, ["-C", repo] ++ command do
          {output, 0}           -> report output
          {output, exit_status} -> report output
        end
      end
    end
  end

  defp report(git_output) do
    IO.write git_output
  end
end
