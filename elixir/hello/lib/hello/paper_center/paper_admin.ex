defmodule Hello.PaperCenter.PaperAdmin do
    def widgets(_schema, _conn) do
        [
          %{
            type: "text",
            title: "Average Reviews",
            content: inspect(Enum.random(0..100)),
            order: 1,
            width: 6,
          }
        ]
    end
end
