require 'spec_helper'

describe Board do
  let(:board) { Board.new }
  let(:player) { Player.new 'player' }

  describe '#new' do
    it 'initializes the board' do
      expect(board).to be_an_instance_of Board
    end

    it 'last square should be an instance of winning square' do
      expect(board.squares.last).to be_an_instance_of WinningSquare
    end

    it 'does not have repeated squares' do
      squares_values = board.squares.map(&:value)
      repeated = squares_values.select{ |e| squares_values.count(e) > 1 }.uniq
      expect(repeated.size).to be <= 0
    end

    it 'first square has to be instance of square' do
      expect(board.squares.first).to be_an_instance_of Square
    end

    it 'ladder `to` value should not be snake `value`' do
      ladders_to = board.squares.select{ |element| element.name == 'ladder' }.map(&:to)
      snakes_value = board.squares.select{ |element| element.name == 'snake' }.map(&:value)
      common_values = ladders_to & snakes_value
      expect(common_values).to eq([])
    end

    it 'ladder `value` should not be snake `to` value' do
      ladders_value = board.squares.select{ |element| element.name == 'ladder' }.map(&:to)
      snakes_to = board.squares.select{ |element| element.name == 'snake' }.map(&:value)
      common_values = ladders_value & snakes_to
      expect(common_values).to eq([])
    end

    it 'creates a board with sequential values from 1 to 100' do
      expect(board.squares.map(&:value)).to eq((1..100).to_a)
    end
  end

  describe '#move' do
    it 'moves the player' do
      board.squares[4].players << player
      player.current_square = 5
      player.dice_rolls << 5
      board.move player
      expect(player.current_square).to eq(10)
    end
  end

  describe '#size' do
    it 'returns size of the board' do
      expect(board.size).to eq(100)
    end
  end
end