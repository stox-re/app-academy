# Write a method ae_count that takes in a string
# and returns a hash containing the number of a's and e's in the string.
# Assume the string contains only lowercase characters.

def ae_count(str)

    countHash = {"a" => 0, "e" => 0}

    str.each_char do |char|

        if char == "a" || char == "e"
            countHash[char] += 1
        end

    end

    return countHash

end

 p ae_count("everyone can program") #=> {"a"=>2, "e"=>3}
 p ae_count("keyboard") #=> {"a"=>1, "e"=>1}