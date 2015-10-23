module SnakesAndLaddersGame
  class Snake < Square
    attr_reader :to

    def initialize(value, to)
      @value = value
      @to = to
    end
    
    def enter(player, squares)
      puts "player is bitten by the snake at #{value}"
      squares[to - 1].enter(player)
    end
    
    def name
      'snake'
    end
  end
end