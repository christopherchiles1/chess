require_relative 'piece.rb'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { NullPiece.new } }
    setup_board
  end

  def move(start_pos, end_pos)
    piece = self[start_pos]
    self[end_pos] = piece
    piece.position = end_pos
    self[start_pos] = NullPiece.new
  end

  def valid_move?(start_pos, end_pos)
    raise NoPieceError if self[start_pos].is_a?(NullPiece)
    raise InvalidMoveError if self[end_pos]
  end

  def [](pos)
    x, y = pos
    board[x][y]
  end

  def []=(pos, val)
    x, y = pos
    board[x][y] = val
  end

  def inspect
    "test".to_s
  end

  private

  INITIAL_WHITE_POSITIONS = {
    :queen => [[0,4]],
    :rook => [[0,0], [0,7]],
    :bishop => [[0,2], [0,5]],
    :knight => [[0,1], [0,6]],
    :king => [[0,3]],
    :pawn => [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7]]
  }

  INITIAL_BLACK_POSITIONS = {
    :queen => [[7,4]],
    :rook => [[7,0], [7,7]],
    :bishop => [[7,2], [7,5]],
    :knight => [[7,1], [7,6]],
    :king => [[7,3]],
    :pawn => [[6,0], [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7]]
  }

  def setup_board
    INITIAL_WHITE_POSITIONS.each do |piece, positions|
      positions.each do |position|
        self[position] = Piece.create_piece(piece, position, :white)
      end
    end
    INITIAL_BLACK_POSITIONS.each do |piece, positions|
      positions.each do |position|
        self[position] = Piece.create_piece(piece, position, :black)
      end
    end
  end

end

class NoPieceError < StandardError
end
