# Split and Join
# string.split(" ") evaluates to an array, can only be used on a string
# array.join evaluates to a string, used on an array

str = "Follow the yellow brick road"

words = str.split(" ")
puts str[2]
print words
puts

arr = [
    "hello",
    "world",
    "how",
    "are",
    "you"
]

print arr.join("")
puts
print arr.join(" ")

str = "follow the yellow brick road"
print str.split("l").join("Z") # Basically replacing all the l's with Z