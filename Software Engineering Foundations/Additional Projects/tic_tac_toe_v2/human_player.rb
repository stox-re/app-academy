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

    def get_position
        puts "You are #{@my_mark}. Please enter a position like 0 0 :"
        prompt = gets.chomp
        if check_string_for_poor_chars(prompt)
            raise "Error: alphabetical characters in input"
        end
        this_position = [prompt.split(" ")[0].to_i, prompt.split(" ")[1].to_i]
        this_position
    end
end