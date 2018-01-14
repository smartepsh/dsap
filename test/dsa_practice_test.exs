defmodule DSAPTest do
  use ExUnit.Case
  doctest DSAP

  test "greets the world" do
    assert DSAP.hello() == :world
  end
end
