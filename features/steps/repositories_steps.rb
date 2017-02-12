Given /^a git repository in ([^ ]+)$/ do |path|
  cd ?. do
    path = Pathname.new(path)
    path.mkpath
    fail "cannot create repository at `#{path}'" unless system(
      "git -C #{path} init > /dev/null"
    )
  end
end
