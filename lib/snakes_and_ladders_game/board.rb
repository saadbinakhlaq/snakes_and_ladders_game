module SnakesAndLaddersGame
  class Board
    attr_accessor :squares, :winner
    def initialize
      @squares = [
        Square.new(1), Square.new(2), Square.new(3), Ladder.new(4, 14), Square.new(5),
        Square.new(6), Square.new(7), Square.new(8), Ladder.new(9, 31), Square.new(10), 
        Square.new(11), Square.new(12), Square.new(13), Square.new(14), Square.new(15),
        Square.new(16), Snake.new(17, 7), Square.new(18), Square.new(19), Ladder.new(20, 38),
        Square.new(21), Square.new(22), Square.new(23), Square.new(24), Square.new(25),
        Square.new(26), Square.new(27), Square.new(28), Square.new(29), Square.new(30),
        Square.new(31), Square.new(32), Square.new(33), Square.new(34), Square.new(35),
        Square.new(36), Square.new(37), Square.new(38), Square.new(39), Ladder.new(40, 59),
        Square.new(41), Square.new(42), Square.new(43), Square.new(44), Square.new(45),
        Square.new(46), Square.new(47), Square.new(48), Square.new(49), Square.new(50),
        Ladder.new(51, 67), Square.new(52), Square.new(53), Snake.new(54, 34), Square.new(55),
        Square.new(56), Square.new(57), Square.new(58), Square.new(59), Square.new(60),
        Square.new(61), Square.new(62), Ladder.new(63, 81), Snake.new(64, 60), Square.new(65),
        Square.new(66), Square.new(67), Square.new(68), Square.new(69), Square.new(70),
        Ladder.new(71, 91), Square.new(72), Square.new(73), Square.new(74), Square.new(75),
        Square.new(76), Square.new(77), Square.new(78), Square.new(79), Square.new(80),
        Square.new(81), Square.new(82), Square.new(83), Square.new(84), Square.new(85),
        Square.new(86), Snake.new(87, 24), Square.new(88), Square.new(89), Square.new(90),
        Square.new(91), Square.new(92), Snake.new(93, 73), Square.new(94), Snake.new(95, 76),
        Square.new(96), Square.new(97), Square.new(98), Snake.new(99, 78), WinningSquare.new(100)
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