module SnakesAndLaddersGame
  class Game
    attr_accessor :players, :board, :size

    def initialize(players)
      @players = players
      @board = Board.new
    end
    
    def play_turn
      if game_over?
        puts "Game over start a new game"
        return
      end

      current_player.rolls_dice
      puts "player #{current_player.name} is in #{current_player.current_square}"
      puts "#{current_player.name} rolls the dice and gets #{current_player.dice_rolls.last}"
      
      if current_player.dice_rolls.last + current_player.current_square <= size
        board.move(current_player)
      end
      
      if current_player.wins?
        puts "Game over #{current_player.name} has won the game"
        players.each do |player|
          puts "player: #{player.name} are at position #{player.current_square}"
        end
      end
      next_player
    end
    
    private
    def next_player
      players.rotate!
      return
    end
    
    def current_player
      players.first
    end
    
    def game_over?
      players.map(&:wins).any?
    end
    
    def size
      board.size
    end
  end
end