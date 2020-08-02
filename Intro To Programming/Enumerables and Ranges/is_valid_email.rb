# Write a method is_valid_email that takes in a string 
# and returns a boolean indicating whether or not it is a valid email address.

# For simplicity, we'll consider an email valid when it satisfies all of the following:
# X contains exactly one @ symbol
# X contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

def is_valid_email(str)
    
    splitString = str.split("@")

    if splitString.length == 2

        numbers = "0123456789"
        firstHalf = splitString[0]

        firstHalf.each_char do |char|
            
            if numbers.include?(char)
                return false
            end

        end

        if (firstHalf[0..-1] == firstHalf[0..-1].downcase)

            secondHalfSplit = splitString[1].split(".")
            
            if secondHalfSplit[0] == "" || secondHalfSplit.length < 2
                return false
            else
                return true
            end

        else
            return false
        end
    
    else
        return false
    end
end

puts is_valid_email("abc@xy.z")         # => true
puts is_valid_email("jdoe@gmail.com")   # => true
puts is_valid_email("jdoe@g@mail.com")  # => false
puts is_valid_email("jdoe42@gmail.com") # => false
puts is_valid_email("jdoegmail.com")    # => false
puts is_valid_email("az@email")         # => false
