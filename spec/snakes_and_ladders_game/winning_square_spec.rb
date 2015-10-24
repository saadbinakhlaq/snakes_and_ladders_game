require 'spec_helper'

describe WinningSquare do
  let(:winning_square) { WinningSquare.new 100 }
  let(:player) { Player.new 'player 1' }

  describe '#new' do
    it 'initializes winning square object' do
      expect(winning_square).to be_an_instance_of WinningSquare
    end
  end

  describe '#enter' do
    it 'player who enters wins' do
      expect(player.wins).to be_falsy
      winning_square.enter player
      expect(player.wins).to be_truthy
    end
  end
end