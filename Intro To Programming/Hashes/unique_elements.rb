# Write a method unique_elements that takes in an array
# and returns a new array where all duplicate elements are removed. Solve this using a hash.

# Hint: all keys of a hash are automatically unique

def unique_elements(arr)

    newHash = {}
    finalArray = []

    for i in 0...arr.length do
        newHash[arr[i]] = 0
    end

    return hash.keys

end

p unique_elements(['a', 'b', 'a', 'a', 'b', 'c']) #=> ["a", "b", "c"]