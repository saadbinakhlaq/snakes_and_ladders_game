module SnakesAndLaddersGame
  class Square
    attr_accessor :players
    attr_reader :value, :winning_square, :transport, :to

    def initialize(value)
      @value = value
      @players = []
    end
    
    def enter(player)
      puts "#{player.name} enters #{value}"
      player.current_square = value
      players << player
    end
    
    def exit(player)
      puts "#{player.name} exits #{value}"
      players.delete(player)
    end
    
    def name
      'square'
    end
  end
end