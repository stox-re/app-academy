require_relative "./hand.rb"

class Player
  def initialize(cards)
    @hand = Hand.new(cards)
    @pot = 100
  end
end