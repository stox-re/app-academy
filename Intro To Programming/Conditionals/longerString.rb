#Write a method longer_string(str1, str2) that takes in two strings 
#and returns the longer of the two strings.
#In the case of a tie, the method should return the first string.

def longerString(str1, str2)
    if str1.length >= str2.length
        return str1
    else
        return str2
    end
end


puts longerString("app", "academy") # => "academy"
puts longerString("summer", "fall") # => "summer"
puts longerString("hello", "world") # => "hello"