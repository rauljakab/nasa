defmodule Nasa do
  def compute_flight_fuel(ship_mass, array) do
    array
    |> Enum.reverse()
    |> Enum.reduce(0, fn flight, acc ->
      acc + operate(ship_mass + acc, flight)
    end)
  end

  def compute_fuel_for_launch(mass, gravity) do
    fuel_mass =
      (mass * gravity * 0.042 - 33)
      |> trunc

    if fuel_mass <= 0 do
      0
    else
      fuel_mass + compute_fuel_for_launch(fuel_mass, gravity)
    end
  end

  def compute_fuel_for_land(mass, gravity) do
    fuel_mass =
      (mass * gravity * 0.033 - 42)
      |> trunc()

    if fuel_mass <= 0 do
      0
    else
      fuel_mass + compute_fuel_for_land(fuel_mass, gravity)
    end
  end

  def operate(operation_mass, {flight_type, gravity}) do
    case flight_type do
      :launch ->
        compute_fuel_for_launch(operation_mass, gravity)

      :land ->
        compute_fuel_for_land(operation_mass, gravity)
    end
  end
end
