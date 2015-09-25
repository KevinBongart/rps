require_relative "../strategy"

class FavoriteStrategy < Strategy
  NAME = :favorite

  def initialize(elements)
    super

    @moves = {}
    @elements.keys.map do |element|
      @moves[element] = 0
    end
  end

  # Picks an element to win against the player's most frequent move
  def bot_hand(player_hand)
    hand = @elements.key(most_frequent_move) || super
    @moves[player_hand] += 1

    hand
  end

  private

  def most_frequent_move
    @moves.sort_by { |element, count| count }.last.first
  end
end
