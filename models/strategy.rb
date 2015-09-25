class Strategy
  NAME = :default

  def initialize(elements)
    @elements = elements
  end

  def to_s
    self.class::NAME
  end

  # Picks a random element to play
  def bot_hand(player_hand)
    @elements.keys.sample
  end
end
