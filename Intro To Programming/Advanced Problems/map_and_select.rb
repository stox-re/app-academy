# Map and Select with arrays

# Instead of
# arr = ["a", "b", "c", "d"]
# newArr = []
# arr.each { |ele| newArr << ele.upcase + "!" }

arr = ["a", "b", "c", "d"]
new_arr = arr.map{ |ele| ele.upcase + "!" }
p new_arr

# Instead of
# evens = []
# nums.each do |num|
#     if num % 2 == 0
#         evens << num
#     end
# end
# p evens

nums = [1, 2, 3, 4, 5, 6]
evens = nums.select { |ele| ele % 2 == 0 }
p evens

array = ["apple", "bootCAMP", "caRrot", "DaNce"]
# newArray = array.map{ |word| word[0].upcase + word[1..-1].downcase }

new_array = array.map.with_index do |word, idx|
    first_char = word[0].upcase
    rest = word[1..-1].downcase
    new_word = first_char + rest # last line taken as new element
    new_word * idx
end

p new_array