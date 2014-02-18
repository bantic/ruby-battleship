class RedBanticPlayer
  def name
    "@bantic's and @redyaffle's ruby battlebot"
  end

  def new_game
    [
      sample_board_1,
      sample_board_2,
      sample_board_e,
      sample_board_4,
      sample_board_5,
      sample_board_6
    ].sample
  end

  def take_turn(state, ships_remaining)
    [rand(10), rand(10)]
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
      [4, 5, 5, :across],
      [7, 0, 4, :down],
      [2, 1, 3, :down],
      [5, 8, 3, :across],
      [1, 7, 2, :across],
    ]
  end

  def sample_board_3
    [
      [4, 5, 5, :across],
      [7, 0, 4, :down],
      [2, 1, 3, :down],
      [5, 8, 3, :across],
      [1, 7, 2, :across],
    ]
  end

  def sample_board_4
    [
      [4, 5, 5, :across],
      [7, 0, 4, :down],
      [2, 1, 3, :down],
      [5, 8, 3, :across],
      [1, 7, 2, :across],
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
