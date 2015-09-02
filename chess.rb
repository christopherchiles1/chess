require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'player.rb'

class Game
  attr_reader :board, :display, :players

  def initialize(players)
    @players = players
    @board = Board.new
    @display = Display.new(board, self)

    colors = [:white, :black]
    players.each_with_index do |player, index|
      player.display = display
      player.color = colors[index]
      player.board = board
    end
  end

  def play
    game_intro

    until game_over?
      display.render
      play_turn
      players.rotate!
    end
    puts "Game over."
  end

  def play_turn
    move = get_move
    update_board(move)
  rescue InvalidMoveError
    puts 'Invalid move.'
    retry
  end

  def game_intro
    puts "Welcome!"
  end

  def update_board(move)
    board.move(*move)
  end

  def game_over?
    [:white, :black].any? { |color| board.checkmate?(color) }
  end

  def current_player
    players.first
  end

  def get_move
    current_player.get_move
  end
end

class InvalidMoveError < StandardError
end

if __FILE__ == $PROGRAM_NAME
  players = [HumanPlayer.new("Jim"), HumanPlayer.new("Lisa")]
  Game.new(players).play
end
