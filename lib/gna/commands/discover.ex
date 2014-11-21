defmodule Gna.Commands.Discover do
  def run([path]) do
    repos = find_repos path
    IO.inspect repos
  end

  defp find_repos(path) do
    Enum.map Path.wildcard("#{path}/**/.git", match_dot: true), fn(e) ->
      String.slice(e, 0..-6)
    end
  end
end
