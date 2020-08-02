# Write a method frequent_letters that takes in a string
# and returns an array containing the characters that appeared more than twice in the string.

def frequent_letters(string)

    countArray = []
    elementHash = element_count(string.split(""))

    elementHash.each do |key, value|

        if (value > 2)
            countArray.push(key)
        end

    end

    return countArray

end

def element_count(arr)

    newHash = Hash.new(0)

    for i in 0...arr.length do
        newHash[arr[i]] += 1
    end

    return newHash

end

p frequent_letters('mississippi') #=> ["i", "s"]

p frequent_letters('bootcamp') #=> []