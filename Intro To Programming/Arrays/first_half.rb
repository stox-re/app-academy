# Write a method first_half(array) that takes in an array and returns a new array 
# containing the first half of the elements in the array. 
# If there is an odd number of elements, return the first half including the middle element.

def first_half(array)

    halfArray = []
    i = 0
    endElement = 0
    
    if array.length % 2 == 0
        endElement = (array.length / 2) - 1
    else 
        endElement = (array.length - 1) / 2
    end

    while i <= endElement

        halfArray << array[i]
        i += 1

    end

    return halfArray

end

print first_half(["Brian", "Abby", "David", "Ommi"]) # => ["Brian", "Abby"]
puts
print first_half(["a", "b", "c", "d", "e"])          # => ["a", "b", "c"]

# Simpler version

def first_half_better(array)

    halfArray = []
    i = 0

    while i < array.length / 2.0
        
        halfArray << array[i]
        i += 1

    end

    return halfArray

end

puts
print first_half_better(["Brian", "Abby", "David", "Ommi"]) # => ["Brian", "Abby"]
puts
print first_half_better(["a", "b", "c", "d", "e"])          # => ["a", "b", "c"]
