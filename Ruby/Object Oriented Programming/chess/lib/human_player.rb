class HumanPlayer
  attr_reader :colour, :make_move
  def initialize(colour, display)
    @colour = colour
    @display = display
  end

  def make_move
    input = @display.cursor.get_input
    @display.render
    return input
  end
end