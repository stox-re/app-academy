require 'colorize'
require_relative "./tile.rb"
require_relative "./board.rb"

class Game
    SLEEP_LENGTH = 1
    def initialize
        @load_grid = Board.from_file
        @board = Board.new(@load_grid)
        play
    end

    def play
        @board.render

        while !@board.solved?
            current_prompt = prompt

            if current_prompt
                @board.[]=([current_prompt[0], current_prompt[1]], current_prompt[2])
            end

            sleep(SLEEP_LENGTH)
            @board.render
        end

        puts "You won! Game over."
    end

    def valid_input?(input)
        split_input = input.split(",")
        return false if split_input.length != 2

        split_again = split_input[1].split(" ")
        concated_input = [split_input[0].to_i, split_again[0].to_i, split_again[1].to_i]

        return false if concated_input.length != 3

        concated_input.each do |ele|
            return false if (ele.is_a? Integer) == false
            return false if (ele > @board.grid[0].length - 1)
        end

        return concated_input
    end

    def prompt
        puts "Please enter a position and value (eg: 0,1 6)"
        input = gets.chomp
        input_valid_result = valid_input?(input)

        if input_valid_result
            return input_valid_result
        else
            puts "Invalid input."
            return false
        end
    end
end

game = Game.new()