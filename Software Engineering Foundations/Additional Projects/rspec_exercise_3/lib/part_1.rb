def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    return true
end

def nth_prime(n)
    found_primes = 0
    primes = []
    checking = 0
    while found_primes < n
        if is_prime?(checking)
            primes << checking
            found_primes += 1
        end
        checking += 1
    end
    primes[n-1]
end

def prime_range(min, max)
    primes_in_range = []
    checking = min
    while checking <= max
        if is_prime?(checking)
            primes_in_range << checking
        end
        checking += 1
    end
    primes_in_range
end