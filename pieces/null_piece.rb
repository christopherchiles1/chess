class NullPiece < Piece

  def initialize(position, board, color = :grey)
    @directions = {}
    super
  end

  def to_s
    "   "
  end

  def empty?
    true
  end

  def moves
    []
  end
end
