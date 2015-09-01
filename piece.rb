require_relative "slideable.rb"

class Piece
  attr_reader :color, :board, :directions
  attr_accessor :position

  def initialize(position, board, color)
    @board = board
    @position = position
    @color = color
  end

  def empty?
    false
  end
end


class NullPiece < Piece

  def initialize(position, board)
    @directions = {}
    super(position, board, :grey)
  end

  def to_s
    "   "
  end

  def empty?
    true
  end

end

class King < Piece
  include Steppable

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
    " \u265A "
  end
end

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

class Pawn < Piece
  def to_s
    " \u265F "
  end
end
