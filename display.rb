require "colorize"
require 'io/console'

class Display
  attr_accessor :cursor, :selected

  def initialize(board)
    @board = board
    @cursor = [0, 0]
    @selected = nil
  end

  def render
    system("clear")
    puts "    A  B  C  D  E  F  G  H"
    @board.board.each_with_index do |row, row_index|
      print " #{row_index} "
      row.each_with_index do |piece, col_index|
        position = [row_index, col_index]
        background = checker_colors(*position)
        colored_piece = colorize_piece(piece, background)

        if @cursor == position
          colored_piece = colored_piece.colorize(:background => :yellow)
        elsif !@selected.nil? && @selected == position
          colored_piece = colored_piece.colorize(:background => :red)
        end
        print colored_piece
      end
      puts
    end
    nil
  end

  def colorize_piece(piece, background)
    piece.to_s.colorize(:background => background, :color => piece.color)
  end

  def checker_colors(row_index, col_index)
    (row_index + col_index).even? ? :light_blue : :light_green
  end

  def update_cursor(direction)
    case direction
    when :down
      cursor[0] = (cursor[0] + 1) % 8
    when :up
      cursor[0] = (cursor[0] - 1) % 8
    when :left
      cursor[1] = (cursor[1] - 1) % 8
    when :right
      cursor[1] = (cursor[1] + 1) % 8
    end
  end
end
