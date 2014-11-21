defmodule Gna.RunControl do
  @file_name "#{System.user_home}/.gna.rc"

  def save_repos(repos) do
    File.write! @file_name, repos_to_rc repos
  end

  defp repos_to_rc(repos) do
    Enum.join(repos, "\n") <> "\n"
  end
end
