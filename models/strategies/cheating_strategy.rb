require_relative "../strategy"

class CheatingStrategy < Strategy
  NAME = :cheating

  # Picks an element to win against the player's current move
  def bot_hand(player_hand)
    @elements.key(player_hand)
  end
end
