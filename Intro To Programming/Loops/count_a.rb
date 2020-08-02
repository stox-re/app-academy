# Write a method count_a(word) that takes in a string word 
# and returns the number of a's in the word. 
# The method should count both lowercase (a) and uppercase (A)


def count_a(word)

    countA = 0
    i = 0
    
    while i < word.length
        
        if word[i] == "a" || word[i] == "A"
            countA += 1
        end

        i += 1
    end
    
    return countA

end


puts count_a("application")  # => 2
puts count_a("bike")         # => 0
puts count_a("Arthur")       # => 1
puts count_a("Aardvark")     # => 3