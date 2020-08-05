def average(num1, num2)
    return (num1 + num2 ) / 2.0
end

def average_array(array)
    average = 0.0
    array.each do |num|
        average += num
    end
    return average / array.length
end

def repeat(string, num)
    new_string = ""
    num.times do
        new_string += string
    end
    new_string
end

def yell(string)
    return string.upcase + "!"
end

def alternating_case(string)
    new_string = []
    string.split(" ").each_with_index do |word, idx|
        if idx % 2 == 0
            new_string.push(word.upcase)
        else
            new_string.push(word.downcase)
        end
    end
    return new_string.join(" ")
end