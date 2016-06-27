defmodule ToyRobot.Robot do
  alias ToyRobot.Bearing
  alias ToyRobot.Pos
  alias ToyRobot.Direction
  alias ToyRobot.Table

  defstruct place: nil, table: %Table{}

  def left(robot  = %{place: nil}), do: robot
  def right(robot = %{place: nil}), do: robot
  def move(robot  = %{place: nil}), do: robot

  def left(robot) do
    assign_pos(robot, Bearing.left(robot.place))
  end

  def right(robot) do
    assign_pos(robot, Bearing.right(robot.place))
  end

  def move(robot) do
    assign_pos(robot, Direction.move(robot.place))
  end

  def place(robot, x, y, facing) do
    pos = %Pos{x: x, y: y, facing: facing}

    assign_pos(robot, pos)
  end

  defp assign_pos(robot, pos) do
    if Table.valid?(robot.table, pos) do
      %{robot | place: pos}
    else
      robot
    end
  end
end
