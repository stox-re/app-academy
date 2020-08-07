# Data Structure - Hashes
# key => value  pairs

dog = {
    "name" => "Fido",
    "colour" => "black",
    "age" => 3,
    "isHungry" => true,
    "enemies" => ["squirrel"]
}

dog["location"] = "NY"
dog["enemies"].push("cat")
p dog

# Check if key exists or value exists
puts dog.has_key?("colour")
puts dog.has_value?(4)

# Just Keys
p dog.keys

puts "------------------------------------"
# Hash enumerables
pizza = {
    "style" => "New York",
    "slices" => 8,
    "diameter" => "15 inches",
    "toppings" => ["mushrooms", "green peppers"],
    "isTasty" => true
}

pizza.each do |key, value|
    puts key + " " + value.to_s
end

pizza.each_key do |key|
    puts key
end

pizza.each_value do |value|
    puts value
end

puts "------------------------------------"

# Nil
puts pizza["something not there"] == nil

# Making a new hash declaration, and default value
newHash = Hash.new(0)
puts newHash["something"]

puts "------------------------------------"
# counter hash - sort by

str = "mississippi river"
count = Hash.new(0)

str.each_char do |char|
    count[char] += 1
end

p count
p count.sort_by { |k, v| v }

# Hash with select to select specific items in the hash and return a hash
def dupe_indices(array)
    indices = Hash.new { |hash, key| hash[key] = [] }
    for i in 0...array.length do
        indices[array[i]] << i
    end
    indices.select { |element, value_array| value_array.length > 1}
end

p dupe_indices(["a", "a", "c", "c", "b", "c"])