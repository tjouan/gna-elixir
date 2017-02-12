Before do
  @_baf_program = 'gna.exs'.freeze
end

require 'baf/testing/cucumber'

Before do
  set_environment_variable 'HOME', expand_path(?.)
end
