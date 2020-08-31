require_relative "./piece.rb"
require "singleton"

class NullPiece < Piece
  include Singleton

  def symbol
    " "
  end
end