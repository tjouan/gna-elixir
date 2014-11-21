defmodule Gna.Commands.List do
  def run([]) do
    Enum.each Gna.RunControl.repos, fn(e) ->
      IO.puts e
    end
  end
end
