require "./player.rb"

class Game
    attr_reader :players
    @@is_loaded = false

    def initialize(players_array)
        puts "".ljust(18,"-") + " Welcome to the Ghost Game ".ljust(50, "-")
        @fragment = ""
        @dictionary = {}
        @players = []
        @losses = {}

        players_array.each do |player|
            @players << Player.new(player)
        end

        @players.each do |player_to_hash|
            @losses[player_to_hash.name] = -1
        end

        @current_player = @players[0]
        @previous_player = @players[1]

        if !@@is_loaded
            @dictionary = load_dictionary
            puts "".ljust(22,"-") + " Dictionary Loaded ".ljust(46, "-")
            is_loaded = true
        end

        play_round
    end

    def valid_play?(letter, new_fragment)
        alphabet = "abcdefghijklmnopqrstuvwxyz"

        if letter.length == 1
            if alphabet.include?(letter)
                if valid_in_dictionary(new_fragment)
                    return true
                else
                    p "Invalid: Sorry, this letter is an invalid guess."
                end
            end
        else
            puts "Invalid, please enter only 1 letter."
        end
        return false
    end

    def next_player!
        @current_player, @previous_player = @previous_player, @current_player
    end

    def take_turn
        is_valid = false

        while !is_valid
            this_guess = @current_player.guess
            new_fragment = @fragment + this_guess

            if valid_play?(this_guess, new_fragment)
                @fragment = new_fragment
                print_current_fragment
                is_valid = true
                return true
            end
        end
    end

    def print_current_fragment
        puts "".ljust(20,"-") + " Currently: #{@fragment} ".ljust(48, "-")
    end

    def valid_in_dictionary(fragment_to_check)
        @dictionary.keys.any? do |k|
            k.start_with?(fragment_to_check)
        end
    end

    def check_is_won
        @dictionary.has_key?(@fragment)
    end

    def play_round
        game_over = false

        while !game_over
            take_turn
            if !check_is_won
                next_player!
            else
                print_winning
                current_lost = update_losses
                if current_lost[0]
                    puts "".ljust(20,"-") + " #{current_lost[1]} loses the game! ".ljust(48, "-")
                    game_over = true
                else
                    "".ljust(20,"-") + " Onto the next round ".ljust(48, "-")
                    next_player!
                    @fragment = ""
                end
            end
        end
    end

    def update_losses
        ghost = "GHOST"
        @losses[@previous_player.name] += 1
        @losses.each do |key, value|
            ghost_builder = []
            if value >= 0
                (0..value).each do |i|
                    ghost_builder << ghost[i]
                end
                puts "".ljust(15,"-") + " #{key} is spelling: #{ghost_builder.join("")} ".ljust(53, "-")
                return [true, key] if value == ghost.length - 1
            end
        end
        return [false, false]
    end

    def print_winning
        puts "".ljust(20,"-") + " The word was: #{@fragment} ".ljust(48, "-")
        puts "".ljust(20,"-") + " #{@current_player.name.to_s} wins! ".ljust(48, "-")
    end

    def load_dictionary
        word_hash = {}

        File.foreach("./dictionary.txt") do |line|
            word_hash[line.chomp] = 0
        end
        word_hash
    end
end

game = Game.new(["Charlie", "Kathleen"])