defmodule Gna do
  defmodule CLI do
    @ex_usage 64

    def main(args) do
      args |> parse_arguments |> run_command
    end

    defp parse_arguments(args) do
      options = OptionParser
        .parse(args, strict: [help: :boolean], aliases: [h: :help])

      case options do
        {[help: true], _, _ }       -> :help
        {_, ["check"], _}           -> [Gna.Commands.Check, []]
        {_, ["discover", path], _}  -> [Gna.Commands.Discover, [path]]
        {_, ["help"], _}            -> :help
        {_, ["list"], _}            -> [Gna.Commands.List, []]
        _                           -> :unknown
      end
    end

    defp run_command([command, arguments]) do
      IO.puts "command: #{inspect command}"
      command.run arguments
    end

    defp run_command(:help) do
      IO.write """
Usage: gna command [arguments]

Commands:
  check           -- Display status for registered repositories
  discover path   -- Search and register repositories in `path' directory
  help            -- Display this message
  list            -- List registered repositories
"""
    end

    defp run_command(:unknown) do
      run_command :help
      System.halt(@ex_usage)
    end
  end
end
