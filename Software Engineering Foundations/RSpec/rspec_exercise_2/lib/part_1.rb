def partition(array, number)
    new_2d_array = [[],[]]
    array.each do |num|
        if num < number
            new_2d_array[0].push(num)
        else
            new_2d_array[1].push(num)
        end
    end
    return new_2d_array
end

def merge(hash1, hash2)
    result_hash = {}
    hash1.each do |key, value|
        result_hash[key] = value
    end
    hash2.each do |key_two, value_two|
        result_hash[key_two] = value_two
    end
    return result_hash
end

def censor(sentance, curse_array)

    vowels = "aeiou"
    split_sentance = sentance.split(" ")
    censored_array = []

    split_sentance.each do |word|
        was_found = false
        curse_array.each do |curse|
            if word.downcase == curse
                new_word = ""
                word.each_char do |letter|
                    if vowels.include?(letter.downcase)
                        new_word += "*"
                    else
                        new_word += letter
                    end
                end
                censored_array.push(new_word)
                was_found = true
            end
        end
        if !was_found
            censored_array.push(word)
        end
    end
    censored_array.join(" ")
end

def power_of_two?(number)
    power_check = 2

    if number == 1
        return true
    end

    for i in 0...number do
        power_check *= 2
        if power_check > number
            return false
        elsif power_check == number
            return true
        end
    end
end