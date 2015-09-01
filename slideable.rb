module Slideable

  def moves
    directions.keys.inject([]) do |moves, direction|
      new_position = shift_position(position, direction)
      moves + step(new_position, direction)
    end
  end

  def step(position, direction)
    return [] unless self.board.on_board?(position)
    return [] if board[position].color == self.color
    return [position] unless board[position].empty?
    new_position = shift_position(position, direction)
    [position] + step(new_position, direction)
  end

  def shift_position(position, direction)
    position.map.with_index do |pos, idx|
      pos + directions[direction][idx]
    end
  end
end
