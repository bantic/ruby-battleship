class Grid
  WIDTH  = 10
  HEIGHT = 10

  attr_reader :squares

  def initialize
    @squares = []

    (0...HEIGHT).each do |y|
      _row = []
      (0...WIDTH).each do |x|
        _row << Square.new(x,y)
      end

      @squares << _row
    end
  end

  def each_square(&block)
    (0...HEIGHT).each do |y|
      (0...WIDTH).each do |x|
        yield self[x,y]
      end
    end
  end

  def [](x,y)
    return nil if x < 0
    return nil if y < 0
    return nil if x >= WIDTH
    return nil if y >= HEIGHT

    @squares[y][x]
  end
end
