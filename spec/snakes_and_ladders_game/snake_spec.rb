require 'spec_helper'

describe Snake do
  let(:snake) { Snake.new 2, 1 }
  let(:square) { Square.new 1 }
  let(:player1) { Player.new 'player 1' }

  describe '#new' do
    it 'initializes snake with to attribute' do
      expect(snake).to be_an_instance_of Snake
    end
  end

  describe '#enter' do
    it 'transports player to square located at `to` attribute' do
      squares = [square, snake]
      snake.enter player1, squares
    
      expect(square.players).to eq([player1])
    end
  end

  describe '#name' do
    it 'returns name of the object type' do
      expect(snake.name).to eq('snake')
    end
  end
end