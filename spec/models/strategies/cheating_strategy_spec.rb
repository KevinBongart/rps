require_relative "../../../models/strategies/cheating_strategy"

RSpec.describe CheatingStrategy do
  describe "#bot_hand" do
    it "picks an element to win against the player's current move" do
      elements = { rock: :scissors, paper: :rock, scissors: :paper }
      strategy = described_class.new(elements)

      expect(strategy.bot_hand(:rock)).to eq(:paper)
      expect(strategy.bot_hand(:scissors)).to eq(:rock)
      expect(strategy.bot_hand(:paper)).to eq(:scissors)
    end
  end
end
