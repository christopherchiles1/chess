class HumanPlayer
  def initialize(name)
    @name = name
  end

  def get_move
    get_user_input
  end


  private

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
        :return
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
