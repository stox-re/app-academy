# Recap Exercise 3
# General Problems

def no_dupes?(arr)
    found_count = 0
    new_array = []

    arr.each do |item|
        found_count = 0
        arr.each do |item_check|
            if item == item_check
                found_count += 1
            end
        end
        if found_count == 1
            new_array << item
        end
    end

    new_array
end

p no_dupes?([1, 1, 2, 1, 3, 2, 4])
p no_dupes?(['x', 'x', 'y', 'z', 'z'])
p no_dupes?([true, true, true])

def no_consecutive_repeats?(arr)
    (0...arr.length).each do |i|
        if i != arr.length-1 && arr[i] == arr[i+1]
            return false
        end
    end
    return true
end

p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])
p no_consecutive_repeats?(['x'])

def char_indices(str)
    hash = Hash.new { |hash, key| hash[key] = [] }
    p hash
    str.each_char.with_index do |char, idx|
        hash[char].push(idx)
    end
    hash
end

p char_indices('mississippi')
p char_indices('classroom')

def longest_streak(str)
    split_str = str.split("")
    hash = Hash.new { |hash, key| hash[key] = [] }
    (0...split_str.length).each do |i|
        hash[split_str[i]] << split_str[i]
    end
    largest = []
    hash.each do |key, value|
        if value.length >= largest.length
            largest = value
        end
    end
    return largest.join("")
end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

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

def bi_prime?(num)
    all_primes = []
    (0...num).each do |i|
        if prime?(i)
            all_primes << i
        end
    end
    all_primes.each_with_index do |prime, idx|
        all_primes.each_with_index do |other_prime, idx_2|
            if prime * other_prime == num
                return true
            end
        end
    end
    return false
end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    current_index = 0
    split_string = message.split("")

    final_array = split_string.map.with_index do |char, idx|
        if current_index >= keys.length
            current_index = 0
        end
        find_char_in_alpha = alphabet.index(char)
        resulting_shift = find_char_in_alpha + keys[current_index]
        if (resulting_shift > alphabet.length-1)
            resulting_shift = resulting_shift - alphabet.length
        end
        current_index += 1
        alphabet[resulting_shift]
    end

    return final_array.join("")
end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    new_string_array = []
    vowels = "aeiou"
    vowel_array = []
    str.split("").each_with_index do |char, idx|
        if vowels.include?(char)
            vowel_array.push(idx)
        end
    end
    rotated = vowel_array.rotate(-1)
    str.split("").each_with_index do |char, index|
        found_at = vowel_array.index(index)
        if found_at != nil
            new_string_array << str.split("")[rotated[found_at]]
        else
            new_string_array << char
        end
    end
    new_string_array.join("")
end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"

# Proc Problems
class String
    def select(&prc)
        prc ||= Proc.new { false }
        new_string = []
        self.each_char do |char|
            if prc.call(char)
                new_string << char
            end
        end
        new_string.join("")
    end

    def map!(&prc)
        self.each_char.with_index do |char, idx|
            self[idx] = prc.call(char, idx)
        end
        self
    end
end

p "app academy".select { |ch| !"aeiou".include?(ch) }
p "HELLOworld".select { |ch| ch == ch.upcase }
p "HELLOworld".select

word_1 = "Lovelace"
word_1.map! do |ch|
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"

# Recursion Problems

def multiply(a, b)
    return 0 if b == 0
    if b < 0
        -(a + multiply(a, (-b)-1))
    else
        a + multiply(a, b-1)
    end
end

p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18

def lucas_sequence(length)
    return [] if length == 0
    return [2] if length == 1
    return [2,1] if length == 2

    seq = lucas_sequence(length-1)
    next_ele = seq[-1] + seq[-2]
    seq << next_ele
    return seq
end

# Examples
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    return_array = []
    (2...num).each do |idx|
        if num % idx == 0
            other_factor = num / idx
            return [ *prime_factorization(idx), *prime_factorization(other_factor)]
        end
    end
    [num]
end
prime_factorization(12)     # => [2, 2, 3]
prime_factorization(24)     # => [2, 2, 2, 3]
prime_factorization(25)     # => [5, 5]
prime_factorization(60)     # => [2, 2, 3, 5]
prime_factorization(7)      # => [7]
prime_factorization(11)     # => [11]
prime_factorization(2017)   # => [2017]