# Write a method, count_vowels(word), that takes in a string word 
# and returns the number of vowels in the word. Vowels are the letters a, e, i, o, u.

def count_vowels(word)
    
    vowelCount = 0
    i=0
    
    while i < word.length
        
        char = word[i]

        if (char == "a" || char == "e" || char == "i" || char == "o" || char == "u")
            vowelCount += 1
        end

        i += 1
    end

    return vowelCount

end

puts count_vowels("bootcamp")  # => 3
puts count_vowels("apple")     # => 2
puts count_vowels("pizza")     # => 2