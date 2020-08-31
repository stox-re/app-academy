require_relative "./slideable.rb"

class Rook < Piece
  include Slideable
  def symbol
    "\u2656"
  end

  def move_dirs
    horizontal_dirs
  end
end