# Nauseating Numbers Problems

# Write a method strange_sums that accepts an array of numbers as an argument.
# The method should return a count of the number of distinct pairs of elements
# that have a sum of zero. You may assume that the input array contains unique elements.

p "---strange_sums----"

def strange_sums(array)
    count = 0
    array.each_with_index do |ele, idx|
        array.each_with_index do |ele_2, idx_2|
            if idx_2 > idx
                if ele + ele_2 == 0
                    count += 1
                end
            end
        end
    end
    count
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0

# Write a method pair_product that accepts an array of numbers and a product as arguments.
# The method should return a boolean indicating whether or not a pair of distinct elements
# in the array result in the product when multiplied together. You may assume that the input
# array contains unique elements.

p "---pair_product----"

def pair_product(array, product)
    array.each_with_index do |ele, idx|
        array.each_with_index do |ele_2, idx_2|
            if idx_2 > idx
                if ele * ele_2 == product
                    return true
                end
            end
        end
    end
    false
end

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false

p "---rampant_repeats----"

def rampant_repeats(string, hash)
    new_string = ""
    string.each_char do |char|
        if hash.has_key?(char)
            new_string += char * hash[char]
        else
            new_string += char
        end
    end
    new_string
end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

# Write a method perfect_square? that accepts a number as an argument.
# The method should return a boolean indicating whether or not the argument
# is a perfect square. A perfect square is a number that is the product of some
# number multiplied by itself. For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144
# are perfect squares; 35 is not a perfect square.

p "---perfect_square----"

def perfect_square(num)
    (0..num).each do |i|
        if i * i == num
            return true
        end
    end
    false
end

p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false

# Write a method anti_prime? that accepts a number as an argument.
# The method should return true if the given number has more divisors
# than all positive numbers less than the given number. For example, 24
# is an anti-prime because it has more divisors than any positive number
# less than 24. Math Fact: Numbers that meet this criteria are also known as highly composite numbers.

p "---anti_prime?----"

def num_factors(n)
    (1..n).count { |i| n % i == 0 }
end

def anti_prime?(num)
    count = num_factors(num)
    (1...num).all? { |i| count > num_factors(i) }
end

p "Anti Prime"
p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false

# Let a 2-dimensional array be known as a "matrix".
# Write a method matrix_addition that accepts two matrices as arguments.
# The two matrices are guaranteed to have the same "height" and "width".
# The method should return a new matrix representing the sum of the two arguments.
# To add matrices, we simply add the values at the same positions:

p "---matrix_addition----"

def matrix_addition(matrice_1, matrice_2)
    new_2d_array = []
    matrice_1.length.times do |i|
        new_2d_array.push(Array.new(matrice_1[0].length))
    end
    matrice_1.each_with_index do |sub_array, idx_1|
        sub_array.each_with_index do |ele, ele_idx|
            new_2d_array[idx_1][ele_idx] = matrice_1[idx_1][ele_idx] + matrice_2[idx_1][ele_idx]
        end
    end
    new_2d_array
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

# Write a method mutual_factors that accepts any amount of numbers as arguments.
# The method should return an array containing all of the common divisors shared among the arguments.
# For example, the common divisors of 50 and 30 are 1, 2, 5, 10. You can assume that all of
# the arguments are positive integers.

p "---mutual_factors----"

def mutual_factors(*nums)
    factor_hash = Hash.new() { |hash, key| hash[key] = [] }
    nums.each do |num|
        (1..num).each do |i|
            if num % i == 0
                factor_hash[num] << i
            end
        end
    end
    result_array = factor_hash[nums[0]]
    factor_hash.each do |key, value|
        result_array &= value
    end
    result_array
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]

# The tribonacci sequence is similar to that of Fibonacci. The first three numbers of the
# tribonacci sequence are 1, 1, and 2. To generate the next number of the sequence,
# we take the sum of the previous three numbers. The first six numbers of tribonacci sequence are:
# 1, 1, 2, 4, 7, 13, ... and so on
# Write a method tribonacci_number that accepts a number argument, n, and returns the n-th number
# of the tribonacci sequence.

p "---tribonacci_number----"

def tribonacci_number(n)
    return 0 if n < 0
    return 1 if n == 0
    return 1 if n == 1
    return 2 if n == 2
    tribonacci_number(n-1) + tribonacci_number(n-2) + tribonacci_number(n-3)
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 4
p tribonacci_number(4)  # 7
p tribonacci_number(5)  # 13
p tribonacci_number(6)  # 24
p tribonacci_number(7)  # 44
p tribonacci_number(11) # 504

# Write a method matrix_addition_reloaded that accepts any number of matrices as arguments.
# The method should return a new matrix representing the sum of the arguments.
# Matrix addition can only be performed on matrices of similar dimensions,
# so if all of the given matrices do not have the same "height" and "width", then return nil.

p "---matrix_addition_reloaded----"

