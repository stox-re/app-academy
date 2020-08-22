class Board
    def initialize(size)
        @grid = []
        @size = size
        @size.times do |i|
            @grid.push(Array.new(@size, "_"))
        end
    end

    def print_grid
        print "\n"
        @grid.each do |sub_array|
            sub_array.each do |ele|
                print ele.to_s + " "
            end
            print "\n"
        end
        print "\n"
    end

    def valid?(position)
        return false if position[0] > @size-1 || position[1] > @size-1
        return true
    end

    def empty?(position)
        if valid?(position)
            return true if @grid[position[0]][position[1]] == "_"
        end
        return false
    end

    def place_mark(position, mark)
        if valid?(position)
            if empty?(position)
                @grid[position[0]][position[1]] = mark
            else
                raise "This position is not empty."
            end
        else
            raise "This position is not valid"
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            found = true
            row.each do |ele|
                if ele != mark
                    found = false
                end
            end
            return true if found
        end
        false
    end

    def win_col?(mark)
        (0...@grid.length).each do |i|
            found = true
            (0...@grid.length).each do |check|
                if @grid[check][i] != mark
                    found = false
                end
            end
            return true if found
        end
        false
    end

    def check_array_for_found(array_2d, mark)
        count_as = 0
        is_found = true
        array_2d.each_with_index do |sub_array, sub_idx|
            if sub_array[count_as] != mark
                is_found = false
            end
            count_as += 1
        end
        is_found
    end

    def win_diagonal?(mark)
        check_array_for_found(@grid, mark) || check_array_for_found(@grid.reverse, mark)
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            row.each do |col|
                return true if col == "_"
            end
        end
        false
    end

    def legal_positions
        array_of_positions = []
        @grid.each_with_index do |row, index|
            row.each_with_index do |col, col_index|
                if col == "_"
                    array_of_positions << [index, col_index]
                end
            end
        end
        array_of_positions
    end
end