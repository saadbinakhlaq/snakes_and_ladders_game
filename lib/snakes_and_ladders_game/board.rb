module SnakesAndLaddersGame
  class Board
    attr_accessor :squares, :winner
    def initialize
      @squares = [
        Square.new(1),
        Square.new(2),
        Ladder.new(3, 6),
        Square.new(4),
        Square.new(5),
        Square.new(6),
        Snake.new(7, 2),
        Square.new(8),
        Square.new(9),
        WinningSquare.new(10)
      ]
    end
    
    def move(player)
      current_square = squares[player.current_square - 1]
      current_square.exit(player)
      
      to_square = squares[current_square.value + player.dice_rolls.last - 1]
      
      if %w(snake ladder).include? to_square.name
        to_square.enter(player, squares)
      else
        to_square.enter(player)
      end
    end
    
    def size
      squares.size
    end
  end
end