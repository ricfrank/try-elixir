defmodule CliTest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [parse_arg: 1, sort_into_descending_order: 1]

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

  test "sort descending orders" do
    result = sort_into_descending_order(fake_created_at_list(["c", "a", "b"]))
    issues = for issue <- result, do: Map.get(issue, "created_at")
    assert issues == ~w{ c b a }
  end

  defp fake_created_at_list(values) do
    for value <- values,
    do: %{"created_at" => value, "other_data" => "xxx"}
  end
end
