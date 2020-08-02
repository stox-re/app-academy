# Enumerable Methods
# array
#      .each
#       .each_with_index
# string
#       .each_char
#       .each_char.with_index

months = ["Jan","Feb","Mar","Apr"]

#i = 0
#while i < months.length
#    month = months[i]
#    puts month
#    i += 1
#end

months.each { 
    |month| 
    puts month 
}

months.each do |ele| 
    puts ele
    puts "---"
end

months.each_with_index do |ele, idx|
    puts ele
    puts idx
    puts "---"
end


sentance = "hello world"

countL = 0
sentance.each_char do |char|
    if char == "l"
        countL += 1
    end
end
puts countL

sentance.each_char.with_index do |char, idx|
    puts char
    puts idx
end

#--------------------------------------------------------------------------
# Range enumerable
# (start..end).each, iterate from start to end inclusive
# (start...end).each, iterate from start to end, excluding the end

puts "----------"

arr = ["a","b","c"]

arr.each {
    |ele|
    puts ele
}

puts "----------"

(1..10).each{
    |num|
    puts num
}

puts "----------"

# Write a method fizzBuzz that takes in a max, and returns an array containing all
# numbers less than max that are divisible by 3 or 5, but not both. Using an enumerable

def fizzBuzz(max)

    arr = []

    (1...max).each do |num|
        if (num % 3 == 0 || num % 5 == 0) && !(num % 3 == 0 && num % 5 == 0)
            arr << num
        end
    end

    return arr

end

p fizzBuzz(20)


# .times

4.times { puts "hello" }