class ComputerPlayer
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
        this_position = legal_positions.sample
        puts "Computer #{@my_mark} played #{this_position}"
        this_position
    end
end