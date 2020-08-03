# Write a method that takes in a string and returns the number of times
# that the same letter repeats twice in a row.

def double_letter_count(string)

    count = 0

    string.each_char.with_index do |char, idx|
        if (char == string[idx+1])
            count += 1
        end
    end

    return count

end

p double_letter_count("the jeep rolled down the hill") #=> 3
p double_letter_count("bootcamp") #=> 1