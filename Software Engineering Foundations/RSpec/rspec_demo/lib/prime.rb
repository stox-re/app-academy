def prime?(num)

    is_prime = true

    if num <= 1
        return false
    end

    for i in 2...num do
        if num % i == 0
            is_prime = false
        end
    end

    return is_prime

end