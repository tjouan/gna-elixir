Given /^a git repository in ([^ ]+)$/ do |path|
  cd ?. do
    path = Pathname.new(path)
    path.mkpath
    fail "cannot create repository at `#{path}'" unless system(
      "git -C #{path} init > /dev/null"
    )
  end
end

Given /^the git repository in ([^ ]+) has current branch ([^ ]+)$/ do |path, branch|
  cd ?. do
    fail "cannot create branch for repository at `#{path}'" unless system(
      "git -C #{path} checkout -b #{branch} > /dev/null"
    )
  end
end

Given /^the git repository in ([^ ]+) has no remote origin$/ do |path|
  cd ?. do
    fail "cannot remove remote for repository at `#{path}'" unless system(
      "git -C #{path} remote remove origin"
    )
  end
end

Given /^the git repository in ([^ ]+) has remote ([^ ]+)$/ do |path, remote|
  cd ?. do
    fail "cannot add remote for repository at `#{path}'" unless system(
      "git -C #{path} remote add origin #{remote}"
    )
  end
end
