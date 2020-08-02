# While loops

def repeatHello()

    counter = 0
    while counter < 5
        print counter
        puts " hello"
        counter += 1
    end

end

repeatHello()
puts "-------"

# While loop between min and max

def printNums(min, max, step)

    i = min
    while i <= max
        puts i
        i  += step
    end

end

printNums(0,9,1)
puts "-------"

# Print all chars in a string

def printString(str)

    i = 0
    while i < str.length
        puts str[i]
        i += 1
    end

end

printString("hello world")
puts "-------"

# break - Immediately exit the loop
# next - Skips to the next iteration

def tryNext()

    i = 0
    
    while i < 10

        puts i
        
        if i == 5
            i += 1
            next
        end
        
        puts i
        i += 1

    end

end

tryNext()