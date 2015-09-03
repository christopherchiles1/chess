require_relative "piece.rb"

class Queen < Piece
  include Slideable

  def initialize(position, board, color)
    @directions = {
      :n => [-1, 0],
      :s => [1, 0],
      :w => [0, -1],
      :e => [0, 1],
      :nw => [-1, -1],
      :ne => [-1, 1],
      :sw => [1, -1],
      :se => [1, 1]
    }
    super
  end

  def to_s
    " \u265B "
  end
end
