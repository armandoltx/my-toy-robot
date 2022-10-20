class RightCommand
  def initialize(robot:)
    @robot = robot
  end


  def perform
    if @robot.placed?

      @robot.current_position = Position.new(
                                              x_axis: @robot.x_axis,
                                              y_axis: @robot.y_axis,
                                              direction: @robot.turn_right(@robot.direction)
                                            )
    else
      puts "Please, place the robot."
    end
  end
end
