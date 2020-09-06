require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe '#initialize' do
    it 'should have 52 cards in an array called @cards' do
      expect(deck.cards.length).to eq(52)
      expect(deck.cards[0]).to be_a(Card)
    end
    it 'cards should all be unique' do
      expect(deck.cards.uniq.length).to eq(52)
    end
    it 'should start with an empty discard pile @discards' do
      expect(deck.discards).to eq([])
    end
  end

  describe '#shuffle' do
    it 'returns a shuffeled version of deck.cards' do
      new_shuffeled = deck.shuffle()
      expect(new_shuffeled).not_to eq(deck.cards)
    end
  end

  describe '#deal' do
    it 'deals 5 cards from the top of the deck' do
      new_cards = deck.deal
      expect(new_cards.length).to eq(5)
      expect(new_cards[0]).to be_a(Card)
      expect(deck.cards.length).to eq(47)
    end
  end

  describe '#take_card' do
    it 'gives 1 card from the top of the deck' do
      new_card = deck.take_card
      expect(new_card).to be_a(Card)
      expect(deck.cards.length).to eq(51)
    end
  end

  describe '#add_discards_to_deck' do
    it 'should move the @discards to the deck of @cards' do
      cards = [
        Card.new("J", "D"),
        Card.new(10, "H"),
        Card.new(4, "S"),
        Card.new("Q", "C"),
        Card.new("Q", "S")
      ]
      deck.instance_variable_set(:@discards, cards)
      deck.add_discards_to_deck
      cards.each do |card|
        expect(deck.cards).to include(card)
      end
    end
  end
end