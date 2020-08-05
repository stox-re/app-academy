def hipsterfy(string)
    vowels = "aeiou"
    for i in (string.length-1).downto(0)
        if vowels.include?(string[i])
            return string[0...i] + string[i+1..-1]
        end
    end
    return string[0..-1]
end

def vowel_counts(string)
    hash = Hash.new(0)
    vowels = "aeiou"
    string.downcase.each_char do |char|
        if vowels.include?(char)
            hash[char] += 1
        end
    end
    hash
end

def caesar_cipher(message, n)

    alphabet = "abcdefghijklmnopqrstuvwxyz"
    result_string = []
    split_string = message.split("")

    split_string.each do |char|
        if alphabet.include?(char)
            index_of_char = alphabet.index(char)
            new_char = alphabet[index_of_char+n]
            if index_of_char + n > alphabet.length-1
                new_char = alphabet[index_of_char - alphabet.length + (n % alphabet.length)]
            end
            result_string.push(new_char)
        else
            result_string.push(char)
        end
    end

    return result_string.join("")

end