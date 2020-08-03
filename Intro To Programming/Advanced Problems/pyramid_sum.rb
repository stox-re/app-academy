# Write a method pyramid_sum that takes in an array of numbers
# representing the base of a pyramid. The function should return a 2D array
# representing a complete pyramid with the given base. To construct a level of the pyramid,
# we take the sum of adjacent elements of the level below.

# For example, the base [1, 4, 6] gives us the following pyramid
#     15
#   5   10
# 1   4    6

def pyramid_sum(base)

    resulting_array = []
    resulting_array.push(base)

    for i in 1...base.length do
        next_array_to_get_adj = resulting_array[i-1]
        adj_array = adjacent_sum(next_array_to_get_adj)
        resulting_array.push(adj_array)
    end

    return resulting_array.reverse

end

def adjacent_sum(arr)

    result_array = []

    for i in 0...arr.length-1 do
        result_array.push(arr[i]+arr[i+1])
    end

    return result_array

end

p pyramid_sum([1, 4, 6]) #=> [[15], [5, 10], [1, 4, 6]]
puts

p pyramid_sum([3, 7, 2, 11]) #=> [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
puts