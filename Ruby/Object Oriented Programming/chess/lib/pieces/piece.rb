require_relative "./slideable.rb"
require_relative "./stepable.rb"

class Piece
  attr_accessor :pos

  def initialize(colour, board, pos)
    @colour = colour
    @board = board
    @pos = pos
  end

  def valid_moves
    p "Returning these moves"
    p moves
    return moves
  end

  def moves
  end

  def to_s
    return self.symbol
  end

  def symbol
    return "P"
  end

  def inspect
    { 'value' => symbol, 'colour' => @colour, 'pos' => @pos }.inspect
  end
end