defmodule ToyRobot.Direction do
  def move(pos = %{facing: "NORTH", y: y}) do
    %{pos | y: y + 1 }
  end

  def move(pos = %{facing: "SOUTH", y: y}) do
    %{pos | y: y - 1 }
  end

  def move(pos = %{facing: "EAST", x: x}) do
    %{pos | x: x + 1 }
  end

  def move(pos = %{facing: "WEST", x: x}) do
    %{pos | x: x - 1 }
  end
end
