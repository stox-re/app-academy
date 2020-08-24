class Player
    attr_reader :name
    def initialize(name)
        @name = name
        @guesses = []
    end

    def guess
        puts "#{@name}, please guess a letter: "
        guess = gets.chomp
        return guess
    end
end