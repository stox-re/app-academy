require 'hand'

describe Hand do
  describe '#initialize' do
    it 'starts with 5 cards from the deck, in a variable called @cards'
    it 'calls Deck#deal'
    it 'should be readable for @hand'
    it 'should hold a variable called @current_hand'
    it 'should hold a variable called @current_hand_score'
  end

  describe '#add_card' do
    it 'adds a new card to this hand'
    it 'recalculates and calls #calculate_hand'
    it 'updates @current_hand score with #hands_order'
  end

  describe '#discard' do
    it 'returns the top card from @cards'
  end

  describe '#update_hand' do
    it 'sets the @current hand to the hand, whether it is a high card, pair, three of a kind, 2 pair'
  end

  describe '#update_hand_score' do
    it 'update the @current_hand_score with the current hand from the arrangement of all hand scores'
  end
end