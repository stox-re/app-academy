require_relative "./board.rb"

class Game
    SLEEP_LENGTH = 2

    def initialize(size)
        @board = Board.new(size)
        welcome_msg
        @guessed_pos = nil
        @previous_guess = nil
        @board.populate
        run
    end

    def welcome_msg
        puts `clear`
        puts "".ljust(20, "-") + " Memory Puzzle Game ".ljust(50, "-")
    end

    def set_guessed_pos(pos)
        if @guessed_pos == nil
            @guessed_pos = pos
        else
            @previous_guess = @guessed_pos
            @guessed_pos = pos
        end
    end

    def make_guess(pos)
        if @board.is_already_revealed(pos)
            puts "Invalid guess, you already revealed those."
            sleep(SLEEP_LENGTH)
            return
        end

        set_guessed_pos(pos)

        if @previous_guess == pos
            puts "Invalid guess, you already just guessed that."
            sleep(SLEEP_LENGTH)
            return
        end

        reveal_result = @board.reveal(@guessed_pos)
        if reveal_result == @board.value_of_card(@previous_guess)
            found_match
        elsif @previous_guess != nil
            previous_guesses_dont_match
        end
    end

    def found_match
        puts "Found Match."
        reset_guesses
        @board.render(true)
    end

    def previous_guesses_dont_match
        @board.reveal(@guessed_pos)
        @board.render(true)
        p "Guesses don't match."
        sleep(SLEEP_LENGTH)
        @board.flip_down(@guessed_pos)
        @board.flip_down(@previous_guess)
        reset_guesses
    end

    def reset_guesses
        @guessed_pos = nil
        @previous_guess = nil
    end

    def run
        won = false
        first_run = true

        while !won
            if first_run
                @board.render(false)
                first_run = false
            else
                @board.render(true)
            end

            prompted = prompt
            if prompted != nil
                make_guess(prompted)
            end

            if @board.is_board_finished
                puts "You won! Game over."
                won = true
            end
        end
    end

    def is_valid_prompt?(input)
        if input.length == 2

            if input[0].to_i > @board.size - 1 || input[1].to_i > @board.size - 1
                puts "Invalid, out of range."
            elsif input[0].to_i < 0 || input[1].to_i < 0
                puts "Invalid, out of range"
            else
                return [input[0].to_i, input[1].to_i]
            end

        else
            puts "Input was invalid."
        end
        sleep(SLEEP_LENGTH)
        nil
    end

    def prompt
        puts "Please enter the position of the card you want to flip (eg: 1,2): "
        input = gets.chomp.split(",")
        return is_valid_prompt?(input)
    end
end

game = Game.new(4)