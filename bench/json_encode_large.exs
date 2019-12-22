data = "bench/generated.bin" |> File.read!() |> :erlang.binary_to_term()

Benchee.run(%{
    "jason"      => fn -> {:ok, _ } = Jason.encode(data) end,
    "poison"     => fn -> {:ok, _ } = Poison.encode(data) end,
    "rust-serde" => fn -> {:ok, _ } =  DataSerialize.map_to_json(data) end
  })
