require_relative "./cursor.rb"
require "colorize"

# Handles rendering logic
class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    render
    test_play
  end

  def test_play
    while !@cursor.selected
      input = @cursor.get_input
      p "Got input: " + input.to_s
      render
    end
  end

  def render
    #puts `clear`
    is_black = false
    @board.grid.each_with_index do |sub_array, sub_index|
      is_black = !is_black
      sub_array.each_with_index do |ele, index|
        background_color = :light_black
        if [sub_index, index] == @cursor.cursor_pos
          background_color = :cyan
        end
        if ele.class == NullPiece
          if is_black
            print " ".colorize(:background => background_color) + " "
          else
            if background_color == :light_black
              background_color = :default
            end
            print " ".colorize(:background => background_color) + " "
          end
        else
          if is_black
            print ele.to_s.colorize(:background => background_color) + " "
          else
            if background_color == :light_black
              background_color = :default
            end
            print ele.to_s.colorize(:background => background_color) + " "
          end
        end
        is_black = !is_black
      end
      print "\n"
    end
  end
end