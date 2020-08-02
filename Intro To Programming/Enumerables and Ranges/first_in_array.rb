# Write a method first_in_array that takes in an array and two elements, 
# the method should return the element that appears earlier in the array.

def first_in_array(array, el1, el2)

    array.each do |item|
    
        if (el1 == item || el2 == item)
            return item
        end

    end

end

puts first_in_array(["a", "b", "c", "d"], "d", "b"); # => "b"
puts first_in_array(["cat", "bird" ,"dog", "mouse" ], "dog", "mouse"); # => "dog"