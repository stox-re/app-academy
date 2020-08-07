# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    factor_array = []
    for i in 1..num do
        if (num % i == 0)
            factor_array.push(i)
        end
    end
    for k in (factor_array.length-1).downto(0) do
        if prime?(factor_array[k])
            return factor_array[k]
        end
    end
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

def unique_chars?(string)
    for i in 0...string.length do
        for k in i+1...string.length do
            if string[i] == string[k]
                return false
            end
        end
    end
    return true
end

def dupe_indices(array)
    indices = Hash.new { |hash, key| hash[key] = [] }
    for i in 0...array.length do
        indices[array[i]] << i
    end
    indices.select { |element, value_array| value_array.length > 1}
end

def ana_array(array1, array2)
    array_count = ele_count(array1)
    array2_count = ele_count(array2)
    return array_count == array2_count
end

def ele_count(array)
    hash = Hash.new(0)
    array.each do |item|
        hash[item] += 1
    end
    hash
end