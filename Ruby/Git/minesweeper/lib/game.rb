require "./board"
require 'colorize'

class Game
    SLEEP_LENGTH = 1

    def initialize(size, bombs)
        @board = Board.new(size, bombs)
        play
    end

    def play
        while !(is_won || is_lost)
            @board.render
            puts "Please enter coordinates to guess (eg: 0,2): "
            get_guess
        end
        if is_lost
            puts "Game over, you hit a bomb."
        end
    end

    def get_guess
        input = gets.chomp
        if is_valid_input?(input)
            split_input = input.split(",")
            @board.grid[split_input[0].to_i][split_input[1].to_i].reveal
            @board.render
            sleep(SLEEP_LENGTH)
            return input
        else
            puts "Invalid input"
            sleep(SLEEP_LENGTH)
            return
        end
    end

    def is_valid_input?(input)
        split_input = input.split(",")
        if split_input.length == 2
            these_coordinates = [split_input[0].to_i, split_input[1].to_i]
            if @board.grid[0][0].is_valid_position?(these_coordinates)
                puts "Valid input"
                return true
            end
        end
        false
    end

    def is_won
        return false
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

game = Game.new(9, 5)
