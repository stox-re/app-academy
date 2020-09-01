class Game
  def initialize(display, board)
    @board = Board.new()
    @display = Display.new(board)
  end

end