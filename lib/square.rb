class Square
  attr_reader :x, :y, :sunk
  attr_accessor :state, :points

  def initialize(x,y)
    @points = 0
    @state = :unknown
    @sunk  = false
    @x = x
    @y = y
  end

  def unknown?
    @state == :unknown
  end

  def miss?
    @state == :miss
  end

  def hit?
    @state == :hit
  end

  def sunk?
    @sunk == true
  end
end
