require_relative "strategy"
require_relative "strategies/favorite_strategy"
require_relative "strategies/last_move_strategy"

class Game
  STRATEGIES = {
    "favorite" => FavoriteStrategy,
    "last_move" => LastMoveStrategy
  }

  # List of elements (rock, paper, scissors) and the value they each win against
  ELEMENTS = {
    r: :s,
    s: :p,
    p: :r
  }

  def initialize(strategy:)
    @wins = @losses = @ties = 0
    @strategy = STRATEGIES.fetch(strategy, Strategy).new(ELEMENTS)
  end

  def play
    puts "You are playing against strategy '#{@strategy.to_s}'."

    while true do
      puts "Type 'r', 'p' or 's'."
      print ">"

      player_hand = STDIN.gets.chomp.to_sym
      bot_hand = @strategy.bot_hand(player_hand)

      puts "I chose '#{bot_hand}'. #{compare_hands(player_hand, bot_hand)}"
      puts "you won #{@wins} times."
      puts "you lost #{@losses} times."
      puts "we tied #{@ties} times."
    end
  end

  private

  def compare_hands(player_hand, bot_hand)
    if player_hand == bot_hand
      @ties += 1
      "It's a tie!"
    elsif ELEMENTS[player_hand] == bot_hand
      @wins += 1
      "You win!"
    else
      @losses += 1
      "You lose!"
    end
  end
end
