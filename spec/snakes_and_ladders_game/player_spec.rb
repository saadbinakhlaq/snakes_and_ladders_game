require 'spec_helper'

describe Player do
  let(:player) { Player.new 'player 1' }

  describe '#new' do
    it 'takes name parameter and creates a player object' do
      expect(player).to be_an_instance_of Player
    end
    
    it 'initializes the player with default values' do
      expect(player.dice_rolls).to eq([])
      expect(player.current_square).to eq(1)
      expect(player.wins).to be_falsy
    end
  end

  describe '#rolls_dice' do
    it 'stores the current dice roll value' do
      allow(Dice).to receive(:roll) { 3 }
      player.dice_rolls << 1
      player.rolls_dice
      expect(player.dice_rolls).to eq([1, 3])
    end
  end
  
  describe '#wins?' do
    it 'returns the value of player wins attribute' do
      expect(player.wins?).to eq(!!player.wins)
    end
  end
end