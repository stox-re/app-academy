# Write a method prime? that takes in a number and returns a boolean,
# indicating whether the number is prime. A prime number is only divisible by 1 and itself.

def prime?(num)
    is_prime = true
    if num < 0
        is_prime = false
    end
    for i in 2...num do
        if num % i == 0
            is_prime = false
        end
    end
    return is_prime
end

puts prime?(2)  #=> true
puts prime?(5)  #=> true
puts prime?(11) #=> true
puts prime?(4)  #=> false
puts prime?(9)  #=> false
puts prime?(-5) #=> false