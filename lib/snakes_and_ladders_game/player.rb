module SnakesAndLaddersGame
  class Player
    attr_reader :name
    attr_accessor :dice_rolls, :current_square, :wins
    
    def initialize(name)
      @name = name
      @dice_rolls = []
      @current_square = 1
      @wins = false
    end
    
    def rolls_dice
      dice_rolls << Dice.roll
    end

    def wins?
      wins
    end
  end
end