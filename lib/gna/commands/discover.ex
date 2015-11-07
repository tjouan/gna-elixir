defmodule Gna.Commands.Discover do
  alias Gna.RunControl

  def run [path] do
    RunControl.save_repos find_repos path
  end

  defp find_repos path do
    Enum.map Path.wildcard("#{path}/**/.git", match_dot: true), fn e ->
      String.slice e, 0..-6
    end
  end
end
