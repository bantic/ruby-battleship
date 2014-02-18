require 'logger'
$LOGGER = Logger.new('red_bantic.log')

$:.unshift File.dirname(__FILE__)
require 'lib/board'
require 'lib/grid'
require 'lib/square'

class RedBanticPlayer
  def name
    "@bantic's and @redyaffle's ruby battlebot"
  end

  def new_game
    [
      sample_board_1,
      sample_board_2,
      sample_board_3,
      sample_board_4,
      sample_board_5,
      sample_board_6
    ].sample
  end

  def take_turn(state, ships_remaining)
    @board ||= Board.new

    @board.update_state(state, ships_remaining)

    if @board.hit?
      $LOGGER.info("HIT! #{@board.hit}")
    end
    if @board.miss?
      $LOGGER.info("MISS! #{@board.miss}")
    end

    if @board.hit? && !@board.sunk_ship?
      @mode =  :destroy
    else
      @mode  = :seek
    end

    if @mode == :seek
      return @board.highest_ranking_square
    else
      return @board.near(@board.hit)
    end
  end

  private

  def sample_board_1
    [
      [4, 5, 5, :across],
      [7, 0, 4, :down],
      [2, 1, 3, :down],
      [5, 8, 3, :across],
      [1, 7, 2, :across],
    ]
  end

  def sample_board_2
    [
      [3, 5, 5, :across],
      [4, 9, 4, :across],
      [3, 3, 3, :across],
      [3, 7, 3, :across],
      [4, 1, 2, :across],
    ]
  end

  def sample_board_3
    [
      [8, 5, 5, :down],
      [6, 0, 4, :across],
      [5, 7, 3, :down],
      [0, 0, 3, :down],
      [4, 4, 2, :across],
    ]
  end

  def sample_board_4
    [
      [2, 4, 5, :across],
      [8, 0, 4, :down],
      [6, 5, 3, :down],
      [1, 7, 3, :down],
      [4, 0, 2, :across],
    ]
  end

  def sample_board_5
    [
      [0, 8, 5, :across],
      [6, 3, 4, :down],
      [7, 7, 3, :down],
      [9, 7, 3, :down],
      [9, 4, 2, :down],
    ]
  end

  def sample_board_6
    [
      [5, 2, 5, :across],
      [1, 6, 4, :down],
      [2, 1, 3, :down],
      [5, 8, 3, :across],
      [8, 9, 2, :across],
    ]
  end
end
