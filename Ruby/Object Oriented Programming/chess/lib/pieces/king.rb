require_relative "./stepable.rb"

class King < Piece
  include Stepable

  def symbol
    return "\u2654"
  end

  def move_diffs
    return [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0],
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
  end
end