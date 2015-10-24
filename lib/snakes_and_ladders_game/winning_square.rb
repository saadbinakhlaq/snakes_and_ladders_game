module SnakesAndLaddersGame
  class WinningSquare < Square
    def enter(player)
      player.current_square = value
      player.wins = true
    end
  end
end