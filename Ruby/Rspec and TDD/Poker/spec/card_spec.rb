require 'card'

describe Card do
  subject(:card) { Card.new("J", "D")}

  describe '#initialize' do
    it 'holds the suit and value of a card' do
      expect(card.suit).to eq("D")
      expect(card.value).to eq("J")
    end

    it 'should raise an error for an invalid suit' do
      expect { Card.new("J", "Z") }.to raise_error("Card: Invalid suit.")
      expect { Card.new("J", 3) }.to raise_error("Card: Invalid suit.")
    end

    it 'should raise an error for an invalid value' do
      expect { Card.new(-1, "H") }.to raise_error("Card: Invalid value.")
      expect { Card.new(0, "D") }.to raise_error("Card: Invalid value.")
      expect { Card.new(11, "C") }.to raise_error("Card: Invalid value.")
      expect { Card.new(12, "S") }.to raise_error("Card: Invalid value.")
    end
end