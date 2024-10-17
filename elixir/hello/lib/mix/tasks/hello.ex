#
# a mix task
#
defmodule Mix.Tasks.Hello do
  @shortdoc "greets the world"


  use Mix.Task


  @impl Mix.Task
  def run(args) do
    IO.inspect args
  end
end
