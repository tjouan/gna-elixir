#!/usr/bin/env elixir

Code.prepend_path Path.expand("../_build/dev/lib/gna/ebin", __DIR__)

if Code.ensure_loaded?(Gna.CLI) do
  Gna.CLI.run(System.argv)
else
  IO.puts :stderr, "Error: cannot load Gna module, try to run: `mix compile'"
  exit 70
end
