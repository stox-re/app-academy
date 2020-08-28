require "./poly_tree_node.rb"

class KnightPathFinder
    def initialize(starting_position)
        @starting_position = starting_position
        @considered_positions = [@starting_position]
        build_move_tree
    end

    def find_path(end_position)
        tree_node_at_end = @root_node.bfs(end_position)
        p "Tree node at end: " + tree_node_at_end.to_s
        path = trace_path_back(tree_node_at_end)
    end

    def trace_path_back(tree_node)
        path_array = [tree_node.value]
        current_parent = tree_node.parent

        until current_parent == @root_node
            path_array << current_parent.value
            current_parent = current_parent.parent
        end
        path_array << @root_node.value

        p "-------------------------------"
        p "Found path: " + path_array.reverse.to_s
        path_array.reverse
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
        @root_node = PolyTreeNode.new(@starting_position)

        queue = [@root_node]

        until queue.length == 0
            current_node_to_process = queue.shift
            current_position = current_node_to_process.value

            new_move_positions(current_position).each do |new_position|
                new_node = PolyTreeNode.new(new_position)
                current_node_to_process.add_child(new_node)
                queue << new_node
            end
        end
    end

end

kpf = KnightPathFinder.new([0, 0])

kpf.find_path([7, 6])
kpf.find_path([6, 2])