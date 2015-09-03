require_relative "piece.rb"

class Pawn < Piece
  attr_reader :all_directions

  def initialize(position, board, color)
    super
    setup_directions
  end

  def setup_directions
    directions = {
      :step => [1, 0],
      :dubstep => [2, 0],
      :leftattack => [1, -1],
      :rightattack => [1, 1]
    }
    directions.each { |_, val| val[0] = -val[0] } if color == :black
    @all_directions = directions
  end

  def update_directions
    @directions = @all_directions.select do |direction, _|
      case direction
      when :step
        can_step?
      when :dubstep
        can_dubstep?
      when :leftattack
        can_attack?(direction)
      when :rightattack
        can_attack?(direction)
      end
    end
  end

  def can_step?
      step_pos = shift_position(:step)
      board[step_pos].empty?
  end

  def can_dubstep?
    dubstep_pos = shift_position(:dubstep)
    can_step? && !moved && board[dubstep_pos].empty?
  end

  def can_attack?(direction)
    new_pos = shift_position(direction)
    return false unless board.on_board?(new_pos)
    board[new_pos].color == opposite_color
  end

  def shift_position(direction)
    position.map.with_index do |pos, idx|
      pos + all_directions[direction][idx]
    end
  end

  def moved=(val)
    @moved = val
    update_directions
  end

  def valid?(position)
    self.board.on_board?(position) && board[position].color != self.color
  end

  def moves
    update_directions
    moves = []
    directions.keys.each do |direction|
      new_position = shift_position(direction)
      moves << new_position if valid?(new_position)
    end
    moves
  end

  def to_s
    " \u265F "
  end
end
