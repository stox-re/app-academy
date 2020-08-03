# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num1, num2)

    first = get_factor_array(num1)
    second = get_factor_array(num2)

    first.each do |factor|
        second.each do |second_factor|
            if factor == second_factor
                return false
            end
        end
    end

    return true

end

def get_factor_array(num)
    factor_array = []
    for i in 2..num do
        if (num % i == 0)
            factor_array.push(i)
        end
    end
    return factor_array
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
