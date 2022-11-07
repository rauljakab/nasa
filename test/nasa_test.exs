defmodule NasaTest do
  use ExUnit.Case
  doctest Nasa

  test "Apollo 11" do
    assert Nasa.compute_flight_fuel(28801, [
             {:launch, 9.807},
             {:land, 1.62},
             {:launch, 1.62},
             {:land, 9.807}
           ]) == 51898
  end

  test "Mission on Mars" do
    assert Nasa.compute_flight_fuel(14606, [
             {:launch, 9.807},
             {:land, 3.711},
             {:launch, 3.711},
             {:land, 9.807}
           ]) == 33388
  end

  test "Passenger ship" do
    assert Nasa.compute_flight_fuel(75432, [
             {:launch, 9.807},
             {:land, 1.62},
             {:launch, 1.62},
             {:land, 3.711},
             {:launch, 3.711},
             {:land, 9.807}
           ]) == 212_161
  end
end
