require "./tile.rb"

class Board
    def initialize(size, bomb_count)
        @size = size
        @bomb_count = bomb_count
        @tiles = generate_tiles
        render
    end

    def render
        puts `clear`

        @tiles.each do |sub_array|
            sub_array.each do |tile|
                print tile.to_s + " "
            end
            print "\n"
        end
        print "\n\n"
    end
    def generate_tiles
        array_of_tiles = Array.new(@size) { Array.new() }
        random_bomb_coordinates = generate_random_bomb_coordinates

        (0...@size).each do |i|
            @size.times do |new_tile_index|

                if random_bomb_coordinates.include?([i, new_tile_index])
                    array_of_tiles[i] << Tile.new("X")
                else
                    array_of_tiles[i] << Tile.new("_")
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