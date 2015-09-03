require_relative "piece.rb"

class Bishop < Piece
  include Slideable

  def initialize(position, board, color)
    @directions = {
      :nw => [-1, -1],
      :ne => [-1, 1],
      :sw => [1, -1],
      :se => [1, 1]
    }
    super
  end

  def to_s
    " \u265D "
  end
end
