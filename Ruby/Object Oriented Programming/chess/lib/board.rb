require_relative "./pieces/piece.rb"
require_relative "./pieces/pawn.rb"
require_relative "./pieces/knight.rb"
require_relative "./pieces/king.rb"
require_relative "./pieces/rook.rb"
require_relative "./pieces/bishop.rb"
require_relative "./pieces/queen.rb"
require_relative "./pieces/null_piece.rb"
require_relative "./display.rb"

# Handles board logic, making pieces, moving pieces, and setting up the chess board
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8){ Array.new(8) }
    setup_chess_board
  end

  def dup
    new_board = Board.new
    (0..7).each do |i|
      (0..7).each do |k|
        if @grid[i][k].class == NullPiece
          new_board.grid[i][k] = NullPiece.instance
        else
          this_item = @grid[i][k]
          new_board.grid[i][k] = this_item.class.new(this_item.colour, new_board, this_item.pos)
        end
      end
    end
    new_board
  end

  def checkmate?(colour)
    was_found = true
    @grid.each do |sub_array|
      sub_array.each do |ele|
        if ele.class != NullPiece && ele != nil && ele.colour == colour
          all_moves = ele.valid_moves
          all_moves.each do |check_move|
            if is_valid_move(check_move)
              if !ele.move_into_check(check_move)
                was_found = false
              end
            end
          end
        end
      end
    end
    return was_found
  end

  def in_check?(colour)
    king_location = find_king(colour)
    @grid.each do |sub_array|
      sub_array.each do |ele|
        if ele.class != King && ele.class != NullPiece && ele.colour != colour
          if ele.valid_moves.include?(king_location)
            return true
          end
        end
      end
    end
    return false
  end

  def find_king(colour)
    @grid.each do |sub_array|
      sub_array.each do |ele|
        if ele.class == King && ele.colour == colour
          return ele.pos
        end
      end
    end
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

  def ends_on_own_piece(start_pos, end_pos)
    return true if self.[](end_pos) != NullPiece.instance && self.[](end_pos).colour == self.[](start_pos).colour
    return false
  end

  def ends_on_opponent_piece(start_pos, end_pos)
    return true if self.[](end_pos) != NullPiece.instance && self.[](end_pos) != nil && self.[](end_pos).colour != self.[](start_pos).colour
    return false
  end

  def move_piece(start_pos, end_pos)
    raise "This start position is off the board." if !is_valid_move(start_pos)
    raise "This end position is off the board" if !is_valid_move(end_pos)
    raise "There is no piece at starting position: #{start_pos}" if self.[](start_pos) == NullPiece.instance
    raise "This end position lands on your own piece" if ends_on_own_piece(start_pos, end_pos)
    piece_to_move = self.[](start_pos)

    if piece_to_move.valid_moves.include?(end_pos)
      p " End move: " + end_pos.to_s
      if piece_to_move.move_into_check(end_pos)
        raise "Moves yourself into check"
      else
        self[end_pos] = piece_to_move
        piece_to_move.pos = end_pos
        self[start_pos] = NullPiece.instance
      end
    else
      p "Didn't find the move"
    end
  end

  def move_piece!(start_pos, end_pos)
    piece_to_move = self.[](start_pos)
    self[end_pos] = piece_to_move
    piece_to_move.pos = end_pos
    self[start_pos] = NullPiece.instance
  end

  def setup_chess_board
    colouring = :black
    start_index = 0
    pawn_index = 1

    2.times do |i|
      8.times do |index|
        if index == 1 || index == 6
          @grid[start_index][index] = Knight.new(colouring, self, [0, index])
        elsif index == 4
          @grid[start_index][index] = King.new(colouring, self, [0, index])
        elsif index == 0 || index == 7
          @grid[start_index][index] = Rook.new(colouring, self, [0, index])
        elsif index == 2 || index == 5
          @grid[start_index][index] = Bishop.new(colouring, self, [0, index])
        elsif index == 3
          @grid[start_index][index] = Queen.new(colouring, self, [0, index])
        end
        @grid[pawn_index][index] = Pawn.new(colouring, self, [pawn_index, index])
      end
      start_index = 7
      pawn_index = 6
      colouring = :white
    end

    8.times do |null_piece_index|
      (2..5).each do |i|
        @grid[i][null_piece_index] = NullPiece.instance
      end
    end
  end
end

board = Board.new
board.move_piece([1,4], [3,4])
#board.move_piece([6,6], [4,6])
#board.move_piece([6,4], [5,5])
#board.move_piece([6,0], [4,0])
#board.move_piece([6,5], [5,5])
#board.move_piece([0,3], [4,7])

display = Display.new(board)
