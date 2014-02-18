class Grid
  WIDTH  = 10
  HEIGHT = 10

  attr_reader :squares

  def initialize
    @squares = []

    0.upto(WIDTH) do |x|
      _row = []
      0.upto(HEIGHT) do |y|
        _row << Square.new(x,y)
      end

      @squares << _row
    end
  end

  def [](x,y)
    @squares[x][y]
  end
end
