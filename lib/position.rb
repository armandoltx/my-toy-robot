class Position
  attr_reader :x_axis, :y_axis, :direction

  def initialize(x_axis:, y_axis:, direction:)
    @x_axis = x_axis.to_i
    @y_axis = y_axis.to_i
    @direction = direction
  end

  def turn_left(direction)
    case @direction
      when "NORTH"
        "WEST"
      when "WEST"
        "SOUTH"
      when "SOUTH"
        "EAST"
      when "EAST"
        "NORTH"
      end
  end

  def turn_right(direction)
    case @direction
      when "NORTH"
        "EAST"
      when "EAST"
        "SOUTH"
      when "SOUTH"
        "WEST"
      when "WEST"
        "NORTH"
      end
  end

  def go_to(direction)
    case @direction
    when "NORTH"
      go_north
    when "EAST"
      go_east
    when "SOUTH"
      go_south
    when "WEST"
      go_west
    end
  end

  private

  def go_north
    Position.new(x_axis: @x_axis, y_axis: @y_axis + 1, direction: @direction)
  end

  def go_south
    Position.new(x_axis: @x_axis, y_axis: @y_axis - 1, direction: @direction)
  end

  def go_west
    Position.new(x_axis: @x_axis - 1, y_axis: @y_axis, direction: @direction)
  end

  def go_east
    Position.new(x_axis: @x_axis + 1, y_axis: @y_axis, direction: @direction)
  end
end
