require_relative "./hand.rb"

class Player
  attr_reader :hand
  attr_accessor :folded

  def initialize(hand)
    @hand = hand
    @pot = 100
    @folded = false
  end

  def deal_hand(cards)
    @hand = Hand.new(cards)
  end

  def discard_card
    @hand.discard
  end

  def fold
    discards = []
    (0...@hand.cards.length).each do |i|
      discards << @hand.discard
    end
    @folded = true
    discards
  end
end