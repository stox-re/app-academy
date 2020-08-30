require "./stepable.rb"

class Knight < Piece
  include stepable
  def initialize(colour, board, pos)
    super(colour, board, pos)
  end

  def symbol
    return "\u2658"
  end

  def moves
    moves = []
    move_diffs.each do |diff|
      moves << [pos[0] + diff[0], pos[1] + diff[1]]
    end
    moves
  end

  def move_diffs
    return [
      [2, 1],
      [2, -1],
      [-2, 1],
      [-2, -1],
      [1, 2],
      [1, -2],
      [-1, 2],
      [-1, -2]
    ]
  end
end