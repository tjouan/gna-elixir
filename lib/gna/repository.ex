defmodule Gna.Repository do
  @git "git"
  @exec_options stderr_to_stdout: true

  def git_exec repository, arguments do
    case System.cmd @git, ["-C", repository] ++ arguments, @exec_options do
      {output, 0} -> {:ok,    output}
      {output, _} -> {:error, output}
    end
  end
end
