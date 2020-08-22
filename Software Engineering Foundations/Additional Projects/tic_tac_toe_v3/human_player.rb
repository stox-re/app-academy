class HumanPlayer
    attr_reader :my_mark
    def initialize(mark_value)
        @my_mark = mark_value
    end

    def check_string_for_poor_chars(string)
        alphabet = "abcdefghijklmnopqrstuvwxyz,-)(*&^%$#@!`)./\\"
        count_spaces = 0
        string.each_char do |check|
            if alphabet.include?(check)
                return true
            elsif check == " "
                count_spaces += 1
            end
            return true if count_spaces > 1
        end
        false
    end

    def get_position(legal_positions)
        invalid_position = true
        while invalid_position
            puts "You are #{@my_mark}. Please enter a position like 0 0 :"
            prompt = gets.chomp
            this_position = [prompt.split(" ")[0].to_i, prompt.split(" ")[1].to_i]
            if check_string_for_poor_chars(prompt)
                raise "Error: alphabetical characters in input"
            end
            if legal_positions.index(this_position) != nil
                invalid_position = false
            else
                puts "Invalid position. Try again."
            end
        end

        this_position
    end
end