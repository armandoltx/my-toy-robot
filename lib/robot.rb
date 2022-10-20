require 'forwardable'

class Robot
  extend Forwardable

  def_delegators :@current_position, :x_axis, :y_axis, :direction, :turn_left, :turn_right

  attr_accessor :current_position

  def initialize
    @current_position = nil
  end

  def report
    if placed?
      [@current_position.x_axis, @current_position.y_axis, @current_position.direction].join(",")
    else
      "Robot is not placed."
    end
  end

  def placed?
    !@current_position.nil?
  end

  def can_i_move?(position, board)
    (position.x_axis.to_i >= 0 && position.x_axis.to_i <= board.width.to_i) &&
    (position.y_axis.to_i >= 0 && position.y_axis.to_i <= board.height.to_i)
  end
end
