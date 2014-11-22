defmodule Gna.Commands.Check do
  @git "git"
  @git_commands [
    ~w(symbolic-ref --short HEAD),
    ~w(status --porcelain)
  ]

  def run([]) do
    Enum.each Gna.RunControl.repos, fn(repo) ->
      IO.puts "*** #{repo} ***"
      Enum.each @git_commands, fn(git_command) ->
        repo_git_exec(repo, git_command) |> report
      end
    end
  end

  defp repo_git_exec(repo, arguments) do
    case System.cmd @git, ["-C", repo] ++ arguments do
      {output, 0} -> {:ok,    output}
      {output, _} -> {:error, output}
    end
  end

  defp report({:ok, git_output}) do
    IO.write git_output
  end

  defp report({:error, git_output}) do
    IO.puts "ERROR: cannot check repository"
    IO.write git_output
  end
end
