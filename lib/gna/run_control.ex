defmodule Gna.RunControl do
  @file_name ".gna.rc"

  def repos do
    rc_to_repos File.read! file_path
  end

  def save_repos repos do
    File.write! file_path, repos_to_rc repos
  end

  defp file_path do
    "#{System.user_home}/#{@file_name}"
  end

  defp rc_to_repos rc do
    String.split rc, "\n", trim: true
  end

  defp repos_to_rc repos do
    Enum.join(repos, "\n") <> "\n"
  end
end
