# Write a method select_long_words(words) that takes in an array of words 
# and returns a new array containing all of the words of the original 
# array that are longer than 4 characters.

def select_long_words(words)

    longArray = []
    i = 0

    while i < words.length

        if (words[i].length > 4)
            longArray << words[i]
        end

        i += 1

    end

    return longArray

end

print select_long_words(["what", "are", "we", "eating", "for", "dinner"]) # => ["eating", "dinner"]
puts
print select_long_words(["keep", "coding"])                               # => ["coding"]
