require 'player'

describe Player do
  cards = [
    Card.new("J", "D"),
    Card.new(10, "H"),
    Card.new(4, "S"),
    Card.new("Q", "C"),
    Card.new("Q", "S")
  ]
  hand = Hand.new(cards)
  subject(:player) { Player.new(hand) }

  describe '#initialize' do
    it 'creates a new Hand' do
      expect(player.hand).to be_a(Hand)
    end
  end

  describe '#deal_hand' do
    it 'should deal a hand to the player of 5 cards' do
      player.instance_variable_set(:@hand, nil)
      cards = []
      player.deal_hand(cards)
      expect(player.hand).to be_a(Hand)
    end
  end

  describe '#discard_card' do
    it 'calls discard on the Hand, and puts that card in the Deck\'s discard pile' do
      length = player.hand.cards.length
      player.discard_card
      expect(player.hand.cards.length).to eq(length - 1)
    end
  end

  describe '#fold' do
    it 'discards all the cards of the hand' do
      player.fold
      expect(player.folded).to eq(true)
    end
  end
end