defmodule NookincTest do
  use ExUnit.Case
  doctest Nookinc

  test "greets the world" do
    assert Nookinc.hello() == :world
  end
end
