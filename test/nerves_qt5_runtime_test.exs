defmodule NervesQt5RuntimeTest do
  use ExUnit.Case
  doctest NervesQt5Runtime

  test "greets the world" do
    assert NervesQt5Runtime.hello() == :world
  end
end
