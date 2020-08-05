# Variable references
str = "hello"
p str.object_id
str.upcase!
p str

str2 = "hello"
p str2.object_id
str2 = "bye"
p str2.object_id

arr = [1,2]
arr2 = arr
arr << 3
p arr2

array = []
array = Array.new(3) # initializes an array of length 3
p array

new_array = Array.new(10, "?") # Initializes at size 10, with a default value of ?
p new_array

array_of_sub_arrays = Array.new(10, [])
more_sub_arrays = Array.new(10,Array.new(3,0))
p array_of_sub_arrays
p more_sub_arrays