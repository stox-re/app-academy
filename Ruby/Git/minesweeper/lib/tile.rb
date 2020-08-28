require 'colorize'

# Class for each tile which parses for neighbors,
# and decides what to reveal on the board based on whether
# it is revealed or not yet.
class Tile
    attr_reader :bomb_count, :revealed, :neighbors
    attr_accessor :type

    def initialize(type, my_coordinates)
        @type = type
        @my_coordinates = my_coordinates
        @revealed = false
        @bomb_count = 0
        @neighbors = {}
        @grid = nil
    end

    def is_bomb
        return true if @type == "X"
        false
    end

    def reveal
        @revealed = true
        reveal_fringe_if_applicable
    end

    def reveal_fringe_if_applicable
        @neighbors.each do |key, value|
            this_neighbor = @grid[key[0]][key[1]]

            if !this_neighbor.is_bomb && this_neighbor.bomb_count == 0 && !this_neighbor.revealed
                if !check_neighbors_for_bomb_count(this_neighbor)
                    this_neighbor.reveal
                end
            end

        end
    end

    def check_neighbors_for_bomb_count(tile_to_check)

        tile_to_check.neighbors.each do |neighbor_key, neighbor_value|
            if @grid[neighbor_key[0]][neighbor_key[1]].bomb_count > 0
                return true
            end
        end

        false
    end

    def to_s
        case type
        when "*"
            to_s_default
        when "_"
            return (type.to_s).colorize(:light_blue) if @revealed
            to_s_default
        when "F"
            (type.to_s).colorize(:green)
        when "X"
            return (type.to_s).colorize(:red) if @revealed
            to_s_default
        when Integer
            return (type.to_s).colorize(:blue) if @revealed
            to_s_default
        end
    end

    def to_s_default
        return "*".colorize(:white)
    end

    def is_valid_position?(position)
        if position[0] >= 0 && position[0] < @grid.length
            return true if position[1] >= 0 && position[1] < @grid.length
        end

        false
    end

    def parse_neighbors(grid)
        @grid = grid
        left = [@my_coordinates[0] - 1, @my_coordinates[1]]
        right = [@my_coordinates[0] + 1, @my_coordinates[1]]
        up = [@my_coordinates[0], @my_coordinates[1] + 1]
        down = [@my_coordinates[0], @my_coordinates[1] - 1]
        top_left = [@my_coordinates[0] - 1, @my_coordinates[1] + 1]
        top_right = [@my_coordinates[0] + 1, @my_coordinates[1] + 1]
        bottom_left = [@my_coordinates[0] - 1, @my_coordinates[1] - 1]
        bottom_right = [@my_coordinates[0] + 1, @my_coordinates[1] - 1]

        all_neighbors = [left, right, up, down, top_left, top_right, bottom_left, bottom_right]

        all_neighbors.each do |check_neighbor_position|
            if is_valid_position?(check_neighbor_position)
                @neighbors[check_neighbor_position] = grid[check_neighbor_position[0]][check_neighbor_position[1]].is_bomb
            elsif is_valid_position?(check_neighbor_position)
                @neighbors[check_neighbor_position] = false
            end
        end

        parse_my_bomb_count
    end

    def parse_my_bomb_count
        @neighbors.each_value do |value|
            if value == true
                @bomb_count += 1
            end
        end

        if @bomb_count > 0 && @type != "X"
            @type = @bomb_count
        elsif @bomb_count == 0
            @type = "_"
        end
    end

end
