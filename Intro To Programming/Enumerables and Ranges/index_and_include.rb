# Array/string.index(ele) - evaluates to the index where ele is found
# array/string.include?(ele) - evaluates to a boolean indicating if ele is found

arr = [
    "SF",
    "NY", 
    "LA"
]
puts arr.index("LA")
puts arr.index("NJ")

puts arr.include?("NJ")
puts arr.include?("NY")

str = "hello"
puts "Check string"
puts str.include?("e")
puts str.include?("f")
puts str.index("ello")
puts str.index("l") # Shows the first index
