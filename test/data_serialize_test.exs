defmodule DataSerializeTest do
  use ExUnit.Case

  test "simple json string to map" do
    assert {:ok, %{"test" => "testing"}} == DataSerialize.json_to_map("{\"test\": \"testing\"}")
  end

  test "simple cbor string to map" do
    assert {:ok, %{"test" => "testing"}} ==
             DataSerialize.cbor_hex_to_map("A164746573746774657374696E67")
  end

  test "simple toml string to map" do
    assert {:ok, %{"test" => "testing"}} == DataSerialize.toml_to_map("test = \"testing\"")
  end

  test "simple yaml string to map" do
    assert {:ok, %{"test" => "testing"}} == DataSerialize.yaml_to_map("test: testing")
  end

  test "simple map to json string" do
    assert {:ok, "{\"test\":\"testing\"}"} == DataSerialize.map_to_json(%{"test" => "testing"})
  end

  test "simple map to cbor string" do
    assert {:ok, "A164746573746774657374696E67"} ==
             DataSerialize.map_to_cbor_hex(%{"test" => "testing"})
  end

  test "simple map to toml string" do
    assert {:ok, "test = \"testing\"\n"} == DataSerialize.map_to_toml(%{"test" => "testing"})
  end

  test "simple map to yaml string" do
    assert {:ok, "---\ntest: testing"} == DataSerialize.map_to_yaml(%{"test" => "testing"})
  end

  test "invalid toml" do
    invalid_toml_map = %{
      "test" => "testing",
      "list" => [1, 2, 3, 4],
      "nested" => %{
        "nesting" => ["a", "b"],
        "other" => "one"
      }
    }

    assert {:error, _toml} = DataSerialize.map_to_toml(invalid_toml_map)
  end
end
