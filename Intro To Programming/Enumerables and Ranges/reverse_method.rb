# array/string.reverse, evaluates to a new reverse version of the array OR string
# array/string.reverse!, reverses an array/string in place

arr = [
    1,
    2,
    3,
    4
]

print arr
puts
print arr.reverse
puts
print arr
puts
arr.reverse!
print arr
puts

str = "hello"
puts str.reverse
puts str
str.reverse!
puts str