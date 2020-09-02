require_relative "./board.rb"
require_relative "./display.rb"
require_relative "./human_player.rb"

class Game
  SLEEP_TIME = 0.5

  def initialize
    @board = Board.new()
    @display = Display.new(@board)
    @white_player = HumanPlayer.new(:white, @display)
    @black_player = HumanPlayer.new(:black, @display)
    @current_player = @white_player
    @display.render
    play
  end

  def try_moving(input, move_input)
    begin
      res = @board.move_piece(input, move_input)
      if res
        @current_player = (@current_player == @white_player ? @black_player : @white_player)
      end
    rescue RuntimeError => e
      puts "Error: " + e.message
      sleep(SLEEP_TIME)
    end
  end

  def not_checkmates
    first_checkmate = !@board.checkmate?(@current_player.colour)
    second_checkmate = !@board.checkmate?(@current_player == @white_player ? @black_player : @white_player)
    first_checkmate || second_checkmate
  end

  def not_cursor_selected
    input = @current_player.make_move
    puts "You are in check." if @board.in_check?(@current_player.colour)
    puts "#{@current_player.colour.capitalize}: Moving piece from: " + input.to_s + " to new location: " if @display.cursor.selected
    return input
  end

  def processing_move_input(input, move_input)
    if !@display.cursor.selected
      if @board.grid[input[0]][input[1]].colour == @current_player.colour
        try_moving(input, move_input)
        @display.render
      else
        puts "It is #{@current_player.colour.capitalize}'s turn."
        sleep(SLEEP_TIME)
        @display.render
      end
    end
  end

  def play

    while not_checkmates
      if !@display.cursor.selected
        input = not_cursor_selected
      else
        move_input = @current_player.make_move
        puts "Moving piece from: " + input.to_s + " to new location: " + move_input.to_s
        processing_move_input(input, move_input)
      end
    end

    if @board.checkmate?(:white)
      puts "Checkmate, game over."
    end
  end
end

game = Game.new()