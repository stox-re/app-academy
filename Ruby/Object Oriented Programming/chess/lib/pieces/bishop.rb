require_relative "./slideable.rb"

class Bishop < Piece
  include Slideable

  def symbol
    "\u2657"
  end

  def move_dirs
    diagonal_dirs
  end
end