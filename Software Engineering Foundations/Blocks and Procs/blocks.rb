# Blocks
# Blocks are chunks of code that is passed into a method to be executed

# Single line blocks
[1,2,3].map { |num| -(num * 2) } # => [-2, -4, -6]

# Multi line blocks with do end
[1,2,3].map do |num|
    doubled = num * 2
    -doubled
  end     # => [-2, -4, -6]

# Map takes each item of an array, executes the block on each item
# then returns an array containing the new elements after the block execution

# Correct:
def double_eles(arr)
    arr.map do |ele|
        ele * 2
    end
end
double_eles([1,2,3]) #=> [2,4,6]

# Incorrect: No return statement in blocks.
def double_eles(arr)
    arr.map do |ele|
        return ele * 2
    end
end
double_eles([1,2,3]) #=> 2

# Using methods as blocks, single methods
["a", "b", "c"].map { |str| str.upcase }  #=> ["A", "B", "C"]
[1, 2, 5].select { |num| num.odd? }       #=> [1, 5]
# Shortform to do single methods in a block
["a", "b", "c"].map(&:upcase) #=> ["A", "B", "C"]
[1, 2, 5].select(&:odd?)      #=> [1, 5]