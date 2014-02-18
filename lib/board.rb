class Board
  attr_reader :hit, :miss

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
            $LOGGER.info("recording hit: #{square.inspect}")
            @hit = square
          else
            $LOGGER.info("recording miss: #{square.inspect}")
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
    guess = nil

    loop do
      guess = [rand(10), rand(10)]
      break if @grid[guess[0], guess[1]].state == :unknown

      $LOGGER.info("throwing back guess #{guess}")
    end

    guess
    # Loop through all grid squares and add a point for each of the possible ships that could be placed on it (both directions), given the current board state
    # This is where it would be handy to know which squares were sunk and which are live...
  end

  def near(square)
    [rand(10), rand(10)]
    # Basically just choose a square near the hit square and if it's also a hit continue in that direction or try the opposite side. If both are misses try the other direction
  end
end
