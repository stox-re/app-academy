def proper_factors(number)
    factor_array = []
    for i in (number-1).downto(1)
        if number % i == 0
            factor_array << i
        end
    end
    factor_array.reverse
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    return true if aliquot_sum(num) == num
    false
end

def ideal_numbers(n)
    count_perfect_numbers = 0
    perfect_nums = []
    checking = 1

    while count_perfect_numbers < n
        if perfect_number?(checking)
            perfect_nums << checking
            count_perfect_numbers += 1
        end
        checking += 1
    end
    perfect_nums
end