require 'byebug'
module Steppable

  def moves
    moves = []

    directions.keys.each do |direction|
      new_position = shift_position(position, direction)
      moves << new_position if valid?(new_position)
    end

    moves
  end

  def valid?(position)
    self.board.on_board?(position) && board[position].color != self.color
  end

  def shift_position(position, direction)
    position.map.with_index do |pos, idx|
      pos + directions[direction][idx]
    end
  end
end
