class Card
  attr_reader :value, :suit, :rank
  SUITS = ["D", "H", "S", "C"]
  VALUES = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]

  def initialize(value, suit)
    raise "Card: Invalid suit." if !is_valid_suit?(suit)
    raise "Card: Invalid value." if !is_valid_value?(value)
    @value = value
    @suit = suit
    @rank = VALUES.index(value)
  end

  def self.suits
    SUITS
  end

  def self.values
    VALUES
  end

  def is_valid_suit?(suit)
    SUITS.include?(suit)
  end

  def is_valid_value?(value)
    VALUES.include?(value)
  end
end