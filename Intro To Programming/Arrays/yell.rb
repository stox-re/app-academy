# Write a method yell(words) that takes in an array of words and returns a
# new array where every word from the original array has an exclamation point after it.

def yell(words)

    yellArray = []
    i = 0
    
    while i < words.length
        
        yellArray << words[i] + "!"
        i += 1

    end

    return yellArray

end

print yell(["hello", "world"]) # => ["hello!", "world!"]
puts
print yell(["code", "is", "cool"]) # => ["code!", "is!", "cool!"]