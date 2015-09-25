require_relative "../../models/strategy"

RSpec.describe Strategy do
  describe "#bot_hand" do
    it "picks a random element to play" do
      elements = { air: 123, water: 123, earth: 123, fire: 123, love: 123 }
      strategy = described_class.new(elements)

      expect(elements.keys).to include(strategy.bot_hand(:air))
    end
  end
end
