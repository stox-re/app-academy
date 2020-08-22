def zip(*arrays)
    new_2d_array = []

    arrays[0].each do |ele|
        new_2d_array.push([])
    end

    arrays.each do |array|
        array.each_with_index do |inner_ele, idx|
            new_2d_array[idx].push(inner_ele)
        end
    end

    new_2d_array
end

def prizz_proc(array, *prc)
    new_array = []
    array.each do |ele|
        if prc[0].call(ele) && prc[1].call(ele)
        elsif prc[0].call(ele) || prc[1].call(ele)
            new_array << ele
        end
    end
    new_array
end

def zany_zip(*arrays)
    new_2d_array = []
    find_largest_length = 0

    # This loop gets the largest length array to set to a new []
    arrays.each do |find_array|
        if find_array.length > find_largest_length
            find_largest_length = find_array.length
        end
    end

    # Sets to a new [] for the largest length to get a base 2d array, and push nils everywhere
    find_largest_length.times do |i|
        new_2d_array.push(Array.new(arrays.length, nil))
    end

    # Push nils everywhere
    #new_2d_array.each_with_index do |push_nil_array, nil_idx|
    #    arrays.length.times do |nil_push|
    #        new_2d_array[nil_idx].push(nil)
    #    end
    #end

    # Rewrites at the proper [index][array_idx] elements to create the zip()
    arrays.each_with_index do |array, array_idx|
        array.each_with_index do |inner_ele, idx|
            new_2d_array[idx][array_idx] = inner_ele
        end
    end

    new_2d_array
end

def maximum(array, &prc)
    return nil if array.length == 0
    find_largest = 0
    largest_ele = 0
    array.each do |ele|
        prc_result = prc.call(ele)
        if prc_result >= find_largest
            find_largest = prc_result
            largest_ele = ele
        end
    end
    largest_ele
end

def my_group_by(array, &prc)
    hash = Hash.new { |hash, key| hash[key] = [] }
    array.each do |item|
        hash[prc.call(item)] << item
    end
    hash
end

def max_tie_breaker(array, prc, &block)
    return nil if array.length == 0
    largest_result = 0
    largest_element = 0

    array.each do |element|
        if block.call(element) > largest_result
            largest_result = block.call(element)
            largest_element = element
        elsif block.call(element) == largest_result
            if prc.call(element) > largest_result
                largest_result = prc.call(element)
                largest_element = element
            end
        end
    end
    largest_element
end

def silly_syllables(sentance)
    vowels = "aeiou"
    words = sentance.split(" ")
    vowel_count = 0
    new_words = []
    index_of_vowels = []

    words.each do |word|
        vowel_count = 0
        index_of_vowels = []

        word.each_char.with_index do |char, idx|
            if vowels.include?(char)
                index_of_vowels << idx
                vowel_count += 1
            end
        end
        if vowel_count >= 2
            new_words.push(word[index_of_vowels[0]..index_of_vowels[index_of_vowels.length-1]])
        else
            new_words.push(word)
        end
    end

    new_words.join(" ")
end