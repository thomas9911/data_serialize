defmodule DataSerialize.TOML do
  def decode(data), do: DataSerialize.toml_to_map(data)
  def encode(data), do: DataSerialize.map_to_toml(data)

  def decode!(data) do
    {:ok, r} = DataSerialize.toml_to_map(data)
    r
  end

  def encode!(data) do
    {:ok, r} = DataSerialize.map_to_toml(data)
    r
  end
end
