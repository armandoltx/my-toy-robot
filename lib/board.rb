class Board
  attr_reader :width, :height

  def initialize(height: 4, width: 4)
    @height = height
    @width = width
  end

  def is_valid?
    height.to_i > 0 && width.to_i > 0
  end
end
