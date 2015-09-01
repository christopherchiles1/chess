require_relative "all_pieces.rb"

class Board
  attr_accessor :grid

  def initialize
    @grid = empty_grid
    setup_grid
  end

  def move(start_pos, end_pos)
    piece = self[start_pos]
    self[end_pos] = piece
    piece.position = end_pos
    self[start_pos] = NullPiece.new(start_pos, self)
  end

  def valid_move?(start_pos, end_pos)
    raise NoPieceError if self[start_pos].is_a?(NullPiece)
    raise InvalidMoveError if self[end_pos]
  end

  def on_board?(pos)
    pos.all? { |i| i.between?(0, 7) }
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    grid[x][y] = val
  end

  def inspect
    "test".to_s
  end

  private

  INITIAL_WHITE_POSITIONS = {
    Queen => [[0,4]],
    Rook => [[0,0], [0,7]],
    Bishop => [[0,2], [0,5]],
    Knight => [[0,1], [0,6]],
    King => [[0,3]],
    Pawn => [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7]]
  }

  INITIAL_BLACK_POSITIONS = {
    Queen => [[7,4]],
    Rook => [[7,0], [7,7]],
    Bishop => [[7,2], [7,5]],
    Knight => [[7,1], [7,6]],
    King => [[7,3]],
    Pawn => [[6,0], [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7]]
  }

  def setup_grid
    INITIAL_WHITE_POSITIONS.each do |piece, positions|
      positions.each do |position|
        self[position] = piece.new(position, self, :white)
      end
    end
    INITIAL_BLACK_POSITIONS.each do |piece, positions|
      positions.each do |position|
        self[position] = piece.new(position, self, :black)
      end
    end
  end

  def empty_grid
    grid = Array.new(8) { Array.new(8) }
    grid.each_with_index do |row, row_index|
      row.each_index do |col_index|
        grid[row_index][col_index] = NullPiece.new([row_index, col_index], self)
      end
    end
    grid
  end

end

class NoPieceError < StandardError
end
