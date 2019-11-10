defmodule DataSerializeTest.Invertible do
  use ExUnit.Case

  test "cbor" do
    start_map = %{
      "nested" => %{
        "nesting" => "oke",
        "other" => "one"
      },
      "list" => [1, 2, 3, 4],
      "key" => "value"
    }

    assert {:ok, cbor} = DataSerialize.map_to_cbor_hex(start_map)
    assert {:ok, end_map} = DataSerialize.cbor_hex_to_map(cbor)

    assert start_map == end_map
  end

  test "json" do
    start_map = %{
      "nested" => %{
        "nesting" => "oke",
        "other" => "one"
      },
      "list" => [1, 2, 3, 4],
      "key" => "value"
    }

    assert {:ok, json} = DataSerialize.map_to_json(start_map)
    assert {:ok, end_map} = DataSerialize.json_to_map(json)

    assert start_map == end_map
  end

  test "toml" do
    start_map = %{
      "nested" => %{
        "nesting" => "oke",
        "other" => "one"
      },
      "list" => [1, 2, 3, 4]
    }

    assert {:ok, toml} = DataSerialize.map_to_toml(start_map)
    assert {:ok, end_map} = DataSerialize.toml_to_map(toml)

    assert start_map == end_map
  end

  test "yaml" do
    start_map = %{
      "nested" => %{
        "nesting" => "oke",
        "other" => "one"
      },
      "list" => [1, 2, 3, 4],
      "key" => "value"
    }

    assert {:ok, yaml} = DataSerialize.map_to_yaml(start_map)
    assert {:ok, end_map} = DataSerialize.yaml_to_map(yaml)

    assert start_map == end_map
  end
end
