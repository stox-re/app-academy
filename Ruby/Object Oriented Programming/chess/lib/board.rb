require_relative "./pieces/piece.rb"
require_relative "./pieces/pawn.rb"

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8){ Array.new(8) }
    setup_chess_board
    #p @grid
    render
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, result)
    @grid[pos[0]][pos[1]] = result
  end

  def is_valid_move(pos)
    return false if pos[0] < 0 || pos[0] > 7
    return false if pos[1] < 0 || pos[1] > 7
    true
  end

  def move_piece(start_pos, end_pos)
    raise "This start position is off the board." if !is_valid_move(start_pos)
    raise "This end position is off the board" if !is_valid_move(end_pos)
    raise "There is no piece at starting position: #{start_pos}" if self.[](start_pos) == nil
    piece_to_move = self.[](start_pos)

    if piece_to_move.valid_moves.include?(end_pos)
      p "Moving: " + piece_to_move.symbol + " to: " + end_pos.to_s
      self[end_pos] = piece_to_move
      piece_to_move.pos = end_pos
      self[start_pos] = nil
    else
      p "Didn't find the move"
    end
    render
  end

  def setup_chess_board
    8.times do |white_index|
      @grid[0][white_index] = Piece.new(:white, self, [0, white_index])
      @grid[1][white_index] = Pawn.new(:white, self, [1, white_index])
    end
    8.times do |black_index|
      @grid[6][black_index] = Pawn.new(:black, self, [6, black_index])
      @grid[7][black_index] = Piece.new(:black, self, [7, black_index])
    end
  end

  def render
    #puts `clear`

    @grid.each do |sub_array|
      sub_array.each do |ele|
        if ele == nil
          print "_" + " "
        else
          print ele.to_s + " "
        end
      end
      print "\n"
    end
  end
end

board = Board.new
board.move_piece([1,4], [2,4])
board.move_piece([6,1], [4, 1])
board.move_piece([1,2], [3, 2])
board.move_piece([4,1], [3, 2])
