require_relative 'tic_tac_toe'

class TicTacToeNode
    attr_reader :board, :next_mover_mark, :prev_move_pos
    def initialize(board, next_mover_mark, prev_move_pos = nil)
        @board = board
        @next_mover_mark = next_mover_mark
        @prev_move_pos = prev_move_pos
    end

    # This method generates an array of all moves that can be made after
    # the current move.
    def children
        next_moves_nodes = []

        @board.rows.length.times do |row|
            @board.rows.length.times do |col|
                if @board.empty?([row, col])
                    pos = [row, col]
                    board_duplicate = @board.dup
                    board_duplicate[pos] = @next_mover_mark
                    next_move = TicTacToeNode.new(board_duplicate, next_move_mark_switch, pos)
                    next_moves_nodes << next_move
                end
            end
        end

        next_moves_nodes
    end

    def next_move_mark_switch
        @next_mover_mark == :x ? :o : :x
    end

    def losing_node?(mark)
        if @board.over?
            return false if @board.winner == mark || @board.tied?
            return true
        end

        if @next_mover_mark == mark
            return children.all? { |child| child.losing_node?(mark) }
        else
            return children.any? { |child| child.losing_node?(mark) }
        end
        false
    end

    def winning_node?(mark)
        if @board.over?
            return true if @board.winner == mark
            return false
        end

        if @next_mover_mark == mark
            return children.any? { |child| child.winning_node?(mark) }
        else
            return children.all? { |child| child.winning_node?(mark) }
        end
    end
end
