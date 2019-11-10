defmodule DataSerialize.JSON do
  def decode(data), do: DataSerialize.json_to_map(data)
  def encode(data), do: DataSerialize.map_to_json(data)

  def decode!(data) do
    {:ok, r} = DataSerialize.json_to_map(data)
    r
  end

  def encode!(data) do
    {:ok, r} = DataSerialize.map_to_json(data)
    r
  end
end
