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
      rustler_crates: [data_serialize: [path: "native/data_serialize", mode: :release]]
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
      {:jason, "~> 1.1", only: :dev}
    ]
  end
end
