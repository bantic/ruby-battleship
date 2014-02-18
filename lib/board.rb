class Board
  attr_reader :hit, :miss, :grid

  def initialize
    @hit = @miss = nil
    @sunk_ship = false
    @ships = [2,3,3,4,5]
    @grid = Grid.new
  end

  def update_state(state_array, ships)
    @hit = @miss = nil
    @sunk_ship = false

    if @ships != ships.sort
      # need to figure out what squares correspond to the sunk ship
      $LOGGER.info("sunk ship! #{@ships.inspect}, #{ships.inspect}")

      @sunk_ship = true
      @ships = ships.sort
    end

    state_array.each_with_index do |row, y|
       row.each_with_index do |state, x|
        square = @grid[x,y]
        if square.state != state
          if state == :hit
            @hit = square
          else
            @miss = square
          end

          square.state = state
        end
      end
    end
  end

  def hit?; @hit; end
  def miss?; @miss; end
  def sunk_ship?; @sunk_ship; end

  def highest_ranking_square
    @grid.each_square do |square|
      square.points = 0
    end

    @grid.each_square do |square|
      next unless square.unknown?

      @ships.each do |ship|
        square.points += potential_placements(square, ship, :across)
        square.points += potential_placements(square, ship, :down)
      end
    end

    max_points = 0

    @grid.each_square do |square|
      if square.points > max_points
        max_points = square.points
      end
    end

    max_squares = []
    @grid.each_square do |square|
      max_squares << square if square.points == max_points
    end

    if max_squares.length > 0
      max_square = max_squares.sample
      return [max_square.x, max_square.y]
    end

    return random_guess
  end

  def random_guess
    $LOGGER.info "falling back to random guess"

    guess = nil

    loop do
      guess = [rand(10), rand(10)]
      break if @grid[guess[0], guess[1]].state == :unknown
    end

    guess
  end

  def near(square)
    [rand(10), rand(10)]
    # Basically just choose a square near the hit square and if it's also a hit continue in that direction or try the opposite side. If both are misses try the other direction
  end

  private

  def potential_placements(square, ship, orientation)
    x = square.x
    y = square.y

    stack = []

    if orientation == :down
      ( (y - ship)..(y+ship) ).each do |y_index|
        stack << [x, y_index]
      end
    end

    if orientation == :across
      ( (x - ship)..(x + ship) ).each do |x_index|
        stack << [x_index, y]
      end
    end

    points = 0
    stack.each do |possible_coordinates|
      points += 1 if placeable?( possible_coordinates, ship, orientation )
    end

    points
  end

  def placeable?( coords, ship, orientation )
    (0...ship).each do |ship_index|
      square = grid[coords[0], coords[1]]

      if !square
        return false
      end
      if square.miss? || square.sunk?
        return false
      end

      if orientation == :down
        coords[1] += 1
      else
        coords[0] += 1
      end
    end

    return true
  end
end
