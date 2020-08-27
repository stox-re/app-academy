require "./board"
require 'colorize'

# Class for launching minesweeper. It plays until the game is won or lost.
class Game
    SLEEP_LENGTH = 1

    def initialize(size, bombs)
        @size = size
        @bombs = bombs
        @board = Board.new(size, bombs)
        play
    end

    def play
        start_time = Time.now

        while !(is_won || is_lost)
            @board.render
            puts "Please enter coordinates to guess (eg: 0,2): "
            get_guess
        end

        end_time = Time.now

        if is_lost
            puts "Game over, you hit a bomb. It took you: " + (end_time - start_time).to_s + " s."
        elsif is_won
            puts "You won! It took you: " + (end_time - start_time).to_s + " s."
        end
    end

    def get_guess
        input = gets.chomp

        if is_valid_input?(input)
            split_input = input.split(",")
            @board.grid[split_input[0].to_i][split_input[1].to_i].reveal
            @board.render
        else
            puts "Invalid input"
            sleep(SLEEP_LENGTH)
        end
    end

    def is_valid_input?(input)
        split_input = input.split(",")

        if split_input.length == 2
            these_coordinates = [split_input[0].to_i, split_input[1].to_i]

            if @board.grid[0][0].is_valid_position?(these_coordinates)
                return true
            end
        end

        false
    end

    def is_won
        revealed_count = 0

        @board.grid.each do |sub_array|
            sub_array.each do |tile|
                revealed_count += 1 if tile.revealed
            end
        end

        return revealed_count == ((@size * @size) - @bombs)
    end

    def is_lost
        @board.grid.each do |sub_array|
            sub_array.each do |tile|
                return true if tile.revealed && tile.is_bomb
            end
        end

        false
    end
end

game = Game.new(9, 9)
