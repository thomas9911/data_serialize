
data = File.read!("bench/generated.json")



Benchee.run(%{
    "jason"      => fn -> {:ok, _ } = Jason.decode(data) end,
    "poison"     => fn -> {:ok, _ } = Poison.decode(data) end,
    "rust-serde" => fn -> {:ok, _ } =  DataSerialize.json_to_map(data) end
  })
