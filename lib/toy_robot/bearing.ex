defmodule ToyRobot.Bearing do
  @compass ["NORTH", "EAST", "SOUTH", "WEST"]
  @right  1
  @left  -1

  def right(pos = %{facing: facing}) do
    %{pos | facing: turn(facing, @right)}
  end

  def left(pos = %{facing: facing}) do
    %{pos | facing: turn(facing, @left)}
  end

  defp turn(facing, speed) do
    index = Enum.find_index(@compass, &(&1 == facing)) + speed
            |> rem(length(@compass))

    Enum.at(@compass, index)
  end
end
