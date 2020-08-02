# Write a method opposite_count that takes in an array of unique numbers.
# The method should return the number of pairs of elements that sum to 0.

def opposite_count(nums)
    
    #first get all pairs
    nestedArray = combinations(nums)
    
    #Loop through the nested arrays and check if combinations equal 0
    countSumZeros = 0

    nestedArray.each do |subCombination|
        if subCombination[0] + subCombination[1] == 0
            countSumZeros += 1
        end
    end
    
    return countSumZeros
end


def combinations(arr)

    nestedArray = []
    
    arr.each_with_index do |ele1, idx1|
        arr.each_with_index do |ele2, idx2|
            if (idx2 > idx1)
                nestedArray.push([ele1, ele2])
            end
        end
    end
    
    return nestedArray

end


puts opposite_count([ 2, 5, 11, -5, -2, 7 ]) # => 2
puts opposite_count([ 21, -23, 24 -12, 23 ]) # => 1