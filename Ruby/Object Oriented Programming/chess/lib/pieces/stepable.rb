module Stepable
  def moves
    moves = []
    move_diffs.each do |diff|
      new_pos = [@pos[0] + diff[0], @pos[1] + diff[1]]
      if @board.is_valid_move(new_pos) && !@board.ends_on_own_piece(@pos, new_pos)
        moves << new_pos
      end
    end
    moves
  end

  private
  def move_diffs
  end
end