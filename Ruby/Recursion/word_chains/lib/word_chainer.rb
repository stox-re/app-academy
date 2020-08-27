require 'set'

class WordChainer
    def initialize(dictionary_name)
        @dictionary = load_dictionary(dictionary_name)
        run("cat", "dog")
    end

    def adjacent_words(word)
        list_of_adjacent_words = []

        @dictionary.each do |test_word|
            if (is_word_adjacent(test_word, word))
                list_of_adjacent_words << test_word
            end
        end

        list_of_adjacent_words
    end

    def is_word_adjacent(test_word, word)
        return false if test_word == word
        return false if test_word.length != word.length
        count_diffs = 0

        test_word.each_char.with_index do |test_char, test_index|
            if test_char != word[test_index]
                count_diffs += 1
            end
        end

        return true if count_diffs == 1
        return false
    end

    def load_dictionary(input_name)
        word_array = Set.new

        File.foreach("./" + input_name) do |line|
            word_array << line.chomp
        end

        word_array
    end

    def run(source, target)
        @current_words = [source]
        @all_seen_words = [source]

        while @current_words.length != 0
            p new_current_words = explore_current_words
            @current_words = new_current_words
        end
    end

    def explore_current_words
        new_current_words = []

        @current_words.each do |word|
            all_adjacent = adjacent_words(word)

            all_adjacent.each do |adj_word|
                if !@all_seen_words.include?(adj_word)
                    @all_seen_words << adj_word
                    new_current_words << adj_word
                end
            end
        end

        new_current_words
    end
end

word_chainer = WordChainer.new("dictionary.txt")