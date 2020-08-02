# Nested Loops

(1..3).each do |num|
    puts num
    (1..5).each do |num2|
        puts "     " + num2.to_s
    end
end

puts "-----------------------------------"

arr = [
    "a",
    "b",
    "c",
    "d"
]
#---------------------------------------------------------
# Iterates through all possible pairs including duplicates

#arr.each do |ele1|
#    puts ele1
#    arr.each do |ele2|
#        puts ele1 + ele2
#    end
#end

#Iterates through possible pairs without duplicates

arr.each_with_index do |ele1, idx1|
    arr.each_with_index do |ele2, idx2|
        if (idx2 > idx1)
            # if idx2 is greater than idx1, then idx2 is never referring to what idx1 compared to previously
            puts ele1 + ele2
        end
    end
end

#---------------------------------------------------------

# 2 Dimensional Arrays
puts "-----------------------------------"

nestedArray = [
    ["a", "b", "c"],
    ["d","e"],
    ["f","g","h"]
]

nestedArray.each do |subArr|
    
    p subArr

    subArr.each do |subEle|
    
        puts subEle

    end

end
