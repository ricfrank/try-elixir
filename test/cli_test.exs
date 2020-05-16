defmodule CliTest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [parse_arg: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_arg(["-h", "anything"]) == :help
    assert parse_arg(["--help", "anything"]) == :help
    assert parse_arg(["anything"]) == :help
  end

  test "three values returned if three given" do
    assert parse_arg(["user", "project", "99"]) == {"user", "project", 99}
  end

  test "count is the default if two values are given" do
    assert parse_arg(["user", "project"]) == {"user", "project", 4}
  end
end
