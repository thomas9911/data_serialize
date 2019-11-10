defmodule DataSerialize do
  @moduledoc """
  Documentation for DataSerialize.
  """

  use Rustler, otp_app: :data_serialize, crate: "data_serialize"

  # When your NIF is loaded, it will override this function.
  def cbor_hex_to_map(_a), do: :erlang.nif_error(:nif_not_loaded)
  def map_to_cbor_hex(_a), do: :erlang.nif_error(:nif_not_loaded)
  def json_to_map(_a), do: :erlang.nif_error(:nif_not_loaded)
  def map_to_json(_a), do: :erlang.nif_error(:nif_not_loaded)
  def map_to_toml(_a), do: :erlang.nif_error(:nif_not_loaded)
  def toml_to_map(_a), do: :erlang.nif_error(:nif_not_loaded)
  def yaml_to_map(_a), do: :erlang.nif_error(:nif_not_loaded)
  def map_to_yaml(_a), do: :erlang.nif_error(:nif_not_loaded)
end
