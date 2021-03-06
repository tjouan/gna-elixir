defmodule Gna.Checker do
  @git_commands [
    {~w[config --get remote.origin.url],  {:match,    ~r/\Agit:\w+/}},
    {~w[symbolic-ref --short HEAD],       {:match,    ~r/\Amaster\n\z/}},
    {~w[status --porcelain],              {:match,    ~r/\A\z/}},
    {~w[branch -vv],                      {:filter,   ~r/\[origin\/[^:]+\]/}}
  ]

  alias Gna.Repository

  def check repository do
    Enum.reduce @git_commands, {:ok, repository, ""}, fn {cmd, verifier}, acc ->
      {status, output} = case Repository.git_exec repository, cmd do
        {:ok, output}     -> verify output, verifier
        {status, output}  -> {status, output}
      end
      merge_checks acc, status, output
    end
  end

  defp verify output, {:match, arg} do
    case output =~ arg do
      true  -> {:ok, output}
      false -> {:ko, output}
    end
  end

  defp verify output, {:filter, arg} do
    Enum.reduce String.split(output, "\n", trim: true), {:ok, ""}, fn line, {as, ao} ->
      case line =~ arg do
        true  -> {merge_check_statuses(as, :ok), ao}
        false -> {:ko, ao <> line <> "\n"}
      end
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
  defp merge_check_statuses(:ok, :ko),  do: :ko
  defp merge_check_statuses(:ko, :ko),  do: :ko
  defp merge_check_statuses(:ko, :ok),  do: :ko
  defp merge_check_statuses(_, _),      do: :error
end
