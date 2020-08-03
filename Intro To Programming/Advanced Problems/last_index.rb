# Write a method last_index that takes in a string and a character.
# The method should return the last index where the character can be found in the string.

def last_index(str, char)

    for i in (str.length-1).downto(0)
        if str[i] == char
            return i
        end
    end

end

p last_index("abca", "a")       #=> 3
p last_index("mississipi", "i") #=> 9
p last_index("octagon", "o")    #=> 5
p last_index("programming", "m")#=> 7