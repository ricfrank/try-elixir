defmodule Issues.CLI do

  @default_count 4

  @moduledoc false

  def run(argv) do
    parse_arg(argv)
  end

  def parse_arg(argv) do
    OptionParser.parse(
      argv,
      switches: [:help, :boolean],
      aliases: [:h, :help])
    |> elem(1)
    |> args_to_internal_representation()
  end

  def args_to_internal_representation([user, project, count]) do
    {user, project, String.to_integer(count)}
  end

  def args_to_internal_representation([user, project]) do
    {user, project, @default_count}
  end

  def args_to_internal_representation(_) do # bad arg or --help
    :help
  end
end
