require_relative "./hand.rb"

class Player
  attr_reader :hand
  attr_accessor :folded

  def initialize(cards)
    @hand = Hand.new(cards)
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

  def show_hand
    @hand.cards.each do |card|
      print card.value.to_s + " " + card.suit.to_s + ", "
    end
    print "\n"
  end

  def take_turn
    puts "Choose either D for discard, F for fold, or H for hold:"
    input = gets.chomp
    if input == "D"
      return discard_card
    elsif input == "F"
      return fold
    elsif input == "H"
      return "H"
    else
      puts "Please retry: "
      take_turn
    end
  end
end