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
      rustler_crates: [data_serialize: [path: "native/data_serialize", mode: :release]],
      source_url: "https://github.com/thomas9911/data_serialize",
      package: package()
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
      {:benchee, "~> 1.0", only: :dev},
      {:poison, "~> 4.0", only: :dev},
      {:jason, "~> 1.1", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
    ]
  end

  defp package do
    [
      description:
        "Package for serializing and deserializing data formats using Rust's serde libraries",
      licenses: ["Unlicense"],
      links: %{"github" => "https://github.com/thomas9911/data_serialize"}
    ]
  end
end
