defmodule ToyRobot.Table do
  defstruct width: 5, height: 5

  def valid?(%{width: width, height: height}, %{x: x, y: y}) do
    x >= 0 && x < width && y >= 0 && y < height
  end
end
