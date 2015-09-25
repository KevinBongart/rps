require_relative "strategy"
require_relative "strategies/cheating_strategy"
require_relative "strategies/favorite_strategy"
require_relative "strategies/last_move_strategy"

class Game
  attr_reader :strategy

  STRATEGIES = {
    "favorite" => FavoriteStrategy,
    "last_move" => LastMoveStrategy,
    "cheating" => CheatingStrategy
  }

  # List of elements (rock, paper, scissors) and the value they each win against
  ELEMENTS = {
    r: :s,
    s: :p,
    p: :r
  }

  def initialize(strategy: nil)
    @wins = @losses = @ties = 0
    @strategy = STRATEGIES.fetch(strategy, Strategy).new(ELEMENTS)
  end

  def play
    puts "You are playing against strategy '#{@strategy.to_s}'."

    while true do
      puts "Type 'r', 'p' or 's'."
      print ">"
      input = STDIN.gets.chomp

      if input == "q"
        print_results
        puts "Bye."
        break
      elsif ELEMENTS.keys.include?(input.to_sym)
        player_hand = input.to_sym
        bot_hand = @strategy.bot_hand(player_hand)
        puts "I chose '#{bot_hand}'. #{compare_hands(player_hand, bot_hand)}"
        print_results
      end
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

  def print_results
    puts "You won #{@wins} times."
    puts "You lost #{@losses} times."
    puts "We tied #{@ties} times."
  end
end
