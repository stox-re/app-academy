def all_words_capitalized?(array_of_words)
    array_of_words.all? do |word|
        #word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase
        word.capitalize == word
    end

end

#def no_valid_url?(array_of_urls)
#    array_of_urls.none? do |url|
#        split_url = url.split(".")[1]
#        split_url == "com" || split_url == "net" || split_url == "io" || split_url == "org"
#    end
#end

def no_valid_url?(array_of_urls)
    valid_endings = [".com", ".net", ".io", ".org"]
    array_of_urls.none? do |url|
        valid_endings.any? { |ending| url.end_with?(ending) }
    end
end

def any_passing_students?(array_of_student_hashes)
    array_of_student_hashes.any? do |student|
        (student[:grades].sum / student[:grades].length) > 75
    end
end