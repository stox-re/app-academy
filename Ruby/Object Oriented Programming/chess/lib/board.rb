require_relative "./piece.rb"

class Board
  def initialize
    @grid = Array.new(8){ Array.new(8) }
    setup_chess_board
    #p @grid
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
    self[end_pos] = piece_to_move
    self[start_pos] = nil
    p @grid
  end

  def setup_chess_board
    8.times do |white_index|
      @grid[0][white_index] = Piece.new
    end
    8.times do |black_index|
      @grid[7][black_index] = Piece.new
    end
  end
end

board = Board.new
board.move_piece([0,1], [1,1])
board.move_piece([7,1], [6,1])