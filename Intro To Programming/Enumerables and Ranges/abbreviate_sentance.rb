# Write a method abbreviate_sentence that takes in a sentence string
# and returns a new sentence where every word longer than 4 characters 
# has all of it's vowels removed.

def abbreviate_sentence(sentance)
    
    newSentance = []
    splitSentance = sentance.split(" ")

    splitSentance.each do |word| 

        if (word.length > 4)
            newSentance.push(abbreviate_word(word))
        else
            newSentance.push(word)
        end

    end

    return newSentance.join(" ")

end


def abbreviate_word(word)
    
    wordWithoutVowels = ""

    word.each_char do |letter|

        if letter == "a" || letter =="e" || letter == "i" || letter == "o" || letter == "u"
        else
            wordWithoutVowels += letter
        end

    end

    return wordWithoutVowels
        
end


puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"