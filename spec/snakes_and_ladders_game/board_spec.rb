require 'spec_helper'

describe Board do
  let(:board) { Board.new }
  let(:player) { Player.new 'player' }

  describe '#new' do
    it 'initializes the board' do
      expect(board).to be_an_instance_of Board
    end
  end

  describe '#move' do
    it 'moves the player' do
      board.squares[3].players << player
      player.current_square = 4
      player.dice_rolls << 5
      board.move player
      expect(player.current_square).to eq(9) 
    end
  end

  describe '#size' do
    it 'returns size of the board' do
      expect(board.size).to eq(10)
    end
  end
end