require 'spec_helper'

describe Square do
  let(:player1) { Player.new 'player 1' }
  let(:player2) { Player.new 'player 2'}
  let(:square) { Square.new 1 }

  describe '#new' do
    it 'takes a number and assigns it as square value' do
      expect(square).to be_an_instance_of Square
    end

    it 'value should not be less than 0' do
      expect(square.value).to be > 0
    end
  end

  describe '#enter' do
    it 'adds new player to its players list' do
      expect(square.players).to eq([])
      square.enter player1
      expect(player1.current_square).to eq(1)
      expect(square.players).to eq([player1])
    end
  end

  describe '#exit' do
    it 'exits the player from its players list' do
      square.players << player1
      square.players << player2
      square.exit player1
      expect(square.players).to eq([player2])
    end
  end

  describe '#name' do
    it 'returns the name of the class in downcase' do
      expect(square.name).to eq('square')
    end
  end
end