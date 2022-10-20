class MoveCommand
  def initialize(robot:, board:)
    @robot = robot
    @board = board
  end

  def perform
    if @robot.placed?
      new_position = @robot.current_position.go_to(@robot.direction)

      if @robot.can_i_move?(new_position, @board)
        @robot.current_position = new_position\
      else
        puts "You cannot move, you are at on edge of the board."
      end
    else
      puts "Please, place the robot."
    end
  end
end