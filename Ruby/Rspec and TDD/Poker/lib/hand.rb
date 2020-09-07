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

  def cards_hash_count(cards)
    check_counts = Hash.new(0)
    cards.each do |card|
      check_counts[card.value] += 1
    end
    check_counts
  end

  def one_pair
    check_counts = cards_hash_count(@cards)
    found = nil
    check_counts.each do |key, value|
      if value == 2
        found = key
      end
    end

    result = []
    if found != nil
      @cards.each do |card|
        if card.value == found
          result << card
        end
      end
    end
    result
  end

  def two_pairs
    check_counts = cards_hash_count(@cards)
    founds = []
    check_counts.each do |key, value|
      if value == 2
        founds << key
      end
    end

    result = []
    if founds.length == 2
      @cards.each do |card|
        if founds[0] == card.value || founds[1] == card.value
          result << card
        end
      end
    end
    result
  end

  def three_of_a_kind
    check_counts = cards_hash_count(@cards)
    found = nil
    check_counts.each do |key, value|
      if value == 3
        found = key
      end
    end

    result = []
    if found != nil
      @cards.each do |card|
        if card.value == found
          result << card
        end
      end
    end
    result
  end

  def four_of_a_kind
    check_counts = cards_hash_count(@cards)
    found = nil
    check_counts.each do |key, value|
      if value == 4
        found = key
      end
    end
    result = []
    if found != nil
      @cards.each do |card|
        if card.value == found
          result << card
        end
      end
    end
    result
  end

  def straight
    sorted = @cards.sort_by { |card| card.rank }
    found = true
    current = sorted[0].rank
    sorted.each_with_index do |card, index|
      if index > 0
        if card.rank == current + 1 || (current == 0 && card.rank == 9)
          current = card.rank
        else
          found = false
        end
      end
    end
    return found
  end

end