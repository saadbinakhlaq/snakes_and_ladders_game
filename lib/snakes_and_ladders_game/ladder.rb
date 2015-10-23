module SnakesAndLaddersGame
  class Ladder < Square
    attr_reader :to

    def initialize(value, to)
      @value = value
      @to = to
    end
    
    def enter(player, squares)
      puts "player takes the ladder at #{value}"
      squares[to - 1].enter(player)
    end
    
    def name
      'ladder'
    end
  end
end