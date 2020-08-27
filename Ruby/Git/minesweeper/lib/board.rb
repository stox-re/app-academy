require 'colorize'
require "./tile.rb"

class Board
    def initialize(size, bomb_count)
        @size = size
        @bomb_count = bomb_count
        @grid = generate_tiles
        parse_for_neighbors
        render
    end

    def render
        puts `clear`

        @grid.each do |sub_array|
            sub_array.each do |tile|
                print tile.type.to_s + " "
            end
            print "\n"
        end

        print "\n\n"
    end

    def parse_for_neighbors
        (0...@size).each do |i|
            @size.times do |new_tile_index|
                @grid[i][new_tile_index].parse_neighbors(@grid)
            end
        end
    end

    def generate_tiles
        array_of_tiles = Array.new(@size) { Array.new() }
        random_bomb_coordinates = generate_random_bomb_coordinates

        (0...@size).each do |i|
            @size.times do |new_tile_index|

                if random_bomb_coordinates.include?([i, new_tile_index])
                    array_of_tiles[i] << Tile.new("X", [i, new_tile_index])
                else
                    array_of_tiles[i] << Tile.new("*", [i, new_tile_index])
                end

            end
        end

        array_of_tiles
    end

    def generate_random_bomb_coordinates
        count = 0
        array_of_coordinates = []

        while count < @bomb_count
            array_of_coordinates << [rand(0...@size), rand(0...@size)]
            count += 1
        end

        array_of_coordinates
    end

end