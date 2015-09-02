class HumanPlayer
  attr_accessor :display, :from_pos, :to_pos, :name

  def initialize(name)
    @name = name
    @from_pos, @to_pos = nil, nil
  end

  def get_move
    until move_made?
      input = get_user_input

      select_piece if input == :return
      move_cursor(input) if arrow_key?(input)
      save if saved?
    end

    move = [from_pos, to_pos]
    self.from_pos, self.to_pos = nil, nil
    move
  end

  def move_made?
    from_pos && to_pos
  end


  private

  def save
  end

  def arrow_key?(input)
    [:up, :down, :left, :right].include?(input)
  end

  def saved?
    false
  end

  def move_cursor(input)
    display.update_cursor(input)
    display.render
  end

  def select_piece
    if self.from_pos.nil?
      self.from_pos = display.cursor.dup
      display.selected = from_pos
    else
      self.to_pos = display.cursor.dup
      display.selected = nil
    end
    display.render
  end

  def read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end

  ensure
    STDIN.echo = true
    STDIN.cooked!

    return input
  end

  def get_user_input
    c = nil

    until c
      c = read_char

      case c
      when "\r"
        return :return
      when "\e[A"
        return :up
      when "\e[B"
        return :down
      when "\e[C"
        return :right
      when "\e[D"
        return :left
      when "\u0003"
        puts "Exit"
        exit 0
      end
    end
  end
end
