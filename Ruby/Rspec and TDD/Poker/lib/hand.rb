require_relative "./card.rb"

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def add_card(new_card)
    @cards << new_card
    calculate_hand
    @current_hand_score = hands_order
  end

  def discard
    @cards.pop
  end

  def calculate_hand
  end

  def hands_order
  end
end