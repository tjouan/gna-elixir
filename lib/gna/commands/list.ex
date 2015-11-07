defmodule Gna.Commands.List do
  alias Gna.RunControl

  def run [] do
    Enum.each RunControl.repos, fn e ->
      IO.puts e
    end
  end
end
