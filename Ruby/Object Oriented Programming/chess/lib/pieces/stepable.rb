module Stepable
  def moves
    moves = []
    move_diffs.each do |diff|
      moves << [@pos[0] + diff[0], @pos[1] + diff[1]]
    end
    moves
  end

  private
  def move_diffs
  end
end