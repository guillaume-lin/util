defmodule VistorManagement.Json do
  import Jason

  def serialize(data) do
    data |> encode!()
  end

  def deserialize(json) do
    json |> decode!()
  end
end
