# Write a method format_name that takes in a name string
# and returns the name properly capitalized.

# Hint: use str.upcase and str.downcase
# "abc".upcase # => "ABC"

def format_name(str)
    
    splitString = str.split(" ")
    newName = []

    splitString.each do |word|

        newName.push( word[0].upcase + word[1..-1].downcase )

    end

    return newName.join(" ")

end

puts format_name("chase WILSON") # => "Chase Wilson"
puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"