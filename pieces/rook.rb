require_relative "piece.rb"

class Rook < Piece
  include Slideable

  def initialize(position, board, color)
    @directions = {
      :n => [-1, 0],
      :s => [1, 0],
      :w => [0, -1],
      :e => [0, 1]
    }
    super
  end

  def to_s
    " \u265C "
  end
end
