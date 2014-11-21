defmodule Gna.RunControl do
  @file_name "#{System.user_home}/.gna.rc"

  def repos do
    rc_to_repos File.read! @file_name
  end

  def save_repos(repos) do
    File.write! @file_name, repos_to_rc repos
  end

  defp rc_to_repos(rc) do
    String.split rc, "\n", trim: true
  end

  defp repos_to_rc(repos) do
    Enum.join(repos, "\n") <> "\n"
  end
end
