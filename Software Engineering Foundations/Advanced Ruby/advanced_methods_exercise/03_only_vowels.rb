# Write a method, `only_vowels?(str)`, that accepts a string as an arg.
# The method should return true if the string contains only vowels.
# The method should return false otherwise.

def only_vowels?(str)
    vowels = "aeiou"
    str.split("").all? { |el| vowels.include?(el) }
end

only_vowels?("aaoeee")  # => true
only_vowels?("iou")     # => true
only_vowels?("cat")     # => false
only_vowels?("over")    # => false


