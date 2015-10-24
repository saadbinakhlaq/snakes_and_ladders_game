require 'spec_helper'

describe Game do
  let(:player1) { Player.new 'player 1' }
  let(:player2) { Player.new 'player 2' }
  let(:game) { Game.new [player1, player2] }

  describe '#new' do
    it 'initializes the game' do
      expect(game).to be_an_instance_of Game
    end
  end

  describe '#play_turn' do
    context 'game is over' do
      it 'returns and no player is allowed to play their turn' do
        allow(game).to receive(:game_over?) { true }
        allow(game).to receive(:current_player) { player1 }
        expect { game.play_turn }.to raise_error(StandardError, 'Game Over')
      end
    end

    context 'dice roll is less than board size' do
      it 'moves the current player' do
        allow(game).to receive(:current_player) { player1 }
        allow(Dice).to receive(:roll) { 1 }
        game.play_turn
        expect(player1.current_square).to eq(2)
      end
    end

    context 'dice roll is greater than board size' do
      it 'does not moves the current player' do
        player1.current_square = 9
        allow(game).to receive(:current_player) { player1 }
        allow(Dice).to receive(:roll) { 2 }
        game.play_turn
        expect(player1.current_square).to eq(9)  
      end
    end

    context 'player wins the game' do
      it 'declares the player who has won' do
        player1.current_square = 9
        allow(game).to receive(:current_player) { player1 }
        allow(Dice).to receive(:roll) { 1 }
        
        output = capture_stdout { game.play_turn }
        expect(output).to include("Game over #{player1.name} has won the game")
      end
    end
  end

  describe '#next_player' do
    it 'returns next player in the list' do
      expect(game.send(:current_player)).to eq(player1)
      game.send(:next_player)
      expect(game.send(:current_player)).to eq(player2)
    end
  end

  describe '#current_player' do
    it 'returns the first player in players list' do
      expect(game.send(:current_player)).to eq(player1)
    end
  end

  describe '#game_over?' do
    context 'one of the player wins' do
      it 'returns true' do
        player1.wins = true
        expect(game.send(:game_over?)).to be_truthy
      end
    end

    context 'no one has won the game' do
      it 'returns false' do
        expect(game.send(:game_over?)).to be_falsy
      end
    end
  end

  describe '#board_size' do
    it 'returns the size of the board' do
      expect(game.send(:board_size)).to eq(game.board.size)
    end
  end
end