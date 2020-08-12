class Hangman
    DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

    def initialize
        @secret_word = Hangman.random_word()
        @guess_word = Array.new(@secret_word.length, "_")
        @attempted_chars = []
        @remaining_incorrect_guesses = 5
    end

    def self.random_word
        return DICTIONARY.sample
    end

    def guess_word
        @guess_word
    end

    def attempted_chars
        @attempted_chars
    end

    def remaining_incorrect_guesses
        @remaining_incorrect_guesses
    end

    def already_attempted?(char)
        attempted_chars.each do |attempted|
            if char == attempted
                return true
            end
        end
        return false
    end

    def get_matching_indices(char)
        array_of_found_chars = []
        @secret_word.each_char.with_index do |secret_char, idx|
            if (char == secret_char)
                array_of_found_chars.push(idx)
            end
        end
        array_of_found_chars
    end

    def fill_indices(char, array_of_indices)
        array_of_indices.each do |indice|
            @guess_word[indice] = char
        end
    end

    def try_guess(char)
        already_attempted = already_attempted?(char)
        if already_attempted
            p "that has already been attempted"
            return false
        else
            @attempted_chars << char
            get_matching = get_matching_indices(char)
            fill_indices(char, get_matching)
            if get_matching.length == 0
                @remaining_incorrect_guesses -= 1
            end
            return true
        end
    end

    def ask_user_for_guess
        p "Enter a char:"
        char_input = gets.chomp
        return try_guess(char_input)
    end

    def win?
        if @guess_word.join("") == @secret_word
            p "WIN"
            return true
        else
            return false
        end
    end

    def lose?
        if @remaining_incorrect_guesses == 0
            p "LOSE"
            return true
        else
            return false
        end
    end

    def game_over?
        if win? || lose?
            p @secret_word
            return true
        else
            return false
        end
    end
end