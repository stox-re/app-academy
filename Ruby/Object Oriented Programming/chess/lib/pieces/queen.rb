require_relative "./slideable.rb"

class Queen < Piece
  include Slideable

  def symbol
    "\u2655"
  end

  def move_dirs
    diagonal_dirs + horizontal_dirs
  end
end