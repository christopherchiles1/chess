class Piece
  attr_reader :color
  attr_accessor :position

  def initialize(position, color)
    @position = position
    @color = color
  end

  def white?
    color == :white
  end

  def self.create_piece(piece, position, color)
    case piece
    when :queen
      Queen.new(position, color)
    when :rook
      Rook.new(position, color)
    when :bishop
      Bishop.new(position, color)
    when :knight
      Knight.new(position, color)
    when :king
      King.new(position, color)
    when :pawn
      Pawn.new(position, color)
    end
  end
end


class NullPiece
  attr_reader :color

  def initialize
    @color = :grey 
  end

  def to_s
    "   "
  end
end

class King < Piece
  def to_s
    " \u265A "
  end
end

class Queen < Piece

  def to_s
    " \u265B "
  end
end

class Rook < Piece
  def to_s
    " \u265C "
  end
end

class Bishop < Piece
  def to_s
    " \u265D "
  end
end

class Knight < Piece
  def to_s
    " \u265E "
  end
end

class Pawn < Piece
  def to_s
    " \u265F "
  end
end
