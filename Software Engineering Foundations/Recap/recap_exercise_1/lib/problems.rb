# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array.
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels = "aeiou"
    vowels = vowels.split("")
    new_array = []

    words.each_with_index do |word, idx|
        words.each_with_index do |another_word, idx_2|
            if idx_2 > idx
                pair = word + " " + another_word
                has_vowels = vowels.all? { |vowel| pair.include?(vowel) }
                if has_vowels
                    new_array.push(pair)
                end
            end
        end
    end

    new_array
end

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |idx|
        if num % idx == 0
            return true
        end
    end
    false
end

# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    array_found = []
    split_string = str.split(" ")

    bigrams.each do |bigram|
        split_string.each do |word|
            if word.include?(bigram)
                array_found << bigram
            end
        end
    end

    array_found
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        new_hash = {}

        if prc == nil
            self.each do |key, value|
                if key == value
                    new_hash[key] = value
                end
            end
            return new_hash
        end

        self.each do |key, value|
            if prc.call(key, value)
                new_hash[key] = value
            end
        end
        return new_hash
    end

end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        subs = []
        (0..self.length).each do |start_idx|
            (start_idx...self.length).each do |end_idx|
                sub = self[start_idx..end_idx]
                subs << sub
            end
        end
        if length == nil
            return subs
        else
            return subs.select {|ele| ele.length == length }
        end
    end

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)

        alphabet = "abcdefghijklmnopqrstuvwxyz"
        split_string = self.split("")

        final_array = split_string.map.with_index do |char, idx|

            find_char_in_alpha = alphabet.index(char)
            resulting_shift = find_char_in_alpha + num

            if (resulting_shift > alphabet.length-1)
                resulting_shift = resulting_shift - alphabet.length
            end

            alphabet[resulting_shift]

        end

        return final_array.join("")
    end

end

p "zebra".caesar_cipher(4)