# Write a method prime_factors that takes in a number
# and returns an array containing all of the prime factors of the given number.

def prime_factors(num)

    factor_array = []

    for i in 2...num do
        if (num % i == 0) && prime?(i)
            factor_array.push(i)
        end
    end

    return factor_array

end

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

p prime_factors(24) #=> [2, 3]
p prime_factors(60) #=> [2, 3, 5]