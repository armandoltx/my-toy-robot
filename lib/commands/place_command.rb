class PlaceCommand

  def initialize(robot: nil, board: nil, input: nil)
    @robot = robot
    @board = board
    @input = input
    @position = nil
  end

  def perform
    # puts "111111111"
    if @board&.is_valid?
      # puts "22222222222"
      if is_valid?(@input)
        # puts "3333333333"
        command, x, y, direction = @input.gsub(",", " ").split
        @position = Position.new(x_axis: x.to_i, y_axis: y.to_i, direction: direction)
        # puts "@position => #{@position.inspect}"
        @robot.current_position = @position
      else
        puts "the command placed is wrong, Must be similar to: 'PLACE 0,0,NORTH'"
      end
    else
      puts "Please, set up a board."
    end
  end

  def is_valid?(input)
    if input =~ /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
      true
    else
      false
    end
  end
end
