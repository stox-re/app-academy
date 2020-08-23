require_relative "./list.rb"

class TodoBoard
    attr_reader :list
    def initialize(label)
        @list = List.new(label)
    end

    def run
        while get_command
            get_command
        end
    end

    def get_command
        puts "Please enter a command:"
        input = gets.chomp.split(" ")
        if input[0] == "mktodo"
            @list.add_item(input[1], input[2], input[3..-1].join(" "))
        end
        if input[0] == "up"
            if input.length == 3
                @list.up(input[1].to_i, input[2].to_i)
            elsif
                @list.up(input[1].to_i)
            end
        end
        if input[0] == "down"
            if input.length == 3
                @list.down(input[1].to_i, input[2].to_i)
            elsif
                @list.down(input[1].to_i)
            end
        end
        if input[0] == "swap"
            @list.swap(input[1].to_i, input[2].to_i)
        end
        if input[0] == "sort"
            @list.sort_by_date!
        end
        if input[0] == "priority"
            @list.print_priority
        end
        if input[0] == "print"
            if input.length == 1
                @list.print
            else
                @list.print_full_item(input[1].to_i)
            end
        end
        return false if input[0] == "quit"
        return true
    end
end

board = TodoBoard.new("Cats")
board.run