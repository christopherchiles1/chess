require "colorize"
require 'io/console'

class Display
  attr_accessor :cursor

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
        background = (row_index + col_index).even? ? :light_blue : :light_green
        if @cursor == [row_index, col_index]
          print piece.to_s.colorize(:background => :yellow, :color => piece.color)
        else
          print piece.to_s.colorize(:background => background, :color => piece.color)
        end
      end
      puts
    end
    nil
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
