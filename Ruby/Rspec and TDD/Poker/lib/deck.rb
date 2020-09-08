require_relative "./card.rb"

class Deck
  attr_reader :cards, :discards

  def initialize
    @cards = []
    build_cards
    @discards = []
    @cards = shuffle
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

  def shuffle
    return @cards.shuffle
  end

  def deal
    new_deal = []
    (1..5).each do |i|
      new_deal << @cards.pop
    end
    new_deal
  end

  def add_to_discards(array_of_cards)
    if array_of_cards.class == Array
      array_of_cards.each do |card|
        @discards << card
      end
    elsif array_of_cards.class == Card
      @discards << array_of_cards
    end
  end

  def take_card
    @cards.pop
  end

  def add_discards_to_deck
    @discards.each do |discard|
      @cards << discard
    end
    @cards = shuffle
  end
end