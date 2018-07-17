defmodule ArkEcosystem.Client.MixProject do
  use Mix.Project

  def project do
    [
      app: :ark_client,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :hackney]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:excoveralls, "~> 0.9.1", only: :test},
      {:hackney, "~> 1.10"},
      {:jason, "~> 1.0"},
      {:mock, "~> 0.3.0", only: :test},
      {:temp, "~> 0.4"},
      {:tesla, "~> 1.0.0-beta.1"}
    ]
  end
end
