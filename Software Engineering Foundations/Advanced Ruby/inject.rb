# Inject calls on an array

# This will give the sum of all elements in the array.
# Acc is accumulator, and el is the current element
[11, 7, 2, 4].inject { |acc, el| acc + el }

# This would get the product of the whole array
p [11, 7, 2, 4].inject { |acc, el| acc * el } # => 616


# This would return the minimum value of the array
p [11, 7, 2, 4].inject do |acc, el|
    if el < acc
        el
    else
        acc
    end
end # => 2

# It is also possible to inject a value
[11, 7, 2, 4].inject(100) { |acc, el| acc + el }

# This sums all even numbers of an array
[11, 7, 2, 4].inject(0) do |acc, el|
    if el.even?
        acc + el
    else
        acc
    end
end # => 6