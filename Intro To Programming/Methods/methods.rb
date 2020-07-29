#Define a method

def sayMessage
    puts "Hello new method"
    puts "How are you?"
end

#Call the method
puts "---Before the call---"
sayMessage
puts "---After the call---"
sayMessage


def sayWithParameters(person1, person2)
    puts "Hello " + person1 + " and " + person2 + "."
end

sayWithParameters("James", "Sophie")


#Calculate an average

def calculateAvg(num1, num2)
    return (num1 + num2) / 2.0
end

average = calculateAvg(5, 10)
p average