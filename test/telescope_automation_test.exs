defmodule TelescopeAutomationTest do
  use ExUnit.Case
  doctest TelescopeAutomation

  test "greets the world" do
    assert TelescopeAutomation.hello() == :world
  end

  test "jpl horizon api test" do
    result = HorizonsClient.get_ephemerides("5", "2017-01-01", "2017-01-02")
    IO.inspect result
  end
end
