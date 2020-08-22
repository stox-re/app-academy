# Arrays

letters = [
    "a",
    "b",
    "c"
]

p letters

# Shovel command <<

names = [
    "Maurice",
    "Mashu",
    "Kurstie"
]

p names

names << "Brian"

p names

# Iterating through an array

foods = [
    "pizza",
    "sushi",
    "burgers",
    "fries",
    "ramen"
]

def printArray(arr)

    i = 0

    while i < arr.length

        puts arr[i]
        i += 1

    end

end

printArray(foods)


# Pushing a new array inside an array with values of nil

find_largest_length.times do |i|
    new_2d_array.push(Array.new(arrays.length, nil))
end