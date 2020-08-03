# Write a method same_char_collapse that takes in a string
# and returns a collapsed version of the string. To collapse the string,
# we repeatedly delete 2 adjacent characters that are the same until there
# are no such adjacent characters. If there are multiple pairs that can be collapsed,
# delete the leftmost pair. For example, we take the following
# steps to collapse "zzzxaaxy": zzzxaaxy -> zxaaxy -> zxxy -> zy

def same_char_collapse(str)
    new_string = str
    str.each_char do |char|
        new_string = collapse_word(new_string)
    end
    return new_string
end

def collapse_word(word)
    word.each_char.with_index do |char, idx|
        if char == word[idx+1]
            if (idx == 0)
                return word[idx+2..-1]
            else
                return word[0..idx-1] + word[idx+2..-1]
            end
        end
    end
end

p same_char_collapse("zzzxaaxy")   #=> "zy"
# because zzzxaaxy -> zxaaxy -> zxxy -> zy


p same_char_collapse("uqrssrqvtt") #=> "uv"
# because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv