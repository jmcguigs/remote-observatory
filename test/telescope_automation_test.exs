defmodule TelescopeAutomationTest do
  use ExUnit.Case
  doctest TelescopeAutomation

  test "greets the world" do
    assert TelescopeAutomation.hello() == :world
  end

  test "latest ephemeris test" do
    result = HorizonsClient.get_latest_ephemeris("5")
    IO.inspect result
  end
end
