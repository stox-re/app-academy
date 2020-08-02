# Write a method select_odds(numbers) that takes in an array of numbers 
# and returns a new array containing the odd numbers of the original array.

def select_odds(numbers)

    oddArray = []
    i = 0

    while (i < numbers.length)
    
        if (numbers[i] % 2 != 0)
            oddArray << numbers[i]
        end

        i += 1

    end

    return oddArray

end

print select_odds([13, 4, 3, 7, 6, 11]) # => [13, 3, 7, 11]
puts
print select_odds([2, 4, 6])            # => []
