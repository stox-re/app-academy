# Write a method greatest_factor_array that takes in an array of numbers
# and returns a new array where every even number is replaced with it's greatest factor.
# A greatest factor is the largest number that divides another with no remainder.
# For example the greatest factor of 16 is 8. (For the purpose of this problem we won't say the greatest factor of 16 is 16, because that would be too easy, ha)

def greatest_factor_array(arr)

    result_array = []

    arr.each do |num|

        factor_array = get_factor_array(num)
        largest_factor = 0

        factor_array.each do |factor|
            if factor_array.length == 1
                largest_factor = factor
            elsif factor > largest_factor && factor != num
                largest_factor = factor
            end
        end

        result_array.push(largest_factor)

    end

    return result_array

end

def get_factor_array(num)

    factor_array = []

    for i in 2..num do
        if (num % i == 0)
            factor_array.push(i)
        end
    end

    return factor_array

end

p greatest_factor_array([16, 7, 9, 14]) # => [8, 7, 3, 7]
p greatest_factor_array([30, 3, 24, 21, 10]) # => [15, 3, 12, 7, 5]

