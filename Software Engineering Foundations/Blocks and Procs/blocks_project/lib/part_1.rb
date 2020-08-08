def select_even_nums(array)
    array.select { |num| num.even? }
end

def reject_puppies(array_of_hashes)
    array_of_hashes.reject{ |hash| hash["age"] < 3}
end

def count_positive_subarrays(array_2d)
    array_2d.count { |sub_array| sub_array.sum > 0 }
end

def aba_translate(word)
    vowels = "aeiou"
    new_word = ""
    word.each_char do |char|
        if vowels.include?(char)
            new_word += char + "b" + char
        else
            new_word += char
        end
    end
    new_word
end

def aba_array(array_of_words)
    array_of_words.map {|word| aba_translate(word) }
end