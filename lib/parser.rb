Dir[File.join(__dir__, 'commands', '*.rb')].each { |file| require file }

class Parser

  def initialize(height: , width:)
    @robot = Robot.new
    @board = Board.new(height: height, width: width)
  end

  def parse(input)
    # puts "-1-1-1-1-1-1-1-1"
    case input
    when /^PLACE/
      # puts "000000000000"
       PlaceCommand.new(robot: @robot, board: @board, input: input).perform
    when /^MOVE$/
      # puts "input => #{input}"
      # puts "@board => #{@board.inspect}"
      MoveCommand.new(robot: @robot, board: @board).perform
    when /^LEFT$/
      LeftCommand.new(robot: @robot).perform
    when /^RIGHT$/
      RightCommand.new(robot: @robot).perform
    when /^REPORT$/
      puts @robot.report
    when /^BOARD$/
      puts "board size is #{@board.height} x #{@board.width}"
    when /^q$/ || /^EXIT$/
      exit!
    else
      puts "No Entiendo..."
    end
  end
end
