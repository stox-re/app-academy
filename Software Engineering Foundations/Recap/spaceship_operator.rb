# Spaceship operator <=>

# The spaceship operator <=> is used between two values and will return -1, 0, or 1. The behavior is as follows:

# given the expression a <=> b
# it will return -1 if a is less than b
# it will return 0 if a is equal to b
# it will return 1 if a is greater than b

p 7 <=> 2     # => 1
p 7 <=> 7     # => 0
p 2 <=> 7     # => -1
p 10 <=> 2    # => 1
p -5 <=> 10   # => -1
p -3 <=> -9   # => 1

def compare(a, b)
    if (a <=> b) == -1
        p "A is less than B"
    elsif (a <=> b) == 1
        p "A is bigger than B"
    else
        p "A is equal to B"
    end
end

compare(3, 5)

# Bubble sort with spaceship

def bubble_sort(array, &prc)
    sorted = false
    while !sorted
        sorted = true
        (0...array.length-1).each do |i|
            if prc.call(array[i], array[i+1]) == 1
                array[i], array[i+1] = array[i+1], array[i]
                sorted = false
            end
        end
    end
    array
end

p bubble_sort([6, 8, -5, 9, 0, 8, 3, 2]) { |a, b| a <=> b }

p (bubble_sort(["z", "y", "b", "x", "m"]) do |a, b|
    alpha = ("a".."z").to_a
    alpha.index(a) <=> alpha.index(b)
end)