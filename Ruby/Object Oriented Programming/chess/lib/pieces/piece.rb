require_relative "./slideable.rb"
require_relative "./stepable.rb"
require 'colorize'

class Piece
  attr_accessor :pos, :colour

  def initialize(colour = nil, board = nil, pos = nil)
    @colour = colour
    @board = board
    @pos = pos
  end

  def valid_moves
    moves
  end

  def to_s
    if @colour == :white
      return self.symbol.colorize(:white)
    else
      return self.symbol.colorize(:red)
    end
  end

  def symbol
    return "P"
  end

  def inspect
    { 'value' => symbol, 'colour' => @colour, 'pos' => @pos }.inspect
  end

  def move_into_check(end_pos)
    board_duplicate = @board.dup
    board_duplicate.move_piece!(@pos, end_pos)
    board_duplicate.in_check?(@colour)
  end

  def duplicate_board
    new_array = Board.new

    @board.grid.each_with_index do |sub_array, sub_index|
      sub_array.each_with_index do |ele, index|
        if ele.class == NullPiece
          new_array[sub_index][index] = NullPiece.instance
        else
          new_array[sub_index][index] = ele.dup
        end
      end
    end
  end
end
