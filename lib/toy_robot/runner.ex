defmodule ToyRobot.Runner do
  import String, only: [to_integer: 1]

  alias ToyRobot.Robot

  def read do
    robot = %Robot{}
    Enum.reduce IO.stream(:stdio, :line), robot, &read_line(String.strip(&1), &2)
  end

  def read_line(line, robot) do
    [command | args] = String.split(line, [" ", ","], parts: 4)
    run(command, robot, args)
  end

  def run("PLACE", robot, [x, y, facing])
  when facing in ["NORTH", "SOUTH", "EAST", "WEST"]
  do
    Robot.place(robot, to_integer(x), to_integer(y), facing)
  end

  def run("LEFT", robot, _) do
    Robot.left(robot)
  end

  def run("RIGHT", robot, _) do
    Robot.right(robot)
  end

  def run("MOVE", robot, _) do
    Robot.move(robot)
  end

  def run("REPORT", robot, _) do
    IO.inspect robot
    robot
  end

  def run(_, robot, _) do
    IO.puts "invalid command"
    robot
  end
end
