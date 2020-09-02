require "array"

describe Array do
  subject(:array) { Array.new() }

  describe '#my_uniq' do
    it 'removes duplicates from array and returns the unique elements in the order they first came in' do
      expect(array.my_uniq([1, 2, 1, 3, 3])).to eq([1,2,3])
    end
  end

  describe "#two_sum" do
    it 'finds all pairs of positions where the elements at these positions sum to zero' do
      expect(array.two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    it 'convert between row oriented and column oriented representations' do
      array_2d = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
      transposed_2d = [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ]
      expect(array.my_transpose(array_2d)).to eq(transposed_2d)
    end
  end

  describe "#stock_picker" do
    it 'takes an array of stock prices on days and outputs the most profitable pair of days to buy and sell the stock' do
      array_of_prices = [5.7, 3.6, 1.2, 4.5, 6.3, 2.2, 4.1]
      expect(array.stock_picker(array_of_prices)).to eq([2, 4])
    end
  end

end