defmodule Mix.Tasks.Compile.NervesQt5Runtime do
  use Mix.Task

  def run(_args) do
    runtime_package = nerves_qt5_engine()
    artifact_path = Nerves.Artifact.dir(runtime_package) || Nerves.Artifact.build_path(runtime_package)
    artifact_path = artifact_path |> Path.join("qt5-engine")

    config = Mix.Project.config()
    engine_path = Mix.Project.app_path(config) |> Path.join("priv") |> Path.join("qt5-engine")

    IO.puts "NervesQt5Runtime copy: #{artifact_path} into #{engine_path}"

    File.rm_rf(engine_path)
    File.mkdir_p(engine_path)

    # Copy from symlink
    Path.wildcard(artifact_path |> Path.join("*")) |> Enum.map(fn p -> File.cp_r!(p, engine_path |> Path.join(Path.basename(p))) end)

    # Cleanup
    Path.wildcard(engine_path |> Path.join("lib") |> Path.join("*.a")) |> Enum.map(fn p -> File.rm!(p) end)
    Path.wildcard(engine_path |> Path.join("lib") |> Path.join("*.la")) |> Enum.map(fn p -> File.rm!(p) end)

    :ok
  end

  defp nerves_qt5_engine do
    nerves_qt5_engine =
      Nerves.Env.packages_by_type(:nerves_qt5_engine)
      |> List.first()

      nerves_qt5_engine
  end
end
