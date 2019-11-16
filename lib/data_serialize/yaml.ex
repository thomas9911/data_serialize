defmodule DataSerialize.YAML do
  def decode(data), do: DataSerialize.yaml_to_map(data)
  def encode(data), do: DataSerialize.map_to_yaml(data)

  def decode!(data) do
    {:ok, r} = DataSerialize.yaml_to_map(data)
    r
  end

  def encode!(data) do
    {:ok, r} = DataSerialize.map_to_yaml(data)
    r
  end
end
