# Write a method vowel_cipher that takes in a string
# and returns a new string where every vowel becomes the next vowel in the alphabet.

def vowel_cipher(string)

    vowels = "aeiou"
    new_string_builder = ""

    string.each_char do |char|

        if (vowels.include?(char))

            location_of_char = vowels.index(char)
            new_location = location_of_char + 1

            if (new_location > vowels.length-1)
                new_location = new_location - vowels.length
            end

            new_string_builder += vowels[new_location]

        elsif
            new_string_builder += char
        end

    end

    return new_string_builder

end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap