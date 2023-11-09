defmodule ModA do 
  defmacro __using__(_opts) do
    IO.puts "your are using ModA"
    quote do 
      import ModA 
    end
  end 

  def moda() do 
    IO.puts "inside moda"

  end
end

defmodule ModB do 
    use ModA
  def modb() do 
    IO.puts "inside modb"
    moda()
  end
end
ModB.modb()
