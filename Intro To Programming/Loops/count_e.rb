# Write a method count_e(word) that takes in a string word 
# and returns the number of e's in the word

def count_e(word)
    
    countingE = 0
    i = 0
    
    while i < word.length
       
        if word[i] == "e"
            countingE += 1
        end

        i += 1
    end

    return countingE

end

puts count_e("movie")
puts count_e("excellent")