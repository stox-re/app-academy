# Time complexity O(n^2)
def my_min_long(array)
  array.each do |item|
    if array.all? { |number| item <= number }
      return item
    end
  end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_long(list)  # =>  -5

# Time complexity O(n)
def my_min(array)
  smallest = array[0]
  array.each do |item|
    if item < smallest
      smallest = item
    end
  end
  smallest
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

def largest_contiguous_subsum(array)
  array_of_combinations = []
  array.each_with_index do |item, index|
    array.each_with_index do |item_next, index_next|
      if index_next > index
        array_of_combinations << array[index..index + index_next]
      end
    end
  end

  largest = array_of_combinations[0].sum
  array_of_combinations.each do |combination|
    if combination.sum > largest
      largest = combination.sum
    end
  end

  largest
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8
# Time complexity: O(n^2 + n), so just O(n^2)