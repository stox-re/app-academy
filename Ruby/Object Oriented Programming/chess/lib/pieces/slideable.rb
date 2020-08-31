module Slideable
  def moves
    new_moves = []

    move_dirs.each do |new_direction|
      new_pos = [@pos[0] + new_direction[0], @pos[1] + new_direction[1]]
      p "checking position: " + new_pos.to_s
      while @board.is_valid_move(new_pos) && !@board.ends_on_own_piece(@pos, new_pos)
        new_moves << new_pos.dup
        new_pos[0] += new_direction[0]
        new_pos[1] += new_direction[1]
      end
    end

    new_moves
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  private
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[1, 1], [-1, 1], [-1, -1], [1, -1]]
end
