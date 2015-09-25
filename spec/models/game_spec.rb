require_relative "../../models/game"

RSpec.describe Game do
  describe ".new" do
    it "uses the right strategy" do
      game = Game.new(strategy: "last_move")
      expect(game.strategy).to be_a(LastMoveStrategy)

      game = Game.new(strategy: "favorite")
      expect(game.strategy).to be_a(FavoriteStrategy)
    end

    it "picks the default strategy otherwise" do
      game = Game.new(strategy: nil)
      expect(game.strategy).to be_a(Strategy)

      game = Game.new(strategy: "capture_the_flag")
      expect(game.strategy).to be_a(Strategy)
    end
  end

  describe "#play" do
    it "plays" do
      game = Game.new

      allow(game).to receive(:print_results)
      allow(game.strategy).to receive(:bot_hand).and_return(:p, :s, :r)
      allow(STDIN).to receive(:gets).once.and_return("p", "r", "s", "q")

      expect(STDOUT).to receive(:puts).with("You are playing against strategy 'default'.")

      expect(STDOUT).to receive(:puts).with("Type 'r', 'p' or 's'.").exactly(4).times
      expect(game).to receive(:print).with(">").exactly(4).times

      expect(STDOUT).to receive(:puts).with("I chose 'p'. It's a tie!")
      expect(STDOUT).to receive(:puts).with("I chose 's'. You win!")
      expect(STDOUT).to receive(:puts).with("I chose 'r'. You lose!")
      expect(STDOUT).to receive(:puts).with("Bye.")

      game.play
    end
  end
end
