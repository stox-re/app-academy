class Code
    POSSIBLE_PEGS = {
        "R" => :red,
        "G" => :green,
        "B" => :blue,
        "Y" => :yellow
    }

    attr_reader :pegs

    def initialize(array_of_chars)
        if Code.valid_pegs?(array_of_chars)
            @pegs = array_of_chars.map { |char| char.upcase }
        else
            raise "Does not contain valid pegs."
        end
    end

    def self.valid_pegs?(array_of_chars)
        array_of_chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
    end

    def self.random(length)
        my_hash_keys = POSSIBLE_PEGS.keys
        random_array_of_chars = []
        length.times do |idx|
            random_array_of_chars << my_hash_keys[rand(0...my_hash_keys.length)]
        end
        Code.new(random_array_of_chars)
    end

    def self.from_string(pegs)
        Code.new(pegs.split(""))
    end

    def [](index)
        @pegs[index]
    end

    def length
        @pegs.length
    end

    def num_exact_matches(code_instance)
        count = 0
        code_instance.pegs.each_with_index do |char, idx|
            @pegs.each_with_index do |this_peg_char, this_idx|
                if char == this_peg_char && this_idx == idx
                    count += 1
                end
            end
        end
        count
    end

    def num_near_matches(code_instance)
        count = 0
        for i in 0...code_instance.pegs.length
            if @pegs[i] != code_instance[i] && @pegs.include?(code_instance[i])
                count += 1
            end
        end
        count
    end

    def ==(code_instance)
        self.pegs == code_instance.pegs
    end
end
