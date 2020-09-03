require 'player'

describe Player do
  describe '#initialize' do
    it 'creates a new Hand with 5 cards from the Deck'
  end

  describe '#draw_card' do
    it 'draws a card from the Deck and puts it in it\'s Hand'
  end

  describe '#discard_card' do
    it 'calls discard on the Hand, and puts that card in the Deck\'s discard pile'
  end

  describe '#fold' do
    it 'discards all the cards of the hand'
    it 'puts the discarded cards in the Deck\'s discard pile'
  end
end