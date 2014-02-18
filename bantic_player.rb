class BanticPlayer
  def name
    "@bantic's ruby battlebot"
  end

  def new_game
    [
      [4, 5, 5, :across],
      [7, 0, 4, :down],
      [2, 1, 3, :down],
      [5, 8, 3, :across],
      [1, 7, 2, :across],
    ]
  end

  def take_turn(state, ships_remaining)
    [rand(10), rand(10)]
  end
end
