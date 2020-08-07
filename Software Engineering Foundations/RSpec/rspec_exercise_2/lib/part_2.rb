def palindrome?(string)
    reverse_string = []
    string.each_char do |char|
        reverse_string.unshift(char)
    end
    if reverse_string.join("") == string
        true
    else
        false
    end
end

def substrings(string)
    sub_strings = []
    (0...string.length).each do |start_idx|
        (start_idx...string.length).each do |end_idx|
            sub_strings.push(string[start_idx..end_idx])
        end
    end
    sub_strings
end

#def palindrome_substrings(string)
#    all_substrings = substrings(string)
#    palindrome_substrings = []
#    all_substrings.each do |word|
#        if word.length > 1
#            if palindrome?(word)
#                palindrome_substrings.push(word)
#            end
#        end
#    end
#    palindrome_substrings
#end

# Shorter solution
def palindrome_substrings(string)
    substrings(string).select { |substr| palindrome?(substr) && substr.length > 1}
end