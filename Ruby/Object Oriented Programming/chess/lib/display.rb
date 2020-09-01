require_relative "./cursor.rb"
require "colorize"

# Handles rendering logic
class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @current_colour = :white
    render
    test_play
  end

  def test_play
    while !@cursor.selected && !@board.checkmate?(:white)
      input = @cursor.get_input
      p "In checkmate? : " + @board.checkmate?(:white).to_s
      sleep(1)
      render
    end
    if @board.checkmate?(:white)
      puts "Checkmate, game over."
    end
  end

  def print_letters
    abc = "abcdefgh"
    print "  "
    8.times do |i|
      print abc[i].colorize(:blue) + " "
    end
    print "\n"
  end

  def render
    puts `clear`
    p "Is in check? " + @board.in_check?(:white).to_s
    puts "You are in check." if @board.in_check?(@current_colour)
    decreasing_print = [8, 7, 6, 5, 4, 3, 2, 1]
    is_black = true
    print_letters

    @board.grid.each_with_index do |sub_array, sub_index|
      print (decreasing_print[sub_index].to_s).colorize(:blue) + " "
      is_black = !is_black

      sub_array.each_with_index do |ele, index|
        background_color = :light_black
        if [sub_index, index] == @cursor.cursor_pos
          background_color = :cyan
        end
        if ele.class == NullPiece
          render_null(is_black, background_color)
        else
          render_piece(is_black, background_color, ele)
        end
        is_black = !is_black
      end

      print "\n"
    end
  end

  def render_piece(is_black, background_color, ele)
    if is_black
      print ele.to_s.colorize(:background => background_color) + " "
    else
      if background_color == :light_black
        background_color = :default
      end
      print ele.to_s.colorize(:background => background_color) + " "
    end
  end

  def render_null(is_black, background_color)
    if is_black
      print " ".colorize(:background => background_color) + " "
    else
      if background_color == :light_black
        background_color = :default
      end
      print " ".colorize(:background => background_color) + " "
    end
  end
end