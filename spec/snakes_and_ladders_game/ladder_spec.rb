require 'spec_helper'

describe Ladder do
  let(:square1) { Square.new 1 }
  let(:ladder) { Ladder.new 2, 4 }
  let(:square3) { Square.new 3 }
  let(:square4) { Square.new 4 }
  let(:player1) { Player.new 'player 1' }

  describe '#new' do
    it 'initializes snake with `to` attribute' do
      expect(ladder).to be_an_instance_of Ladder
    end
  end

  describe '#enter' do
    it 'transports player to square located at `to` attribute' do
      squares = [square1, ladder, square3, square4]
      ladder.enter player1, squares
    
      expect(square4.players).to eq([player1])
    end
  end

  describe '#name' do
    it 'returns name of the object type' do
      expect(ladder.name).to eq('ladder')
    end
  end
end