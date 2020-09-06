require_relative "./card.rb"

class Deck
  attr_reader :cards, :discards

  def initialize
    @cards = []
    build_cards
    @discards = []
  end

  def build_cards
    suits = Card.suits
    values = Card.values
    values.each do |value|
      suits.each do |suit|
        @cards << Card.new(value, suit)
      end
    end
  end
end