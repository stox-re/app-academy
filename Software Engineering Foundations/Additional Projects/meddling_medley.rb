p "---duos---"

# Write a method duos that accepts a string as an argument and returns
# the count of the number of times the same character appears consecutively in the given string.

def duos(string)
    count = 0
    (0...string.length).each do |i|
        if string[i] == string[i+1]
            count += 1
        end
    end
    count
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0

p "---sentance_swap---"

# Write a method sentence_swap that accepts a sentence and a hash as arguments.
# The method should return a new sentence where every word is replaced with
# it's corresponding value in the hash. If a word does not exist as a key of the hash,
# then it should remain unchanged.

def sentance_swap(sentance, hash)
    split_sentance = sentance.split(" ")
    new_sentance = []
    split_sentance.each do |word|
        if hash.has_key?(word)
            new_sentance << hash[word]
        else
            new_sentance << word
        end
    end
    new_sentance.join(" ")
end

p sentance_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentance_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentance_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'

p "---hash_mapped---"

# Write a method hash_mapped that accepts a hash, a proc, and a block.
# The method should return a new hash where each key is the result of the original
# key when given to the block. Each value of the new hash should be the result
# of the original values when passed into the proc.

def hash_mapped(hash, proc, &prc)
    new_hash = {}
    hash.each do |key, value|
        new_hash[prc.call(key)] = proc.call(value)
    end
    new_hash
end

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}

p "---counted_characters---"

# Write a method counted_characters that accepts a string as an argument.
# The method should return an array containing the characters of the string
# that appeared more than twice. The characters in the output array should appear
# in the same order they occur in the input string

def counted_characters(string)
    new_array = []
    char_hash = Hash.new(0)
    string.each_char do |char|
        char_hash[char] += 1
    end
    char_hash.each do |key, value|
        if char_hash[key] > 2
            new_array << key
        end
    end
    new_array
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []

p "---triplet_true?---"

def triplet_true(string)
    (0...string.length).each do |i|
        if (string[i] == string[i+1]) && string[i] == string[i+2]
            return true
        end
    end
    false
end

p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false

p "---energetic_encoding---"

# Write a method energetic_encoding that accepts a string and a hash as arguments.
# The method should return a new string where characters of the original string
# are replaced with the corresponding values in the hash.
# If a character is not a key of the hash, then it should be replaced with
# a question mark ('?'). Space characters (' ') should remain unchanged.

def energetic_encoding(string, hash)
    new_string = ""
    string.each_char do |char|
        if hash.has_key?(char)
            new_string << hash[char]
        elsif char == " "
            new_string << " "
        else
            new_string << "?"
        end
    end
    new_string
end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'

p "---uncompress---"

# Write a method uncompress that accepts a string as an argument.
# The string will be formatted so every letter is followed by a number.
# The method should return an "uncompressed" version of the string where every
# letter is repeated multiple times given based on the number that appears directly after the letter.

def uncompress(string)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_string = ""
    string.each_char.with_index do |char, i|
        if alphabet.include?(char)
            this_char = char
            (string[i+1].to_i).times do |print|
                new_string << this_char
            end
        end

    end
    p new_string
end

uncompress('a2b4c1') # 'aabbbbc'
uncompress('b1o2t1') # 'boot'
uncompress('x3y1x2z4') # 'xxxyxxzzzz'

p "---conjunct_select---"

# Write a method conjunct_select that accepts an array and one or more procs as arguments.
# The method should return a new array containing the elements that return true when
# passed into all of the given procs.

def conjunct_select(array, *prc)
    new_array = []
    array.each do |item|
        was_true = true
        prc.each do |this_prc|
            if !this_prc.call(item)
                was_true = false
            end
        end
        if was_true
            new_array << item
        end
    end
    new_array
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]