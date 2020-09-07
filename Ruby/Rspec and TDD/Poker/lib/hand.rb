require_relative "./card.rb"

class Hand
  attr_reader :cards

  HAND_RANKS = {
    :straight_flush => 9,
    :four_of_a_kind => 8,
    :full_house => 7,
    :flush => 6,
    :straigh => 5,
    :four_of_a_kind => 4,
    :three_of_a_kind => 3,
    :two_pairs => 2,
    :one_pair => 1,
    :high_card => 0
  }

  def initialize(cards)
    @cards = cards
  end

  def add_card(new_card)
    @cards << new_card
  end

  def discard
    @cards.pop
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

  def flush
    found = true
    this_suit = @cards[0].suit
    @cards.each do |card|
      if this_suit != card.suit
        found = false
      end
    end
    found
  end

  def high_card
    sorted = @cards.sort_by { |card| card.rank }
    if sorted[0].rank == 0
      return sorted[0]
    else
      return sorted[sorted.length - 1]
    end
  end

  def self.wins(hands)
    hand_results = [:high_card, :high_card]
    current_hand = 0
    hands.each_with_index do |hand, index|

      if hand.one_pair.length > 0
        hand_results[current_hand] = :one_pair
      end
      if hand.two_pairs.length > 0
        hand_results[current_hand] = :two_pairs
      end
      if hand.three_of_a_kind.length > 0
        hand_results[current_hand] = :three_of_a_kind
      end
      if hand.straight
        hand_results[current_hand] = :straight
      end
      if hand.flush
        hand_results[current_hand] = :flush
      end
      if hand.three_of_a_kind.length > 0 && hand.one_pair.length > 0
        hand_results[current_hand] = :full_house
      end
      if hand.four_of_a_kind.length > 0
        hand_results[current_hand] = :four_of_a_kind
      end
      if hand.straight && hand.flush
        hand_results[current_hand] = :straight_flush
      end
      current_hand += 1
    end

    hand_ranking = []
    hand_results.each do |result|
      hand_ranking << HAND_RANKS[result]
    end
    hands[hand_ranking.index(hand_ranking.max)]
  end

end