require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'player.rb'

class Game
  attr_reader :board, :display, :players

  def initialize(players)
    @players = players
    @board = Board.new
    @display = Display.new(board)

    players.each { |player| player.display = display }
  end

  def play
    game_intro
    display.render

    until game_over?
      play_turn
      players.rotate!
    end
    puts "Game over."
  end

  def play_turn
    move = get_move
    update_board(move)
  # rescue FishError
  #   puts 'Invalid move.'
  #   retry
  end

  def game_intro
    puts "Welcome!"
  end

  def update_board(move)
    board.move(*move)
  end

  def game_over?
    false
  end

  def current_player
    players.first
  end

  def get_move
    current_player.get_move
  end
end

if __FILE__ == $PROGRAM_NAME
  players = [HumanPlayer.new("Jim"), HumanPlayer.new("Lisa")]
  Game.new(players).play
end
