# Write a method caesar_cipher that takes in a string and a number.
# The method should return a new string where every character of the original
# is shifted num characters in the alphabet.

# Feel free to use this variable:
# alphabet = "abcdefghijklmnopqrstuvwxyz"

def caesar_cipher(str, num)

    alphabet = "abcdefghijklmnopqrstuvwxyz"
    split_string = str.split("")

    final_array = split_string.map.with_index do |char, idx|

        find_char_in_alpha = alphabet.index(char)
        resulting_shift = find_char_in_alpha + num

        if (resulting_shift > alphabet.length-1)
            resulting_shift = resulting_shift - alphabet.length
        end

        alphabet[resulting_shift]

    end

    return final_array.join("")

end

puts caesar_cipher("apple", 1)    #=> "bqqmf"
puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
puts caesar_cipher("zebrayx", 4)    #=> "difve"