def matrix_addition_reloaded(*matrices)
    this_length = matrices[0].length
    matrices.each do |matrice|
        return nil if matrice.length != this_length
    end

    new_2d_array = []
    matrices[0].length.times do |i|
        new_2d_array.push(Array.new(matrices[0][0].length, 0))
    end

    final_2d_array = (
        matrices.inject(new_2d_array) do |m1, m2|
            matrix_addition(m1, m2)
        end
    )

    final_2d_array
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# Write a method squarocol? that accepts a 2-dimensional array as an argument.
# The method should return a boolean indicating whether or not any row or column is
# completely filled with the same element. You may assume that the 2-dimensional
# array has "square" dimensions, meaning it's height is the same as it's width.

p "---Squarocol?----"

def squarocol?(array_2d)
    return true if array_2d.any? { |row| row.uniq.length == 1 }
    return true if array_2d.transpose.any? { |col| col.uniq.length == 1 }
    false
end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false

# Write a method squaragonal? that accepts 2-dimensional array as an argument.
# The method should return a boolean indicating whether or not the array contains
# all of the same element across either of its diagonals. You may assume that
# the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

p "---Squaragonal?----"
def check_array_for_found(array_2d)
    checking_as = array_2d[0][0]
    count_as = 0
    is_found = true
    array_2d.each_with_index do |sub_array, sub_idx|
        if sub_array[count_as] != checking_as
            is_found = false
        end
        count_as += 1
    end
    is_found
end

def squaragonal?(array_2d)
    check_array_for_found(array_2d) || check_array_for_found(array_2d.reverse)
end

p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false

# Write a method pascals_triangle that accepts a positive number, n,
# as an argument and returns a 2-dimensional array representing the first n levels of pascal's triangle.
#     1
#    1 1
#   1 2 1
#  1 3 3 1
# 1 4 6 4 1
p "---Pascals Triangle---"

def adjacent_sums(arr)
    sums = []
    (0...arr.length-1).each do |i|
        sums << arr[i] + arr[i + 1]
    end
    sums
end

def pascals_triangle(n)
    triangle = [[]]
    triangle[0] = [1]
    triangle[1] = [1,1]
    (2...n).each do |item|
        next_item = [1]
        next_item += adjacent_sums(triangle.last)
        next_item << 1
        triangle << next_item
    end
    triangle
end

p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

# Write a method mersenne_prime that accepts a number, n, as an argument and returns the n-th Mersenne prime.
p "---Mersenne Primes---"
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

def mersenne_prime(num)

    found_count = -1
    start_at = 1
    mersenne_primes_array = []

    while found_count < num
            checking = (2**start_at) - 1
            if (prime?(checking))
                found_count += 1
                mersenne_primes_array << checking
            end
        start_at += 1
    end
    mersenne_primes_array[mersenne_primes_array.length-1]
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31

# Write a method triangular_word? that accepts a word as an argument
# and returns a boolean indicating whether or not that word's number
# encoding is a triangular number. You can assume that the argument contains lowercase letters.

p "---triangular_word?----"

def triangular_word?(word)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    calculate_word_triangle = 0

    word.each_char do |char|
        calculate_word_triangle += alphabet.index(char) + 1
    end
    i = 0
    while i < calculate_word_triangle
        triangular = (i * (i + 1)) / 2
        if triangular == calculate_word_triangle
            return true
        end
        i += 1
    end
    return false
end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false

# Write a method consecutive_collapse that accepts an array of numbers as an argument.
# The method should return a new array that results from continuously removing
# consecutive numbers that are adjacent in the array. If multiple adjacent pairs
# are consecutive numbers, remove the leftmost pair first.

p "---consecutive_collapse----"

def consecutive_collapse(array_of_nums)
    array_of_nums.each_with_index do |num, idx|
        if idx > 0 && (array_of_nums[idx] + 1 == array_of_nums[idx-1] || array_of_nums[idx] - 1 == array_of_nums[idx-1])
            array_of_nums.delete_at(idx)
            array_of_nums.delete_at(idx-1)
            consecutive_collapse(array_of_nums)
        end
    end
    array_of_nums
end

p consecutive_collapse([3, 4, 1])
p consecutive_collapse([1, 4, 3, 7])
p consecutive_collapse([9, 8, 2])
p consecutive_collapse([9, 8, 4, 5, 6])
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])
p consecutive_collapse([3, 5, 6, 2, 1])
p consecutive_collapse([5, 7, 9, 9])
p consecutive_collapse([13, 11, 12, 12])
# Write a method pretentious_primes that takes accepts an array and a number, n, as arguments.
# The method should return a new array where each element of the original array is replaced
# according to the following rules:
# when the number argument is positive, replace an element with the n-th nearest prime number that is greater than the element
# when the number argument is negative, replace an element with the n-th nearest prime number that is less than the element

p "---pretentious_primes----"

def next_prime(number, i)
    step = 1
    if i < 0
        i = -(i)
        step = -(step)
    end

    prime_count = 0
    while prime_count < i
        return nil if number < 0
        number += step
        prime_count += 1 if prime?(number)
    end
    number
end

def pretentious_primes(numbers, n)
    numbers.map { |num| next_prime(num, n) }
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]