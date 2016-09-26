defmodule Gna.Repository do
  @git "git"
  @exec_options stderr_to_stdout: true

  @doc ~S"""
  Executes given git command in specified repository.

  ## Examples

      iex> Gna.Repository.git_exec ".", ["log", "-0"]
      {:ok, ""}

      iex> Gna.Repository.git_exec ".", ["ls-files", ".gitignore"]
      {:ok, ".gitignore\n"}

  Unsuccessful commands returns an error:

      iex> Gna.Repository.git_exec ".", ["not_a_git_command"]
      {
        :error,
        "git: 'not_a_git_command' is not a git command. See 'git --help'.\n"
      }

  """
  def git_exec repository, arguments do
    case System.cmd @git, ["-C", repository] ++ arguments, @exec_options do
      {output, 0} -> {:ok,    output}
      {output, _} -> {:error, output}
    end
  end
end
