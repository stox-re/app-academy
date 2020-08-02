# Write a method to_initials that takes in a person's name string 
# and returns a string representing their initials.

def to_initials(name)

    nameSplitArr = name.split(" ")
    initials = ""

    nameSplitArr.each do |splitName|
        initials += splitName[0]
    end

    return initials
end

puts to_initials("Kelvin Bridges")      # => "KB"
puts to_initials("Michaela Yamamoto")   # => "MY"
puts to_initials("Mary La Grange")      # => "MLG"