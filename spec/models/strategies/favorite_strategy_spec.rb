require_relative "../../../models/strategies/favorite_strategy"

RSpec.describe FavoriteStrategy do
  describe "#bot_hand" do
    it "picks an element to win against the player's most frequent move" do
      elements = { rock: :scissors, paper: :rock, scissors: :paper }
      strategy = described_class.new(elements)

      # Player picks "rock" twice and "paper" once
      strategy.bot_hand(:rock)
      strategy.bot_hand(:rock)
      strategy.bot_hand(:paper)

      # Paper wins against the player's most frequent move (rock)
      expect(strategy.bot_hand(:paper)).to eq(:paper)

      # Paper wins against the player's most frequent move (rock)
      expect(strategy.bot_hand(:paper)).to eq(:paper)

      # Scissors win against the player's most frequent move (paper)
      expect(strategy.bot_hand(:paper)).to eq(:scissors)
    end

    it "picks a random element during the first turn" do
      elements = { rock: :scissors, paper: :rock, scissors: :paper }
      strategy = described_class.new(elements)

      strategy.bot_hand(:paper)

      expect(elements.keys).to include(strategy.bot_hand(:rock))
    end
  end
end
