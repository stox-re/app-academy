# The fibonacci sequence is a sequence of numbers whose first and second elements are 1.
# To generate further elements of the sequence we take the sum of the previous two elements.
# For example the first 6 fibonacci numbers are 1, 1, 2, 3, 5, 8.
# Write a method fibonacci that takes in a number length and returns the fibonacci
# sequence up to the given length.

def fibonacci(length)

    fib_array = []

    for i in 1..length do
        if fib_array.length < 2
            fib_array.push(1)
        elsif
            addUp = fib_array[i-2] + fib_array[i-3]
            fib_array.push(addUp)
        end
    end

    return fib_array

end

print fibonacci(0) # => []
puts
print fibonacci(1) # => [1]
puts
print fibonacci(6) # => [1, 1, 2, 3, 5, 8]
puts
print fibonacci(8) # => [1, 1, 2, 3, 5, 8, 13, 21]
puts