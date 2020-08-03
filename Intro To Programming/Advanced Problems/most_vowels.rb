# Write a method most_vowels that takes in a sentence string
# and returns the word of the sentence that contains the most vowels.

def most_vowels(sentence)

    word_array = sentence.split(" ")
    counting_array = []

    word_array.each do |word|
        count_vowels = 0
        word.each_char do |char|
            if (char == "a" || char == "i" || char == "o" || char == "e" || char == "u")
                count_vowels += 1
            end
        end
        counting_array.push(count_vowels)
    end

    largest = 0
    index_of_largest = 0

    counting_array.each_with_index do |count_num, i|
        if count_num > largest
            largest = count_num
            index_of_largest = i
        end
    end

    return word_array[index_of_largest]

end

p most_vowels("what a wonderful life") #=> "wonderful"