defmodule Gna.CLI do
  @ex_usage 64

  alias Gna.Commands.Check
  alias Gna.Commands.Discover
  alias Gna.Commands.List

  def main(args) do
    args |> parse_arguments |> run_command
  end

  defp parse_arguments(args) do
    case OptionParser.parse(args, parse_options) do
      {[help: true],  _,                  _}  -> :help
      {_,             ["check"],          _}  -> [Check,    []]
      {_,             ["discover", path], _}  -> [Discover, [path]]
      {_,             ["help"],           _}  -> :help
      {_,             ["list"],           _}  -> [List,     []]
      _                                       -> :unknown
    end
  end

  defp parse_options do
    [
      strict:   [help: :boolean],
      aliases:  [h: :help]
    ]
  end

  defp run_command([command, arguments]) do
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
