defmodule Hello.Hanoi do
    @moduledoc """
     hanoi game
    """

    @doc """
    hanoi game
    move(from,via,to,n)
    """
    def hanoi(n) do
        IO.puts("hanoi,haha")
        move("A","B","C",n)
    end


    #move from From via Via to To, with N
    defp move(from,via,to,n) do
        if n == 1 do
                IO.puts("Move disk from #{from} to #{to}")
        else
                move(from,to,via,n-1)
                move(from,via,to,1)
                move(via,from,to,n-1)
        end
    end

    def lua() do
        IO.puts("do lua")
      st0 = :luerl.init()
      {:ok, b} = :luerl.eval("return 1 + 1",st0)  # this will return []

      IO.puts(b)
      {:ok,b}
    end
end
