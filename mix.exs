defmodule NervesQt5Runtime.MixProject do
  use Mix.Project

  def project do
    [
      app: :nerves_qt5_runtime,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: Mix.compilers() ++ [:nerves_qt5_runtime],
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
      {:nerves, "~> 1.5.4 or ~> 1.6.0", runtime: false}
    ]
  end
end
