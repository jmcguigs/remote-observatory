defmodule TelescopeAutomation.MixProject do
  use Mix.Project

  def project do
    [
      app: :telescope_automation,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.4"},
      {:plug, "~> 1.6"},
      {:poison, "~> 3.0"},
      {:httpoison, "~> 1.8"}
      # Add other dependencies here
    ]
  end
end
