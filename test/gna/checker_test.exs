defmodule Gna.CheckerTest do
  use ExUnit.Case, async: true

  alias Gna.Checker
  alias Gna.Repository

  setup do
    on_exit fn ->
      File.rm_rf! "tmp/my"
    end
    File.mkdir_p! "tmp/my"
    Repository.git_exec "tmp/my", ["init"]
    Repository.git_exec "tmp/my", ["remote", "add", "origin", "git:my"]
    :ok
  end

  test "returns repository path" do
    {_status, repository, _output} = Checker.check "tmp/my"
    assert repository == "tmp/my"
  end

  test "returns :ok status when all checks are successfull" do
    assert {:ok, _repository, _output} = Checker.check "tmp/my"
  end

  test "returns :ko status when a check fails" do
    File.touch "tmp/my/foo"
    assert {:ko, _repository, _output} = Checker.check "tmp/my"
  end

  test "returns :error status when repository cannot be check" do
    assert {:error, _repository, _output} = Checker.check "tmp/none"
  end

  test "returns the output of passing checks" do
    {:ok, _repository, output} = Checker.check "tmp/my"
    assert output == """
      git:my
      master
      """
  end

  test "checks that we use our remote origin" do
    Repository.git_exec "tmp/my", ["remote", "rm", "origin"]
    Repository.git_exec "tmp/my", ["remote", "add", "origin", "my.test:my"]
    {:ko, _repository, output} = Checker.check "tmp/my"
    assert output =~ "my.test:my\n"
  end

  test "checks that current branch is master" do
    Repository.git_exec "tmp/my", ["checkout", "-b", "new_branch"]
    {:ko, _repository, output} = Checker.check "tmp/my"
    assert output =~ "new_branch\n"
  end

  test "checks that working directory is clean" do
    File.touch "tmp/my/foo"
    {:ko, _repository, output} = Checker.check "tmp/my"
    assert output =~ "?? foo\n"
  end
end
