# Write a method number_check(num) that takes in a number and returns a string. 
# The method should return the string 'positive' if the num is positive,
# 'negative' if the num is negative, and 'zero' if the num is zero.

def numberCheck(num)
    if (num > 0)
        return "positive"
    elsif (num < 0)
        return "negative"
    else
        return "zero"
    end
end

puts numberCheck(5)    # => "positive"
puts numberCheck(-2)   # => "negative"
puts numberCheck(0)    # => "zero"