# Default parameters for methods are possible in ruby

def greet(person_1, person_2=nil)
    if person_2.nil?
        p "Hey " + person_1
    else
        p "Hey " + person_1 + " and " + person_2
    end
end

greet("Chao") # => "Hey Chao"
greet("Chao", "Arittro") # => "Hey Chao and Arittro"

