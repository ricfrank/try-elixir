defmodule Issues.CLI do

  @default_count 4

  @moduledoc false

  def run(argv) do
    parse_arg(argv)
  end

  def parse_arg(argv) do
    parse = OptionParser.parse(
      argv,
      switches: [:help, :boolean],
      aliases: [:h, :help]
    )

    IO.inspect parse

    case parse do
      {[help: true], _, _} -> :help
      {_, [user, project, count], _} -> {user, project, String.to_integer(count)}
      {_, [user, project], _} -> {user, project, @default_count}
      _ -> :help
    end
  end
end
