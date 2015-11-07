defmodule Gna.Repository do
  @git "git"
  @git_exec_options stderr_to_stdout: true
  @git_check_commands [
    ~w(symbolic-ref --short HEAD),
    ~w(status --porcelain)
  ]

  def check repository do
    Enum.reduce @git_check_commands, {:ok, repository, ""}, fn command, acc ->
      {status, output} = git_exec repository, command
      merge_checks acc, status, output
    end
  end

  defp merge_checks {acc_status, repository, acc_output}, status, output do
    {
      merge_check_statuses(acc_status, status),
      repository,
      acc_output <> output
    }
  end

  defp merge_check_statuses(:ok, :ok),  do: :ok
  defp merge_check_statuses(_, _),      do: :error

  defp git_exec repository, arguments do
    case System.cmd @git, ["-C", repository] ++ arguments, @git_exec_options do
      {output, 0} -> {:ok,    output}
      {output, _} -> {:error, output}
    end
  end
end
