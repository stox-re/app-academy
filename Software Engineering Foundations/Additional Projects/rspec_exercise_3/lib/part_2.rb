def element_count(array)
    hash = Hash.new(0)
    array.each do |ele|
        hash[ele] += 1
    end
    hash
end

def char_replace!(string, hash)
    string.each_char.with_index do |char, idx|
        if hash.has_key?(char)
            string[idx] = hash[char]
        end
    end
    string
end

def product_inject(array)
    array.inject(1) { |acc, ele| acc * ele }
end