Given /^a file named ([^ ]+) with:$/ do |path, content|
  write_file path, content + $/
end


Then /^the file ([^ ]+) must contain exactly:$/ do |path, content|
  expect(path).to have_file_content content + $/
end
