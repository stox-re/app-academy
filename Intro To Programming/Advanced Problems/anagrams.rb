# Write a method anagrams? that takes in two words
# and returns a boolean indicating whether or not the words are anagrams.
# Anagrams are words that contain the same characters but not necessarily in the same order.
# Solve this without using .sort

def anagrams?(word1, word2)
    return char_count_hash(word1) == char_count_hash(word2)
end

def char_count_hash(word)
    word_hash = Hash.new(0)
    word.each_char do |char|
        word_hash[char] += 1
    end
    return word_hash
end

# Old version
# def anagrams?(word1, word2)
#
#     checkWordSize = word2.length > word1.length
#     useLongerWord = checkWordSize ? word2 : word1
#     useShorterWord = checkWordSize ? word1 : word2
#
#     useLongerWord.each_char do |char|
#         wasFound = false
#         useShorterWord.each_char do |char2|
#             if (char == char2)
#                 wasFound = true
#             end
#         end
#         if (!wasFound)
#             return false
#         end
#     end
#
#     return true
#
# end

puts anagrams?("cat", "act")          #=> true
puts anagrams?("restful", "fluster")  #=> true
puts anagrams?("cat", "dog")          #=> false
puts anagrams?("boot", "bootcamp")    #=> false