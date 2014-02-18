class Square
  attr_reader :points, :x, :y
  attr_accessor :state

  def initialize(x,y)
    @points = 0
    @state = :unknown
    @x = x
    @y = y
  end
end
