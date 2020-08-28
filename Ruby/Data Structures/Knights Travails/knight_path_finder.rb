require "./poly_tree_node.rb"

class KnightPathFinder
    def initialize(starting_position)
        @starting_position = starting_position
        @considered_positions = [@starting_position]
        @root_node = PolyTreeNode.new(@starting_position)
        build_move_tree
    end

    def self.valid_moves(pos)
        row, col = pos[0], pos[1]
        moves = [
            [row + 2, col + 1],
            [row + 2, col - 1],
            [row - 2, col + 1],
            [row - 2, col - 1],
            [row - 1, col + 2],
            [row + 1, col + 2],
            [row - 1, col - 2],
            [row + 1, col - 2]
        ]

        moves.select do |move|
            self.is_valid_position(move[0], move[1])
        end
    end

    def self.is_valid_position(row, col)
        valid_row = (row >= 0 && row < 8)
        valid_col = (col >= 0 && col < 8)
        valid_row && valid_col
    end

    def new_move_positions(position)
        new_moves_to_consider = KnightPathFinder.valid_moves(position).select{ |new_move| !@considered_positions.include?(new_move) }
        new_moves_to_consider.each do |new_move_to_consider|
            @considered_positions << new_move_to_consider
        end
        new_moves_to_consider
    end

    def build_move_tree
        queue = [@root_node]

        until queue.length == 0
            current_node_to_process = queue.shift
            current_position = current_node_to_process.value

            new_move_positions(current_position).each do |new_position|
                new_node = PolyTreeNode.new(new_position)
                new_node.parent = current_node_to_process
                queue << PolyTreeNode.new(new_position)
            end
            p queue
        end
    end
end

kpf = KnightPathFinder.new([0, 0])