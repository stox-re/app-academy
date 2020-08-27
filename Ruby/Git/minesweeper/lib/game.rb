require "./board"
require 'colorize'

class Game
    def initialize(size, bombs)
        @board = Board.new(size, bombs)
    end

end

game = Game.new(9, 5)
