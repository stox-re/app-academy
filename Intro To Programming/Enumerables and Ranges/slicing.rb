# Array and String Slicing
# array[startId..endId] - grabs element from startId to endId including the element at endId
# array[startId...endId] - grabs element from startId to endId excluding the element at endId

arr = [
    "a",
    "b",
    "c",
    "d",
    "e"
]

print arr[1...3]
puts
print arr[1..3]
puts

str = "bootcamp"
print str[1...4]
puts
print str[1..4]
puts
print str[3..-1]