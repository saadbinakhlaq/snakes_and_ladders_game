module SnakesAndLaddersGame
  class WinningSquare < Square
    def enter(player)
      player.wins = true
    end
  end
end