class LastMoveStrategy < Strategy
  NAME = :last_move

  def initialize(elements)
    super
    @last_move = nil
  end

  # Picks an element to win against the player's last move
  def bot_hand(player_hand)
    hand = @elements.key(@last_move) || super
    @last_move = player_hand

    hand
  end
end
