require 'hand'

describe Hand do
  cards = [
    Card.new("J", "D"),
    Card.new(10, "H"),
    Card.new(4, "S"),
    Card.new("Q", "C"),
    Card.new("Q", "S")
  ]
  subject(:hand) { Hand.new(cards) }

  describe '#initialize' do
    it 'starts with 5 cards from the deck, in a variable called @cards' do
      expect(hand.cards.length).to eq(5)
      expect(hand.cards[0]).to be_a(Card)
    end
  end

  describe '#add_card' do
    it 'adds a new card to this hand' do
      new_card = Card.new(10, "D")
      hand.add_card(new_card)
      expect(hand.cards[hand.cards.length - 1]).to eq(new_card)
    end
    it 'recalculates and calls #calculate_hand' do
      new_card = Card.new(10, "D")
      expect(hand).to receive(:calculate_hand)
      hand.add_card(new_card)
    end
    it 'updates @current_hand score with #hands_order' do
      new_card = Card.new(10, "D")
      expect(hand).to receive(:hands_order)
      hand.add_card(new_card)
    end
  end

  describe '#discard' do
    it 'returns the top card from @cards' do
      expect(hand.discard).to eq(cards[4])
    end
  end

  describe '#one_pair' do
    it 'returns the cards if there is a pair' do
      cards = [
        Card.new("J", "D"),
        Card.new("J", "H"),
        Card.new(10, "S"),
        Card.new(8, "S"),
        Card.new(2, "H")
      ]
      hand = Hand.new(cards)
      expect(hand.one_pair).to eq([cards[0], cards[1]])
    end
  end

  describe '#two_pairs' do
    it 'returns the cards if there is 2 pairs' do
      cards = [
        Card.new("J", "D"),
        Card.new("J", "H"),
        Card.new(10, "S"),
        Card.new(10, "D"),
        Card.new(2, "H")
      ]
      hand = Hand.new(cards)
      expect(hand.two_pairs).to eq([cards[0], cards[1], cards[2], cards[3]])
    end
  end

  describe '#three_of_a_kind' do
    it 'returns the cards if there is 3 of a king' do
      cards = [
        Card.new("J", "D"),
        Card.new("J", "H"),
        Card.new("J", "C"),
        Card.new(10, "D"),
        Card.new(2, "H")
      ]
      hand = Hand.new(cards)
      expect(hand.three_of_a_kind).to eq([cards[0], cards[1], cards[2]])
    end
  end

  describe '#four_of_a_kind' do
    it 'returns the cards if there is 4 of a kind' do
     cards = [
        Card.new("J", "D"),
        Card.new("J", "H"),
        Card.new("J", "C"),
        Card.new("J", "S"),
        Card.new(2, "H")
      ]
      hand = Hand.new(cards)
      expect(hand.four_of_a_kind).to eq([cards[0], cards[1], cards[2], cards[3]])
    end
  end

  describe '#straight' do
    it 'returns the cards if there is a straight' do
     cards = [
        Card.new(2, "D"),
        Card.new(3, "H"),
        Card.new(4, "C"),
        Card.new(5, "D"),
        Card.new(6, "H")
      ]
      hand = Hand.new(cards)
      expect(hand.straight).to eq(cards)
    end
    it 'returns the cards if there is an Ace, 2, 3, 4, 5' do
     cards = [
        Card.new("A", "D"),
        Card.new(2, "H"),
        Card.new(3, "C"),
        Card.new(4, "D"),
        Card.new(5, "H")
      ]
      hand = Hand.new(cards)
      expect(hand.straight).to eq(cards)
    end
  end

  describe '#flush' do
    it 'returns the cards if there is a flush' do
      cards = [
        Card.new(3, "S"),
        Card.new(4, "S"),
        Card.new(5, "S"),
        Card.new(10, "S"),
        Card.new("Q", "S")
      ]
      hand = Hand.new(cards)
      expect(hand.flush).to eq(cards)
    end

    it 'is false if there is only 4 of a kind' do
     cards = [
        Card.new(2, "D"),
        Card.new(4, "D"),
        Card.new(6, "D"),
        Card.new(10, "D"),
        Card.new("J", "H")
      ]
      hand = Hand.new(cards)
      expect(hand.flush).to eq(false)
    end
  end

  describe '#high_card' do
    it 'returns the high card if there is one' do
     cards = [
        Card.new(2, "C"),
        Card.new(4, "D"),
        Card.new(6, "S"),
        Card.new(10, "D"),
        Card.new("Q", "H")
      ]
      hand = Hand.new(cards)
      expect(hand.high_card).to eq(cards[4])
    end
  end

  describe 'Hand::wins' do
    it 'returns the winning hand' do
      cards = [
        Card.new(2, "C"),
        Card.new(4, "D"),
        Card.new(6, "S"),
        Card.new(10, "D"),
        Card.new("Q", "H")
      ]
      high_hand = Hand.new(cards)
      other_cards = [
        Card.new("J", "D"),
        Card.new("J", "H"),
        Card.new("J", "C"),
        Card.new("J", "S"),
        Card.new(2, "H")
      ]
      kind_hand = Hand.new(other_cards)
      expect(Hand.wins([high_hand, kind_hand])).to eq(kind_hand)
    end
  end

end