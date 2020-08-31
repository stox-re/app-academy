require_relative "./stepable.rb"

class Knight < Piece
  include Stepable
  def symbol
    return "\u2658"
  end

  def move_diffs
    return [
      [1, 2],
      [1, -2],
      [-1, 2],
      [-1, -2],
      [2, 1],
      [2, -1],
      [-2, 1],
      [-2, -1]
    ]
  end
end