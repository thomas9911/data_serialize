defmodule DataSerialize.CBOR.Hex do
  def decode(data), do: DataSerialize.cbor_hex_to_map(data)
  def encode(data), do: DataSerialize.map_to_cbor_hex(data)

  def decode!(data) do
    {:ok, r} = DataSerialize.cbor_hex_to_map(data)
    r
  end

  def encode!(data) do
    {:ok, r} = DataSerialize.map_to_cbor_hex(data)
    r
  end
end
