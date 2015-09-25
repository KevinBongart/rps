require_relative "../../../models/strategies/last_move_strategy"

RSpec.describe LastMoveStrategy do
  describe "#bot_hand" do
    it "picks an element to win against the player's last move" do
      elements = { rock: :scissors, paper: :rock, scissors: :paper }
      strategy = described_class.new(elements)

      # Player picks "paper"
      strategy.bot_hand(:paper)

      # Scissors win against the player's last move (paper)
      expect(strategy.bot_hand(:rock)).to eq(:scissors)

      # Paper wins against the player's last move (rock)
      expect(strategy.bot_hand(:scissors)).to eq(:paper)

      # Rock wins against the player's last move (scissors)
      expect(strategy.bot_hand(:paper)).to eq(:rock)
    end

    it "picks a random element during the first turn" do
      elements = { rock: :scissors, paper: :rock, scissors: :paper }
      strategy = described_class.new(elements)

      strategy.bot_hand(:paper)

      expect(elements.keys).to include(strategy.bot_hand(:rock))
    end
  end
end
