require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'player.rb'

class Game
  attr_reader :board, :display, :players

  def initialize(players)
    @players = players
    @board = Board.new
    @display = Display.new(board)
  end

  def play
    until game_over?
      display.render
      move = players.first.get_move
      display.update_cursor(move)
    end
  end

  def game_over?
    false
  end

end

if __FILE__ == $PROGRAM_NAME
  players = [HumanPlayer.new("Jim"), HumanPlayer.new("Lisa")]
  Game.new(players).play
end
