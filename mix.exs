defmodule DataSerialize.MixProject do
  use Mix.Project

  def project do
    [
      app: :data_serialize,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates(),
      source_url: "https://github.com/thomas9911/data_serialize",
      package: package(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.21"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      # Only needed for benchmarking
      {:benchee, "~> 1.0", only: :dev},
      {:benchee_html, "~> 1.0", only: :dev},
      {:poison, "~> 4.0", only: :dev},
      {:jason, "~> 1.1", only: :dev}
    ]
  end

  defp package do
    [
      description:
        "Package for serializing and deserializing data formats using Rust's serde libraries",
      files: [
        "lib",
        "native/data_serialize/Cargo.*",
        "native/data_serialize/src",
        "mix.exs",
        "README.md",
        "LICENSE"
      ],
      licenses: ["Unlicense"],
      links: %{"Github" => "https://github.com/thomas9911/data_serialize"}
    ]
  end

  defp rustler_crates do
    [
      data_serialize: [
        path: "native/data_serialize",
        cargo: :system,
        default_features: true,
        features: [],
        mode: rust_mode(Mix.env())
      ]
    ]
  end

  defp aliases do
    [
      bench: ["run bench/json_decode.exs", "run bench/json_encode.exs"]
    ]
  end

  defp rust_mode(:prod), do: :release
  defp rust_mode(:test), do: :release
  defp rust_mode(:dev), do: :release
end
