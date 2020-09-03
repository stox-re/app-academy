require 'deck'

describe Deck do
  describe '#initialize' do
    it 'should have 52 cards in an array called @cards'
    it 'should be in order from 2 to Aces'
    it 'cards should all be unique'
    it 'should start with an empty discard pile @discards'
  end

  describe '#shuffle' do
    it 'shuffles the deck of @cards'
  end

  describe '#deal' do
    it 'deals 5 cards from the top of the deck'
  end

  describe '#take_card' do
    it 'gives 1 card from the top of the deck'
  end

  describe '#add_discards_to_deck' do
    it 'should move the @discards to the deck of @cards'
    it 'should shuffle the cards'
  end
end