class Board
    attr_reader :size

    def initialize(n)
        @grid = []
        n.times do
            @grid.push Array.new(n,:N)
        end
        @size = n * n
    end

    def [](array)
        @grid[array[0]][array[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |sub|
            sub.each do |item|
                if item == :S
                    count += 1
                end
            end
        end
        count
    end

    def attack(position)
        if self.[](position)  == :S
            self.[]=(position, :H)
            p "you sunk my battleship!"
            return true
        else
            self.[]=(position, :X)
            return false
        end
    end

    def place_random_ships
        quarter_of_grid = @size / 4
        while self.num_ships != quarter_of_grid
            @grid[rand(0...@grid.length)][rand(0...@grid.length)] = :S
        end
    end

    def hidden_ships_grid
        new_replaced_grid = []
        @grid.length.times do
            new_replaced_grid.push Array.new(@grid.length)
        end
        @grid.each_with_index do |sub, idx|
            sub.each_with_index do |item, item_idx|
                if item == :S
                    new_replaced_grid[idx][item_idx] = :N
                else
                    new_replaced_grid[idx][item_idx] = item
                end
            end
        end
        new_replaced_grid
    end

    def self.print_grid(grid)
        grid.each do |sub|
            sub.each_with_index do |item, item_idx|
                print item.to_s
                if item_idx != sub.length-1
                    print " "
                end
            end
            print "\n"
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
