# Write a method consonant_cancel that takes in a sentence
# and returns a new sentence where every word begins with it's first vowel.

def consonant_cancel(sentence)

    split_sentance = sentence.split(" ")
    vowels = "aeiou"
    resulting_array = []

    split_sentance.each do |word|
        word.each_char.with_index do |char, idx|
            if vowels.include?(char)
                resulting_array.push(word[idx..-1])
                break
            end
        end
    end

    return resulting_array.join(" ")

end

p consonant_cancel("down the rabbit hole") #=> "own e abbit ole"
p consonant_cancel("writing code is challenging") #=> "iting ode is allenging"