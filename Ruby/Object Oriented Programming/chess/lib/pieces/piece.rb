require_relative "./slideable.rb"
require_relative "./stepable.rb"
require 'colorize'

class Piece
  attr_accessor :pos, :colour

  def initialize(colour, board, pos)
    @colour = colour
    @board = board
    @pos = pos
  end

  def valid_moves
    p "Returning these moves: " + moves.to_s
    moves
  end

  def to_s
    if @colour == :white
      return self.symbol.colorize(:white)
    else
      return self.symbol.colorize(:cyan)
    end
  end

  def symbol
    return "P"
  end

  def inspect
    { 'value' => symbol, 'colour' => @colour, 'pos' => @pos }.inspect
  end

  def move_into_check(end_pos)
  end
end
