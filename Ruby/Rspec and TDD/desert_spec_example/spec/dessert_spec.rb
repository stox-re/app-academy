require "dessert"
require "drink"

describe Dessert do
  subject(:brownie) { Dessert.new("brownie", 50) }
  #let(:milk) { Drink.new("milk") }
  let(:milk) { double("milk") }
  # Double is like a mock class that can accept methods without needing to intiailize an actual class

  describe '#initialize' do
    it 'takes in a type' do
      expect(brownie.type).to eq('brownie')
    end

    it 'takes in an amount' do
      expect(brownie.amount).to eq(50)
    end

    context 'with a huge amount' do
      subject(:brownie) { Dessert.new("brownie", 100000) }
      it 'sets the type to giant version' do
        expect(brownie.type).to eq('giant brownie')
      end
    end

    it 'raises an error if the amount is not a number' do
      expect { Dessert.new("brownie", "tons") }.to raise_error('Amount must be a number')
    end

  end

  describe '#eat' do
    it 'calls #dip on the accompanying drink' do
      expect(milk).to receive(:dip).with(brownie)
      brownie.eat(milk)
    end
  end


end