require_relative "./board.rb"
require_relative "./display.rb"

class Game
  def initialize
    @board = Board.new()
    @display = Display.new(@board)
    @current_colour = :white
    play
  end

  def play

    while !@board.checkmate?(@current_colour)
      if !@display.cursor.selected
        input = @display.cursor.get_input
        @display.render
        puts "You are in check." if @board.in_check?(@current_colour)
        puts "Moving piece from: " + input.to_s + " to new location: " if @display.cursor.selected
      else
        move_input = @display.cursor.get_input
        @display.render
        puts "Moving piece from: " + input.to_s + " to new location: " + move_input.to_s
        if !@display.cursor.selected
          @board.move_piece(input, move_input)
          @display.render
        end
      end
    end

    if @board.checkmate?(:white)
      puts "Checkmate, game over."
    end
  end
end

game = Game.new()