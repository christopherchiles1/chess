require_relative "slideable.rb"
require_relative "steppable.rb"

class Piece
  attr_reader :color, :board
  attr_accessor :position, :moved, :directions

  def initialize(position, board, color)
    @board = board
    @position = position
    @color = color
    @moved = false
  end

  def empty?
    false
  end

  def opposite_color
    return :black if color == :white
    return :white if color == :black
  end

  def self.opposite_color(color)
    return :black if color == :white
    return :white if color == :black
  end

  def dup(board)
    self.class.new(position, board, color)
  end

  def valid_moves
    self.moves.select do |move|
      valid_move?(move)
    end
  end

  def valid_move?(move)
    dupped_board = board.deep_dup
    dupped_board.move_piece!(position, move)
    !dupped_board.in_check?(self.color)
  end
end
