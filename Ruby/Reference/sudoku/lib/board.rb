require_relative "./tile.rb"

class Board
    attr_reader :grid
    def initialize(grid_of_tiles)
        @grid = grid_of_tiles
    end

    def solved?
        all_sections = [rows(@grid), rows(@grid.transpose), squares]
        return all_sections.all? { |to_check| check_solution(to_check) }
    end

    def check_solution(array_to_check)
        solution = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        array_to_check.all? { |sub_section| sub_section.sort == solution }
    end

    def squares
        square_arrays = []
        (0...9).each do |i|
            square_arrays << square(i)
        end
        square_arrays
    end

    def square(index)
        tile_values = []
        row_index = (index / 3) * 3
        col_index = (index % 3) * 3

        (row_index...row_index+3).each do |row_idx|
            (col_index...col_index+3).each do |col_idx|
                tile_values << @grid[row_idx][col_idx].value
            end
        end

        tile_values
    end

    def rows(array_to_get_values)
        array_to_get_values.map do |row|
            row.map { |tile| tile.value }
        end
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(position, value)
        result = @grid[position[0]][position[1]].value = value
        return result
    end

    def render
        puts `clear`

        @grid.each do |sub_array|
            sub_array.each do |tile|
                print tile.to_s + " "
            end
            print "\n"
        end
    end

    def self.from_file
        puzzle_array = []

        File.foreach("./puzzles/sudoku1.txt") do |line|
            puzzle_array << line.chomp
        end

        self.parse_as_2d_tiles(puzzle_array)
    end

    def self.parse_as_2d_tiles(puzzle_array)
        new_2d_array_of_tiles = Array.new(puzzle_array.length) { Array.new() }

        puzzle_array.each_with_index do |string, idx|
            string.each_char do |element|
                new_2d_array_of_tiles[idx] << Tile.new(element.to_i, element.to_i==0)
            end
        end

        new_2d_array_of_tiles
    end
end