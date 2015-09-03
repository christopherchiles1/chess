require_relative "piece.rb"

class Knight < Piece
  include Steppable

  def initialize(position, board, color)
    @directions = {
      :nww => [-1, -2],
      :nnw => [-2, -1],
      :nne => [-2, 1],
      :nee => [-1, 2],
      :see => [1, 2],
      :sse => [2, 1],
      :ssw => [2, -1],
      :sww => [1, -2]
    }
    super
  end

  def to_s
    " \u265E "
  end
end
