class Player
    def get_move
        p "enter a position with coordinates seperated with a space like '4 7'"
        input = gets.chomp
        input_split = input.split(" ")
        return [input_split[0].to_i, input_split[1].to_i]
    end
end
