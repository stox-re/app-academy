# Write a method is_valid_name that takes in a string
# and returns a boolean indicating whether or not it is a valid name.

# A name is valid is if satisfies all of the following:
# X - contains at least a first name and last name, separated by spaces
# X - each part of the name should be capitalized
#
# Hint: use str.upcase or str.downcase
# "a".upcase # => "A"

def is_valid_name(str)

    splitString = str.split(" ")
    
    if str.split.length > 1

        splitString.each do |word|
            
            if word[0] == word[0].upcase

                if ( word[1..-1] == word[1..-1].downcase )
                    return true
                else
                    return false
                end

            else
                return false
            end

        end
    
    else
        return false
    end


end

puts is_valid_name("Kush Patel")       # => true
puts is_valid_name("Daniel")           # => false
puts is_valid_name("Robert Downey Jr") # => true
puts is_valid_name("ROBERT DOWNEY JR") # => false
puts is_valid_name("robert downey jr") # => false